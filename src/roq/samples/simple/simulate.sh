#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

if [ "$1" == "debug" ]; then
  PREFIX="libtool --mode=execute gdb --args"
  shift 1
else
  PREFIX=
fi

NAME="simple"

HISTORY="$CONDA_PREFIX/share/roq/data/USTP_Multi_20180223.csv"

EXCHANGE="CFFEX"
ACCOUNTS="A1"
SYMBOLS="IC1803"

$PREFIX "$DIR/roq-samples-simple" \
	--name "$NAME" \
	--exchange "$EXCHANGE" \
	--accounts "$ACCOUNTS" \
	--symbols "$SYMBOLS" \
	--create-orders 1 \
	--simulation \
	--generator-type "csv-old" \
	--market-data-latency 10 \
	--order-manager-latency 100 \
	"$HISTORY" \
	$@
