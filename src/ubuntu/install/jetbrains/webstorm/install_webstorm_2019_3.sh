#!/usr/bin/env bash
set -ex

mkdir -pv /opt/jetbrains
wget -qO /opt/jetbrains/WebStorm-2019.3.5.tar.gz https://download.jetbrains.com/webstorm/WebStorm-2019.3.5.tar.gz
tar -zxf /opt/jetbrains/WebStorm-2019.3.5.tar.gz -C /opt/jetbrains

cat >/etc/profile.d/WebStorm.sh <<'EOF'
export WEBSTORM_HOME=/opt/jetbrains/WebStorm-193.7288.28
export PATH=:$PATH:$WEBSTORM_HOME/bin
EOF

cat >/usr/share/applications/WebStorm.desktop <<EOL
[Desktop Entry]
Version=2021.3.3
Name=WebStorm
Comment=JetBrains WebStorm
Exec=/opt/jetbrains/WebStorm-193.7288.28/bin/webstorm.sh
Icon=/opt/jetbrains/WebStorm-193.7288.28/bin/webstorm.png
Terminal=false
StartupNotify=false
Type=Application
EOL

chmod +x /usr/share/applications/WebStorm.desktop
cp /usr/share/applications/WebStorm.desktop $DEFAULT_PROFILE_HOME/Desktop/WebStorm.desktop

rm -rf /opt/jetbrains/WebStorm-2019.3.5.tar.gz