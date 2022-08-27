local wezterm = require 'wezterm'
local act = wezterm.action

return {
    -- font = wezterm.font('Fira Code', { weight = 'Bold', italic = false }),
    color_scheme = "Belge (terminal.sexy)",
    font_size = 14,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },

    keys = {
        {
            key = '-',
            mods = 'LEADER',
            action = act.SplitVertical { domain = 'CurrentPaneDomain' },
        },
        {
            key = '|',
            mods = 'LEADER',
            action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        {
            key = 'z',
            mods = 'LEADER',
            action = act.TogglePaneZoomState
        },
        {
            key = '/',
            mods = 'LEADER',
            action = act.Search {CaseSensitiveString=''},
        },
        {
            key = 'x',
            mods = 'LEADER',
            action = act.CloseCurrentPane {confirm=true}
        },
        {
            key = 'n',
            mods = 'LEADER',
            action = act.ActivateTabRelative(1)
        },
        {
            key = 'c',
            mods = 'LEADER',
            action = act.SpawnTab 'DefaultDomain'
        },
        {
            key = 'LeftArrow',
            mods = 'LEADER',
            action = act.ActivatePaneDirection 'Left',
        },
        {
            key = 'RightArrow',
            mods = 'LEADER',
            action = act.ActivatePaneDirection 'Right',
        },
        {
            key = 'UpArrow',
            mods = 'LEADER',
            action = act.ActivatePaneDirection 'Up',
        },
        {
            key = 'DownArrow',
            mods = 'LEADER',
            action = act.ActivatePaneDirection 'Down',
        },
    },
}
