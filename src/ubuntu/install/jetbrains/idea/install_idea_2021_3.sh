#!/usr/bin/env bash
set -ex

mkdir -pv /opt/jetbrains
wget -qO /opt/jetbrains/ideaIU-2021.3.3.tar.gz https://download.jetbrains.com/idea/ideaIU-2021.3.3.tar.gz
tar -zxf /opt/jetbrains/ideaIU-2021.3.3.tar.gz -C /opt/jetbrains

cat >/etc/profile.d/idea.sh <<'EOF'
export IDEA_HOME=/opt/jetbrains/idea-IU-213.7172.25
export PATH=:$PATH:$IDEA_HOME/bin
EOF

cat >/usr/share/applications/IDEA.desktop <<EOL
[Desktop Entry]
Version=2021.3.3
Name=IDEA
Comment=JetBrains Idea
Exec=/opt/jetbrains/idea-IU-213.7172.25/bin/idea.sh
Icon=/opt/jetbrains/idea-IU-213.7172.25/bin/idea.png
Terminal=false
StartupNotify=false
Type=Application
EOL

chmod +x /usr/share/applications/IDEA.desktop
cp /usr/share/applications/IDEA.desktop $DEFAULT_PROFILE_HOME/Desktop/IDEA.desktop

rm -rf /opt/jetbrains/ideaIU-2021.3.3.tar.gz