do local function run(msg, matches) if is_momod(msg) and matches[1]== "he1" then return [[ 🚸❗️ #اوامر_ادارة_المجموعة 
✵•┈••●◆ 🎌 ◆●••┈•✵
🎴 /who :: قـائـمـة الاعـضـاء | 🗝 
🎴 /info :: مـعلومـات الـشـخـص | 🔬 
🎴 /gpinfo :: مـعلومـات الكروب | 🔧 
🎴 /me :: لـعرض مـوقـعـك | ⚙ 
✵•┈••●◆ 🎴 ◆●••┈•✵
🎳 /link :: رابـط الـكـروب | 📐 
🎳 /setlink :: لـصـنـع رابـط | 📍 
🎳 /linkpv :: الـرابـط خـاص | 📩 
🎳 /newlink :: رابـط جـديـد | 🆕 
✵•┈••●◆ 🏮 ◆●••┈•✵
🏮 /block :: لـمـنـع الـكلمات | ▫️ 
🏮 /unblock :: لـفك منع الـكلمـة | 🔺 
🏮 /blocks :: قائمة الـكلمات | 🔻 
🏮 /delt blocks ::مسح الكلمات|▪️ 
✵•┈••●◆ 🎯 ◆●••┈•✵
🎯 /setrules :: وضـع الـقـوانـيـن 
🎯 /rules :: رؤيــة الـقـوانـيـن 
🎯 /setabout :: وضـع الــوصــف 
🎯 /setname :: وضـع اسـم للمجموعة 
🎯 /setphoto :: وضع صورة للمجموعة 
🎯 /setusername :: وضع معرف 
✵•┈••●◆ ✂️ ◆●••┈•✵
✂️ /delt rules | 📮 
✂️ /delt about | 📕 
✂️ /delt modlist | 📍 
✂️ /delt silentlist | 🚩 
✂️ /delt username | 📌 
✂️ /delt + (5/1000000) لحذف رسائل المجموعة بالعدد
✵•┈••●◆ 🎌 ◆●••┈•✵
- DEV - @IQ_ABS   🗞📌
- Channel - @DEV_PROX ]] end if not is_momod(msg) then return "للمشرفين فقط ⛔️😴✋🏿" end end return { description = "Help list", usage = "Help list", patterns = { "[#!/](he1)" }, run = run } end 
