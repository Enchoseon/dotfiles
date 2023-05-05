#!/usr/bin/env bash
# Source: https://wiki.archlinux.org/title/Wine#Unregister_existing_Wine_file_associations
# Explanation: I manually run this script whenever I notice that Wine has taken over my default application; usually when Lutris decides to use a binary instead of my system's Wine and bypasses my configuration. The better solution is to not use or change Wine wrappers, but I'm lazy.
# I keep Wine .desktop files I want to keep in ~/.local/share/applications/wine
# Step I: Remove all Wine extensions
rm -f ~/.local/share/applications/wine-extension*.desktop
rm -f ~/.local/share/icons/hicolor/*/*/application-x-wine-extension*
# Step II: Remove outdated file assocation cache
rm -f ~/.local/share/applications/mimeinfo.cache
rm -f ~/.local/share/mime/packages/x-wine*
rm -f ~/.local/share/mime/application/x-wine-extension*
# Step III: Update the cache
update-desktop-database ~/.local/share/applications
update-mime-database ~/.local/share/mime/
