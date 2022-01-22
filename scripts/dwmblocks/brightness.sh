#!/bin/sh

getbrightness=$(xbacklight)
round=$(printf %.0f $getbrightness)

echo "󰃟 $round"
