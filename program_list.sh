PROGRAMS=(

    # - SYSTEM - #
    'xorg-server'           # Xorg X graphic server
    'ly-git'                # display manager

    # - INTERFACE - #
    'i3-gaps'
    'i3lock-color-git'
    'perl-anyevent-i3'
    'polybar'
    'python-pywal'          # Generate and change color-schemes on the fly according to your wallpaper
    'dunst'
    'compton'
    'feh'

    # - CLI APPS - #
    'ranger'                # file manager
    'ncdu'                  # disk usage utility
    'htop'
    'glances'             
    'neomutt'               # mail client
    'tig'                   # git interface
    'abook'                 # contact manager
    'mpd'                   # music player daemon
    'ncmpcpp'               # mpd client
    'translate-shell'       # translator
    'tomb'                  # folder crypter
    'pass'                  # crypted password manager
    'bc'                    # the GNU calculator

    'z'
    'thefuck'
    'httpie'

    'ponysay'
    'fortune-mod'
    'asciiiquarium'
    'cmatrix'

    'nautilus'
    'nautilus-ext-git'      # Encrypted open-source password manager in Node.js
    #'stacer'                # Linux system utilities and monitoring

    # - APPLICATIONS - #
    'boostnote'             # Note taking app
    'buttercup-desktop'
    'fb-messenger-cli'
    'qutebrowser'           # A vim like internet browser"
    'irssi'                 # The famous IRC client"
    'task'                  # TaskWarrior : A command-line todo list manager
    'khal'                  # A CLI agenda manager"
    'synergy2-bin'

    # - GAMES - #
    'ninvaders'             # invaders
    'bastet'                # tetris
    'pacman$console'        # pacman

    # - AUDIO - #
    'alsa-utils'
    'alsa-plugins'
    'pulseaudio'
    'pulseaudio-alsa'
    'apulse'
    'pulsemixer'
    'cli-visualizer'


    # - DEV - #
    'vim'
    'sublime-text-dev'
    'mycli'
    'multitail'

    # - TERMINAL - #
    'rxvt-unicode-pixbuf'   # An URxvt version that allowed picture preview in ranger
    'rxvt-unicode-terminfo'
    'urxvt-perls'
    'zsh'
    'thefuck'
    'screen'
    'openssh'
    'rsync'

    # - TOOLS - #
    'arandr'                # Provide a simple visual front end for XRandR
    'lxappearance'
    'gnome-disk-utiliy'
    'networkmanager'

    # - THEMING - #'
    'arc-gtk-theme'

    # - FONTS - #
    'nerd-fonts-git'
    'otf-san-francisco'          # The system font for macOS, iOS, watchOS, and tvOS
    'otf-fira-code'
    'terminus-font'              # Monospace bitmap font (for X11 and console)
    'ttf-material-design-icons'  # Material Design icons by Google
    'ttf-font-awesome'           # Iconic font designed for Bootstrap
    'ttf-twemoji-color'
    'ttf-font-logos'
)

MANUAL_INSTALL=(
    'font-mfizz'
    'sc-im'                       # https://github.com/andmarti1424/sc-im.git
    'resize-font'                 # https://github.com/simmel/urxvt-resize-font
)

TO_INSTALL=(
    'github:dylanaraps/bum'
    'github:x70b1/polybar-scripts/tree/master/polybar-scripts/openweathermap-fullfeatured'
)

TO_FOLLOW=(
    'sway'      # i3 replacement that use Wayland instead of XOrg
    'oni'       # Modern editor. A mix between Vim and VSCodoe
    'kakoune'   # Modal editor · Faster as in less keystrokes · Multiple selections · Orthogonal design
)

ABANDONNED=(
    'luakit'                #
    'freshplayerplugin'      # Used by luakit to render Flash.
)
