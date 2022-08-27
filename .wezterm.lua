local wezterm = require 'wezterm'

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
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
        },
        {
            key = '|',
            mods = 'LEADER',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        {
            key = 'z',
            mods = 'LEADER',
            action = wezterm.action.TogglePaneZoomState
        },
        {
            key = '/',
            mods = 'LEADER',
            action = wezterm.action.Search {CaseSensitiveString=''},
        },
        {
            key = 'x',
            mods = 'LEADER',
            action = wezterm.action.CloseCurrentPane {confirm=true}
        },
    },
}
