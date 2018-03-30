#!/bin/bash

trap exit TERM
/opt/$APP_NAME/bin/$APP_NAME foreground
wait
