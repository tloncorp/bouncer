#!/usr/bin/env sh

SHIP="${1:-zod}"
URBIT_PATH=~/dev/urbit/urbit
REPO_PATH=~/dev/urbit/homestead
SHIP_PATH=~/dev/urbit/ships

rsync -avqL --delete $URBIT_PATH/pkg/base-dev/* $SHIP_PATH/$SHIP/garden/ && \
rsync -avqL $URBIT_PATH/pkg/garden/* $SHIP_PATH/$SHIP/garden/ && \
rsync -avqL --delete $URBIT_PATH/pkg/base-dev/* $SHIP_PATH/$SHIP/groups/ && \
rsync -avqL $URBIT_PATH/pkg/garden-dev/* $SHIP_PATH/$SHIP/groups/ && \
rsync -avqL $REPO_PATH/desk/* $SHIP_PATH/$SHIP/groups/ && \
rsync -avqL $REPO_PATH/landscape-dev/* $SHIP_PATH/$SHIP/groups/
