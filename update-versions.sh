#!/bin/bash

curl --silent https://hub.spigotmc.org/versions/ | grep -o -E '[0-9.]+\.[0-9]+' | sort -u -t. -k 1,1nr -k 2,2nr -k 3,3nr > versions