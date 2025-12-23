local f = CreateFrame("Frame")

local function IsOnIgnore(name)
	local i = 1
	while GetIgnoreName(i) ~= "Unknown" do
		if GetIgnoreName(i) == name then
			return true
		end

		i = i + 1
	end

	return false
end

local function OnEvent(self, event, ...)
	local numParty, numRaid = GetNumPartyMembers(), GetNumRaidMembers()
	local memberName = nil

	if numRaid > 0 then
		for i=1,numRaid,1 do
			memberName = UnitName("raid"..i)

			if IsOnIgnore(memberName) then
				print(("[|cffffaaffIgnoreCheck|r]: |cfff0000|TInterface\\TargetingFrame\\UI-RaidTargetingIcons:0:0:0:0:64:64:48:64:16:32|t%s|TInterface\\TargetingFrame\\UI-RaidTargetingIcons:0:0:0:0:64:64:48:64:16:32|t is on your ingore list.|r"):format(memberName))
			end
		end
	elseif numParty > 0 then
		for i=1,numParty,1 do
			memberName = UnitName("party"..i)

			if IsOnIgnore(memberName) then
				print(("[|cffffaaffIgnoreCheck|r]: |cffff0000|TInterface\\TargetingFrame\\UI-RaidTargetingIcons:0:0:0:0:64:64:48:64:16:32|t%s|TInterface\\TargetingFrame\\UI-RaidTargetingIcons:0:0:0:0:64:64:48:64:16:32|t is on your ignore list.|r"):format(memberName))
			end
		end
	end
end

f:SetScript("OnEvent", OnEvent)

f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("INGORELIST_UPDATE")
f:RegisterEvent("PARTY_MEMBERS_CHANGED")
f:RegisterEvent("RAID_ROSTER_UPDATE")
