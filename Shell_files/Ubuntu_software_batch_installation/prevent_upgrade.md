function sudo() {
    if [[ $@ == "apt-get upgrade" ]]; then
        echo "sudo apt-get upgrade is disabled in this terminal."
        kill -9 $PPID
        exit
    fi
    command sudo "$@"
}
