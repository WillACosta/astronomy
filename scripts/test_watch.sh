#!/bin/bash
echo $'\e[1;36m' 'Watching files...'

fswatch "lib/" | xargs -I RESULT sh -c \
        "clear -x; echo ⚡️$'\e[1;33m' Changed \
        $'\e[0;36m'RESULT$'\e[0m'\
        $'\n'⚙️$'\e[1;33m' ' Running '$'\e[0;36m''flutter test'; \
        flutter test ./test"
