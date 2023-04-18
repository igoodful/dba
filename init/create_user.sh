create_user() {
    username=$1
    password=$2
    
    # Check if user already exists
    if id "$username" >/dev/null 2>&1; then
        echo "User $username already exists"
        exit 1
    fi

    # Create user
    useradd "$username"
    
    # Set password for user
    echo "$password" | passwd --stdin "$username"
    
    echo "User $username created successfully with password $password"
}
create_user work work
