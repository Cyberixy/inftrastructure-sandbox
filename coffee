#!/bin/bash

function exec_dc() {
    cmd=$1
    for dir in ./*/     
    do
        dir=${dir%*/}   
        module_name=${dir##*/}
        cd ./$module_name
        echo "===================== $module_name ====================="
        docker-compose $cmd
        cd ..
    done
}

function help(){
    echo "TBD"
}

function services(){
    for dir in ./*/     
    do
        dir=${dir%*/}   
        module_name=${dir##*/}
        echo $module_name
    done
}

case $1 in

  up)
    exec_dc "up -d"
    ;;

  down)
    exec_dc "down"
    ;;

  ps)
    exec_dc "ps"
    ;;

  logs)
    exec_dc "logs"
    ;;
  
  services)
    services
    ;;

  *)
    echo "Command $cmd not suported."
    help
    ;;
esac