#!/bin/zsh

current_hour=$(date +%H)
starting_day_hour=9
end_day_hour=18 # 12 + 6 for 24 hour clock
files_to_concat=("$0:a:h/base.yml")

# Add colorscheme for time of day
# NOTE: How can I make this a higher order function?
if ([ $current_hour -gt $starting_day_hour ]) && ([ $current_hour -lt $end_day_hour ]); then
  files_to_concat+=("$0:a:h/gruvbox-light.yml")
else
  files_to_concat+=("$0:a:h/gruvbox-dark.yml")
fi

# Add any OS-specific configs + keybindings
if [[ `uname` == "Darwin" ]]; then
  files_to_concat+=("$0:a:h/macos.yml")
else
  files_to_concat+=("$0:a:h/linux.yml")
fi

# Toggle macOS dark mode
if [[ `uname` == "Darwin" ]]; then
  if ([ $current_hour -gt $starting_day_hour ]) && ([ $current_hour -lt $end_day_hour ]); then
    echo "Setting dark mode: OFF"
    osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false"
  else
    echo "Setting dark mode: ON"
    osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true"
  fi
fi

# Delete alacritty file if exists
if [[ -f "~/.alacritty.yml" ]]; then
  rm ~/.alacritty.yml
fi

echo "Writing alacritty file"
for f in $files_to_concat; do (cat "${f}"; echo) >> ~/.alacritty.yml; done
echo 'done'
