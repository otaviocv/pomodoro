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

## Usage
To start pomodoro simply run
``` bash
$ pomodoro start
```

To stop pomdoro
``` bash
$ pomodoro stop
```

### Detailed help
``` bash
Usage: pomdoro [COMMAND] [OPTION]... 
Start a simple work cycles service.

List of commands
  start           Start the pomodoro service.
  stop            Stop the pomdoro service.

List of options
  -n, --number-of-short-cycles
                  The number of short cycles, after this number of cycles 
                  a short break will happen. Default number of cycles is 4.
  -s, --short-cycle-length
                  The length of the short cycle, in minutes. Default short
                  cycle length is 15 minutes.
  -r, --rest-length
                  The length of the break after the short cycles, in minutes.
                  Default rest length is 5 minutes.
  -l, --loud      Enable the text-to-speech system. It will say out loud the
                  messages. 
  -f, --file      Pomodoro stores the process id in the $HOME/.pomodoroid by
                  default, if you want to store it in another file specify
                  with this flag.
  -h, --help      Show this message.
```
