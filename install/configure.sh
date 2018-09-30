#!/bin/bash

# SETUP ANACONDA SETTINGS FILE:--------------------------------------------------------

# Get startup directory location:
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
STARTUP_DIR=`dirname "$THIS_DIR"`/startup/profile_default/startup
IN_CONFIG_DIR=$THIS_DIR/config
sed -e "s/\"extra_paths\":\[\"\"\]/\"extra_paths\":\[\"${STARTUP_DIR//\//\\/}\"\]/g" $IN_CONFIG_DIR/Anaconda.sublime-settings_proto > $IN_CONFIG_DIR/Anaconda.sublime-settings

# COPY CONFIG FILES TO SUBLIME TEXT'S PACKAGES USER CONFIG DIR:-------------------------------
# Search for Sublime Text's packages User config dir:
OUT_CONFIG_DIR="${HOME}/.config/sublime-text-3/Packages/User"
if [ ! -d "$OUT_CONFIG_DIR" ]; then
    echo -e "\nERROR: Sublime Text's packages user config dir not found.\nEither, you don't have Sublime Text + Package Control installed in your system, or the the directory is in another location.\nSOLUTION: Find it by hand, edit the variable 'OUT_CONFIG_DIR' in this script, and then run this script again.\n"
    exit 1
fi

# Backing up original Sublime Text config files:
mv "${OUT_CONFIG_DIR}/Default (Linux).sublime-keymap" "${OUT_CONFIG_DIR}/Default (Linux).sublime-keymap_backup"
mv "${OUT_CONFIG_DIR}/Preferences.sublime-settings" "${OUT_CONFIG_DIR}/Preferences.sublime-settings_backup"

# Copy config files:
cp -f $IN_CONFIG_DIR/*.sublime-settings $OUT_CONFIG_DIR
cp -f $IN_CONFIG_DIR/*.sublime-keymap   $OUT_CONFIG_DIR


echo -e "\nATTENTION: Sublime Text configuration has been modified.\nJust in case, backup files of your old settings were created, so you can merge them with the ones provided by Matide if wanted (by hand)."
echo -e "The files are:\n${OUT_CONFIG_DIR}/Default (Linux).sublime-keymap_backup\nand\n${OUT_CONFIG_DIR}/Preferences.sublime-settings_backup\n"

# Setting up PdbEditorSupport:
echo "import PdbEditorSupport" >> ~/.pdbrc
echo "PdbEditorSupport.patch(editor='sublime')" >> ~/.pdbrc

echo -e "Matide configured!\n"
