#!/bin/sh
(cd $1 && git fetch && git merge --ff-only && git fetch && git status)
