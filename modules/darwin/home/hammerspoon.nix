{pkgs, ...}: {
  home.packages = with pkgs; [
    hammerspoon
    stackline
  ];

  #  <yabai> <stackline>
  home.file.".hammerspoon/stackline" = {
    source = builtins.toPath (pkgs.stackline + "/source");
    recursive = true;
  };
  home.file.".hammerspoon/init.lua".text = ''
    stackline = require "stackline"
    stackline:init({
        paths = {
            yabai = "${pkgs.yabai}/bin/yabai"
        },
    })

    stackline.config:set('appearance.showIcons', true)
    -- stackline.config:set('appearance.color', { red=0.094, green=0.086, blue=0.137 })
    stackline.config:set('appearance.color', { red=0.72, green=0.58, blue=0.87 })
    stackline.config:set('features.clickToFocus', false)

    -- display current language
    -- https://cliearl.github.io/posts/etc/show-current-language-in-macos/
    local inputSource = {
      english = "com.apple.keylayout.ABC",
      english2 = "io.github.colemakmods.keyboardlayout.colemakdh.colemakdhmatrix-extended",
      korean2 = "org.youknowone.inputmethod.Gureum.han2",
      korean3 = "org.youknowone.inputmethod.Gureum.han3moa-semoe-2018i",
      japanese = "com.apple.inputmethod.Japanese"
    }

    local customStyle = hs.alert.defaultStyle

    customStyle.fillColor = { white = 0, alpha = 0.25 }
    customStyle.strokeColor = { alpha = 0 }

    customStyle.textColor = { white = 0.75, alpha = 0.75 }
    customStyle.textSize = 50

    customStyle.fadeOutDuration = 1.0

    function IM_alert()

    local current = hs.keycodes.currentSourceID()
    local language = nil


    if current == inputSource.korean2 then
    language = ' 🇰🇷 두벌식 '
    elseif current == inputSource.korean3 then
    language = ' 🇰🇷 세벌식 '
    elseif current == inputSource.english then
    language = ' 🇺🇸 QWERTY '
    elseif current == inputSource.english2 then
    language = ' 🇺🇸 COLEMAK '
    elseif current == inputSource.japanese then
    language = ' 🇯🇵 あいう '
    else
    language = current
    end

    if hs.keycodes.currentSourceID() == last_alerted_IM_ID then return end

    hs.alert.closeSpecific(last_IM_alert_uuid)
    last_IM_alert_uuid = hs.alert.show(language, customStyle, 0.3)
    last_alerted_IM_ID = hs.keycodes.currentSourceID()
    end


    hs.keycodes.inputSourceChanged(IM_alert)
  '';
  # <yabai> <stackline>
}
