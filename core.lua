local AutoRole = CreateFrame("Frame", nil, UIParent)

-- WoW functions/constants
local UnitSetRole = UnitSetRole
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local StaticPopupSpecial_Hide = StaticPopupSpecial_Hide

AutoRole:RegisterEvent("ROLL_POLL_BEGIN")

local function ROLL_POLL_BEGIN(frame, event, ...)
	-- Get our current spec.
	local specIndex = GetSpecialization()

	-- Find out what the role of the spec is.
	-- specID, specName, specDesc, specIcon, specBackground, specRole
	local _, _, _, _, _, specRole = GetSpecializationInfo(specIndex)

	-- Set our current role.
	UnitSetRole("player", specRole)

	-- Close the Roll Poll popup
	StaticPopupSpecial_Hide(RollPollPopup)
end

AutoRole:SetScript("OnEvent", ROLL_POLL_BEGIN)
