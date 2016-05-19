do 
local function iDev1(msg, matches) 
if ( msg.text ) then
  if ( msg.to.type == "user" ) then
     return "اهلاً في الرد الألي لبوت MastersDev\n لتحدث مع مبرمج البوت ادخل المعرف @iDev1\n وللدخول لمجموعه الدعم ادخل المعرف @iDev8"
    end 
  end 
end 
return { 
  patterns = { 
     "(.*)$"
  }, 
  run = iDev1 
} 

end 