local followXOffset = 700

local resizeX = 1280
local resizeY = 720

function resize()
    resizeWindow(resizeX,resizeY)
end

function start (song)
    hudX = getHudX()
    hudY = getHudY()
	
	WhiteBG = makeSprite('WhiteBG','whitebg', true)
	WhiteFade = makeSprite('WhiteBG','whitefade', false)
	Techo2 = makeSprite('Techo2','techo2', true)
	
	setActorX(200,'whitebg')
	setActorY(500,'whitebg')
	setActorAlpha(0,'whitebg')
	setActorScale(4,'whitebg')
	
	setActorX(200,'whitefade')
	setActorY(500,'whitefade')
	setActorAlpha(0,'whitefade')
	setActorScale(4,'whitefade')

	setActorX(110,'techo2')
	setActorY(553,'techo2')
	setActorAlpha(0,'techo2')
	setActorScale(2.25,'techo2')
end

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

local Fullscreen = false

local defaultHudX = 0
local defaultHudY = 0

local defaultWindowX = 0
local defaultWindowY = 0

local moveWindow = false


local xTo4 = 0
local xTo5 = 0
local xTo6 = 0
local bfX = 0


local xTo7 = 0



function defaultWindow()
    setHudPosition(defaultHudX,defaultHudY)
    setWindowPos((getScreenWidth() / 2 - getWindowWidth() / 2),  (getScreenHeight() / 2 - getWindowHeight() / 2))
    setHudAngle(0)
end

function Fullscreen()
	setHudPosition(defaultHudX,defaultHudY)
	setWindowPos((getScreenWidth() / 2 - getWindowWidth() / 2),  (getScreenHeight() / 2 - getWindowHeight() / 2))
    setHudAngle(0)
end


function update (elapsed)
	local currentBeat = (songPos / 1000)*(bpm/60)
	hudX = getHudX()
    hudY = getHudY()

	if moveWindow then
        setHudPosition(defaultHudX + -13 * math.sin((currentBeat * 4) * math.pi), defaultHudY + -8 * math.cos((currentBeat * 4) * math.pi))
        setWindowPos(defaultWindowX + -13 * math.sin((currentBeat * 4) * math.pi), defaultWindowY + -8 * math.cos((currentBeat * 4) * math.pi))
    else 
        setWindowPos((getScreenWidth() / 2 - getWindowWidth() / 2),  (getScreenHeight() / 2 - getWindowHeight() / 2))
    end
	
	if zoom then
		setCamZoom(2)
	end
	
	if hide then
		for i=0,7 do
			setActorAlpha(0,i)
		end
	end

	if curStep >= 1987 and curStep < 2408 then
		local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	end

	if curStep >= 2409 and curStep < 3500 then
		local currentBeat = (songPos / 1000)*(bpm/60)
        	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 8 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	end

	if swayingmedium then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*1)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*1)) + 10, i)
		end
	end
end

function beatHit (beat)
	if camerabeat then
		setCamZoom(1)
	end
end

function stepHit (step)
	if step == 1987 then
		tweenFadeIn(WhiteBG,1,0.2)
		swayingmedium = false
    end
    if step == 1988 then
	    defaultWindowX = getWindowX()
        defaultWindowY = getWindowY()
		print('moving window')
        moveWindow = true
	end
    if step == 1989 then
		tweenFadeOut(WhiteBG,0,0.6)
		tweenFadeIn(Techo2,1,0.2)
    end
    if step == 2408 then
		tweenFadeOut(Techo2,0,0.6)
		moveWindow = false
		swayingmedium = false
		print('resizing to ' .. getScreenWidth() .. 'x' .. getScreenHeight())
        resizeY = getScreenHeight()
        resizeX = getScreenWidth()
        resize()
    end
end