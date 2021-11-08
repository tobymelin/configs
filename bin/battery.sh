#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9][0-9]?[0-9]?%')

echo "Battery: $BAT"

exit 0

