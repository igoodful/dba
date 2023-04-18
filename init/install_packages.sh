
function install_packages() {
    success=()
    fail=()

    for package in "$@"; do
        if yum install -y "$package"; then
            success+=("$package")
        else
            fail+=("$package")
        fi
    done

    echo "安装成功的软件包："
    printf '%s\n' "${success[@]}"
    echo ""
    echo "安装失败的软件包："
    printf '%s\n' "${fail[@]}"
}
