function create_ssh_key() {
    # Check if the key files already exist
    if [[ -f ~/.ssh/id_rsa && -f ~/.ssh/id_rsa.pub ]]; then
        echo "SSH key files already exist"
        return 1
    fi

    # Create SSH key files
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""

    # Set appropriate file permissions
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/id_rsa
    chmod 644 ~/.ssh/id_rsa.pub

    echo "SSH key files created successfully"
}
create_ssh_key
