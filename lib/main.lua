WarcraftGroups = LibStub("AceAddon-3.0"):NewAddon("CSExporter")

local private = {
    isLoaded = false
}

function WarcraftGroups:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("CSExporterDB")

    if not CSExporterSettings then
        CSExporterSettings = {}
    end
    if not CSExporterSettings.debug then
        CSExporterSettings.debug = false
    end

    handle =
        C_Timer.NewTicker(
        1,
        function()
            self:setSavedVariables()
        end
    )
end

function WarcraftGroups:setSavedVariables()
    if not private.isLoaded then
        return false
    end

    return true
end

local function EventHandler(self, event, arg)
    if event == "ADDON_LOADED" and arg == "WarcraftGroups" then
        private.isLoaded = false
        print("|cffFF0000[LOADED]|r WarcraftGroups"
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", EventHandler)