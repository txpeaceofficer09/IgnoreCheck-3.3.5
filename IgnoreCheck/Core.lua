local f = CreateFrame("Frame")

local function IsOnIgnore(name)
	local numIgnore = GetNumIgnore()

	for i=1,numIgnore,1 do
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
				print(("[|cffffaa00IgnoreCheck|r]: %s is on your ingore list."):format(memberName))
			else
				print("Not on ignore: "..memberName)
			end
		end
	elseif numParty > 0 then
		for i=1,numRaid,1 do
			memberName = UnitName("party"..i)
			if IsOnIgnore(memberName) then
				print(("[|cffffaa00IgnoreCheck|r]: %s is on your ignore list."):format(memberName))
			else
				print("Not on ignore: "..memberName)
			end
		end
	end
end

f:SetScript("OnEvent", OnEvent)

f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("INGORELIST_UPDATE")
f:RegisterEvent("PARTY_MEMBERS_CHANGED")
f:RegisterEvent("RAID_ROSTER_UPDATE")
