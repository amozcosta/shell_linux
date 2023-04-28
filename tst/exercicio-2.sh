#!/bin/env bash

telefones='../Arqs/telefones'

#echo "Exercicio 1"
cut -d' ' -f2 $telefones

echo "Exercicio 2"
cut -d"(" -f2 $telefones | grep $1)