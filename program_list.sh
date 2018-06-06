PROGRAMS=(

    # - SYSTEM - #
    'xorg-server'           # Xorg X graphic server

    # - INTERFACE - #
    'i3-gaps'
    'i3lock-color-git'
    'polybar'
    'python-pywal'          # Generate and change color-schemes on the fly according to your wallpaper
    'dunst'

    'ranger'
    'ncdu'                  # A CLI disk usage utility

    'nautilus'
    'nautilus-ext-git'      # Encrypted open-source password manager in Node.js
    'stacer'                # Linux system utilities and monitoring

    # - APPLICATIONS - #
    'boostnote'             # Note taking app
    'buttercup-desktop'
    'qutebrowser'           # A vim like internet browser"
    'irssi'                 # The famous IRC client"
    'task'                  # TaskWarrior : A command-line todo list manager
    'khal'                  # A CLI agenda manager"

    # - DEV - #
    'vim'
    'sublime-text-dev'
    'mycli'

    # - TERMINAL - #
    'rxvt-unicode-pixbuf'   # An URxvt version that allowed picture preview in ranger
    'rxvt-unicode-terminfo'
    'urxvt-perls'
    'zsh'
    'thefuck'

    # - TOOLS - #
    'arandr'                # Provide a simple visual front end for XRandR

    # - FONTS - #
    'otf-san-francisco'          # The system font for macOS, iOS, watchOS, and tvOS
    'otf-fira-code'
    'terminus-font'              # Monospace bitmap font (for X11 and console)
    'ttf-material-design-icons'  # Material Design icons by Google
    'ttf-font-awesome'           # Iconic font designed for Bootstrap
    'ttf-twemoji-color'
    'ttf-font-logos'
)

TO_INSTALL=(
    'github:dylanaraps/bum'
    'github:x70b1/polybar-scripts/tree/master/polybar-scripts/openweathermap-fullfeatured'
)

TO_FOLLOW=(
    'sway'      # i3 replacement that use Wayland instead of XOrg
    'oni'       # Modern editor. A mix between Vim and VSCode
)

ABANDONNED=(
    'luakit'                #
    'freshplayerplugin'      # Used by luakit to render Flash.
)
