#!/bin/bash
git submodule foreach git checkout master
git submodule foreach git clean -f
git status

rm home/.vim/bundle/*
