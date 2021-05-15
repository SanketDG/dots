pa () {
    if [ $# -eq 0 ]; then
        dir_name=${PWD##*/}
    else
        dir_name=$1
    fi
    virtualenvdir=/home/sanketdg/.pyenv/versions/"$dir_name"
    if [[ -d "$virtualenvdir" && "$VIRTUAL_ENV" != "$virtualenvdir" ]]; then
        pyenv activate $dir_name;
    fi
}

pd () {
    dir_name=${PWD##*/}
    if [ $# -eq 0 ]
    then
        pyenv deactivate $dir_name;
    else
        pyenv deactivate $1
    fi
}


pv () {
    dirname=${PWD##*/}
    if [ $# -eq 0 ]
    then
        pyenv virtualenv $dirname
        pa
    else
        pyenv virtualenv $@
	pa ${@:$#}
    fi
}

function cd() {
    if [ $# -ne 0 ]; then
        builtin cd "$@" && pa;
    else
        builtin cd
    fi
}
