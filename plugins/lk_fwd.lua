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

local function pre_process(msg) 
    --Checking mute 
    local hash = 'mate:'..msg.to.id 
    if redis:get(hash) and msg.fwd_from and not is_sudo(msg) and not is_owner(msg) and not is_momod(msg) and not is_admin1(msg)  then 
            delete_msg(msg.id, ok_cb, true) 
            send_large_msg(get_receiver(msg), '🚷❗️ عـۛزيـۛزي : '..msg.from.first_name..'\nمٌمٌنوع عمل اعآدة توجية مۧن آلُقنواة هناا..\nألتزم بـٲڵـقوۧانيۧن لتجنب الـطرد⛔️🎣\n🕴 #user : @'..msg.from.username) 
            return "done" 
        end 
        return msg 
    end 

local function iq_abs(msg, matches) 
    chat_id =  msg.to.id 
    if is_momod(msg) and matches[1] == 'lk' then 
                    local hash = 'mate:'..msg.to.id 
                    redis:set(hash, true) 
                    return "" 
  elseif is_momod(msg) and matches[1] == 'nlk' then 
                    local hash = 'mate:'..msg.to.id 
                    redis:del(hash) 
                    return "" 
end 

end 

return { 
    patterns = { 
        '^[/!#](lk) fwd$', 
        '^[/!#](nlk) fwd$' 
    }, 
    run = iq_abs, 
    pre_process = pre_process 
} 
end 
