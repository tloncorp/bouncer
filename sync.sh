#!/usr/bin/env sh

SHIP="${1:-zod}"
URBIT_PATH=~/dev/urbit/urbit
HOMESTEAD_PATH=~/dev/urbit/homestead
SHIP_PATH=~/dev/urbit/ships

rsync -avqL --delete $URBIT_PATH/pkg/base-dev/* $SHIP_PATH/$SHIP/garden/ && \
rsync -avqL $URBIT_PATH/pkg/garden/* $SHIP_PATH/$SHIP/garden/ && \
rsync -avqL --delete $URBIT_PATH/pkg/base-dev/* $SHIP_PATH/$SHIP/homestead/ && \
rsync -avqL $URBIT_PATH/pkg/garden-dev/* $SHIP_PATH/$SHIP/homestead/ && \
rsync -avqL $HOMESTEAD_PATH/desk/* $SHIP_PATH/$SHIP/homestead/ && \
rsync -avqL $HOMESTEAD_PATH/landscape-dev/* $SHIP_PATH/$SHIP/homestead/
