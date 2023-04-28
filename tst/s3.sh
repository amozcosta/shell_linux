#!/bin/env bash

hora=54321:012345

if [[ $hora =~ ^([01][0-9]|2[0-3]):[0-5][0-9]$ ]]; then
    echo "Horário OK"
else
    echo "O horário informado esta incorreto"
fi

echo ${BASH_REMATCH[0]}