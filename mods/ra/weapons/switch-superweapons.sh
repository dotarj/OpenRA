#!/bin/bash

backup_file="superweapons-backup.yaml"
main_file="superweapons.yaml"
custom_file="superweapons-custom.yaml"

if [ ! -f "$backup_file" ]; then
    cp "$main_file" "$backup_file"
fi

if cmp -s "$main_file" "$custom_file"; then
    cp "$backup_file" "$main_file"
    echo "$main_file was replaced by $backup_file."
elif cmp -s "$main_file" "$backup_file"; then
    cp "$custom_file" "$main_file"
    echo "$main_file was replaced by $custom_file."
fi

read -n 1 -s -r -p "Press any key to continue..."
