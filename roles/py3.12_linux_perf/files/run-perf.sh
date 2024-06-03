#!/bin/bash

PYTHON={{ pyenv_user.home }}/versions/3.12.0/bin/python
exec perf record -F 9999 -g $PYTHON -X perf hello_world.py