#! /usr/bin/env bash
    
function check {

    # if response is NOT the answer
    if [[ $1 -ne $num_of_files ]] 
    then 
        if [[ $1 -gt $num_of_files ]]
        then 
            echo "Your guess was too hight! Please make another guess..."
        else    
            echo "Your guess was too low! Please make another guess..."
        fi

    # if response IS the answer
    else
        echo "Congratulations, Your answer is right!"
    fi

}

# Find all files in current directory excluding those containing only dots ("." , ".." etc...)
# and count them (wc -l)
num_of_files=$(ls -a | egrep -v "^\.+$" | wc -l)

# loop until responce is correct
while [[ $response != $num_of_files ]]
do
    echo "How many files are in the current directory?"
    read response

    #if response is a valid number (positive integer)
    if [[ $response =~ ^[0-9]+$ ]] 
    then 
        check $response #call check function and pass repsonse as argument ($1)
    else     
        echo "not a correct number, please try again..." 
    fi
    
done