#!/usr/bin/env bash
if pgrep "nginx"> /dev/null ; then
	sudo nginx -s reload
else
	sudo nginx
fi