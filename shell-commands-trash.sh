#!/usr/bin/env bash
#parse last tag without changeset, without 'v'
TAG=$(hg tags | grep -m1 -e 'v[[:digit:]].[[:digit:]].[[:digit:]]*' | sudo sed 's/[[:digit:]][[:digit:]][[:digit:]][[:digit:]].*$//' | sudo sed 's/v//'

find -maxdepth 1 -type d | grep '[[:digit:]][[:digit:]]\?.[[:digit:]][[:digit:]]\?.[[:digit:]][[:digit:]]\?' | sudo sed 's/\.\///'