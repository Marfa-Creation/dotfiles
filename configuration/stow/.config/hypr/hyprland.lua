-- Hyprland Lua config — converted from hyprland.conf
-- Requires Hyprland >= 0.55
-- Refer to the wiki: https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
  output = "HDMI-A-1",
  mode = "preferred",
  position = "auto",
  scale = "auto"
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
-- local menu = "wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function ()
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("bash ~/.config/hypr/auto_waybar_reload.sh")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("fcitx5 -dr")
  hl.exec_cmd("nu -c 'loop { notify-send (fortune ~/myquotes); sleep 60min; }'")
  hl.exec_cmd("easyeffects --hide-window")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Uncomment to enforce:
-- hl.config({ ecosystem = { enforce_permissions = true } })
-- hl.permission("/usr/(bin|local/bin)/grim",                              "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",  "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm",                            "plugin",     "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- https://wiki.hypr.land/Configuring/Basics/Variables/

local function layout_bind(bind_table)
  return function ()
    local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()

    if not workspace then
      return
    end

    local layout = workspace.tiled_layout

    if bind_table[layout] then
      hl.dispatch(bind_table[layout])
    end
  end
end
hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 3,
    col = {
      active_border = "rgb(F7768E)",
      inactive_border = "rgba(595959aa)"
    },
    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle"
  },
  group = {
    col = {
      border_active = "rgb(F7768E)"
    },
    groupbar = {
      font_size = 12,
      font_weight_active = "semibold",
      font_weight_inactive = "semibold",
      col = {
        active = "rgb(9ECE6A)",
        inactive = "rgb(414868)"
      }
    }
  },
  decoration = {
    rounding = 1,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)"
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696
    }
  },
  animations = {
    enabled = true
  },
  dwindle = {
    -- pseudotile removed in 0.55 (was already non-functional)
    preserve_split = true
  },
  master = {
    new_status = "master"
  },
  scrolling = {},
  misc = {
    font_family = "JetBrainsMonoNl NF",
    force_default_wallpaper = -1,
    disable_hyprland_logo = true
  },
  input = {
    kb_layout = "us,ara",
    kb_variant = "",
    kb_model = "",
    kb_options = "grp:alt_caps_toggle",
    kb_rules = "",
    repeat_rate = 30,
    repeat_delay = 200,
    accel_profile = "flat",
    follow_mouse = 0,
    sensitivity = 0.6,
    float_switch_override_focus = 0,
    touchpad = {
      natural_scroll = true
    },
    touchdevice = {
      enabled = true,
      output = "current"
    }
  },
  debug = {
    disable_logs = false
  }
})

-- Bezier curves
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Animations
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 1.5, bezier = "quick", style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 1.5, bezier = "quick", style = "slide bottom" })

-- Per-device input config
hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5
})

---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER"

-- Custom binds
-- hl.bind(mainMod .. " + W", hl.dsp.group.toggle())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("rofi -show run"))
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("rofi -show window"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("rofi -show calc"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("~/.config/hypr/ocr.nu"))

-- Special workspace
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.workspace.toggle_special("special"))
hl.bind(mainMod .. " + SHIFT + comma", function ()
  local active = hl.get_active_window()
  local ws = hl.get_active_workspace() -- special workspace is excluded from this function

  if active == nil or active.workspace == nil or ws == nil then
    return
  end

  if active.workspace.name == "special:special" then
    hl.dispatch(hl.dsp.window.move({ workspace = ws.id }))
  else
    
    hl.dispatch(hl.dsp.window.move({ workspace = "special:special" }))
  end
end)

-- Float switcher
-- hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("nu -c ~/.config/hypr/switch_float.nu"))
-- local last_floating
-- local last_tiling
-- -- swap between floating and tiling window, also remember it
-- hl.on("window.active", function (window)
-- if window ~= nil then
-- if window.floating then
-- last_floating = window
-- elseif not window.floating then
-- last_tiling = window
-- end
-- end
-- end)
-- hl.bind(mainMod .. " + SPACE", function ()
-- local active = hl.get_active_window()

-- hl.dispatch(hl.dsp.exec_cmd("notify-send " .. last_tiling.address))

-- if last_tiling ~= nil and active ~= nil and active.floating then
-- -- hl.dispatch(hl.dsp.exec_cmd("notify-send " .. last_tiling))
-- end
-- end)

-- Media keys (locked = works on lockscreen)
hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Volume (repeating)
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), {
  repeating = true,
  locked = true
})
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), {
  repeating = true,
  locked = true
})
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind(mainMod .. " + F7", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Brightness
hl.bind(mainMod .. " + bracketright", hl.dsp.exec_cmd("light -A 5"))
hl.bind(mainMod .. " + bracketleft", hl.dsp.exec_cmd("light -U 5"))

-- Window swapping (tiled) — note: these share keys with moveactive below;
-- Hyprland will use swapwindow for tiled windows and moveactive only applies
-- when the window is floating. They are kept separate here as in the original.
hl.bind(
  mainMod .. " + SHIFT + H",
  layout_bind({
    dwindle = hl.dsp.window.swap({ direction = "left" }),
    scrolling = hl.dsp.layout("swapcol l")
  })
)
hl.bind(
  mainMod .. " + SHIFT + L",
  layout_bind({
    dwindle = hl.dsp.window.swap({ direction = "right" }),
    scrolling = hl.dsp.layout("swapcol r")
  })
)
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

-- Move floating windows (repeating)
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ x = 0, y = 30, relative = true }), { repeating = true })

-- Resize submap
hl.bind(mainMod .. " + R", function ()
  hl.dispatch(hl.dsp.submap("resize"))
end)

hl.define_submap("resize", function ()
  -- hl.bind("L", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
  -- hl.bind("H", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
  -- scrolling layout
  hl.bind("L", layout_bind({
    dwindle = hl.dsp.window.resize({ x = 30, y = 0, relative = true }),
    scrolling = function ()
      hl.dsp.layout("colresize +0.1")
      local active = hl.get_active_window()
      if active ~= nil and active.floating then
        hl.dispatch(hl.dsp.window.resize({ x = 30, y = 0, relative = true }))
      else
        hl.dispatch(hl.dsp.layout("colresize +0.1"))
      end
    end
  }), {
    repeating = true
  })
  hl.bind("H", layout_bind({
    dwindle = hl.dsp.window.resize({ x = -30, y = 0, relative = true }),
    scrolling = function ()
      hl.dsp.layout("colresize -0.1")
      local active = hl.get_active_window()
      if active ~= nil and active.floating then
        hl.dispatch(hl.dsp.window.resize({ x = -30, y = 0, relative = true }))
      else
        hl.dispatch(hl.dsp.layout("colresize -0.1"))
      end
    end
  }), {
    repeating = true
  })

  -- Switch to slow-resize submap
  hl.bind(mainMod .. " + S", function ()
    hl.dispatch(hl.dsp.submap("resize-slow"))
  end)
  hl.bind("Escape", hl.dsp.submap("reset"))
end)

hl.define_submap("resize-slow", function ()
  hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
  hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
  -- Switch back to normal resize
  hl.bind(mainMod .. " + R", function ()
    hl.dispatch(hl.dsp.submap("resize"))
  end)
  hl.bind("Escape", hl.dsp.submap("reset"))
end)

-- Group tab navigation
hl.bind(mainMod .. " + comma", layout_bind({ scrolling = hl.dsp.layout("consume_or_expel prev") }))
hl.bind(mainMod .. " + period", layout_bind({ scrolling = hl.dsp.layout("consume_or_expel next") }))

-- Move window into / out of groups
hl.bind(mainMod .. " + X", hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + SHIFT + ALT + H", hl.dsp.window.move({ into_group = "l" }))
hl.bind(mainMod .. " + SHIFT + ALT + L", hl.dsp.window.move({ into_group = "r" }))
hl.bind(mainMod .. " + SHIFT + ALT + K", hl.dsp.window.move({ into_group = "u" }))
hl.bind(mainMod .. " + SHIFT + ALT + J", hl.dsp.window.move({ into_group = "d" }))

hl.bind(mainMod .. " + ALT + H", hl.dsp.group.prev())
hl.bind(mainMod .. " + ALT + L", hl.dsp.group.next())

-- Core binds
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- layout msg
hl.bind(mainMod .. " + E", layout_bind({ dwindle = hl.dsp.layout("togglesplit") })) -- dwindle only
-- hl.bind
hl.bind(
  mainMod .. " + W",
  layout_bind({
    dwindle = hl.dsp.layout("swapsplit"),
    scrolling = function ()
      local active = hl.get_active_window()
      local screen = hl.get_active_monitor()

      if active == nil or screen == nil then
        return
      end

      if active.size['x'] / screen.width >= 0.75 then
        hl.dispatch(hl.dsp.layout("colresize 0.5"))
      else
        hl.dispatch(hl.dsp.layout("colresize 1"))
      end
    end
  })
) -- dwindle only TODO

-- Focus with hjkl
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 -> key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize with mouse
-- TODO mouse code
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia / brightness keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {
  locked = true,
  repeating = true
})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
  locked = true,
  repeating = true
})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
  locked = true,
  repeating = true
})
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {
  locked = true,
  repeating = true
})
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), {
  locked = true,
  repeating = true
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), {
  locked = true,
  repeating = true
})

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Suppress maximize events for all windows
hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize"
})

-- Fix XWayland drag issues
hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false
  },
  no_focus = true
})

-- Disable blur for kitty
hl.window_rule({
  name = "kitty-no-blur",
  match = { class = "kitty" },
  no_blur = true
})

-- local last_floating
-- local last_tiling
-- -- swap between floating and tiling window, also remember it
-- hl.on("window.active", function(w)
-- if w.floating then
-- last_floating = w
-- else
-- last_tiling = w
-- end
-- end)

local last_floating_addr = nil
local last_tiling_addr = nil

local function find_window_by_address(addr)
  if addr == nil then return nil end
  for _, win in ipairs(hl.get_windows()) do
    if win.address == addr then
      return win
    end
  end
  return nil -- window no longer exists
end

hl.on("window.active", function (window)
  if window == nil then return end

  if window.floating then
    last_floating_addr = window.address
  else
    last_tiling_addr = window.address
  end
end)

-- hl.on("win")

hl.bind(mainMod .. " + SPACE", function ()
  local active = hl.get_active_window()
  if active == nil then return end

  if active.floating then
    local target = find_window_by_address(last_tiling_addr)
    if target ~= nil then
      hl.dispatch(hl.dsp.focus({ window = "address:" .. target.address }))
    end
  else
    local target = find_window_by_address(last_floating_addr)
    if target ~= nil then
      hl.dispatch(hl.dsp.focus({ window = "address:" .. target.address }))
    end
  end
end)
hl.bind(mainMod .. " + SHIFT + SPACE", function ()
  local active = hl.get_active_window()
  if active == nil then return end

  if not active.floating then
    for _, win in ipairs(hl.get_windows()) do
      if not win.floating and win.address ~= active.address and win.workspace == active.workspace then
        last_tiling_addr = win.address
        last_floating_addr = active.address
        break
      end
    end
    hl.dispatch(hl.dsp.window.float({ action = true }))
  else
    for _, win in ipairs(hl.get_windows()) do
      if win.floating and win.address ~= active.address and win.workspace == active.workspace then
        last_floating_addr = win.address
        last_tiling_addr = active.address
        break
      end
    end
    hl.dispatch(hl.dsp.window.float({ action = false }))
  end
end)

hl.bind(mainMod .. " + S", function ()
  local layouts = { "scrolling", "dwindle" }
  local workspace = hl.get_active_workspace()
  local next_layout = "dwindle"

  if not workspace then
    return
  end

  for i = 1, #layouts do
    if layouts[i] == workspace.tiled_layout then
      local next_layout_idx = (i % #layouts) + 1
      next_layout = layouts[next_layout_idx] or "dwindle"
      break
    end
  end

  hl.workspace_rule({ workspace = workspace.name, layout = next_layout })
end)
