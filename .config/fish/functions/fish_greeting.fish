function fish_greeting
    echo "=========================================="
    echo (set_color green)"Hello $(whoami)!"(set_color normal)
    echo "The current time is: "(date "+%A, %B %d, %Y %T")
    echo
    echo (set_color yellow)"$(fortune)"(set_color normal)
    echo "=========================================="
end
