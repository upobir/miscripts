#!/bin/bash


if [ "$0" != "$BASH_SOURCE" ]; then
  if [ "$1" == "-c" ]; then

    export suppress_todochecker_duration=0
    echo "continuing todo check"

  elif [ "$1" == "-s" ]; then

    export suppress_todochecker_timestamp=$(date +%s)
    export suppress_todochecker_duration=${2:-30}
    echo "suppresing todo check for ${suppress_todochecker_duration} seconds"

  else

    echo "use one of following two flags when sourcing"
    echo
    echo "    -s [seconds] to suppress todochecker (default: 30 seconds)" 
    echo "    -c           to clear todochecker suppression"
    echo

  fi

  return 0

else
  if [[ "$1" == "-s" || "$1" == "-c" ]]; then
    echo "to use suppression or clear flags, you will need to source the script"
    exit 0
  fi

  current_timestamp=$(date +%s)
  time_difference=$(($current_timestamp - ${suppress_todochecker_timestamp:-0}))

  if [[ "$time_difference" -lt "$suppress_todochecker_duration" ]]; then
    echo
    echo Suppresing TODO Check !!!
    echo
    exit 0
  fi

  pattern="todo"
  if [ -n "$1" ]; then
    pattern="todo *\( *$1 *\)"
  fi

  grep -irnE --color=auto "$pattern" ./

  if [[ $? -eq 0 ]]; then
      exit 1
  else
      exit 0
  fi

fi
