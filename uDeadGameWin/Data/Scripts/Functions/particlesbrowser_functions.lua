
gObjName=""
gCurSel=ig3d_GetSelection__s()
gObjName=gCurSel ;  
gOldSel=""
gSelectedParticle=""
gAttributePicked = 1
gEVals={}

particleFieldValues={}
gEmitterFileValues={}
gEmitterFileAttributes={}
lastPushed=nil
storedSingleSelect=0
dragged=false
gLastBrowserControlClick=time()
gLastSelection=-1

ParticleBrowserFileList={}
gParticleFilesShortNames={}
gEmissionSource = ""
gEmissionSourcePath = ""



gParticleValues={} ; -- List of current values
gParticleAttributes={} ; --List of current attribute names
gSelParticleData={}  ; --raw input from getInfo


gBrowserImagesPath=gameroot.."Data/Images/"
gBrowserEMTPath = gameroot.."Data/Emitters"
gBrowserImagesFiles={}
gBrowserEMTFiles={}
gCatchModelPath = ""
gCatchTexturePath=""
gEmtFileBrowserLines={}

gSourceRequest = ""  ;-- mode of selecting emitter source from browser
gEmitterNewName=""  ; -- hold short name of emitter or emitter name for new make

gNewEmitterValueItems={} ;-- multi item list from field values ie x,y,z etc
gEmitterValueItems={};-- multi item list from emitter attriute values ie x,y,z etc
gOldInfo = ""


--  EmitBrowserValueCatch
function EmitBrowserValueCatch()
particleFieldValues[1]=EmitterListBrowser:value()
particleFieldValues[2]=EmitAttListBrowser:value()
particleFieldValues[3]=EmitAttListBrowser:value()

particleFieldValues[4]=emtFileBrowser:value()
particleFieldValues[5]=BoolBtn:value()
particleFieldValues[6]=ParticleValInputA:value()
particleFieldValues[7]=NameInput:value()

curValBool = gEmitterValueItems[1]
	if curValBool ~= "true" and curValBool ~= "false" then 	
	curValBool = nil
	end	
	
gNewEmitterValueItems={}	
for i=1,#gEmitterValueItems,1 do
  if i == 1 then
	if curValBool == nil then
 	ParticleValInputA:show()
 	table.insert(gNewEmitterValueItems,ParticleValInputA:value());
 	else
 	table.insert(gNewEmitterValueItems,curValBool);
 	end
 	end
 
	if i == 2 then 
	if curValBool == nil then
 	table.insert(gNewEmitterValueItems,ParticleValInputB:value());
 	else
 	table.insert(gNewEmitterValueItems,ParticleValInputA:value());
 	end
 	end
 
	if i == 3 then 
	if curValBool == nil then
 	table.insert(gNewEmitterValueItems,ParticleValInputC:value());
 	else
 	table.insert(gNewEmitterValueItems,ParticleValInputB:value());
 	end
 	end
 	
	if i == 4 then 
	if curValBool == nil then
 	table.insert(gNewEmitterValueItems,ParticleValInputD:value());
	else
 	table.insert(gNewEmitterValueItems,ParticleValInputC:value());
 	end
 	end		
end

 fltk_update()
end



-- ParticleBrowserWindowUpdate
function ParticleBrowserWindowUpdate(arg)
 if ParticleBrowser == nil then return end
 ParticleBrowser:make_current()
   EmitBrowserValueCatch()
 local i = 1
 local FBn,EBLn,EAn = nil,nil,nil
 	 EAn = particleFieldValues[2]
			 EBLn = particleFieldValues[1]
			 FBn = emtFileBrowser:value()
 ---- SourceList 
		if arg == "SourceList" then
		emtFileBrowser:clear() 
  			for i=1,#gParticleFilesShortNames,1 do
			emtFileBrowser:add(gParticleFilesShortNames[i])
			end
		end
---- CurParticleInfo	
		if arg == "CurParticleInfo" then
			if gEmitterSourcePath ~= nil then  
				local ss,se = string.find(gEmitterSourcePath,"Data/Emitters/")
				if se ~= nil then 
				local curParticleName = string.sub(gEmitterSourcePath,se+1,-1)
				SourceNameInput:value(curParticleName)
				SourceNameInput:redraw()
				end;	
			end;
			
			 
			 
			 if #gParticleAttributes > 1 then 
				EmitAttListBrowser:clear()
				ValueListBrowser:clear()
				
				
			        local i = 1
				for i = 1,#gParticleAttributes,1 do
				EmitAttListBrowser:add(gParticleAttributes[i])
				ValueListBrowser:add(gParticleValues[i])
				gOldInfo = gSelectedParticleInfo
				end
				
			end
			
	
	
			
				
		end; -- if_curparticleinfo
		
---- updateEmitterListBrowser 		
		if arg == "updateEmitterListBrowser" then
		if #gParticleEmitters > 0  then
		 EBLn = particleFieldValues[1]
			  EmitterListBrowser:clear()
			  for i=1,#gParticleEmitters,1 do 
			  EmitterListBrowser:add(gParticleEmitters[i])	
			 	 if gSelectedParticle == gParticleEmitters[i] then EBLn = i end;
			  end
		gSourceRequest = ""
		end	
		end;
		  

	
	if arg == "newEmitter" then
		EmitAttListBrowser:value(2)
		ValueListBrowser:value(2)
		EmitAttListBrowser:select(2)
		ValueListBrowser:select(2)
		EmitBrowserValueCatch()
	end



---- SELECT LINE OF BROWSER  
				if FBn ~= nil then
				emtFileBrowser:selected(FBn,FBn)
				emtFileBrowser:value(FBn)
				emtFileBrowser:select(FBn)
				emtFileBrowser:redraw()
				end
		
				if EBLn ~= nil then
				particleFieldValues[1] = EBLn
				gSelectedParticle = gParticleEmitters[EBLn] 
				 EmitterListBrowser:select(EBLn,EBLn)
		 		EmitterListBrowser:value(EBLn)
		 		EmitterListBrowser:selected(EBLn)
				end
			if EAn ~= nil then 		 
			EmitAttListBrowser:select(EAn,EAn)
			EmitAttListBrowser:value(EAn)
			EmitAttListBrowser:selected(EAn)
			ValueListBrowser:select(EAn,EAn)
			ValueListBrowser:value(EAn)
			ValueListBrowser:selected(EAn) 
			ValueListBrowser:redraw()
			EmitAttListBrowser:redraw()
			end
fltk_update()
end


--  CurParticleInfo
function CurParticleInfo(n)
plist= ig3d_GetParticle_emittersList__s()
if getlinecount(plist) == 0 then return end
if n == nil then n = particleFieldValues[1] end
if n ~= nil then gSelectedParticle =  getlineof(plist,n) end
if gSelectedParticle == nil then return end;


	gSelectedParticleInfo = ig3d_GetParticle_emitterInfo_s_s(gSelectedParticle)
	gObjName = "particles "..gSelectedParticle;
	ig3d_SetSelection_s(gObjName)
	gEmitterSourcePath = getlineof(gSelectedParticleInfo,2)
	
 if gEmitterSourcePath == nil then gEmitterSourcePath  ="Data/Emitters/"..SourceNameInput:value() end;
gParticleValues={}
gParticleAttributes={}
gSelParticleData={}
EmitterInfoLineCount = getlinecount(gSelectedParticleInfo)
print("EmitterInfoLineCount=",EmitterInfoLineCount)
	for i = 1, EmitterInfoLineCount , 1 do
	EmitterLineN  = getlineof(gSelectedParticleInfo,i) 
		if EmitterLineN ~= nil then 
		
		-- gSelParticleData insert
		table.insert(gSelParticleData,EmitterLineN)
		
		if i == 1 then EmitterLineN= "name="..EmitterLineN end;
		if i == 2 then EmitterLineN= "source="..EmitterLineN end ;
		if i == 3 then EmitterLineN= "position="..EmitterLineN end;
		if i == 4 then EmitterLineN= "rotation="..EmitterLineN end;
		
		-- look at MODIFIED EmitterLineN to find EQUAL
			fe =string.find(EmitterLineN,"=")
			if fe ~= nil then 
			EmitterAttributeName = string.sub(EmitterLineN,1,fe-1)
			EmitterAttributeValue = string.sub(EmitterLineN,fe+1,-1)
			
			-- gParticleValues insert
			table.insert(gParticleValues, EmitterAttributeValue);
			
			-- gParticleAttributes insert
			nLab = string.sub(EmitterLineN,1,fe-1);
			table.insert(gParticleAttributes,EmitterAttributeName)
			
				if gParticleAttributes[#gParticleAttributes]=="texture=" then 
				if gParticleValues[#gParticleValues]~=nil then
				gCatchTexturePath = gParticleValues[#gParticleValues]
				end
				end
				
				if gParticleAttributes[#gParticleAttributes] == "model=" then
				if gParticleValues[#gParticleValues]~=nil then
				gCatchModelPath = gParticleValues[#gParticleValues]
				end
				end
			end
		end
	end
	print("#gSelParticleData=",#gSelParticleData)
ParticleBrowserWindowUpdate("CurParticleInfo")
return gSelectedParticleInfo

end
-- emitterSourceList
function emitterSourceList(emitterspath)
ParticleBrowser:make_current()
if emitterspath == nil then emitterspath = "Data/Emitters/" end;
ParticlesinDir=gameroot..emitterspath
ParticlesFileList={}
gParticleFilesShortNames={}
ParticlesFileList=listFiles(ParticlesinDir)
	 for i = 1,#ParticlesFileList,1 do
	 particleFileName = string.sub(ParticlesFileList[i],1,-5)	  
	 table.insert(gParticleFilesShortNames,particleFileName)
	 end	 
end
-- updateEmitterListBrowser
function updateEmitterListBrowser()
EmitBrowserValueCatch()
	gParticleEmitters={}
	plist= ig3d_GetParticle_emittersList__s()
	pcount =  getlinecount(plist)
	if pcount ~= nil then  
		for i=1,pcount,1 do		
		pname = getlineof(plist,i)	
			if pname ~= nil then  
			table.insert(gParticleEmitters,pname)
			end;	
		end	
	end
	ParticleBrowserWindowUpdate("updateEmitterListBrowser")
end
-- PickedParticleAttribute
function PickedParticleAttribute(n)
if ParticleBrowser == nil then return end;

if n == nil then n = particleFieldValues[2] end
if n == nil then 
ParticleValInputA:hide()
return 
end
gSelectedParticleInfo = CurParticleInfo()
                EmitterValueGroup:hide()  
		NameInput:value(gParticleValues[1]) 
		MakeEmitterBtn:hide()
		EmitterSourceGroup:hide()
		EmissionInputGroup:hide()
		
		if particleFieldValues[2] ~= 5 then EmitterTextureGroup:hide() end
		EmitterSaveAsGroup:hide()
		ParticleValInputA:value()
		ParticleValInputB:value()
		ParticleValInputC:value()
		ParticleValInputD:value()
		ParticleValInputA:hide()
		ParticleValInputB:hide()
		ParticleValInputC:hide()
		ParticleValInputD:hide()
		CurValBrowser:clear()	


-- Path to Source
if n == 2 then 
ParticleBrowserWindowUpdate("SourceList")
gSourceRequest = "Replace"
emtFileBrowser:label("Replace Emitter Source")
EmitterSourceGroup:show()
emtFileBrowser:value(particleFieldValues[4])
emtFileBrowser:select(particleFieldValues[4])
EmitterSourceGroup:redraw()
 end
 

if n ~= 2 and n~=5 then 
EmissionInputGroup:show() 
EmitterValueGroup:show()
end



	gEmitterValueItems={}
	curVal = gParticleValues[n]
	curValBool=curVal
	curValF=""
	sstr = nil
	-- COMMAS
	if curVal ~= nil then 
	fc=string.find(curVal,",")
		if fc == nil then 
		CurValBrowser:add(curVal)
		table.insert(gEmitterValueItems,curVal)
		else
			for i = 1, numberofitems(curVal,","), 1 do
			local va=item(i,curVal,",")
			CurValBrowser:add(va)
			table.insert(gEmitterValueItems,va)
			end
		end
		
	end	



-- BOOLS
curValBool = gEmitterValueItems[1]
	if curValBool == "true" or curValBool == "false" then 	
	BoolBtn:show()
	BoolBtn:label(gParticleAttributes[n])
		if string.len(curValF) >1  then 
		ParticleValInputA:show()
		ParticleValInputA:value(tonumber(curValF))
		else
		ParticleValInputA:hide()
		end
	else
	if n ~= 1 then 
	ParticleValInputA:value(tonumber(curValBool))
	ParticleValInputA:show()
	end
	BoolBtn:hide()
	curValBool = nil
	end	
		
	if curValBool == "true" then
	BoolBtn:value(1)
	else
	BoolBtn:value(0)
	end
	
for i=1,#gEmitterValueItems,1 do
cEmitterValueItem = tonumber(gEmitterValueItems[i])
  if i == 1 then
	if curValBool == nil then
 	ParticleValInputA:show()
 	ParticleValInputA:value(cEmitterValueItem)
 	end
 	end
 
	if i == 2 then 
	if curValBool == nil then
	ParticleValInputB:show()
 	ParticleValInputB:value(cEmitterValueItem)
 	else
 	ParticleValInputA:show()
 	ParticleValInputA:value(cEmitterValueItem)
 	end
 	end
 
	if i == 3 then 
	if curValBool == nil then
	ParticleValInputC:show()
 	ParticleValInputC:value(cEmitterValueItem)
 	else
 	ParticleValInputB:show()
 	ParticleValInputB:value(cEmitterValueItem)
 	end
 	end
 	
	if i == 4 then 
	if curValBool == nil then
	ParticleValInputD:show()
 	ParticleValInputD:value(cEmitterValueItem)
 	else
 	ParticleValInputC:show()
 	ParticleValInputC:value(cEmitterValueItem)
 	end
 	end
 
		
end



-- TEXTURES	
if n == 5 then 
listPNGFiles()
pngPreviewBox:hide()
EmitterTextureGroup:show()
EmitterTextureGroup:redraw()	
end

-- EMITTER NAME
if n == 1 or particleFieldValues[2] == 1 then  
NameInput:show()
ParticleValInputA:hide()
else
NameInput:hide()
end


fltk_update()
end
-- ValueListCallback
function ValueListCallback(w)
if ParticleBrowser == nil then return end;
if w:value() == nil then return end
EmitAttListBrowser:value(w:value())
EmitAttListBrowser:select(w:value())
EmitAttListBrowser:selected(w:value(),w:value())
EmitBrowserValueCatch()
PickedParticleAttribute(particleFieldValues[2])
end
-- readEmitterFile  DEFECTIVE!
function readEmitterFile(fileName)

	gEmitterFileValues={}
	gEmitterFileAttributes={}
        local f=io.open(gameroot..fileName, "r")
        txtt=f:read("*a")
        f:close()
       txtt=string.gsub(txtt,string.char(13),"_CR_")
       txtt=string.gsub(txtt,string.char(10),"_CR_")
       txtt=string.gsub(txtt,"_CR_CR_",string.char(13)..string.char(10))
       txtt=string.gsub(txtt,"_CR_",string.char(13)..string.char(10))
       f=io.open(fileName,"w")
        f:write(tostring(txtt))
        f:close()
         
        for i=1,string.len(txtt),1 do
    	sc=string.sub(txtt,i,i)
    	end
    	
	local f=io.open(gameroot..fileName, "r")
	
 	local lines = {}
    
    	for line in f:lines() do
      	table.insert(lines, line)
    	end
  
    		for i, L in ipairs(lines) do
    		 lino=L
    		 rtp=string.find(lino,"=")
    			if rtp~=nil then 
    			Attrline=string.sub(lino,1,rtp-1)
			table.insert(gEmitterFileAttributes,Attrline)
    			end	 			
		end
	f:close()	 
	 
	local f=io.open(gameroot..fileName, "r")	  
	local ttxt = tostring(f:read("*a"))
	f:close()
	 gEmitterFileValues={}
	if #gEmitterFileAttributes >=1 then 
		for i=1,#gEmitterFileAttributes,1 do 
		ws,we=string.find(ttxt,gEmitterFileAttributes[i].."=")
			if i <= #gEmitterFileAttributes-1 then
			ns,ne = string.find(ttxt,gEmitterFileAttributes[i+1].."=")
			else
			ns,ne=0,0
			end				
		vstr = string.sub(ttxt,we+1,ns-1)	
		vstr = string.gsub(vstr,string.char(10),"")
    		vstr = string.gsub(vstr,string.char(13),"")
		table.insert(gEmitterFileValues,vstr)
		end
	end	
         ParticleBrowser:redraw();
 end
-- pickEmissionSource
function pickEmissionSource(n)
if ParticleBrowser == nil then return end;

ParticleBrowser:make_current()
EmitBrowserValueCatch()
if n == nil then return end
CurParticleInfo()
emitterSourceList()
SourceNameInput:value(ParticlesFileList[n])
gEmitterSourcePath = "Data/Emitters/"..ParticlesFileList[n] 
gSelParticleData[2] = gEmitterSourcePath
setVal=""
for i=1,#gSelParticleData,1 do
setVal=setVal..gSelParticleData[i].."\n"
end

a=get(ig3d_particle_emitter, gSelectedParticle)	
ig3d_SetParticle_emitterInfo_2s(gSelectedParticle,setVal)
gSelectedParticleInfo = ig3d_GetParticle_emitterInfo_s_s(gSelectedParticle)


print("Save and Restart")
save_level()
restartbutton()

ParticleBrowser:make_current()
runningParticle = get(ig3d_particle_emitter, gSelectedParticle)
setParticle_emitterInfo(runningParticle, IG3D_START)
updateEmitterListBrowser()

end
-- NewEmissionSource
function NewEmissionSource(s)
if ParticleBrowser == nil then return end;
ParticleBrowserWindowUpdate("newEmissionSource")

gSelectedParticleInfo = CurParticleInfo()
gEmitterSourcePath = "Data/Emitters/"..s
if string.find(s,".emt") == nil then gEmitterSourcePath = gEmitterSourcePath..".emt" end
setParticle_emitterInfo(runningParticle, IG3D_STOP)
setVal=""
for i=1,#gSelParticleData,1 do
setVal=setVal..gSelParticleData[i].."/n"
end
a=get(ig3d_particle_emitter, gSelectedParticle)	
ig3d_SetParticle_emitterInfo_2s(gSelectedParticle,setVal)
gSelectedParticleInfo = CurParticleInfo()
save_level()
restartbutton()

runningParticle = get(ig3d_particle_emitter, gSelectedParticle)
setParticle_emitterInfo(runningParticle, IG3D_START)
CurParticleInfo()
fltk_update()
end
-- RenameEmitter
function RenameEmitter(w)
if ParticleBrowser == nil then return end;
nName = w:value()
ParticleBrowser:make_current()
EmitBrowserValueCatch()

gSelectedParticleInfo = CurParticleInfo()
gSelParticleData[1]=nName
setVal=""
for i=1,#gSelParticleData,1 do
setVal=setVal..gSelParticleData[i].."\n"
end
a=get(ig3d_particle_emitter, gSelectedParticle)	
ig3d_SetParticle_emitterInfo_2s(gSelectedParticle,setVal)
gSelectedParticleInfo = ig3d_GetParticle_emitterInfo_s_s(gSelectedParticle)
save_level()
restartbutton()
ParticleBrowser:make_current()
updateEmitterListBrowser()
CurParticleInfo()
fltk_update()
end
-- EMTAttPicked
function EMTAttPicked(w)
if ParticleBrowser == nil then return end;
ParticleBrowser:make_current()
 if w:value() == nil then  return  end
 EmitBrowserValueCatch()
 n= w:value()
 gAttributePicked=w:value()
 PickedParticleAttribute(particleFieldValues[2])
end
-- SetEmitterSource
function SetEmitterSource()
if ParticleBrowser == nil then return end;
gEmissionSource = "Data/Emitters/"..ParticlesFileList[sourceListBrowser:value()]
local lcn = 0
local gSelParticleData={}
shrin= gSelectedParticleInfo

for ws in string.gmatch(gSelectedParticleInfo,"\n") do 
	lcn=lcn+1 
	rtn = string.find(shrin,"\n")
	gSelParticleData[lcn]= string.sub(shrin,1,rtn)
	shrin  = string.sub(shrin,rtn,-1)

end

gSelParticleData[2]=gEmissionSource
 gSelectedParticleInfo=""
 
 for i=1,#gSelParticleData,1 do
 gSelectedParticleInfo = gSelectedParticleInfo..gSelParticleData[i]
 end
 
 ig3d_SetParticle_emitterInfo_2s(gSelectedParticle,string.sub(gSelectedParticleInfo,1,-2))
 
runningParticle = get(ig3d_particle_emitter, gSelectedParticle)
setParticle_emitterInfo(runningParticle, IG3D_START)

end
-- MakeEmitter
function MakeEmitter()
if ParticleBrowser == nil then return end;
if gEmitterSourcePath == nil then return end
 
if gParticleValues[1]== nil then gParticleValues[1] ="p" end

 plist= ig3d_GetParticle_emittersList__s()
 pcount =  getlinecount(plist)
	local numofLike=1
 
	
fs,fe=string.find(gEmitterSourcePath,"Data/Emitters/")
fp=string.find(gEmitterSourcePath,".emt")
if fe == nil then fe = 0 end
if fp == nil then fp = 0 end
gEmitterNewName=string.sub(gEmitterSourcePath,fe+1,fp-1)

	
	for i=1,pcount,1 do
	if string.find(getlineof(plist,i),gEmitterNewName) ~= nil then numofLike=numofLike+1 end
	end
	
	 npad=string.sub("000",string.len(numofLike)+1,-1)
	gSelectedParticle = gEmitterNewName..npad..numofLike
	table.insert(gParticleNamesAndEMTs,{gSelectedParticle,gEmitterSourcePath})
	gParticleEmitters[#gParticleNamesAndEMTs]=make(ig3d_particle_emitter, gSelectedParticle, gEmitterSourcePath)
	
	
	gObjName = "particles "..gSelectedParticle;
	ig3d_SetSelection_s(gObjName)

	setParticle_emitterInfo(gSelectedParticle, IG3D_START)
 	gCurSel=ig3d_GetSelection__s()
 	EmitterListBrowser:add(gSelectedParticle)
 	
	particleFieldValues[1]=pcount+1
	EmitterListBrowser:select(pcount+1)
	EmitterListBrowser:selected(pcount+1,pcount+1)
	EmitterListBrowser:value(pcount+1)
	 	updateEmitterListBrowser()
		
		runButton()
end
-- DuplicateEmitter
function DuplicateEmitter()
if ParticleBrowser == nil then return end;
PickedParticleAttribute(2)
CurParticleInfo()
if gEmitterSourcePath == nil then return end
 
if gParticleValues[1]== nil then gParticleValues[1] ="p" end

 plist= ig3d_GetParticle_emittersList__s()
 pcount =  getlinecount(plist)
	local numofLike=1
fs,fe=string.find(gEmitterSourcePath,"Data/Emitters/")
fp=string.find(gEmitterSourcePath,".emt")
if fe == nil then fe = 1 end
if fp == nil then fp = -1 end


	st=string.sub(gEmitterSourcePath,fe,fp)
	for i=1,pcount,1 do
	if string.find(getlineof(plist,i),st) ~= nil then numofLike=numofLike+1 end
	end
	for i=4,2,-1 do
	if string.len(numofLike) < i then numofLike = "0"..numofLike end
	end
	
	gSelectedParticle = st..numofLike
	table.insert(gParticleNamesAndEMTs,{gSelectedParticle,gEmitterSourcePath})
	gParticleEmitters[#gParticleNamesAndEMTs]=make(ig3d_particle_emitter, gSelectedParticle, gEmitterSourcePath)
	
	
	gObjName = "particles "..gSelectedParticle;
	ig3d_SetSelection_s(gObjName)

	setParticle_emitterInfo(gSelectedParticle, IG3D_START)
 	gCurSel=ig3d_GetSelection__s()
	
	 	updateEmitterListBrowser()
		
end
-- runButton
function runButton()
runningParticle = get(ig3d_particle_emitter, gSelectedParticle)
setParticle_emitterInfo(runningParticle, IG3D_START)
end
-- stopButton
function stopButton()
runningParticle = get(ig3d_particle_emitter, gSelectedParticle)
setParticle_emitterInfo(runningParticle, IG3D_STOP)

end
-- Stop Clear Run particle n

function stopParticle(n)
plist= ig3d_GetParticle_emittersList__s()
	pcount =  getlinecount(plist)
	pname = getlineof(plist,n)
	if pname ~= nil then 
	runningParticle = get(ig3d_particle_emitter, pname)
	setParticle_emitterInfo (runningParticle, IG3D_STOP) 
	end
end

function clearParticle(n)
if n == nil then return end

	pname = gParticleEmitters[n]
	if pname ~= nil then 
	runningParticle = get(ig3d_particle_emitter, pname)
	setParticle_emitterInfo (runningParticle, IG3D_STOP) 
	setParticle_emitterInfo (runningParticle, IG3D_CLEAR_PARTICLES) 
	end
end

function runParticle(n)
plist= ig3d_GetParticle_emittersList__s()
	pcount =  getlinecount(plist)
	pname = getlineof(plist,n)
	if pname ~= nil then 
	runningParticle = get(ig3d_particle_emitter, pname)
	setParticle_emitterInfo (runningParticle, IG3D_START) 
	end
end
-- changeVal
function changeVal(PValue)
if ParticleBrowser == nil then return end;
EmitBrowserValueCatch()
changeLine = particleFieldValues[2]
setVal=""
gSelectedParticleInfo = CurParticleInfo()
curData = gSelParticleData[changeLine]
currentEMTVal = gParticleValues[changeLine]
if changeLine > 4 then 
gSelParticleData[changeLine] = gParticleAttributes[changeLine].."="..PValue
else
print(changeLine.."\n"..PValue)
gSelParticleData[changeLine] = PValue
end

for i=1,#gSelParticleData,1 do
setVal = setVal .. gSelParticleData[i].."\n"
end
print("setVal=",getlinecount(setVal))
runningParticle=get(ig3d_particle_emitter, gSelectedParticle)
ig3d_SetParticle_emitterInfo_2s(gSelectedParticle,setVal.."\n")
render()
CurParticleInfo()
fltk_update()
end
-- valInput

function valInput(w)
if ParticleBrowser == nil then return end;
EmitBrowserValueCatch()
local lVal = ""	
for i=1,#gNewEmitterValueItems,1 do
lVal = lVal..gNewEmitterValueItems[i]..","
end
changeVal(string.sub(lVal,1,-2));
end


-- changeBool
function changeBool(n)
if ParticleBrowser == nil then return end;
EmitBrowserValueCatch()
if n == nil then n=BoolBtn:value() end
runningParticle = get(ig3d_particle_emitter, gSelectedParticle)
setParticle_emitterInfo(runningParticle, IG3D_STOP)
changeLine = particleFieldValues[2]
setVal=""
gSelectedParticleInfo = CurParticleInfo()
	if n == 1 then 
		tBool = "true"
	else
		tBool = "false"
	end

datacount = getlinecount(gSelectedParticleInfo)
for i = 1, datacount , 1 do
theL  = getlineof(gSelectedParticleInfo,i)   			
	if theL ~= nil then 
		if i == changeLine then 
		fe=string.find(theL,"=")
			if fe~=nil then 
			setVal = setVal .. string.sub(theL,1,fe)..tBool.."\n"
			else
			setVal = setVal..theL.."\n"
			end
		else	 	
		 setVal = setVal..theL.."\n" 
		
		end
	end
end
a=get(ig3d_particle_emitter, gSelectedParticle)	
ig3d_SetParticle_emitterInfo_2s(gSelectedParticle,setVal)
gSelectedParticleInfo = ig3d_GetParticle_emitterInfo_s_s(gSelectedParticle)
setParticle_emitterInfo(runningParticle, IG3D_START)

fltk_update()
end
-- particleBoolBtnPick
function particleBoolBtnPick(w)
if ParticleBrowser == nil then return end;
changeBool(w:value())
PickedParticleAttribute()
end
-- handle_particle_browser
function handle_particle_browser()
ParticleBrowser:make_current()
	if click("o") then		
		--The selection might have been changed, see what happened
		gCurSel=ig3d_GetSelection__s()		
		if gCurSel=="" then return end
					
			if gCurSel~=gOldSel then
			--  selection in here;
			gOldSel=gCurSel
			end	 		
	end
updateEmitterListBrowser()
fltk_update()	
end
-- SaveEmitterSource
function SaveEmitterSource()
emitNew = nil
if ParticleBrowser == nil then return end;
local curName = "Data/Emitters/"..SourceNameInput:value()
gSelectedParticleInfo =CurParticleInfo()
if gSelParticleData[2] ~=  curName then
gSelParticleData[2] = curName
gEmitterSourcePath = curName
emitNew = true
end

setVal=""
for i=5,#gSelParticleData,1 do
setVal=setVal..gSelParticleData[i].."\n"
end

tfile = gameroot..gEmitterSourcePath
if string.find(tfile,".emt") == nil then tfile = tfile..".emt" end
f=io.open(tfile,"w") 	
        f:write(setVal)
        f:close()
        
--if emitNew ~= nil then NewEmissionSource(SourceNameInput:value()) end
emitterSourceList()
end
-- SaveButtonClick
function particleSaveButtonClick()
if ParticleBrowser == nil then return end;

SaveEmitterSource()
emitterSourceList()
EmitterSaveAsGroup:hide()
EmitterValueGroup:show()


end
-- listPNGFiles
function listPNGFiles()
if ParticleBrowser == nil then return end;
gBrowserImagesFiles={}
    pngFileBrowser:clear()
    for file in lfs.dir(gBrowserImagesPath) do
        if string.sub(file, 1,1)~="." or file==".." then
            local f = gBrowserImagesPath..'/'..file
            local attr = lfs.attributes (f)
            assert (type(attr) == "table")
             if attr.mode == "file" and string.sub(file, -4,-1)==".png" then 
             	local a={file, "file"}
             	table.insert(gBrowserImagesFiles, a)
             	pngFileBrowser:add(file)
             end   
           if attr.mode == "directory" then 
           local a={file, "directory"}
             table.insert(gBrowserImagesFiles, a)
             pngFileBrowser:add(file.."     ->")
	   end  
        end
     end
     
end
-- pngLoad
function pngLoad(w)
if ParticleBrowser == nil then return end;
	if pngFileBrowser:value()==0 then return end
	local theFile=gBrowserImagesFiles[tonumber(pngFileBrowser:value())]
	if theFile[2]=="directory" then return end
	
	local c=#(gameroot)+1
	local newObj={}
	table.insert(gObjects, newObj)
	local n=#gObjects
	loadTexture( string.sub(gBrowserImagesPath..theFile[1],c,-1))
	gCatchTexturePath = string.sub(gBrowserImagesPath..theFile[1],c,-1)
	 
	
end
-- updateTexture
function updateTexture()
if ParticleBrowser == nil then return end;
pngLoad()
loadTexture(gCatchTexturePath)	
changeVal(gCatchTexturePath)
fltk_update()
end
-- updatePNGPreviewBox
function updatePNGPreviewBox(name)
if ParticleBrowser == nil then return end;
	fltk.fl_register_images()
	local a=gBrowserImagesPath 
	local b=string.sub(name, 1,-5)..".png"
	local img = Fl_Shared_Image.get(a..b,128,128)
	pngPreviewBox:color(40)
	if img==nil then
		img=Fl_Shared_Image.get(gameroot.."Data/Images/Colors/white.png")
		
	else
		
	end
	
	pngPreviewBox:image()
	
	
	pngPreviewBox:image(img)
	
	pngPreviewBox:w(128)
	pngPreviewBox:h(128)
	pngPreviewBox:show()
	pngPreviewBox:redraw()
	updateTexture()
	EmitterTextureGroup:redraw()
	
	fltk_update()
end
-- browserControlDoubleClicked
function browserControlDoubleClicked(w)
	--
	local theFile=gBrowserImagesFiles[tonumber(w:value())]
	if theFile[2]=="directory" then
		if theFile[1]==".." then 
			gBrowserImagesPath=goDirsUp(gBrowserImagesPath, 1)
		else
			gBrowserImagesPath=gBrowserImagesPath..theFile[1].."/"
		end
		listPNGFiles()
	end
end
-- browserControlClicked
function browserControlClicked(w)
	if w:value()==0 then return end
	local theFile=gBrowserImagesFiles[tonumber(w:value())]
	if theFile[2]=="file" then
		updatePNGPreviewBox(theFile[1])
	end
	
	local t=time()
	
	if t-gLastBrowserControlClick < 0.4 and w:value()==gLastSelection then
		browserControlDoubleClicked(w)
		gLastBrowserControlClick=0
	else
		gLastBrowserControlClick=time()
	end
	gLastSelection=w:value()
	
end
-- ParticlesMakePick
function ParticlesMakePick(tEmt)

gEmitterSourcePath = "Data/Emitters/"..tEmt..".emt"
 plist= ig3d_GetParticle_emittersList__s()
 pcount =  getlinecount(plist)
	local numofLike=1
	for i=1,pcount,1 do
	if string.find(getlineof(plist,i),tEmt) ~= nil then numofLike=numofLike+1 end
	end
	for i=4,2,-1 do
	if string.len(numofLike) < i then numofLike = "0"..numofLike end
	end
	gSelectedParticle = tEmt..numofLike
	table.insert(gParticleNamesAndEMTs,{gSelectedParticle,gEmitterSourcePath})
	gParticleEmitters[#gParticleNamesAndEMTs]=make(ig3d_particle_emitter, gSelectedParticle, gEmitterSourcePath)
	gObjName = "particles "..gSelectedParticle;
	ig3d_SetSelection_s(gObjName)
	setParticle_emitterInfo(gSelectedParticle, IG3D_START)
 	gCurSel=ig3d_GetSelection__s()
	 updateEmitterListBrowser()	
	 		 	
end
-- emitterListBrowserCallback
function emitterListBrowserCallback(w)
print(w:value())

if ParticleBrowser == nil then return end;
n = w:value()
CurParticleInfo()
runningParticle = get(ig3d_particle_emitter, gSelectedParticle)
--setParticle_emitterInfo(runningParticle, IG3D_START)
PickedParticleAttribute()
end
-- PARTICLES MENU FUNCTIONS
ParticlesMenuIndex={}
ParticlesMenuText={}
ParticlesMenuText.Source={"Make", "Save","Duplicate"}
ParticlesMenuText.Control={"Run","Stop","Clear"}

function fillParticlesSourceMenu()
if ParticleBrowser == nil then return end;
	for  i=1,#ParticlesMenuText.Source,1 do
	menuLine="Emitters/"..ParticlesMenuText.Source[i]
	ParticlesMenu:add(menuLine);
	table.insert(ParticlesMenuIndex,menuLine)
	end
ParticlesMenu:add("");
table.insert(ParticlesMenuIndex,"")
ParticlesMenu:redraw()
end 

function fillParticlesControlMenu()
if ParticleBrowser == nil then return end;
for  i=1,#ParticlesMenuText.Control,1 do
	menuLine="Current/"..ParticlesMenuText.Control[i]
	ParticlesMenu:add(menuLine);
	table.insert(ParticlesMenuIndex,menuLine)
	end
ParticlesMenu:add("");
table.insert(ParticlesMenuIndex,"")
ParticlesMenu:add("");
table.insert(ParticlesMenuIndex,"")
--All
for  i=1,#ParticlesMenuText.Control,1 do
	menuLine="All/"..ParticlesMenuText.Control[i]
	ParticlesMenu:add(menuLine);
	table.insert(ParticlesMenuIndex,menuLine)
	end



ParticlesMenu:redraw()
end


function particlesCurrentPick(tPick)

runningParticle = get(ig3d_particle_emitter, gSelectedParticle)
		if tPick == "Clear" then
		setParticle_emitterInfo (runningParticle, IG3D_STOP) 
		setParticle_emitterInfo (runningParticle, IG3D_CLEAR_PARTICLES) 
		render()
		end
		
		if tPick == "Run" then		
		setParticle_emitterInfo (runningParticle, IG3D_START)
		setParticle_emitterInfo( emitter, IG3D_FORCE, 0,9.81, 0)  
		render()
		end
		
		if tPick == "Stop" then		
		setParticle_emitterInfo (runningParticle, IG3D_STOP)  
		render()
		end
end

function particlesAllMenuPick(tPick)
	plist= ig3d_GetParticle_emittersList__s()
	if plist ~= nil then 
	pcount =  getlinecount(plist)
		if pcount ~= nil then 
			if tPick == "Stop" then 
			for i=1,pcount,1 do stopParticle(i)end	
			end
		
			if tPick == "Clear" then
			for i=1,pcount,1 do 
			clearParticle(i) 
			render()
			end;	
			end
			if tPick == "Run" then 
				for i=1,pcount,1 do 
				runParticle(i)
				render()
				end	
			end
		end
		end
end

function particlesEmittersMenuPick(tPick)
if ParticleBrowser == nil then return end;
CurParticleInfo()	
if tPick == "Save" then 
PickedParticleAttribute(2)
EmissionInputGroup:hide()
EmitterSourceGroup:hide()
EmitterValueGroup:hide()
EmitterTextureGroup:hide()
EmitterSaveAsGroup:show()
end

if tPick == "Make" then
emtFileBrowser:label(tPick)
gSourceRequest = tPick
PickedParticleAttribute(1)
ValueListBrowser:clear()
EmissionInputGroup:hide()
EmitterSourceGroup:show()
EmitterValueGroup:hide()
EmitterTextureGroup:hide()
EmitterSaveAsGroup:hide()
emitterSourceList()
ParticleBrowserWindowUpdate("SourceList") --
end		
if tPick == "Duplicate" then MakeEmitter() end;

end




function particles_menu_callback(w)
if ParticleBrowser == nil then return end;
tMenu = w:label()
tVal = w:value()
tPick = w:text()
tIndex = ParticlesMenuIndex[tVal]
tIndex1 = ParticlesMenuIndex[tVal-1]
tIndex2 = ParticlesMenuIndex[tVal+1]

	if tIndex ~=nil  then 
	ParticlesmenuHead=item(1,tIndex,"/")

 		if ParticlesmenuHead == "Emitters" then particlesEmittersMenuPick(tPick) end;
 		if ParticlesmenuHead == "Current" then particlesCurrentPick(tPick) end;
 		if ParticlesmenuHead == "All" 	then  particlesAllMenuPick(tPick) end;
 		
 	 end 
 	 if tIndex1 == "All/Clear" then particlesAllMenuPick("Clear") end
 	 if tIndex1 == "Current/Clear" then particlesCurrentPick("Clear") end
  Fl:check();
   io.flush();
end

function particles_MenuBarFill()
if ParticleBrowser == nil then return end;
fillParticlesSourceMenu()
fillParticlesControlMenu()
end
-- emtFileBrowserCallback
function emtFileBrowserCallback(w)
if ParticleBrowser == nil then return end;
EmitBrowserValueCatch()
if w:value() == nil then return end
n = w:value()
MakeEmitterBtn:show()
gEmitterSourcePath = "Data/Emitters/"..ParticlesFileList[n]
if gSourceRequest == "Replace"  then 
pickEmissionSource(n)
else
gEmitterNewName = gParticleFilesShortNames[n]
end
end


----- 
function ParticleBrowserShow()
if gNumParticleEmitters == nil or gNumParticleEmitters == 0 then 
gParticleNamesAndEMTs={}
gParticlePositions={}
gParticleRotations={}
gParticleEmitters={}
end

ParticleBrowser:label("Particle Emitters")
ParticleBrowser:show()
ParticleBrowser:make_current()
EmitterSourceGroup:hide()
EmissionInputGroup:hide()
--EmitterValueGroup:hide()
EmitterTextureGroup:hide()
EmitterSaveAsGroup:hide()
NameInput:hide()
BoolBtn:hide()
ParticleValInputA:hide()
MakeEmitterBtn:hide()
particles_MenuBarFill()
emitterSourceList()
 updateEmitterListBrowser()	
if gSelectedParticle ~= nil then PickedParticleAttribute() end
end
