set fish_greeting  # disable greeting
#set -x XKB_DEFAULT_LAYOUT us,ru
#set -x XKB_DEFAULT_OPTIONS grp:shift_caps_toggle,caps:swapescape
#set -x GDK_BACKEND x11
#set -x SDL_VIDEODRIVER wayland
# Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

if not pgrep -u "$USER" ssh-agent > /dev/null
  ssh-agent -c > ~/.ssh-agent-thing
end
if test "$SSH_AGENT_PID" = ""
  source ~/.ssh-agent-thing > /dev/null
end
