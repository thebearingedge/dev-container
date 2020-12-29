useradd --create-home --shell /bin/bash --groups sudo dev
echo 'dev ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/dev
chmod 440 /etc/sudoers.d/dev
touch /home/dev/{.hushlogin,.sudo_as_admin_successful}

cat << 'EOF' >> /home/dev/.bashrc

export LS_COLORS="${LS_COLORS}fi=97:di=34:tw=34:ow=34"

EOF
