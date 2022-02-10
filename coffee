#!/bin/bash

function exec_dc() {
    cmd=$1
    while IFS= read -r line
    do
        dir=${line%*/}
        module_name=${dir##*/}
        cd ./$module_name
        echo "===================== $module_name ====================="
        docker-compose $cmd
        cd ..
    done < "services.txt"
}

function help(){
    echo "TBD"
}

function services(){
    while IFS= read -r line
    do
        dir=${line%*/}
        module_name=${dir##*/}
        echo $module_name
    done < "services.txt"
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