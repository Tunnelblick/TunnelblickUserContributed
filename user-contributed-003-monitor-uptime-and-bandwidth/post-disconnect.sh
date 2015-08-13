#!/bin/bash
x=`ps ax | grep  timer | grep -v grep| awk '{print $1}'`
kill $x > /dev/null 2>&1
