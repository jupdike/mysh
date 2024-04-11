#!/bin/sh
awk '{s+=$0} END {print s}' $@
