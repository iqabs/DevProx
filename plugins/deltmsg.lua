local function history(extra, suc, result) 
  for i=1, #result do 
    delete_msg(result[i].id, ok_cb, false) 
  end 
  if tonumber(extra.con) == #result then 
    send_msg(extra.chatid, ' ⛔️❗️ تـۖم حـذف ٱڵـرسٲل بّنـجاح '..#result..'', ok_cb, false) 
  else 
    send_msg(extra.chatid, '⛔️❗️ تـۖم حـذف ٱڵـرسٲل بّنـجاح', ok_cb, false) 
  end 
end 
local function iq_abs(msg, matches) 
  if matches[1] == 'delt' and is_owner(msg) then 
    if msg.to.type == 'channel' then 
      if tonumber(matches[2]) > 10000000000 or tonumber(matches[2]) < 1 then 
        return "⛔️❗️ العدد المحدود (1000000/5) فقط" 
      end 
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]}) 
    else 
      return "" 
    end 
  else 
    return "للمشرفين فقط ⛔️😴✋🏿" 
  end 
end 

return { 
    patterns = { 
        '^[Dd](elt) (%d*)$', 
        '^[/!#](delt) (%d*)$' 
    }, 
    run = iq_abs
} 
