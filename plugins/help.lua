do
--local function help()
local function iDev1(msg,matches)
    if matches[1] == 'help' then
  local help_text = tostring(_config.help_text)
  return help_text
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /help")
      return help()
    end
   
return {
    patterns = {
        '[#!/](help)'
        
    },

  run = iDev1
}

end
