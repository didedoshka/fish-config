function mr -w make
    command make $argv[1]

    if test $status -ne 0
        return 1
    end

    set_color -o green
    echo "Make successful"
    set_color normal

    ./$argv[1] $argv[2..]
end
