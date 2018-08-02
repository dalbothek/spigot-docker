#!/bin/bash

curl --silent  https://hub.spigotmc.org/versions/ | grep -o -E '[0-9.]+\.[0-9]+' | uniq > versions