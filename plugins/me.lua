--[[ 
$ :) 
-- - ( #MASCO_ماسكو ) - -- 
$ :) 
-- - ( @IQ_ABS ) - -- 
$ :) 
--Channel-( @DEV_PROX )-- 
$ :) 
]]-- 
do 

local function iq_abs(msg, matches) 
if is_sudo(msg) then 
        local text = "أنـت مـطـور الـبـؤت 🕵🔧".."\n".."🆔 - أيـۧديـۧک : "..msg.from.id.."\n".."🏧- أســمـك : "..msg.from.first_name.."\n".."🚸- مــعــرفــك  : @"..msg.from.username.."\n".."©- أســم ألـمـجـمـوعـة : "..msg.to.title.."\n"..'📱 - رقـۖـمـۗـک : '..(msg.from.phone or "لُايَوَجْدِ ⛔️‼️")
        return reply_msg(msg.id, text, ok_cb, false) 
     end 
if is_momod(msg) then 
        local text = "أنـت أدمــن ألـكـروب 🛳⚓️".."\n".."🆔 - أيـۧديـۧک : "..msg.from.id.."\n".."🏧- أســمـك : "..msg.from.first_name.."\n".."🚸- مــعــرفــك : @"..msg.from.username.."\n".."©- أســم ألـمـجـمـوعـة : "..msg.to.title.."\n"..'📱 - رقـۖـمـۗـک : '..(msg.from.phone or "لُايَوَجْدِ ⛔️‼️")
        return reply_msg(msg.id, text, ok_cb, false) 
     end 
if not is_momod(msg) then 
        local text = "أنـت عـضـوو 😹💙".."\n".."🆔 - أيـۧديـۧک : "..msg.from.id.."\n".."🏧- أســمـك : "..msg.from.first_name.."\n".."🚸- مــعــرفــك : @"..msg.from.username.."\n".."©- أسـم ألـمـجـمـوعـة : "..msg.to.title.."\n"..'📱 - رقـۖـمـۗـک : '..(msg.from.phone or "لُايَوَجْدِ ⛔️‼️")
        return reply_msg(msg.id, text, ok_cb, false) 
     end 
if is_owner(msg) then 
        local text = "أنـت مــديــر ألـكـروب 🤖🤘🏼".."\n".."🆔 - أيـۧديـۧک : "..msg.from.id.."\n".."🏧- أســمـك : "..msg.from.first_name.."\n".."🚸- مــعــرفــك  : @"..msg.from.username.."\n".."©- أســم ألـمـجـمـوعـة : "..msg.to.title.."\n"..'📱 - رقـۖـمـۗـک : '..(msg.from.phone or "لُايَوَجْدِ ⛔️‼️")
        return reply_msg(msg.id, text, ok_cb, false) 
     end 
     end 

return { 
  patterns = { 
       "^[!/](me)$", 
  }, 
  run = iq_abs, 
} 

end 

-- BY - @IQ_ABS 
