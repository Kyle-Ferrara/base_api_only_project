#!/bin/bash -e

DEFAULT_STAGE=development
DEFAULT_PORT=5000

read -r -p "Stage start [development]: [$DEFAULT_STAGE] " ARG_STAGE
ARG_STAGE=${ARG_STAGE:-$DEFAULT_STAGE}

read -r -p "Port to start on: [$DEFAULT_PORT] " ARG_PORT
ARG_PORT=${ARG_PORT:-$DEFAULT_PORT}

RAILS_DB_POOL=8 RAILS_ENV=$ARG_STAGE rails s -p $ARG_PORT -e $ARG_STAGE
