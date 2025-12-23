local f = CreateFrame("Frame")

local function IsOnIgnore(name)
	for i=1,50,1 do
		print("Checking "..name.." against "..GetIgnoreName(i))

		if GetIgnoreName(i) == name then
			return true
		end
	end

	return false
end

local function OnEvent(self, event, ...)
	print(event)

	local numParty, numRaid = GetNumPartyMembers(), GetNumRaidMembers()
	local memberName = nil

	if numRaid > 0 then
		for i=1,numRaid,1 do
			memberName = UnitName("raid"..i)

			if IsOnIgnore(memberName) then
				print(("[|cffffaaffIgnoreCheck|r]: %s is on your ingore list."):format(memberName))
			end
		end
	elseif numParty > 0 then
		for i=1,numRaid,1 do
			memberName = UnitName("party"..i)

			if IsOnIgnore(memberName) then
				print(("[|cffffaaffIgnoreCheck|r]: %s is on your ignore list."):format(memberName))
			end
		end
	end
end

f:SetScript("OnEvent", OnEvent)

f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("INGORELIST_UPDATE")
f:RegisterEvent("PARTY_MEMBERS_CHANGED")
f:RegisterEvent("RAID_ROSTER_UPDATE")
