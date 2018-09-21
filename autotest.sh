#!/bin/sh
declare -A paramMap=()

files=$(find . -name "run_*.sh")
module_info=("name" "init_func")

function load_module()
{
    if [ $# -lt 1 ];then
        echo "load_module $* failed!!"
    fi
    local cmd=$1
	echo "load "${cmd}
	source ${cmd}
	
	filename=$(basename ${cmd})
	
	funname=${filename%.*}"_init"

	info=$(eval "${funname}")
	handle=($info)
	
	if [ ${#handle[@]} -ne ${#module_info[@]} ];then
		echo "error $cmd ----> $info"	
	fi
	
	paramMap[${handle[0]}]=${handle[1]}
	
}

for file in $files
do
	load_module $file
done


ags=""
cmd=""


function call()
{
	if [ ! -z $cmd ];then
		eval '$cmd $ags'
	fi
}

function is_key()
{
       for key in ${!paramMap[@]};do
	if [ "$1" == "$key" ];then
		return 0		
        fi
       done
	return 1	
}


until [ -z "$1" ];
do
	if is_key "$1";then
		call
		cmd=${paramMap["$1"]}
			
		ags=""
		
	else
		ags="$ags $1"
	fi
	
	shift
done

call


