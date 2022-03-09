local followXOffset = 700

local swayingsmall = false


function update (elapsed)
	if curStep >= 875 and curStep < 1071 then
		local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	end

	if curStep >= 1072 and curStep < 1599 then
		local currentBeat = (songPos / 1000)*(bpm/60)
        	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 8 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	end

	if curStep >= 1600 and curStep < 1731 then
		local currentBeat = (songPos / 1000)*(bpm/60)
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	end

	if curStep >= 1732 and curStep < 1900 then
		local currentBeat = (songPos / 1000)*(bpm/60)
        	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 8 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 8 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	end
end

function stepHit (step)
	
end