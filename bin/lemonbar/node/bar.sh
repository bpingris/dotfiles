#!/bin/bash


clock() {
    DATE=$(date "+%a %b %d, %T")
    echo "$DATE"
}



while true; do
    echo "%{l}%{F#ffffff}%{B#000000} $(Memory_Used)%{F-} %{c}%{F#113654}%{B#898E92} $(clock)%{F-} %{r} $(Music)"
    sleep 1;
done
