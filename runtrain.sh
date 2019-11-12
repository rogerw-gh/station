#!/bin/bash
# runtrain.sh
# go home, then to station code
cd /home/pi
cd station/luma.examples/examples
sudo python3 sys_info_boot.py  --display=ssd1322 --height 64 --width 256 --interface spi
cd /home/pi
cd station/train-departure-screen
pwd
sudo python3 src/main.py  --display=ssd1322 --height 64 --width 256 --interface spi
