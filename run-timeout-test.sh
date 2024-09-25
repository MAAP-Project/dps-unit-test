#!/bin/bash

basedir=$( cd "$(dirname "$0")" ; pwd -P)

echo "Testing timeout"
python ${basedir}/test-timeout.py
