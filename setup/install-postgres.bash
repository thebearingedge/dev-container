apt-get install -y postgresql

service postgresql start
su -c 'psql -c "create user dev with superuser password '\''dev'\''"' postgres
service postgresql stop

cat << EOF >> /home/dev/.bashrc

export PGUSER=dev
export PGPASSWORD=dev

EOF

curl -sL https://github.com/sosedoff/pgweb/releases/download/v0.11.7/pgweb_linux_amd64.zip -o /tmp/pgweb_linux_amd64.zip && \
  unzip -d /tmp /tmp/pgweb_linux_amd64.zip && \
  mv /tmp/pgweb_linux_amd64 /usr/local/bin/pgweb && \
  rm /tmp/pgweb_linux_amd64.zip

cat << EOF >> /home/dev/.bashrc

alias pgweb='pgweb --bind=0.0.0.0'

EOF
