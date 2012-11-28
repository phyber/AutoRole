local AutoRole = CreateFrame("Frame", nil, UIParent)

-- WoW functions/constants
local UnitSetRole = UnitSetRole
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local StaticPopupSpecial_Hide = StaticPopupSpecial_Hide

AutoRole:RegisterEvent("ROLE_POLL_BEGIN")

local function ROLE_POLL_BEGIN(frame, event, ...)
	-- Get our current spec.
	local specIndex = GetSpecialization()

	-- It's possible to not know any specs.
	if specIndex then
		-- Find out what the role of the spec is.
		-- specID, specName, specDesc, specIcon, specBackground, specRole
		local _, _, _, _, _, specRole = GetSpecializationInfo(specIndex)

		-- Set our current role.
		UnitSetRole("player", specRole)

		-- Close the Role Poll popup
		StaticPopupSpecial_Hide(RolePollPopup)
	end
end

AutoRole:SetScript("OnEvent", ROLE_POLL_BEGIN)
