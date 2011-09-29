function mkcd {
    if [ $# -ne 1 ]; then 
        echo "usage: mkcd directory_name"
    elif [ -d "${1}" ]; then
        echo "(directory already existed)"
        cd "$1"
    elif [ -e "${1}" ]; then
        echo "file exists"
    else
        mkdir -p "${1}" && cd "${1}"
    fi
}
