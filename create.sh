#!/usr/bin/env sh

SHIP="${1:-zod}"
URBIT_BINARY_PATH=~/urbit/urbit
URBIT_REPO_PATH=~/dev/urbit/urbit
SHIP_PATH=~/dev/urbit/ships

rm -rf $SHIP_PATH/$SHIP/
cd $SHIP_PATH
$URBIT_BINARY_PATH -F $SHIP -B $URBIT_REPO_PATH/bin/solid.pill -c $SHIP_PATH/$SHIP
