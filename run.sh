#!/bin/bash
#================================================================
# Command-line Assistant - run.sh
# - Executes various R scripts
#================================================================


echo =============================================================
echo Hi $USER@$HOSTNAME. 
echo What do you want to do?
echo -------------------------------------------------------------
echo 01: Docker: Build
echo 02: Docker: Run Container
echo 03: Docker: Stop Container 
echo 04: Docker: STDIN attach
echo 05: Shell
echo 06: Docker: View Logs
echo 07: Docker: Compose 
echo ----------------------------------------------
echo qq: Exit [Quit]
echo Enter [Selection] to continue
echo =============================================================
# Command line selection
if [ -n "$1" ]; then
  SELECTION=$1
else
  read  -n 2 SELECTION
fi
if [ -n "$2" ]; then
  PARAM2=$2
else
  read  -n  PARAM2
fi
echo Your selection is : $SELECTION.
echo Your parameter is : $PARAM2.

IMAGE=mypy
CONTAINER=mypyc1

case "$SELECTION" in
# Note variable is quoted.

  "01" )
  echo ===========================================================
  echo Docker Build
  echo ===========================================================
  docker build -t $IMAGE .
  ;;


  "02" )
  echo ===========================================================
  echo Docker Run
  echo ===========================================================
  docker run --name $CONTAINER -p 80:80 -d $IMAGE
  ;;


  "03" )
  echo ===========================================================
  echo Docker Stop
  echo ===========================================================
  docker container stop $CONTAINER
  ;;


  "04" )
  echo ===========================================================
  echo Docker STDIN attach
  echo ===========================================================
  docker run attach
  #docker $CONTAINER attach
  ;;


  "05" )
  echo ===========================================================
  echo Docker Shell
  echo ===========================================================
  docker run attach
  #docker -ti $IMAGE --name $CONTAINER  /bin/bash
  ;;

  "06" )
  echo ===========================================================
  echo Docker Logs
  echo ===========================================================
  docker logs $CONTAINER
  ;;

  "07" )
  echo ===========================================================
  echo Docker Compose
  echo ===========================================================
  docker-compose -f dev.yml up -d
  ;;

  "qq" )
  echo Quit
  exit 0
  ;;

   * )
   # Default option.
   # Empty input (hitting RETURN) fits here, too.
   echo
   echo "Not a recognized option."
  ;;

esac


