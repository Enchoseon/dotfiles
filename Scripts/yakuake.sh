#!/usr/bin/env bash
# Vertical split (2x)
for run in {1..2}; do qdbus org.kde.yakuake /yakuake/sessions splitTerminalLeftRight "$(qdbus org.kde.yakuake /yakuake/sessions activeTerminalId)"; done
# Topydo on left, scratch terminal in center, cmus on right
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "t"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 1 "emerge --moo"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 2 "cmus"
history -d "$(history 3)" # HACK: Remove three previous command from history
# Grow topydo split to the right (HACK: Yakuake needs to be visible/toggled in order for tryGrowTerminal* to work)
qdbus org.kde.yakuake /yakuake/window toggleWindowState
for run in {1..12}; do qdbus org.kde.yakuake /yakuake/sessions tryGrowTerminalRight 0; done
qdbus org.kde.yakuake /yakuake/window toggleWindowState
