#!/bin/sh

date="$(date)"
dir="$1 at $date"
username=$(users)
device_info=$(uname -a)

if [[ $# -gt 0 ]]; then
  echo $dir
  if [ ! -d "$dir" ] 
  then
    echo aaa
    mkdir -p "$dir/about_me/personal"
    mkdir -p "$dir/about_me/professional"
    mkdir -p "$dir/my_friends"
    mkdir -p "$dir/my_system_info"
  else
    echo "Directory exists!"
    exit
  fi

  echo bruh

  echo "https://www.facebook.com/$2"  > "$dir/about_me/personal/facebook.txt"
  echo "https://www.linkedin.com/in/$3"  > "$dir/about_me/professional/linkedin.txt"
  curl -s https://gist.github.com/tegarimansyah/e91f335753ab2c7fb12815779677e914/raw/94864388379fecee450fde26e3e73bfb2bcda194/list%2520of%2520my%2520friends.txt > "$dir/my_friends/list_of_my_friends.txt"
  ping -c 3 google.com > "$dir/my_system_info/internet_connection.txt"
  echo "My username : $username" > "$dir/my_system_info/about_this_laptop.txt"
  echo "With host: $device_info" >> "$dir/my_system_info/about_this_laptop.txt" 
  
  
fi 
