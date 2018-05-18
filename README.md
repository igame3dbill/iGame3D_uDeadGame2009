# iGame3D_uDeadGame2009
3D action horror first person real time strategy adventure.
iGame3D Game Engine using MurgaLua (Lua 5.1) with FLTK for Windows and Mac OS X 10.4(?)

*This is the Mac OS X 10.4 version, zipped, since I don't know what Windows will do to the .app structure.*

When there's no more room in hell, the dead will go to the arcade!
You play as the uncanny intelligence for hordes of hungry living dead.
Your goal in the game is to devour all the living on each of the 32 levels.

Battle a cast of characters including thugs, prostitutes, office workers, police, 
military, strangely suited guys, and mad scientists. 

Revisit good times with surprise guests from previous iGame3D uDevGames entries.

Modulate play between aggresive romps of flesh rending horror and strategic
stalking to minimise casualities from the unbeatable human karate style, 
the never ending rain of bullets and those spectacularly lethal grenades.

Slip into zombie time slow motion to better target your dinner and 
enjoy your crushing assaults with a cinematic style.

This is a game every zombie in your family will love.

What are you waiting for zombies?
Get out there and shred some flesh!

Cheat Keys are probably disabled on Windows.
*/uDeadGame/Data/Scripts/UDG_Functions/UDG_Game.lua*
and
*/uDeadGame/Data/Scripts/UDG_Functions/UDG_Keyboard.lua*
can be modified to create new key bindings or activate these cheats.

#default/loadscript.lua

Replacing the text inside the file: *uDeadGame/Data/Levels/default/load script.lua* with this:

```lua
-- Begin of auto-script
LockScript = true
-- End of auto-script
if UIMainTools then UIMainTools:hide() end
gameroot=getSceneInfo(IG3D_ROOT)
dofile(gameroot.."Data/Levels/default/default_Globals.lua")
dofile(gameroot.."Data/Fluid/UI_MAIN_TOOLS/UI_MAIN_TOOLS.fl")
TextBox_Levels_Menu()
```
Will give you the full fledged undocumented buggy no undo iGame3D editor.



#uDeadGame Postmortem 2009:
Provocative and Interactive
With uDeadGame, our uDevGames 2008 entry, we set out to create a provocative and interactive learning tool to initiate conversation about the spiritually sensitive controversy over appeasing the infinite hunger of the restless dead. To our surprise invididuals found it either entertaining, disappointing and/or disturbing. This unexpected result has lead the iGame3D team of experts to feel confident that people may like or perhaps even dislike a three dimensional first person zombie action adventure game. Such profound discoveries will certainly lead our research and development team to rich and meaningful technologies that will with out a doubt benefit all mankind.

![udeadgameArcadeimage](https://user-images.githubusercontent.com/238475/40210498-8308f20e-5a02-11e8-8981-60ac5fb18b98.png)


The iGame3D Engine Team
People often recognize us and shout “Hey iGame3D guys, how do you make such awesome games?”, and we always tell them “It’s all in the wrists.” But thats only half the truth. An eleborate hi-tech system of hardware and software is required to achieve desireable results. Why, if it were not for the internet iGame3D could not exist. In fact, everyone here at iGame3D urges you to use the internet, its an excellent product made by really swell people. iGame3D of course, is more than some lone scientist working morbid and forbidden arts high in some tower. It’s actually two computer game enthusiasts working in Germany and the United States.

Tobias Opfermann, the ingenious creator of the iGame3D engine and an original uDevGames contender is responsible for every line of cryptic C spelling out the DNA of uDeadGames. Further he’s the brain that fed the majority of the game’s Lua scripts as well, if people run, shoot, or kung fu kick, thats Tobi’s grey matter at work. If a zombie leaps, eats, runs or trashes hotel room furniture like a rock star, thats Tobi’s mental faculties in play. Lucky for iGame3D, Tobi has plenty of brains. Enough to goad uDeadGame’s zombie horde on to an iPhone recently. One possible advertising them for that new phase of development is “Touch Tobi’s Brains.”

![udeadgamemacdesktop](https://user-images.githubusercontent.com/238475/40210503-89467a74-5a02-11e8-8597-2f601796e57e.png)


I credit myself with many titles and accomplishments at iGame3D — lately its raising an undead army, but generally I’m pretty much the interior designer. The iGame3D engine is an empty house of potential and I script the buttons and menus, fill the coffers of content, build the worlds and generally explore an the infinite chaotic universe of my own creation.

iGame3D occasionally employs the talent of family and friends for various unpleasant tasks. Felix Gonsior let one of his harem of many zombies girlfriends out of her cage for uDeadGame. Marco Kittel produced an excellent up tempo ambient mix that was a hilight of the uDeadGame experience. Alisa Griffin produced zombie textures, timely level testing and bug reports as well as audio samples. Amy Griffin brought home the brains along with purchasing all the new models, textures, and audio.

![udeadgameforums](https://user-images.githubusercontent.com/238475/40210508-8da6295c-5a02-11e8-988b-7e81e161facf.png)

We wouldn’t be able to manipulate all these bits and vertices if wasn’t for legions of crack independent support teams providing software and services to our great cause. Apple hardware and software is the very backbone of iGame3D. The various programs that come preinstalled with our iMac and MacBook computers, get widely overlooked but are vital to our efforts. We’ve been literally tied to Xcode by a virtual umbilical cord for almost a decade.

The Tools
Every workday we we break out a toolbox weighed down heavy with Adium, Smultron, Xcode, AC3D, Safari, Cyberduck, Terminal, iTunes, iPhoto, Preview, SubEthaEdit, murgaLua, Fluid, Photoshop, and Console.app.

With that we wire and stitch the internal organs of the iGame3D Player.app while adding scripts, models and assets like the writhing tentacles of some enormous creature. It all gets organized and archived by updating our ever growing sourceforge.net SVN repository. Tobi uses Terminal.app, while I rely on ZigVersion to manage the gigabytes of source, scripts, models, and images.

AC3D is a simple, easy and low cost cross-platform 3D modeling solution that has been great for us. We developed rudimentary import and export plugins for the software that allow us to generate or modify content with minimal difficulty.

The levels for uDeadGame were generally initiated by a crude user interface window I created that allows me to draw some squares from a small grid. A press of a button then be converts that drawing to imported polygon objects as floors, walls and ceilings. From there the map was brought into AC3D and given textures, door frames, buildings and other elements. The biggest challenge to this was scale, especially with textures. What is visible to the eye from a distance in AC3D is often enormously over scaled when confronting it up close in iGame3D.

Every nerve and blood vessel of the game can be accessed in a quick dissection of uDeadGame’s resident Data folder. One of the vital ingredients for our re-animation techniques in uDeadGame is the scripting language Lua. An iGame3D level is a Lua script defining iGame3D entities and scene settings. This “load script.lua” also can run a common series of scripts defining game globals and functions. A single master control function enabling physics and interaction runs while the engine is in play mode.

A uDeadGame level for example, loads about sixty objects, fifty particles, two hundred twenty sounds, forty textures, followed by thirty or more script files. One script makes sure character models with specific names are put on the appropriate team or in the hands of the right people.One of the scripts reads a low poly count model file for animations and extracts them for use with the higher quality models in the scene.

The user interface for making games with iGame3D is a never ending work in progress. In 2007 we joined forces with John Murga and integrated his murgaLua software which itself is a Lua based amalgmation of libraries providing a number of excellent solutions. Through this software I can use Fast Light Toolkit’s Fluid program to create, script and organize interfaces. Drag and drop of these files to iGame3D converts the document to a Lua script and runs it, crashes, or just ignore’s my affection. It’s pretty easy work, however Fluid has no line numbers or find and replace and I’m prone to typos.

Zombie Genre Simulator
In the spring of 2008 I wrote a design document for a “Zombie Genre Simulator”. We began working on the concept of having common life scenes suddenly interupted by various forms of zombie outbreak. You would influence a human or a zombie and try to favor their survival through a series of dramatic situations, eventually raising their status to hero of humanity or undead overlord. A decent real time strategy game began evolving from our attempts to make a practical game of the idea. To accompany the RTS I created an interface that made new levels by randomizing the number and placement of houses, zombies, humans, guns, and cars for a level.

We later combined the randomizer with our first person shooter scripts and quickly had a “shoot the zombies” game to play with. It was uDeadGame pre-mortis.

On Christmas evening 2008 Tobi and I had a casual internet chat. In a holiday mood uDeadGame twitched its first sign of re-animation. Within an hour a dozen low poly models from TurboSquid were ready to face our zombies.January and February of 2008 were two months of two weeks intensive game development haulted by commitments to school and often hindered by bugs with the A-Star path finding scripts.

![udeadgameacd3d](https://user-images.githubusercontent.com/238475/40210512-916d36fc-5a02-11e8-9f35-665b40befa7d.png)

Game levels were created but couldn’t be tested effectively, followed by game levels being cannibalized and reworked several times, all needlessly, as changes to the A-Star system eventually solved most problems.

Soon there were so many levels to test that time was quickly being consumed in empty levels versus very simple humans and zombies just looking for A-Star or map issues.

Only at the very end did the music, the title and menu screens , the tutorial level, the furniture and the keyboard commands for controlling zombies, get put into the game for testing. It was a brand new game literally between breakfast and dinner.

Some breakthroughs that happened in those final hours include a safe in game menu activated by pressing escape key. Previously our escape key would always pull a game out of the play and into a different level all together. This was awful. Finally for uDeadGame we let a user pause the game while providing them a few options to consider without disregarding all their game progress at the touch of a button.

I don’t know if our new binary “.wtfb” format was much of a breakthrough. It was invented to hasten level loading times. Having a model and a low poly level of detail version to copy into binary format quadrupled the number of files we have to track. It also killed uDeadGame for PowerPc computers.

What Went Right (and Wrong)
When we finally went public with the current build, there were some complaints and comments that echoed our own. A lot could be done in a short time to feed everyone’s appetites, but we very much wanted to see as much feedback gathered on this incarnation of the game before returning to the dark wilderness of design.

![udeadgameFLTKLUstuff](https://user-images.githubusercontent.com/238475/40210517-97f4f226-5a02-11e8-9919-34425e746b2e.png)

By the time the uDevGames public and peer voting feedback arrived we were already moving away from decayed corpses and on to the iPhone. The emailed messages resonated like the voices of ghosts freed from a mundane life by our zombie onslaught, some gleeful of the liberty uDeadGame offered, others frustrated as if playing damned them to eternal peril. Thats the kind of emotional response we hope to gather from our game playing fans, only its much more satistfying if there cries for help are immediate.

iGame3D has honored the uDevGames contest with courageous battle since its very conception. At least three times the dead have risen for these events and many developers have fallen. Still its undeniabled that great heros have risen from the carnal fields of the contest. Team iGame3D itself has grown doubly wise by pitting themselves against the imaginations and wizardry of dozens of Mac OS X game developers. Gaining a seat among the honored has given them a responsibility to represent an added value to the contest.

Title: uDeadGame
Developer: iGame3D Team
Genre: Action
Team size: 6
Released date: March 03, 2009
Project length: Six Weeks
Development hardware: iMac Core Duo 2, MacBook Core Duo 2
Critical software: iGame3D, Ac3D, Fluid, ZigVersion, Xcode, Smultron, Cyberduck, Photoshop, FLTK, LUA, 
