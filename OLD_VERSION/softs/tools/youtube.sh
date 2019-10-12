#!/bin/bash
url=$1
number=$(youtube-dl -F $1 | grep "(best)" | cut -d" " -f1)
cd ~/Movies
youtube-dl -f $number $1