#!/bin/bash -e

SHORT_CYCLE_LENGHT=5 # in minutes
NUMBER_OF_SHORT_BREAKS=4 # The nuber of short breaks until a long break
LONG_BREAK_DURATION=5 # in minutes

tomato () {
    echo -e "\U1F345"
}

short_cycle_message () {
    possible_messages=(
    "Short break!"
    "Stand up!"
    "Watch your posture!"
    )
    number_of_possible_messages=3
    echo ${possible_messages[$((RANDOM % number_of_possible_messages))]}
}

long_cycle_message () {
    possible_messages=(
    "LOOOONG BREAK!"
    "Long break. Stand up, take a coffee, look at the window then come back to work."
    "Long break. Please stop working."
    )
    number_of_possible_messages=3
    echo ${possible_messages[$((RANDOM % number_of_possible_messages))]}
}

end_of_rest_message () {
    possible_messages=(
    "Ending of rest period, get back to work."
    "Your rest period just finished, get back here."
    )
    number_of_possible_messages=2
    echo ${possible_messages[$((RANDOM % number_of_possible_messages))]}
}

message_notification () {
    notify-send "$(tomato) ${1}"
    say "${1}"
    echo "$(date) [${2}]: \"${1}\""
}

short_cycle () {
    sleep ${SHORT_CYCLE_LENGHT}
    log_message="$(message_notification "$(short_cycle_message)" "SHORT CYCLE")"
    echo ${log_message}
}

last_short_cycle () {
    sleep ${SHORT_CYCLE_LENGHT}
    log_message="$(message_notification "$(long_cycle_message)" "LONG CYCLE")"
    echo ${log_message}
}

rest_cycle () {
    sleep ${LONG_BREAK_DURATION}
    log_message="$(message_notification "$(end_of_rest_message)" "REST")"
    echo ${log_message}
}

pomodoro_cycle () {
notify-send "Starting cycles. You will see a notification like this."
while true
do
    for i in $( seq 1 $((${NUMBER_OF_SHORT_BREAKS}-1)) )
    do
        echo "$(short_cycle)"
    done
    echo "$(last_short_cycle)"
    echo "$(rest_cycle)"
done
}

case ${1} in 
    start)
        echo "$(pomodoro_cycle)" &
        echo $!>$HOME/.pomodoropid
        echo "$(tomato) Pomodoro started!"
        ;;
    stop)
        kill "$(cat $HOME/.pomodoropid)"
        rm $HOME/.pomodoropid
        echo "$(tomato) Pomodoro stoped!"
        ;;
    *)
        echo "None of the above."
    ;;

esac
