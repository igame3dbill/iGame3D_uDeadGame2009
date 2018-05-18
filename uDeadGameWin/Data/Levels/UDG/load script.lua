

-- Begin of auto-script
LockScript = true
-- End of auto-script
if UIMainTools then UIMainTools:hide() end
gameroot=getSceneInfo(IG3D_ROOT)
dofile(gameroot.."Data/Levels/default/default_Globals.lua")
loadLevel("Data/Levels/UDG/UDG_IntroCredits")
