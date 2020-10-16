<p align="center">
    <img src="https://jessarcher.github.io/zsh-vapor/logo.svg?1" alt="zsh-vapor - Enhanced Laravel integration for zsh" width="400">
</p>

This plugin adds an `vapor` shell command with the following features:

* It will find and execute `vapor` from anywhere within the project file tree
  (and you don't need to prefix it with `php` or `./`)
* It provides auto-completion for `vapor` commands (that also work anywhere
  within the project).

<p align="center">
    <img src="https://jessarcher.github.io/zsh-vapor/demo.svg?1">
</p>

## Requirements

* [zsh](https://www.zsh.org/)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* A [Laravel](https://laravel.com/) project
* vapor-cli package installed with composer in the project

## Installation

### [Antigen](https://github.com/zsh-users/antigen)

Add the following bundle to your `.zshrc`:

```zsh
antigen bundle notf0und/zsh-vapor
```

### Oh-my-zsh

First download the plugin to your oh-my-zsh custom plugin location:

```zsh
git clone https://github.com/notf0und/zsh-vapor.git ~/.oh-my-zsh/custom/plugins/vapor
```

> Note that the repository name is prefixed with `zsh-`, however the plugin
> directory name should just be "vapor".

Then enable the plugin in your `.zshrc` file. For example:

```zsh
plugins=(
    vapor
    composer
    git
)
```

## Usage

Simply use the command `vapor` from anywhere within the directory structure of
a Laravel project and it will search up the tree for the `vapor` command and
execute it. E.g:

```zshrc
$ pwd
~/MyProject/tests/Feature

$ vapor --version 
Laravel Vapor 1.9.0
```

Tab-completion will work anywhere that `vapor` can be found, and the available
commands are retrieved on-demand. This means that you will see any vapor
commands that are available to you.

The plugin does not create any aliases for you, but the author would like to
offer some suggestions:

## License

This project is open-sourced software licensed under the MIT License - see the
[LICENSE](LICENSE) file for details

## Acknowledgements

* [jessarcher/zsh-artisan](https://github.com/jessarcher/zsh-artisan)
  this is a copy of that repo with small changes to fit vapor instead of artisan
