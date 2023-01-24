--Script.Debug.Enabled = true

local function dispatch(args)
	Script.ClearQueue()
	-- args is expected to be a gearset number with an optional glamour plate number after it
	local a, b = args:match("(%d+)(.*)")
	-- since users may make typos, this ensures that even if args DOESN'T start with a numer, we'll have one for comparisons
	local gs = tonumber(a) or 0
	local plate = tonumber(b) or 0
	-- if args isn't valid, gs will be 0, so we don't have to do any special checks for that
	if gs < 1 then
		Game.PrintError(string.format("%s <gearset> [<glamour>]", Script.CallSelfCommand))
		return
	end
	local command = "/gearset change " .. gs
	if plate >= 1 and plate <= 20 then
		command = command .. " " .. plate
	end
	-- cached in local vars so we don't tag the WoLua API a bunch of times
	local moving = Game.Player.Moving
	local shifted = Script.Keys.Shift
	local snap = Game.Player.HasEmote("snap")
	print("Switch requested to gearset #" .. gs .. (plate > 0 and (" with plate " .. plate) or ""))
	print("Player is " .. (moving and "currently" or "not") .. " moving, shift is " .. (shifted and "down" or "up") .. ", player " .. (snap and "can" or "cannot") .. " snap")
	-- you must be able to /snap, not be moving (that'll hide the animation), AND not be holding shift (for a manual quick-change override)
	if snap and not moving and not shifted then
		Script.QueueAction(Game.SendChat, "/snap motion")
		Script.QueueDelay(1350)
	end
	-- this COULD be moved into the conditional and run directly in an else-block instead of queueing every time, but WoLua runs the queue
	-- on game framework update events, so it'll happen basically instantly if the above conditional doesn't pass, so there's no real change
	Script.QueueAction(Game.SendChat, command)
end

Script(dispatch)
