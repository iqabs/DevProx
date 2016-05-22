package.path = package.path .. ';.luarocks/share/lua/5.2/?.lua'
  ..';.luarocks/share/lua/5.2/?/init.lua'
package.cpath = package.cpath .. ';.luarocks/lib/lua/5.2/?.so'

require("./BoTMasters/utils")

local f = assert(io.popen('/usr/bin/git describe --tags', 'r'))
VERSION = assert(f:read('*a'))
f:close()

-- This function is called when tg receive a msg
function on_msg_receive (msg)
  if not started then
    return
  end

  msg = backward_msg_format(msg)

  local receiver = get_receiver(msg)
  print(receiver)
  --vardump(msg)
  --vardump(msg)
  msg = pre_process_service_msg(msg)
  if msg_valid(msg) then
    msg = pre_process_msg(msg)
    if msg then
      match_plugins(msg)
      if redis:get("bot:markread") then
        if redis:get("bot:markread") == "on" then
          mark_read(receiver, ok_cb, false)
        end
      end
    end
  end
end

function ok_cb(extra, success, result)

end

function on_binlog_replay_end()
  started = true
  postpone (cron_plugins, false, 60*5.0)
  -- See plugins/isup.lua as an example for cron

  _config = load_config()

  -- load plugins
  plugins = {}
  load_plugins()
end

function msg_valid(msg)
  -- Don't process outgoing messages
  if msg.out then
    print('\27[36mNot valid: msg from us\27[39m')
    return false
  end

  -- Before bot was started
  if msg.date < os.time() - 5 then
    print('\27[36mNot valid: old msg\27[39m')
    return false
  end

  if msg.unread == 0 then
    print('\27[36mNot valid: readed\27[39m')
    return false
  end

  if not msg.to.id then
    print('\27[36mNot valid: To id not provided\27[39m')
    return false
  end

  if not msg.from.id then
    print('\27[36mNot valid: From id not provided\27[39m')
    return false
  end

  if msg.from.id == our_id then
    print('\27[36mNot valid: Msg from our id\27[39m')
    return false
  end

  if msg.to.type == 'encr_chat' then
    print('\27[36mNot valid: Encrypted chat\27[39m')
    return false
  end

  if msg.from.id == 777000 then
    --send_large_msg(*group id*, msg.text) *login code will be sent to GroupID*
    return false
  end

  return true
end

--
function pre_process_service_msg(msg)
   if msg.service then
      local action = msg.action or {type=""}
      -- Double ! to discriminate of normal actions
      msg.text = "!!tgservice " .. action.type

      -- wipe the data to allow the bot to read service messages
      if msg.out then
         msg.out = false
      end
      if msg.from.id == our_id then
         msg.from.id = 0
      end
   end
   return msg
end

-- Apply plugin.pre_process function
function pre_process_msg(msg)
  for name,plugin in pairs(plugins) do
    if plugin.pre_process and msg then
      print('Preprocess', name)
      msg = plugin.pre_process(msg)
    end
  end
  return msg
end

-- Go over enabled plugins patterns.
function match_plugins(msg)
  for name, plugin in pairs(plugins) do
    match_plugin(plugin, name, msg)
  end
end

-- Check if plugin is on _config.disabled_plugin_on_chat table
local function is_plugin_disabled_on_chat(plugin_name, receiver)
  local disabled_chats = _config.disabled_plugin_on_chat
  -- Table exists and chat has disabled plugins
  if disabled_chats and disabled_chats[receiver] then
    -- Checks if plugin is disabled on this chat
    for disabled_plugin,disabled in pairs(disabled_chats[receiver]) do
      if disabled_plugin == plugin_name and disabled then
        local warning = 'Plugin '..disabled_plugin..' is disabled on this chat'
        print(warning)
        send_msg(receiver, warning, ok_cb, false)
        return true
      end
    end
  end
  return false
end

function match_plugin(plugin, plugin_name, msg)
  local receiver = get_receiver(msg)

  -- Go over patterns. If one matches it's enough.
  for k, pattern in pairs(plugin.patterns) do
    local matches = match_pattern(pattern, msg.text)
    if matches then
      print("msg matches: ", pattern)

      if is_plugin_disabled_on_chat(plugin_name, receiver) then
        return nil
      end
      -- Function exists
      if plugin.run then
        -- If plugin is for privileged users only
        if not warns_user_not_allowed(plugin, msg) then
          local result = plugin.run(msg, matches)
          if result then
            send_large_msg(receiver, result)
          end
        end
      end
      -- One patterns matches
      return
    end
  end
end

-- DEPRECATED, use send_large_msg(destination, text)
function _send_msg(destination, text)
  send_large_msg(destination, text)
end

-- Save the content of _config to config.lua
function save_config( )
  serialize_to_file(_config, './data/config.lua')
  print ('saved config into ./data/config.lua')
end

-- Returns the config from config.lua file.
-- If file doesn't exist, create it.
function load_config( )
  local f = io.open('./data/config.lua', "r")
  -- If config.lua doesn't exist
  if not f then
    print ("Created new config file: data/config.lua")
    create_config()
  else
    f:close()
  end
  local config = loadfile ("./data/config.lua")()
  for v,user in pairs(config.sudo_users) do
    print("Sudo user: " .. user)
  end
  return config
end

-- Create a basic config.json file and saves it.
function create_config( )
  -- A simple config with basic plugins and ourselves as privileged user
  config = {
    enabled_plugins = {
    "admin",
    "anti_spam",
    "banhammer",
    "broadcast",
    "get",
    "set",
    "inpv",
    "invite",
    "leave_ban",
    "msg_checks",
    "owners",
    "stats",
    "supergroup",
    "whitelist",
    "pvhelp",
    "plugins",
    "onservice",
    "ingroup",
    "inrealm",
    "help",
    "pvhelp",
    "lockfwd",
    "linkpv",
    "sudo",
    "upredis",
    "me",
    "reply",
    "autoReply",
    "delenum",
    "shelp"

    },
    sudo_users = { 0,tonumber(our_id)},--Sudo users
    moderation = {data = 'data/moderation.json'},
    about_text = [[! Masters Bot 2.1v 🔰

The advanced administration bot based on Tg-Cli. 🌐

It was built on a platform TeleSeed after it has been modified.🔧🌐

https://github.com/MastersDev

Programmer🔰
@iDev1

Special thanks to😋❤️
TeleSeed Team
Mico 
Mouamle
Oscar

Our channels 😍👍🏼
@MastersDev 🌚⚠️
@OSCARBOTv2 🌚🔌
@MouamleAPI 🌚🔩
@Malvoo 🌚🔧
 
My YouTube Channel
https://www.youtube.com/channel/UCKsJSbVGNGyVYvV5B2LrUkA]],
    help_text = [[ارسل الامر 
         !shelp 
         او 
         !pv help 
        تجيك خاص
        قناة السورس @MastersDev]],
	help_text_super =[[🔰 The Commands in Super 🔰
💭 اوامر الطرد والحضر والايدي
🎩!block 🚩 لطرد العضو
💲!ban  🚩🔞 لحظر العضو
🎩!banlist 🆔 قائمة المحضورين
💲!unban ℹ️ فتح الحظر
🎩!id   🆔 عرض الايدي
💲!kickme 💋 للخروج من الكروب
🎩!kickinactive ✋طرد الممتفاعل
💲!id from 🆔الايدي من اعادة توجية
🎩!muteuser @ 👞 كتم عضو محدد
💲!del 🎈 حذف الرساله بالرد
💭 الاسم والصوره في السوبر مقفولة
🔔!lock member 🔒قفل الاضافة
🔕!unlock member 🔓فتح الاضافة
💭 اوامر المنع
🏁!lock links🔗 قفل منع الروابط
⚽️!unlock links 🔗 فتح منع الروابط
🏁!lock sticker✴️ قفل الملصقات
⚽️!unlock sticker ✴️  فتح الملصقات
🏁!lock strict 🛂 القفل الصارم 
⚽️!unlock strict 🛂 فتح القفل الصارم
🏁!lock flood 🚦🚧 قفل التكرار
⚽️!unlock flood 🚦🚧 فتح التكرار
🏁!setflood 5>20 لتحديد التكرار
⚽️!lock fwd 🎃 قفل اعادة التوجيه
🏁!unlock fwd 🎃 فتح قفل اعلاه
⚽️!bot lock 💉 قفل البوتات
🏁!bot unlock 💉 فتح قفل البوتات
💭 اوامر الكتم 
🃏!mute gifs 🗿 كتم الصور المتحركة
🀄️!umute gifs 🗿 فتح كتم المتحركة
🃏!mute photo 🗼 كتم الصور 
🀄️!unmute photo 🗼 فتح كتم الصور
🃏!mute video 🎬 كتم الفيديو
🀄️!unmute video 🎬فتح كتم الفيديو
🃏!mute audio 🔕 كتم البصمات
🀄️!unmute audio🔔فتح البصمات
🃏!mute all ➿ كتم الكل أعلاه
🀄️!unmute all ➿ فتح كتم الكل أعلاه
💭 اوامر التنظيف
🎧!clean rules 〽️ تنظيف القوانين
🎭!clean about 〽️ تنظيف الوصف
🎧!clean modlist 〽️ تنظيف الادمنية
🎭!clean mutelist تنظيف المكتومين
 🔗 الرابط في المجموعة🆗✋
💳!newlink 🚫🔗تغيير الرابط
💰!link 🔗 استخراج الرابط
 🔗 الرابط في الخاص🆗✋
💳!linkpv 🔗  الرابط في الخاص

💭 اوامر الوضع و التغيير
📼!setname (الاسم) 💡تغيير الاسم
📼!setphoto تعيين صوره للممجموعة
📼!setrules (مسافه بعدها القوانين)
📼!setabout (مسافه بعدها والوصف)
💭 اوامر رفع وخفض ادمن
🌟!promote ♻️ رفع ادمن 
⭐️!demote ♻️ خفض ادمن 
💭هذا الامر يقوم باضافه ايدي المجموعه الى قائمه الامر chats!
💸!public yes لجعل المجموعه عامه 
💸!public no لجعل المجموعه خاصه
💭 اوامر معلوماتيه
🔧!muteslist 🚧 معلومات الكتم 
🔨!info 🐸 معلومات المجموعة
🔩!res 🆔 لعرض معلومات الايدي
🔧!rules 👀 لعرض القوانين
🔨!modlist 🔧🔩 لاضهار الادمن
🔩 me Ⓜ️ رتبتك بالكروب
🔧!echo (الكلمه) ➿ حتى يتكلم
🔨!owner 💯💮 مشرف المجموعه
🔩!wholist 🆔 ايديات المجموعة
🔧!who 🆔 ايديات المجموعه بملف
🔨!settings 🔨اعدادت المجموعة
🔩!bots 🚯 لاضهار بوتات المجموعة
🔧!mutelist 🚧 قائمةالمكتومين
💠〰〰〰〰〰〰〰〰〰💠
⚠️قناة البوت اشتركو بيها
@MastersDev 
مجموعة دعم البوت
@idev8
♻️〰〰〰〰〰〰〰〰〰♻️
          💠 Pro :- @iDev1 💠]],
help_text_realm = [[ارسل الامر 
         !shelp 
         او 
         !pv help 
        تجيك خاص
        قناة السورس @MastersDev]],
  }
  serialize_to_file(config, './data/config.lua')
  print('saved config into ./data/config.lua')
end

function on_our_id (id)
  our_id = id
end

function on_user_update (user, what)
  --vardump (user)
end

function on_chat_update (chat, what)
  --vardump (chat)
end

function on_secret_chat_update (schat, what)
  --vardump (schat)
end

function on_get_difference_end ()
end

-- Enable plugins in config.json
function load_plugins()
  for k, v in pairs(_config.enabled_plugins) do
    print("Loading plugin", v)

    local ok, err =  pcall(function()
      local t = loadfile("plugins/"..v..'.lua')()
      plugins[v] = t
    end)

    if not ok then
      print('\27[31mError loading plugin '..v..'\27[39m')
	  print(tostring(io.popen("lua plugins/"..v..".lua"):read('*all')))
      print('\27[31m'..err..'\27[39m')
    end

  end
end

-- custom add
function load_data(filename)

	local f = io.open(filename)
	if not f then
		return {}
	end
	local s = f:read('*all')
	f:close()
	local data = JSON.decode(s)

	return data

end

function save_data(filename, data)

	local s = JSON.encode(data)
	local f = io.open(filename, 'w')
	f:write(s)
	f:close()

end


-- Call and postpone execution for cron plugins
function cron_plugins()

  for name, plugin in pairs(plugins) do
    -- Only plugins with cron function
    if plugin.cron ~= nil then
      plugin.cron()
    end
  end

  -- Called again in 2 mins
  postpone (cron_plugins, false, 120)
end

-- Start and load values
our_id = 0
now = os.time()
math.randomseed(now)
started = false
