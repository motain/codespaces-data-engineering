umask 0022

if [[ $- == *i* ]]
then
    exec fish -i
fi
