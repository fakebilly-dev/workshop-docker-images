#!/usr/bin/env bash
set -ex

mkdir -pv /opt/jetbrains
wget -qO /opt/jetbrains/datagrip-2019.3.5.tar.gz https://download.jetbrains.com/datagrip/datagrip-2019.3.5.tar.gz
tar -zxf /opt/jetbrains/datagrip-2019.3.5.tar.gz -C /opt/jetbrains

cat >/etc/profile.d/datagrip.sh <<'EOF'
export DATAGRIP_HOME=/opt/jetbrains/DataGrip-2019.3.5
export PATH=:$PATH:$DATAGRIP_HOME/bin
EOF

cat >/usr/share/applications/DataGrip.desktop <<EOL
[Desktop Entry]
Version=2019.3.5
Name=DataGrip
Comment=JetBrains DataGrip
Exec=/opt/jetbrains/DataGrip-2019.3.5/bin/datagrip.sh
Icon=/opt/jetbrains/DataGrip-2019.3.5/bin/datagrip.png
Terminal=false
StartupNotify=false
Type=Application
EOL

chmod +x /usr/share/applications/DataGrip.desktop
cp /usr/share/applications/DataGrip.desktop $DEFAULT_PROFILE_HOME/Desktop/DataGrip.desktop

rm -rf /opt/jetbrains/datagrip-2019.3.5.tar.gz