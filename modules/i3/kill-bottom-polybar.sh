#!/bin/sh
pgrep polybar --list-full | grep bottom | grep '[0-9]*' | xargs kill -9
