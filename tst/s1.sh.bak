#!/bin/bash

usb () {
	lsusb
}

pci () {
	lspci
}

start () {
	usb
	pci
}
start | zenity --title "Dados do meu notebook" --text-info --width 500 --height 500
