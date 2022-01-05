-- Plugin
local TB = plugin:CreateToolbar("Wiki: Plugin")
local WikiButton = TB:CreateButton("Wiki", "Open the Wiki Ui", "rbxassetid://1507949215")
-- Widget
local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Right,  -- Widget will be initialized in floating panel
	false,   -- Widget will be initially enabled
	false,  -- Don't override the previous enabled state
	280,    -- Default width of the floating window
	300,    -- Default height of the floating window
	280,    -- Minimum width of the floating window
	150     -- Minimum height of the floating window
)

local WikiWid = plugin:CreateDockWidgetPluginGui("WikiWidget", widgetInfo)
WikiWid.Title = "Wiki"

local Ui = script.Parent.Parent:WaitForChild("Ui")
local Background = Ui.Background

-- Parenting
Background.Parent = WikiWid
-- Shares
_G.Widget = WikiWid

-- Widget Opener
local db = false
WikiButton.Click:Connect(function()
	if db == false then
		db = true
		WikiWid.Enabled = true
	else
		db = false
		WikiWid.Enabled = false
	end
end)
-- Wiki Handler
local MainWiki = require(script.Parent.Parent:WaitForChild("Modules").MainWIki)
-- Stuff
local Background = WikiWid:WaitForChild("Background")
local Pages = Background.Pages

local Bars = Background.Bars
local SearchBar = Bars.SearchBar
local SearchBox = SearchBar.SearchBox

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
	for _, v in pairs(Pages:GetChildren()) do
		if v.Name ~= "UIGridLayout" then
			if MainWiki.FindString(v.Name, SearchBox.Text) then
				v.Visible = true
			else
				v.Visible = false
			end
		end
	end
end)
