#!/bin/sh

eval "xvfb-run --server-args=\"-screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} -ac\" robot ${ROBOT_OPTIONS} ${ROBOT_PATH}"
