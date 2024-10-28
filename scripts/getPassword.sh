#!/bin/bash

pass ls

echo -en "\nEnter a name of password to fetch: "
read ans

# Termux specific command
pass "$ans" | termux-clipboard-set || echo "Password does not exit."
echo ""
