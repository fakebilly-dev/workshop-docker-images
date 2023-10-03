#!/usr/bin/env bash
set -ex

mkdir -pv /opt/jetbrains
wget -qO /opt/jetbrains/pycharm-professional-2019.3.5.tar.gz https://download.jetbrains.com/python/pycharm-professional-2019.3.5.tar.gz
tar -zxf /opt/jetbrains/pycharm-professional-2019.3.5.tar.gz -C /opt/jetbrains

cat >/etc/profile.d/pycharm.sh <<'EOF'
export PYCHARM_HOME=/opt/jetbrains/pycharm-2019.3.5
export PATH=:$PATH:$PYCHARM_HOME/bin
EOF

cat >/usr/share/applications/PyCharm.desktop <<EOL
[Desktop Entry]
Version=2019.3.5
Name=PyCharm
Comment=JetBrains PyCharm
Exec=/opt/jetbrains/pycharm-2019.3.5/bin/pycharm.sh
Icon=/opt/jetbrains/pycharm-2019.3.5/bin/pycharm.png
Terminal=false
StartupNotify=false
Type=Application
EOL

chmod +x /usr/share/applications/PyCharm.desktop
cp /usr/share/applications/PyCharm.desktop $DEFAULT_PROFILE_HOME/Desktop/PyCharm.desktop

rm -rf /opt/jetbrains/pycharm-professional-2019.3.5.tar.gz