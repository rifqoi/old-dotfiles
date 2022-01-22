#!/bin/sh

sudo reflector -c Indonesia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
