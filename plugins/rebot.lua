do 

local function run(msg, matches) 

if ( msg.text ) then 

  if ( msg.to.type == "user" ) then 

     return "- أهـلآ وسـهلا بـك في البوت ⇣\n- Welcome to BOT ⇣\n- لـمزيـد مـن المعلومات راسـل المطور ⇣\n- For more information Contact Developer ⇣\n- DEV - @IQ_ABS ♋️✴️♋️\n- Channel  -  @DEV_PROX" 
  end 
end 

-- DEV @IQ_ABS 

end 

return { 
  patterns = { 
       "(.*)$" 
  }, 
  run = run, 
} 

end 
-- BY @IQ_ABS 
