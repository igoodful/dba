#!/bin/bash
function generate_password() {
    # 生成32字节随机数（即256位二进制数）
    local random_bytes=$(openssl rand -base64 32)
    # 将随机数转换成只包含数字和大小写字母的32位字符串
    local password=$(echo "$random_bytes" | tr -dc '[:alnum:]' | head -c 32)
    # 检查密码中是否有相邻的相似字符，如果有则重新生成密码
    while [[ "$password" =~ ([il1Lo0])\1 ]]; do
        password=$(generate_password)
    done
    echo "$password"
}

# 示例用法
password=$(generate_password)
echo "$password"

