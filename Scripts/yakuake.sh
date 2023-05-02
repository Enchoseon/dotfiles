#!/usr/bin/env bash
# Run Topydo columns in Yakuake (Note: The "t" alias is defined in ~/.zshrc)
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "t"
# Split left/right and run Cmus on the right
qdbus org.kde.yakuake /yakuake/sessions splitTerminalLeftRight "$(qdbus org.kde.yakuake /yakuake/sessions activeTerminalId)"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 1 "cmus && emerge --moo"
# Grow window to the right (Hack Explanation: Yakuake needs to be visible/toggled in order for tryGrowTerminal* to work)
qdbus org.kde.yakuake /yakuake/window toggleWindowState
for run in {1..35}; do qdbus org.kde.yakuake /yakuake/sessions tryGrowTerminalRight 0; done
qdbus org.kde.yakuake /yakuake/window toggleWindowState
