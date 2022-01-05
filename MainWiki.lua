local Wiki = _G.Widget

local module = {}

function module.Visibility(NameOfFrame: GuiObject, Visible: boolean)
	if Visible == false then
		NameOfFrame.Visible = true
		Visible = true
	else
		Visible = false
		NameOfFrame.Visible = false
	end
end

function module.FindString(Word, WordFinding)
	if type(Word) ~= "string" and type(WordFinding) ~= "string" then
		warn(Word.." and "..WordFinding.." are not strings")
		return
	end
	return string.find(Word, WordFinding)
end

return module
