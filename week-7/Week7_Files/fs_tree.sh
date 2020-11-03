#!/bin/bash
# Implementasi oleh : Christopher Samuel
current_dir=$( pwd )
echo "Initial Directory = $current_dir"
dir_count=0
 
function tree_dir {
    next_dir=$1
    cd $next_dir
    subdirs=$( ls -l | grep ^d )

    if [ -z "$subdirs" ]
    then
        cd ..
        return 0
    fi

    local depth=$2

    while read dir;
        do
            local loop_count=0;
            indentation="";
            while [ $loop_count -le $((depth - 1)) ];
                do
                    indentation="$indentation>>> ";
                    loop_count=$((loop_count + 1));
                done
            dir_arr=($dir);
            dirName=${dir_arr[8]};
            if [ -n $dirName ]
            then
                dir_count=$((dir_count + 1));
                echo $indentation$dirName;
                newDepth=$((depth + 1))
                tree_dir $dirName $newDepth
            fi

        done <<< $subdirs

    cd ..
    return 0
}

tree_dir . 0
echo "Total directories = $dir_count"
