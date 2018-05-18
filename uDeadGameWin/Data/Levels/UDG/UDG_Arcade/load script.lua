-- Begin of auto-script
loadMesh("Data/Levels/UDG/UDG_Arcade/UDG_Arcade_level_mesh.wtf")
gSoundFiles={"Data/Sounds/bodyhit.ogg","Data/Sounds/skid.ogg","Data/Sounds/engine.ogg","Data/Sounds/colt45.ogg","Data/Sounds/rifle.ogg","Data/Sounds/zombie.ogg","Data/Sounds/male_scream1.ogg","Data/Sounds/male_scream2.ogg","Data/Sounds/female_scream1.ogg","Data/Sounds/female_scream2.ogg","Data/Sounds/zombie_eating.ogg","Data/Sounds/zombie_yes.ogg","Data/Sounds/zombie_idle1.ogg","Data/Sounds/zombie_idle2.ogg","Data/Sounds/zombie_idle3.ogg","Data/Sounds/zombie_idle4.ogg","Data/Sounds/footsteps_walk.ogg","Data/Sounds/footsteps_run.ogg","Data/Sounds/bodyhitfloor.ogg","Data/Sounds/male_eaten.ogg","Data/Sounds/female_eaten.ogg","Data/Sounds/no_way.ogg","Data/Sounds/punchsolid.ogg","Data/Sounds/glassbreaking.ogg","Data/Sounds/grenade.ogg","Data/Sounds/dropgrenade.ogg"}
for i=1,#gSoundFiles,1 do
	loadSound(gSoundFiles[i])
end
gFontFiles={{"Data/FontPngs/default32_1.png","Data/FontPngs/default32_2.png"}}
for i=1,#gFontFiles,1 do
	loadFont(gFontFiles[i][1],gFontFiles[i][2])
end
setCameraInfo(IG3D_POSITION, 2.133206, 0.767221, -0.530848)
setCameraInfo(IG3D_ROTATION, 9.999902, -176.649933, 0.000000)
gObjects={}
gObjectWTFs={"Misc/selectionRect.wtf","Reticule/crosshair.wtf","Cubes/kiste.wtf","Characters/scientist.wtf","Characters/fatscifisoldierTB.wtf","Characters/tomdrinwoman1_3k.wtf","Characters/thug_mustafa.wtf","Characters/tomdrinwoman3_3k.wtf","Characters/civilianmale1TB.wtf","Characters/civilianmale2TB.wtf","Characters/thug_melvin.wtf","Characters/thug_rufus.wtf","Characters/thug_fatjack.wtf","Weapons/leadpipe84.wtf","Weapons/gloc.wtf","Tools/baton.wtf","Weapons/leadpipe84.wtf","Tools/baton2.wtf","Weapons/leadpipe84.wtf","Weapons/leadpipe84.wtf","Weapons/leadpipe84.wtf","Weapons/luger140.wtf","Tools/baton2.wtf","Characters/zombiechick_alt.wtf","Characters/tomdrinman5_3kslimed.wtf","Characters/swatzombieTB.wtf","Characters/antackzombie.wtf","Characters/tomdrinman2tronguy.wtf","Characters/tomdrinman4_3kgreenbeard.wtf","Characters/antackzombie.wtf","Characters/antackzombie.wtf","Characters/thug_fatjackblack.wtf","Characters/swatfemale1k.wtf","Characters/antackzombie.wtf","Characters/soldierusaTB.wtf","Characters/soldiersol1kTB.wtf","Weapons/gloc.wtf","Weapons/gloc.wtf","Weapons/gloc.wtf","Weapons/gloc.wtf","Weapons/gloc.wtf","Characters/tomdrinwoman1_3kredhead.wtf","Characters/tomdrinman2_3kladyman.wtf","Characters/tomdrinman5_police.wtf","Characters/thug_jackson.wtf","Characters/thug_mustafa.wtf","Characters/thug_fatjackblack.wtf","Weapons/bostaff84.wtf","Weapons/luger140.wtf","Weapons/luger140.wtf","Weapons/m16980.wtf","Tools/baton2.wtf","Tools/baton.wtf","Tools/baton2.wtf","Weapons/gloc.wtf","Weapons/gloc.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Building_parts/doorglass1x1.wtf","Characters/robothead.wtf","Characters/robothead.wtf","Misc/udgmainmenu.wtf"}
gObjectNames={"selectionRect1","crosshair1","playerbox","human1","human2","human3","human4","human5","human6","human7","human8","human9","human10","gun2","gun3","gun4","gun5","gun6","gun7","gun8","gun9","gun10","gun11","zombiechick_alt2","tomdrinman5_3kslimed5","tomdrinman2_3ksnowed8","antackzombie1","tomdrinman2tronguy1","tomdrinman4_3kgreenbeard1","antackzombie2","antackzombie3","thug_fatjackblack1","swatfemale1k1","antackzombie4","fatscifisoldierTB1","fatscifisoldierTB2","gloc1","gloc2","gloc3","gloc4","gloc5","tomdrinwoman1_3kredhead1","tomdrinman2_3kladyman1","tomdrinman5_police1","thug_jackson1","thug_mustafa1","thug_fatjackblack2","bostaff841","luger1401","luger1402","m169801","policebaton1","leadpipe841","leadpipe842","gloc6","gloc7","doorglass1x11","doorglass1x12","doorglass1x13","doorglass1x14","doorglass1x15","doorglass1x16","doorglass1x17","doorglass1x18","doorglass1x19","doorglass1x110","doorglass1x111","doorglass1x112","robothead1","robothead2","udgmainmenu1"}
gObjectPositions={{0.966020,-10.925303,-0.301002},{-0.000000,-0.000000,-0.100000},{1.967922,0.249558,-23.680616},{0.001887,0.498722,8.445904},{-2.038898,0.498685,6.402115},{3.648956,0.615639,-5.579649},{5.456136,0.498722,7.461141},{-0.705520,0.624321,10.059757},{-5.389371,0.498722,-3.919760},{9.318807,0.498761,4.311577},{-4.549704,0.498722,6.595905},{-7.597248,0.498722,4.293692},{5.788920,0.498722,-5.226608},{-10.129247,0.490008,-1.580281},{3.177270,-10.925303,5.754665},{2.387695,0.724027,-0.550564},{6.296766,0.675642,-18.150537},{-4.410664,0.486506,-5.899402},{-5.870865,0.469578,-8.266376},{-0.026164,0.732351,-18.335018},{-3.918868,0.528206,1.969790},{-10.110561,0.697326,-3.499760},{-9.624247,0.638709,-27.893038},{3.760464,1.249553,-29.963326},{-0.293421,1.364985,-16.434582},{0.858633,1.369759,-18.348682},{-5.827864,0.498722,-34.431606},{0.280172,0.698722,-10.254442},{-1.589575,0.620828,0.181579},{-10.346601,0.498652,-25.816706},{4.155470,0.498722,-34.100208},{1.400766,0.498722,0.109802},{-2.421492,0.498722,-1.434280},{-2.220908,0.498722,-33.936794},{1.820688,0.498077,6.568367},{6.529173,0.498345,4.903272},{-0.196219,0.419589,-1.454525},{9.855677,0.483326,-0.143794},{-7.187184,0.741183,4.287955},{-5.722342,0.747062,6.093747},{-8.665343,0.514081,0.292054},{3.381292,0.652160,0.475732},{-8.797709,0.662485,4.543278},{-3.886163,0.648356,2.506835},{-9.077846,0.499596,1.016267},{8.977755,0.787214,-1.787355},{0.645976,0.495048,10.066528},{-5.961198,0.638730,-34.548592},{8.987661,0.359154,-28.100971},{9.053282,0.713142,3.812032},{5.941695,0.620486,0.627988},{2.131007,0.699489,-27.859812},{5.907392,0.710530,4.053172},{-5.351740,0.675371,-22.103500},{7.616230,0.782684,-4.135891},{5.417936,0.359054,-33.795418},{-0.519995,0.909845,-12.898787},{0.415936,0.909845,-12.936666},{1.478235,0.829591,-3.153786},{2.456115,0.829591,-3.184674},{-2.506568,0.965267,-3.134617},{-1.500168,0.965267,-3.086331},{4.666188,0.891338,-5.582596},{4.630048,0.891338,-6.518115},{5.505609,0.829706,-8.762606},{6.455650,0.829706,-8.788727},{-6.490101,0.902908,-7.306772},{-5.523229,0.902908,-7.301926},{-2.678493,0.810653,-19.049341},{2.869481,0.806893,-19.332727},{-0.939985,3.748173,-33.567459}}
gObjectRotations={{-0.000000,-0.000000,-0.000000},{-0.000000,-0.000000,-0.000000},{0.085148,-29.419912,0.189814},{179.966110,11.994798,-179.943893},{179.976868,55.570389,179.913651},{-0.065120,-48.293213,0.010716},{179.940964,5.494766,179.972916},{179.931641,-64.995346,-179.956436},{179.976746,69.941048,-179.992432},{-0.118194,14.503376,-0.015040},{179.977295,33.495140,179.993164},{179.933868,53.994797,179.939117},{179.998871,6.506020,179.980118},{152.583618,4.266920,109.648270},{-179.952942,-83.999878,179.882050},{174.256760,-27.832661,-168.938858},{-12.100119,49.362926,-15.078798},{-139.302414,-16.951393,100.977493},{174.741745,-3.772819,109.760956},{-176.123047,24.355251,-169.298431},{112.068398,16.149649,102.125488},{-176.117325,24.354259,-169.293884},{-176.123169,24.355268,-169.299316},{-179.578110,-41.940647,-179.607834},{-177.533585,-55.425125,179.968750},{0.345661,43.216534,0.151961},{0.007498,-0.000000,-0.009260},{179.959976,-9.999887,-179.996490},{-0.137750,84.500610,-0.068432},{-0.118515,61.000282,-0.118515},{-0.001505,-0.000000,-0.000000},{179.862228,-76.500778,-179.931213},{-0.050783,-20.000570,0.008955},{-0.000000,-0.000000,-0.000000},{179.944046,-0.000014,179.972031},{179.939392,-11.582204,-179.973969},{121.150658,14.091631,104.478439},{80.199951,20.092878,92.012985},{167.505386,-50.250786,-164.681763},{169.071381,-46.383614,-165.823380},{118.638489,14.686443,103.872871},{179.975662,65.999527,-179.989426},{179.965439,8.499796,179.997437},{-180.000000,49.081825,-180.000000},{-179.902496,69.499519,-179.911514},{179.974106,-79.999695,-179.969147},{-179.997513,-9.999693,179.971695},{-176.126236,24.355793,-169.306900},{64.767563,19.807810,86.698174},{-69.522392,79.553093,-69.266251},{-0.000000,-0.000000,-0.000000},{-176.128494,24.356182,-169.301666},{-179.598358,5.646042,-170.237228},{170.083572,-43.470276,-166.563034},{64.767151,19.814837,86.718025},{64.767159,19.814547,86.723122},{-0.000000,-0.000000,-0.000000},{-179.998444,-4.500389,179.960342},{0.000000,-0.000000,0.000000},{179.918427,-1.000244,-179.999298},{-0.000000,-0.000000,-0.000000},{179.933029,-0.500085,179.972321},{179.020660,86.943153,179.018555},{-0.000000,-87.498688,0.000000},{-0.000000,-0.000000,-0.000000},{179.955719,-2.918563,-179.998871},{-0.000000,-0.000000,-0.000000},{-179.999878,0.499089,-179.972031},{-0.080003,79.000572,-0.065950},{179.976135,-38.500149,-179.991669},{0.000000,-0.000000,0.000000}}
gObjectSizes={{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{50.000000,50.000000,50.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000},{100.000000,100.000000,100.000000}}
gObjectColls={false,false,true,true,true,true,true,true,true,true,true,true,true,false,true,false,false,false,false,false,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,true,true,true,true,true,true,false,false,false,true,false,false,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true}
gObjectHUDs={false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false}
for i=1,#gObjectWTFs,1 do
	gObjects[i]={}
gObjects[i].cObj=make(ig3d_object, gObjectWTFs[i])
	setObjectInfo(gObjects[i].cObj, IG3D_NAME, gObjectNames[i])
	setObjectInfo(gObjects[i].cObj, IG3D_POSITION, gObjectPositions[i][1],gObjectPositions[i][2],gObjectPositions[i][3])
	setObjectInfo(gObjects[i].cObj, IG3D_ROTATION, gObjectRotations[i][1],gObjectRotations[i][2],gObjectRotations[i][3])
	setObjectInfo(gObjects[i].cObj, IG3D_SIZE, gObjectSizes[i][1],gObjectSizes[i][2],gObjectSizes[i][3])
	setObjectInfo(gObjects[i].cObj, IG3D_COLL, gObjectColls[i])
	setObjectInfo(gObjects[i].cObj, IG3D_HUD, gObjectHUDs[i])
end
gNumObjects=#gObjectWTFs
gParticleNamesAndEMTs={{"Bullets","Data/Emitters/pistol.emt"},{"TireTraces","Data/Emitters/tiretrace.emt"},{"Blood","Data/Emitters/blood.emt"},{"MoreBlood","Data/Emitters/blood2.emt"},{"MuzzleFlash","Data/Emitters/muzzleflash.emt"},{"Unitmarker","Data/Emitters/unitmarker.emt"},{"Unitmarker2","Data/Emitters/unitmarker2.emt"},{"fpsgun","Data/Emitters/slowbullet.emt"},{"bloodonfloor","Data/Emitters/bloodonfloor.emt"},{"arcadegame11emt","Data/Emitters/Misc/arcadegame1.emt"},{"arcadegame21emt","Data/Emitters/Misc/arcadegame2.emt"},{"eatdotsgame1emt","Data/Emitters/Misc/eatdotsgame.emt"},{"rotngame1emt","Data/Emitters/Misc/rotngame.emt"},{"illegaaliensgame1emt","Data/Emitters/Misc/illegaaliensgame.emt"},{"illegaaliensgame2emt","Data/Emitters/Misc/illegaaliensgame.emt"},{"deaddaysgame1emt","Data/Emitters/Misc/deaddaysgame.emt"},{"deaddaysgame2emt","Data/Emitters/Misc/deaddaysgame.emt"},{"illegaaliensgame3emt","Data/Emitters/Misc/illegaaliensgame.emt"},{"udgarcadegame3","Data/Emitters/Misc/udgarcadegame.emt"},{"antackgame1emt","Data/Emitters/Misc/antackgame.emt"},{"antackgame2emt","Data/Emitters/Misc/antackgame.emt"},{"udgarcadegame2","Data/Emitters/Misc/udgarcadegame.emt"},{"postmortemgame2emt","Data/Emitters/Misc/postmortemgame.emt"},{"dawnofthederbygame1emt","Data/Emitters/Misc/dawnofthederbygame.emt"},{"iflygame1emt","Data/Emitters/Misc/iflygame.emt"},{"iflygame2emt","Data/Emitters/Misc/iflygame.emt"},{"dawnofthederbygame2emt","Data/Emitters/Misc/dawnofthederbygame.emt"},{"dawnofthederbygame3emt","Data/Emitters/Misc/dawnofthederbygame.emt"},{"ibotgame1emt","Data/Emitters/Misc/ibotgame.emt"},{"ibotgame2emt","Data/Emitters/Misc/ibotgame.emt"},{"stilllifegame1emt","Data/Emitters/Misc/stilllifegame.emt"},{"stilllifegame2emt","Data/Emitters/Misc/stilllifegame.emt"},{"UDGarcadegame1","Data/Emitters/Misc/udgarcadegame.emt"},{"tumorinacangame2emt","Data/Emitters/Misc/tumorinacangame.emt"},{"trankgame1emt","Data/Emitters/Misc/trankgame.emt"},{"trankgame2emt","Data/Emitters/Misc/trankgame.emt"},{"ighoulgame1emt","Data/Emitters/Misc/ighoulgame.emt"},{"ighoulgame2emt","Data/Emitters/Misc/ighoulgame.emt"},{"glthrillgame1emt","Data/Emitters/Misc/glthrillgame.emt"},{"glthrillgame2emt","Data/Emitters/Misc/glthrillgame.emt"},{"deaddaysgame3emt","Data/Emitters/Misc/deaddaysgame.emt"},{"ibotgame3emt","Data/Emitters/Misc/ibotgame.emt"},{"antackgame3emt","Data/Emitters/Misc/antackgame.emt"},{"Grenade","Data/Emitters/grenade.emt"},{"Explosion","Data/Emitters/grenadeexplosion.emt"}}
gParticlePositions={{-34.501820,-2.745420,-11.845739},{-185.062057,-2.428456,-0.457016},{-29.986479,-2.190553,-33.200272},{-0.182363,0.522658,-0.518280},{-34.501820,-2.745420,-11.845739},{-34.501820,-2.745420,-11.845739},{-0.000000,0.050000,10.000000},{-34.501820,-2.745420,-11.845739},{-34.501820,-2.745420,-11.845739},{-0.200317,0.733300,-2.672408},{-2.655023,0.733300,-0.042049},{4.422526,0.733300,0.847146},{3.132788,0.733300,-0.760473},{0.036127,0.733300,2.711096},{3.342926,0.733300,2.703171},{2.666994,0.733300,4.063495},{6.658157,0.733300,5.915903},{7.832803,0.733300,3.362060},{-1.163361,0.733300,10.506916},{-3.348904,0.733300,5.447472},{-2.178533,0.733300,-6.714643},{2.671906,0.733300,-3.653985},{3.414858,0.733300,6.952437},{2.417180,0.733300,-6.689247},{-0.192582,0.733300,-5.174050},{-4.500902,0.733300,-6.685899},{-6.668537,0.733300,-2.026357},{-5.319847,0.733300,-4.079051},{8.416795,0.733300,-0.079830},{6.915716,0.733300,-6.212407},{4.462640,0.733300,-2.648729},{5.379981,0.733300,-7.753555},{-3.936531,0.733300,9.381724},{-7.451031,0.733300,3.302325},{1.245327,0.733300,9.192301},{5.314250,0.733300,3.997296},{-2.496988,0.733300,-2.900818},{-9.367465,0.733300,1.863781},{-10.625632,0.733300,-3.522586},{-9.323051,0.733300,-1.692476},{-0.046754,0.733300,5.645897},{-0.689856,0.733300,-9.018378},{0.760030,0.857423,-9.072849},{6.167578,1.123812,0.426051},{6.167578,1.123812,0.426051}}
gParticleRotations={{-9.058784,168.954941,-0.000000},{17.067825,64.048012,-0.000000},{-29.986481,-2.190553,-33.200272},{-0.182363,0.522658,-0.518280},{-0.182363,0.522658,-0.518280},{-0.000000,-0.000000,-0.000000},{-0.000000,-0.000000,-0.000000},{-0.000000,-0.000000,-0.000000},{-0.000000,-0.000000,-0.000000},{-0.925405,0.000865,-0.001816},{-0.010439,89.582222,-0.000000},{-0.010460,-89.582222,-0.000000},{1.115638,-88.093712,-1.255992},{-177.772339,0.006559,179.801605},{-178.359741,2.364010,-179.750534},{177.816833,-88.502235,-177.809128},{-0.000000,-88.502365,-0.000000},{-0.000000,-0.000000,-0.000000},{-179.979691,-1.500432,179.960175},{-0.000000,-0.000000,-0.000000},{-0.000000,-0.000000,-0.000000},{-0.019695,-89.582222,-0.000000},{179.943771,1.499777,179.979477},{-0.000000,-0.000000,-0.000000},{-179.947571,0.500059,-179.979996},{-0.000000,-0.000000,-0.000000},{0.090595,86.501732,0.136490},{0.004203,-89.582222,-0.000000},{3.827152,82.484428,3.973121},{-0.044196,-89.582222,-0.000000},{-0.000000,-0.000000,-0.000000},{-0.013541,89.918434,-0.000000},{-0.111002,87.502678,-0.115949},{-0.000000,-0.000000,-0.000000},{-0.000000,-0.000000,-0.000000},{-0.013924,89.501503,-0.000000},{-179.429840,87.502213,-179.466980},{-0.031240,-89.918434,-0.000000},{0.180366,85.000603,0.271126},{179.934937,-88.000900,-179.900803},{-0.000000,-0.000000,-0.000000},{-0.000000,112.500000,-0.000000},{-0.000000,-80.000000,-0.000000},{-0.000000,-0.000000,-0.000000},{-0.000000,-0.000000,-0.000000}}
gParticleEmitters={}
for i=1,#gParticleNamesAndEMTs,1 do
	gParticleEmitters[i]=make(ig3d_particle_emitter, gParticleNamesAndEMTs[i][1], gParticleNamesAndEMTs[i][2])
	setParticle_emitterInfo(gParticleEmitters[i], IG3D_POSITION, gParticlePositions[i][1],gParticlePositions[i][2],gParticlePositions[i][3])
	setParticle_emitterInfo(gParticleEmitters[i], IG3D_ROTATION, gParticleRotations[i][1],gParticleRotations[i][2],gParticleRotations[i][3])
end
gNumParticleEmitters=#gParticleNamesAndEMTs
gSoundEmitterNames={"emt1","emt2","emt3","emt4","emt5","emt6","emt7","emt8","emt9","emt10","emt11","emt12","emt13","emt14","emt15","emt16","emt17","emt18","emt19","emt20","emt21","emt22","emt23","emt24","emt25","emt26","emt27","emt28","emt29","emt30","emt31","emt32","emt33","emt34","emt35","emt36","emt37","emt38","emt39","emt40","emt41","emt42","emt43","emt44","emt45","emt46","emt47","emt48","emt49","emt50","emt51","emt52","emt53","emt54","emt55","emt56","emt57","emt58","emt59","emt60","emt61","emt61","emt61","emt61","emt61","emt66","emt66","emt66","emt66","emt66","emt71","emt71","emt71","emt71","emt71","emt76","emt76","emt76","emt76","emt76","emt81","emt81","emt81","emt81","emt81","emt86","emt86","emt86","emt86","emt86","emt91","emt91","emt91","emt91","emt91","emt96","emt96","emt96","emt96","emt96","emt101","emt101","emt101","emt101","emt101"}
gSoundEmitterPositions={{0.441606,0.619985,10.178659},{0.145561,0.499553,10.426063},{-0.904073,0.621980,9.954784},{2.156264,0.498094,10.040401},{0.382254,0.614985,9.846038},{-0.167035,0.496370,10.038674},{0.633445,0.620386,9.955604},{-0.516162,0.619759,9.866308},{-0.716348,0.498938,10.053930},{-0.406158,0.614397,10.161579},{32.548939,-2.700276,-37.814537},{-0.073257,0.498737,-1.548320},{-9.868608,0.498737,-3.735738},{-2.079678,0.615601,-0.011323},{2.281486,0.498737,0.794129},{-10.128036,0.624336,-1.742447},{-5.902138,0.498737,-8.439220},{7.570508,0.498776,3.663727},{6.011618,0.498737,3.961350},{-6.191916,0.498737,1.779704},{6.072805,0.498737,-7.902498},{-0.073257,0.498722,-1.548320},{-1.984610,0.498685,-4.221759},{2.370028,0.615639,6.106210},{2.437705,0.498722,-0.660798},{-10.128036,0.624321,-1.742447},{-5.902138,0.498722,-8.439220},{10.008258,0.498761,-0.178262},{6.011618,0.498722,3.961351},{-7.180679,0.498722,4.151914},{6.072805,0.498722,-7.902498},{0.441606,0.619985,10.178659},{0.145561,0.499553,10.426063},{-0.904073,0.621980,9.954784},{2.156264,0.498094,10.040401},{0.382254,0.614985,9.846038},{-0.167035,0.496370,10.038674},{0.633445,0.620386,9.955604},{-0.516162,0.619759,9.866308},{-0.716348,0.498938,10.053930},{-0.406158,0.614397,10.161579},{-5.827864,0.498722,-34.431606},{9.167439,0.498722,-27.931358},{0.167805,0.498722,-34.090462},{5.597652,0.498722,-33.625828},{-9.490898,0.498722,-27.776041},{0.061210,0.498722,-18.389200},{-4.563129,0.620828,-5.954639},{-4.165915,0.498652,-26.484764},{0.809474,0.498722,-30.120510},{0.401495,0.498722,1.776624},{2.235318,0.498722,-27.935061},{-3.404852,0.498722,-30.095713},{-5.362532,0.498077,-22.195265},{6.317035,0.498345,-18.060396},{-5.740370,0.652160,5.971421},{-3.810491,0.662485,1.849114},{-8.571321,0.648356,0.159884},{-9.982826,0.499596,-3.571680},{7.779916,0.787214,-4.087193},{9.109075,0.495048,3.877614},{-9.490898,0.498737,-27.776041},{-0.000000,-0.000000,-0.100000},{-0.073257,0.498722,-1.548320},{-1.984610,0.498685,-4.221759},{2.370028,0.615639,6.106210},{2.437705,0.498722,-0.660798},{-10.128036,0.624321,-1.742447},{-5.902138,0.498722,-8.439220},{10.008258,0.498761,-0.178262},{6.011618,0.498722,3.961351},{-7.180679,0.498722,4.151914},{6.072805,0.498722,-7.902498},{3.177270,-7.650095,5.754665},{-10.110561,0.697326,-3.499760},{-5.827864,0.498722,-34.431606},{9.167439,0.498722,-27.931358},{0.167805,0.498722,-34.090462},{5.597652,0.498722,-33.625828},{-9.490898,0.498722,-27.776041},{0.061210,0.498722,-18.389200},{-4.563129,0.620828,-5.954639},{-4.165915,0.498652,-26.484764},{0.809474,0.498722,-30.120510},{0.401495,0.498722,1.776624},{2.235318,0.498722,-27.935061},{-3.404852,0.498722,-30.095713},{-5.362532,0.498077,-22.195265},{6.317035,0.498345,-18.060396},{-0.196219,0.419589,-1.454525},{9.855677,0.483326,-0.143794},{-7.187184,0.741183,4.287955},{-5.722342,0.747062,6.093747},{-8.665343,0.514081,0.292054},{-5.740370,0.652160,5.971421},{-3.810491,0.662485,1.849114},{-8.571321,0.648356,0.159884},{-9.982826,0.499596,-3.571680},{7.779916,0.787214,-4.087193},{9.109075,0.495048,3.877614},{8.987661,0.359154,-28.100971},{9.053282,0.713142,3.812032},{5.941695,0.620486,0.627988},{7.616230,0.782684,-4.135891},{5.417936,0.359054,-33.795418}}
gSoundEmitterSamples={"Data/Sounds/zombie.ogg","Data/Sounds/zombie.ogg","Data/Sounds/zombie.ogg","Data/Sounds/zombie.ogg","Data/Sounds/zombie.ogg","Data/Sounds/zombie.ogg","Data/Sounds/zombie.ogg","Data/Sounds/zombie.ogg","Data/Sounds/zombie.ogg","Data/Sounds/zombie.ogg","","Data/Sounds/colt45.ogg","Data/Sounds/colt45.ogg","Data/Sounds/colt45.ogg","Data/Sounds/colt45.ogg","Data/Sounds/colt45.ogg","Data/Sounds/colt45.ogg","Data/Sounds/colt45.ogg","Data/Sounds/colt45.ogg","Data/Sounds/colt45.ogg","Data/Sounds/colt45.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/footsteps_walk.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/footsteps_walk.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/footsteps_walk.ogg","Data/Sounds/footsteps_walk.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/footsteps_walk.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/footsteps_walk.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/bodyhit.ogg","Data/Sounds/rifle.ogg","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""}
gSoundEmitters={}
for i=1,#gSoundEmitterNames,1 do
	gSoundEmitters[i]=make(ig3d_sound_emitter, gSoundEmitterNames[i])
	setSound_emitterInfo(gSoundEmitters[i], IG3D_POSITION, gSoundEmitterPositions[i][1],gSoundEmitterPositions[i][2],gSoundEmitterPositions[i][3])
	setSound_emitterInfo(gSoundEmitters[i], IG3D_SAMPLE, gSoundEmitterSamples[i])
end
gNumSoundEmitters=#gSoundEmitterNames
gGroups={}
gNumGroups=0
gTextboxFonts={"Data/FontPngs/default32_1.png","Data/FontPngs/default32_1.png","Data/FontPngs/default32_1.png","Data/FontPngs/default32_1.png","Data/FontPngs/default32_1.png","Data/FontPngs/default32_1.png","Data/FontPngs/default32_1.png","Data/FontPngs/default32_1.png","Data/FontPngs/default32_1.png","Data/FontPngs/default32_1.png"}
gTextboxPositions={{8,8},{20,20},{20,20},{20,20},{20,20},{20,20},{20,20},{20,20},{20,20},{20,20}}
gTextboxSizes={12,10,10,10,10,10,10,10,10,10}
gTextboxColors={{1.000000,1.000000,1.000000,1.000000},{1.000000,1.000000,1.000000,1.000000},{1.000000,1.000000,1.000000,1.000000},{1.000000,1.000000,1.000000,1.000000},{1.000000,1.000000,1.000000,1.000000},{1.000000,1.000000,1.000000,1.000000},{1.000000,1.000000,1.000000,1.000000},{1.000000,1.000000,1.000000,1.000000},{1.000000,1.000000,1.000000,1.000000},{1.000000,1.000000,1.000000,1.000000}}
gTextboxes={}
for i=1,#gTextboxFonts,1 do
	gTextboxes[i]=make(ig3d_text_box, gTextboxFonts[i])
	setText_boxInfo(gTextboxes[i], IG3D_POSITION, gTextboxPositions[i][1],gTextboxPositions[i][2])
	setText_boxInfo(gTextboxes[i], IG3D_SIZE, gTextboxSizes[i])
	setText_boxInfo(gTextboxes[i], IG3D_COLOR, gTextboxColors[i][1],gTextboxColors[i][2],gTextboxColors[i][3], gTextboxColors[i][4])
end
gNumTextboxes=#gTextboxFonts
setSceneInfo(IG3D_TINT_COLOR, 1.000000,1.000000,1.000000)
setSceneInfo(IG3D_FOG, false,0.100000,-0.000000,-0.000000,7.000000,10.000000)
setSceneInfo(IG3D_BACKGROUND_COLOR, 0.650000,0.650000,0.650000)
setSceneInfo(IG3D_FOV, true, 90.000000)
setLightInfo(1, IG3D_ENABLED, true)
setLightInfo(1, IG3D_POSITION, 72.000000,2.924348,74.000000,1.000000)
setLightInfo(1, IG3D_AMBIENT, 1.000000,1.000000,1.000000,1.000000)
setLightInfo(1, IG3D_DIFFUSE, 0.700000,0.700000,0.700000,1.000000)
setLightInfo(1, IG3D_SPECULAR, 1.000000,1.000000,1.000000,1.000000)
setLightInfo(1, IG3D_CONSTANT_ATTENUATION, 1.000000)
setLightInfo(1, IG3D_LINEAR_ATTENUATION, -0.000000)
setLightInfo(1, IG3D_QUADRATIC_ATTENUATION, -0.000000)
setLightInfo(1, IG3D_SPOTLIGHT, -0.000000,-0.000000,-0.000000,180.000000,-0.000000)
setLightInfo(2, IG3D_ENABLED, true)
setLightInfo(2, IG3D_POSITION, -0.000000,5.000000,7.000000,1.000000)
setLightInfo(2, IG3D_AMBIENT, 1.000000,1.000000,1.000000,1.000000)
setLightInfo(2, IG3D_DIFFUSE, -0.000000,-0.000000,-0.000000,1.000000)
setLightInfo(2, IG3D_SPECULAR, -0.000000,-0.000000,-0.000000,1.000000)
setLightInfo(2, IG3D_CONSTANT_ATTENUATION, 1.000000)
setLightInfo(2, IG3D_LINEAR_ATTENUATION, -0.000000)
setLightInfo(2, IG3D_QUADRATIC_ATTENUATION, -0.000000)
setLightInfo(2, IG3D_SPOTLIGHT, -0.000000,-0.000000,-0.000000,180.000000,-0.000000)
setLightInfo(3, IG3D_ENABLED, false)
setLightInfo(4, IG3D_ENABLED, true)
setLightInfo(4, IG3D_POSITION, -0.052137,2.899558,10.430401,1.000000)
setLightInfo(4, IG3D_AMBIENT, 0.200000,0.200000,0.500000,1.000000)
setLightInfo(4, IG3D_DIFFUSE, 0.312000,0.276000,0.116000,1.000000)
setLightInfo(4, IG3D_SPECULAR, 0.844000,1.000000,0.496000,1.000000)
setLightInfo(4, IG3D_CONSTANT_ATTENUATION, 0.500000)
setLightInfo(4, IG3D_LINEAR_ATTENUATION, 0.036000)
setLightInfo(4, IG3D_QUADRATIC_ATTENUATION, 0.004000)
setLightInfo(4, IG3D_SPOTLIGHT, -0.000000,-0.000000,-0.000000,180.000000,-0.000000)
setLightInfo(5, IG3D_ENABLED, false)
setLightInfo(6, IG3D_ENABLED, false)
setLightInfo(7, IG3D_ENABLED, false)
setLightInfo(8, IG3D_ENABLED, false)
-- End of auto-script
--dofile(gameroot"Data/Levels/H10_G10_Z10_UDG/H10_G10_Z10_UDGmapXY.lua")
function udg_arcade_game()
udg_Instructions_lightfive()
handle_udg()
end

if ig3d_GetMode__i() == 4 then
dontPlaceRandomly=true
gGridSize=1
dofile(gameroot.."Data/Scripts/UDG_Functions/UDG_Init.lua")
udg_StartUpEmitters() ;--see UDG_Utilities.lua
UDGLevel1Lighting() -- ;see UDG_Lights.lua
lit = UDGWorkLighting 
dark = udg_Instructions_lightfive
game_func = udg_arcade_game
end

function udg_check_game_end_condition()
	rts_update_living_and_dead_counts()
	if gNumZombies==0 then
		return ig3d_GetLevelName__s(),"\nGame over dead man game over!!\n\nPress space bar to raise the dead."
	end
	if gNumHumans==0 then
			return "Data/Levels/UDG/UDG_Cargo","\nGame over? Not yet!\n\nPress space bar for more."
	end
	return nil,""	
end
