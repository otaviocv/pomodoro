#!/bin/bash -e

SHORT_CYCLE_LENGHT=15 # in minutes
NUMBER_OF_SHORT_BREAKS=4 # The nuber of short breaks until a long break

notify-send "Starting cycles. You will see a notification like this."
while true
do
    for i in {1..$((${NUMBER_OF_SHORT_BREAKS}))}
    do
        sleep ${SHORT_CYCLE_LENGHT}
        message="$(short_cycle_message)"
        notify-send "${message}"
        say "${message}"
        echo "${i}"
        echo "${message}"
    done
    sleep ${SHORT_CYCLE_LENGHT}
    long_message="$(long_cycle_message)"
    notify-send "${long_message}"
    say "${long_message}"

done


short_cycle_message () {
    possible_messages=(
    "Short break!"
    "Stand up!"
    "Watch your posture!"
    )
    number_of_possible_messages=5
    echo ${possible_messages[$((RANDOM % number_of_possible_messages))]}
}


long_cycle_message () {
    possible_messages=(
    "LOOOONG BREAK!"
    "Stand up, take a coffee, look at the window then come back to work."
    "Long break. Please stop working."
    )
    number_of_possible_messages=3
    echo ${possible_messages[$((RANDOM % number_of_possible_messages))]}
}
