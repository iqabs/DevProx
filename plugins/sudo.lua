
local function run(msg,matches)
if is_sudo(msg) and matches[1]== "sudo" then
local text = [[❌🚫اوامر المطورين😊✋    
📵!modadd 🔘 أضافة البوت
📵!modrem 🔘 حذف البوت
📵!creategroup🔘صنع 
📵!banall🔘عام
📵!unbanall🔘سماح
📵!setowner🔘وضع مشرف
📵!broadcast🔘رسالة للجميع
📵!setadmin🔘وضع ادمن
📵!demoteadmin🔘حذف ادمن
📵!super 🔘تحويل لسوبر
♻️〰〰〰〰〰〰〰〰〰♻️
  💠 pro :- @iDev1 💠]]
return text
end
     if not is_sudo(msg) then
      return "for sudo"
     end 
  end
 
return {
patterns ={
  "^[!/#](sudo)$"
},
run = run
}