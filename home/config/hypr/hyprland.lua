-----------------------------
---- ENVIRONMENT VARIABLES --
-----------------------------
hl.env("SSH_AUTH_SOCK", os.getenv("XDG_RUNTIME_DIR") .. "/ssh-agent")

-----------------------
---- AUTOSTART --------
-----------------------
hl.on("hyprland.start", function()
  hl.exec_cmd("noctalia")
  hl.exec_cmd("discord", { workspace = 9 })
  hl.exec_cmd("keepassxc", { workspace = 9 })
  hl.exec_cmd("firefox", { workspace = 0 })
end)

-----------------------
---- ECOSYSTEM --------
-----------------------
hl.config({
  ecosystem = {
    no_update_news = false,
    no_donation_nag = false,
  },
})

-----------------------
---- LOOK & FEEL ------
-----------------------
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 20,
    border_size = 2,
    col = {
      active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 10,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",    enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade",       enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6,  bezier = "default" })

hl.config({
  dwindle = {
    force_split = 2,
    preserve_split = true,
  },
})

-----------------------
---- INPUT ------------
-----------------------
hl.config({
  input = {
    kb_layout = "fr",
    kb_variant = "oss_latin9",
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      natural_scroll = false,
      tap_and_drag = true,
    },
  },
})

hl.device({
  name = "mouse",
  sensitivity = -0.5,
})

-----------------------
---- KEYBINDINGS ------
-----------------------
local mainMod = "SUPER"

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region -o " .. os.getenv("HOME") .. "/Pictures"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nemo"))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
-- forcekillactive -> window.kill() (SIGKILL, sans attendre la fermeture propre)
hl.bind(mainMod .. " + K", hl.dsp.window.kill())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("noctalia msg session lock"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("1"))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:special" }))

hl.bind(mainMod .. " + ampersand",  hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + eacute",     hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + quotedbl",   hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + apostrophe", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + parenleft",  hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + minus",      hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + egrave",     hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + underscore", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + ccedilla",   hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + agrave",     hl.dsp.focus({ workspace = 0 }))

hl.bind(mainMod .. " + SHIFT + ampersand",  hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + eacute",     hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + quotedbl",   hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + apostrophe", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + parenleft",  hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + minus",      hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + egrave",     hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + underscore", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + ccedilla",   hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + agrave",     hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + tab", hl.dsp.focus({ workspace = "e+1" }))

hl.bind("switch:on:Lid Switch",  hl.dsp.exec_cmd("hyprctl dispatch dpms off"), { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl dispatch dpms on"),  { locked = true })

-----------------------
---- WINDOW RULES -----
-----------------------
hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})
