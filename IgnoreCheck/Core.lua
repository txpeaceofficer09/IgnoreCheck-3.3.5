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
	local numParty, numRaid = GetNumPartyMembers(), GetNumRaidMembers()

	if numRaid > 0 then
		for i=1,numRaid,1 do
			if IsOnIgnore(UnitName("raid"..i)) then
				print(("[|cffffaa00IgnoreCheck|r]: %s is on your ingore list."):format(UnitName("raid"..i))
			end
		end
	elseif numParty > 0 then
		for i=1,numRaid,1 do
			if IsOnIgnore(UnitName("party"..i)) then
				print(("[|cffffaa00IgnoreCheck|r]: %s is on your ignore list."):format(UnitName("party"..i))
			end
		end
	end
end

f:SetScript("OnEvent", OnEvent)

f:RegisterEvent("INGORELIST_UPDATE")
f:RegisterEvent("PARTY_MEMBERS_CHANGED")
f:RegisterEvent("RAID_ROSTER_UPDATE")
