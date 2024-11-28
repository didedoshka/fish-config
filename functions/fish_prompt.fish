function fish_prompt --description 'Informative prompt'
    #Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)
    set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
    set -l duration $CMD_DURATION
    set -l duration_str
    if test $duration -lt 1000
        set duration_str $duration'ms'
    else if test $duration -lt 10000
        set duration_str (printf "%.3f" (math $duration / 1000))'s'
    else if test $duration -lt 60000
        set duration_str (math "floor($duration / 1000)")'s'
    else
        set duration_str (math "floor($duration / 60000)")'m'(math "floor(($duration - (floor($duration / 60000) * 60000)) / 1000)")'s'
    end
    set -l duration_space ' '$duration_str

    # echo -n $duration_str

    printf '%s%s %s%s%s@%s %s%s%s%s%s%s%s%s %s%s\n> ' (set_color magenta) (date "+%H:%M:%S") (set_color green) \
        $USER (set_color normal) (prompt_hostname) (set_color blue) (prompt_pwd) (set_color normal) (fish_vcs_prompt) (set_color magenta) $duration_space $pipestatus_string (set_color normal) 
end
