#!/bin/bash

out="goodbye"

echo $$ > .handler_pid

russian() {
        echo "здравствуйте!"
        out="до свидания!"
}

english() {
        echo "Hello!"
        out="Goodbye!" 
}

chinese() {
        echo "你好"
        out="再见"
}

polish() {
        echo "Cześć!"
        out="do widzenia!"
}

term() {
        echo "$out"
        kill $(cat .generator_pid)
        exit 0
}

trap 'russian' SIGUSR1
trap 'english' SIGUSR2
trap 'chinese' SIGRTMIN+1
trap 'polish' SIGRTMIN+2
trap  'term' SIGTERM

while true
do
        sleep 1
done

