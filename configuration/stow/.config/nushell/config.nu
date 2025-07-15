# config.nu
#
# Installed by:
# version = "0.104.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# alias
alias logseq = logseq --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --wayland-text-input-version=3

# function

def math [] {
	job spawn {brave}
	job spawn {gnome-pomodoro} 
	job spawn {logseq} 
  job spawn {
    sleep 30sec
  	syncthing 
  }
}

def language [username: string, password: string] {
	job spawn {brave}
	job spawn {gnome-pomodoro}
	job spawn {logseq} 
  job spawn	{SYNC_USER1=$"($username):($password)" anki --syncserver} 
	job spawn {anki} 
	job spawn {
    sleep 30sec
  	syncthing 
  }
}

def --wrapped helix [...args] {
	# kitten @ set-background-opacity 1
	^helix ...$args
	# if (ps | where $it.name == helix | length) == 0  {
	# 		kitten @ set-background-opacity 0.7
	# }
}
def hx --wrapped [...args] {
	helix ...$args
}

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

## env var

open /etc/locale.conf
| lines
| parse "{name}={value}"
| str trim value --char '"'
| transpose --header-row --as-record
| load-env

# configuration variable
$env.ELECTRON_OZONE_PLATFORM_HINT = "auto"
$env.ANKI_WAYLAND = 1
$env.MOZ_ENABLE_WAYLAND = 1
$env.ELECTRON_FLAGS = "--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --wayland-text-input-version=3"
$env.QT_IM_MODULE = "fcitx"

# PATH
$env.PATH = [
  "/usr/local/bin"
  "/usr/bin"
  "/bin"
  "/usr/sbin"
  "/sbin"
  "~/.local/bin"
	"~/.cargo/bin"
	"~/.npm-global/bin"
]

# theming
$env.config.buffer_editor = "helix"
$env.config.show_banner = false
$env.config.color_config = {
  separator: "#7AA2F7"                     
  leading_trailing_space_bg: "#414868"    
  header: "#F7768E"                        
  date: "#ff9e64"                          
  filesize: "#7dcfff"                      
  row_index: "#7aa2f7"                     
  bool: "#f7768e"                          
  int: "#9ece6a"                           
  duration: "#f7768e"                      
  range: "#f7768e"                         
  float: "#f7768e"                         
  string: "#7DCFFF"                        
  nothing: "#f7768e"                       
  binary: "#f7768e"                        
  cellpath: "#f7768e"                      
  hints: "#F7768E"

  shape_garbage: { fg: "#ffffff", bg: "#ff0000", attr: "b" }
  shape_bool: "#7dcfff"                                  
  shape_int: { fg: "#ff9e64", attr: "b" }                
  shape_float: { fg: "#ff9e64", attr: "b" }              
  shape_range: { fg: "#ff9e64", attr: "b" }               
  shape_internalcall: { fg: "#7aa2f7", attr: "b" }       
  shape_external: "#7aa2f7"                              
  shape_externalarg: { fg: "#9ece6a", attr: "b" }        
  shape_literal: "#7dcfff"                              
  shape_operator: "#ff9e64"                              
  shape_signature: { fg: "#9ece6a", attr: "b" }          
  shape_string: "#9ece6a"                                
  shape_filepath: "#7dcfff"                              
  shape_globpattern: { fg: "#7dcfff", attr: "b" }        
  shape_variable: "#ff9e64"                              
  shape_flag: { fg: "#7dcfff", attr: "b" }               
}

## autostart
# fastfetch
fastfetch 
# starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
# zoxide
source ~/.zoxide.nu
