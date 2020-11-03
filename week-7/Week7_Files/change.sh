#!/bin/bash

RED="\[\e[0;31m\]"
MAGENTA="\[\e[0;35m\]"
BLUE="\[\e[0;34m\]"
YELLOW="\[\e[0;33m\]"
CYAN="\[\e[0;36m\]"
GREEN="\[\e[0;32m\]"
END="\[\e[m\]"

PS1="$CYAN[\D{%A}, \D{%d-%m-%Y}$END||$RED\D{%I:%M%p %Z}]$END[$BLUE\h$END$YELLOW of$END $GREEN\u:$END$MAGENTA~$END]$RED\$$END "

echo PS1=\"$PS1\" >> ~/.bashrc
