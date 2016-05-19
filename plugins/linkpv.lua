do
function iDev1(msg, matches)
       if not is_momod(msg) then
        return "only 4 admin"
       end
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then 
        return "plez send\n !newlink\n to get a newlink :("
       end
         local text = "🌐link of group:\n"..group_link
          send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "look at Ur pv to get link :)"
end
return {
  patterns = {
    "^[/#!]([Ll]inkpv)$"
  },
  run = iDev1
}
end