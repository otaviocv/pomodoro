# 🍅 Pomodoro
A simples bash service to run working cycles.

## Installation
Pomodoro uses the [festival](http://manpages.ubuntu.com/manpages/trusty/man1/festival.1.html)
speech to text system, if you intend to use the loud functionality (-l) you
need to install it.
``` bash
$ sudo apt-get install festival
```
Just copy the `pomodoro` file and put in your path.
A suitable alternative is the .local folder under the home path.
``` bash
$ mkdir -p $HOME/.local/bin
$ cp pomodoro $HOME/.local/bin/
$ export PATH="$PATH:$HOME/.local/bin/"
```

You may want to add this last export to your bashrc or bash profile to make it
available in every sessio.
