local function iq_abs(msg,matches)
local iq_abs = matches[2]
return iq_abs
end

  return  {
    patterns = {
      "^[#!/](re)(.+)",
},
  run = iq_abs,
}