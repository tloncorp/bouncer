#!/usr/bin/env sh

SHIP="${1:-zod}"
URBIT_PATH=~/dev/urbit/urbit
HOMESTEAD_PATH=~/dev/urbit/homestead
SHIP_PATH=~/dev/urbit/ships

rsync -avL --delete $URBIT_PATH/pkg/base-dev/* $SHIP_PATH/$SHIP/garden/ && \
rsync -avL $URBIT_PATH/pkg/garden/* $SHIP_PATH/$SHIP/garden/ && \
rsync -avL --delete $URBIT_PATH/pkg/base-dev/* $SHIP_PATH/$SHIP/homestead/ && \
rsync -avL $URBIT_PATH/pkg/garden-dev/* $SHIP_PATH/$SHIP/homestead/ && \
rsync -avL $HOMESTEAD_PATH/desk/* $SHIP_PATH/$SHIP/homestead/ && \
rsync -avL $HOMESTEAD_PATH/landscape-dev/* $SHIP_PATH/$SHIP/homestead/
