-- Library
local NovaLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Libs/NovaUiLib/NovaUiLib.lua"))()

-- Information
AddInfo({Title = "NOVA HUB : EXAMPLE", Font = Enum.Font.FredokaOne})

-- Notification
AddNotify({
  Title = "NOVA HUB",
  Text = "By @Roun95",
  Time = 10
})

-- New tab
local Tab = NewTab({Name = "Home"})

-- New Button
AddButton(Tab, {
  Name = "Button",
  Callback = function()
    print("hi")
  end
})

-- New Toggle/Check Box
AddToggle(Tab, {
  Name = "Toggle",
  Default = false,
  Callback = function(Value)
    print(Value)
  end
})

-- New Slider
AddSlider(Tab, {
  Name = "Slider",
  MinValue = 10,
  MaxValue = 100,
  Default = 25,
  SliderColor = Color3.fromRGB(50, 200, 50),
  Callback = function(Value)
    print(Value)
  end
})

-- New Color Picker
AddColorPicker(Tab, {
  Name = "Select Color",
  Default = Color3.fromRGB(200, 0, 0),
  Callback = function(Value)
    
  end
})

-- New Dropdown
AddDropdown(Tab, {
  Name = "Numbers",
  Options = {"1", "2", "3", "4"},
  Default = "2",
  Callback = function(Value)
    print(Value)
  end
})

-- New Label
AddLabel(Tab, {"Label"})

-- New Paragraph
AddParagraph(Tab, {"Warn", "Paragraph"})

