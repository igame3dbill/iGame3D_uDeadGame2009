-- Begin of auto-script
LockScript = true
-- End of auto-script
if UIMainTools then UIMainTools:hide() end
gameroot=getSceneInfo(IG3D_ROOT)
dofile(gameroot.."Data/Levels/default/default_Globals.lua")
--dofile(gameroot.."Data/Fluid/UI_MAIN_TOOLS/UI_MAIN_TOOLS.fl")
--TextBox_Levels_Menu()  -- see Data/Scripts/Functions/textBox_functions.lua

loadLevel("Data/Levels/UDG/UDG_IntroCredits")