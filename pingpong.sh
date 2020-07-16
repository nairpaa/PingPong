#! /bin/bash

ip_list=$1

# check file
if [ -e $ip_list ] && [ ! -z $1 ]
then
    
    # check empty file
    if [ -s $ip_list ]
    then
        
        # looping for get ip target
        for ip in `cat $ip_list`
        do
            # ping to target
            ping -c1 $ip &> /dev/null
            
            # check connection live or dead
            if [ $? -eq 0 ]
            then
                echo "$ip is Live"
            else
                echo "$ip is Dead"
            fi
        done
        
    else
        echo "File $ip_list is empty."
    fi
    
else
    
    # check whether using arguments?
    if [ -z $1 ]
    then
        echo -e "Argument not found.\n"
        
        echo "Usage:"
        echo "./pingpong.sh ip-list.txt"
    else
        echo "File $ip_list not found."
    fi
    
fi
