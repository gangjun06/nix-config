local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

sbar.exec(
    "killall input_monitoring >/dev/null; $CONFIG_DIR/helpers/event_providers/input_monitoring/bin/input_monitoring input_method_change 0.2")

local TextMAP = {
    ["default"] = "En",
    ["org.youknowone.inputmethod.Gureum.han2"] = "Ko",
    ["org.youknowone.inputmethod.Gureum.han3moa-semoe-2018i"] = "Ko2",
    ["com.apple.inputmethod.Japanese"] = "Ja"
}

local input_text = sbar.add("item", "widgets.input1", {
    position = "right",
    icon = { drawing = false },
    label = {
        string = "XX",
        padding_left = -1,
        font = { family = settings.font.text }
    },

})

local input_icon = sbar.add("item", "widgets.input2", {
    position = "right",
    padding_right = -1,
    icon = {
        string = icons.textformat,
        width = 0,
        align = "left",
        color = colors.grey,
        font = {
            style = settings.font.style_map["Regular"],
            size = 14.0,
        },
    },
    label = {
        width = 25,
        align = "left",
        font = {
            style = settings.font.style_map["Regular"],
            size = 14.0,
        },
    },
})

sbar.add("bracket", "widgets.input.bracket", {
    input_text.name,
    input_icon.name
}, {
    background = { color = colors.bg1 },
    popup = { align = "center" }
})

sbar.add("item", "widgets.input.padding", {
    position = "right",
    width = settings.group_paddings
})

-- -- Called from hammerspoon
input_text:subscribe("input_method_change", function(env)
    local inputModeId = env.method or ""
    local trimedInputModeId = inputModeId:gsub("^%s*(.-)%s*$", "%1")
    local inputModeText = TextMAP[trimedInputModeId]
    if inputModeText == nil then inputModeText = TextMAP["default"] end

    input_text:set({
        label = inputModeText
    })
end)
