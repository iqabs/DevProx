do local function run(msg, matches) 
local reply_id = msg['id']
 if is_momod(msg) and matches[1]== "help" then return [[ WELCOOME TO help list 🚁

🌍- هناك خمس قوائم لٲدارة المجموعة 
🌎- There are five list in the group
〰➖〰➖〰➖〰➖〰
🔵 - /he1 — اوامر ادارة المجموعة 
⚫️ - /he2 — اوامر حماية المجموعة 
⚪️ - /he3 — اوامر الطرد والرفع
🔴 - /he4 —  اوامـر اضـآفـيـة 
🔘 - /hedev —  اوامر ألمطورين 
〰➖〰➖〰➖〰➖〰
- DEV - @IQ_ABS   🗞📌
- Channel - @DEV_PROX ]] end if not is_momod(msg) then return "للمشرفين فقط ⛔️😴✋🏿" end end return { description = "Help list", usage = "Help list", patterns = { "[#!/](help)" }, run = run } end 
