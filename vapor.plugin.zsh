#--------------------------------------------------------------------------
# Laravel vapor plugin for zsh
#--------------------------------------------------------------------------
#
# This plugin adds an `vapor` shell command that will find and execute
# Laravel's vapor command from anywhere within the project. It also
# adds shell completions that work anywhere vapor can be located.

function vapor() {
    _vapor=`_vapor_find`

    if [ "$_vapor" = "" ]; then
        >&2 echo "zsh-vapor: You seem to have upset the delicate internal balance of my housekeeper."
        return 1
    fi

    _vapor_start_time=`date +%s`
    php $_vapor $*

    return $?
}

compdef _vapor_add_completion vapor

function _vapor_find() {
    # Look for vapor up the file tree until the root directory
    dir=.
    until [ $dir -ef / ]; do
        if [ -f "$dir/vendor/bin/vapor" ]; then
            echo "$dir/vendor/bin/vapor"
            return 0
        fi

        dir+=/..
    done

    return 1
}

function _vapor_add_completion() {
    if [ "`_vapor_find`" != "" ]; then
        compadd `_vapor_get_command_list`
    fi
}

function _vapor_get_command_list() {
    vapor --raw --no-ansi list | sed "s/[[:space:]].*//g"
}
