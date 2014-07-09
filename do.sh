#!/bin/sh

OPTIONS=$(getopt file: -- "$@")

if [ $? -ne 0 ]; then
  echo "getopt error"
  exit 1
fi

eval set -- $OPTIONS

while true; do
  case "$1" in
    -f|--file) FILE="$2" ; shift ;;
    --)        shift ; break ;;
    *)         echo "You must pass a file." ; exit 1 ;;
  esac
  shift
done


if [  $# -ne 0 ]; then
  eval sudo chown $USER ./Slack.app/Contents/Resources/public
  eval cp "./$1" "./Slack.app/Contents/Resources/public/slyStyle.css"
  echo "success!"
  exit 1
fi

echo "You must pass a file as a parameter."