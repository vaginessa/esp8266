#!/bin/bash

################################################
### Flashes the nodemcu firmware on the esp ###
###############################################

# include the env vars
. ./envVars.sh

########################################
### Downloads the current firmeware ###
#######################################
function downloadFirmWare() {
  FMW_DEST_FILE=$DATA_DIR"/firmware.bin"
  if [ -f $FMW_DEST_FILE ]
  then
    echo "Found $FMW_DEST_FILE deleting it"
    rm $FMW_DEST_FILE
  fi
  cp "v0.9.5.2 AT Firmware.bin" $FMW_DEST_FILE
}

##########################################
### Flashes the ESP wit the firmeware ###
#########################################
function flashESP() {
  cd $ESP_TOOL_DIR
  sudo python esptool.py --port $ESP_PORT  write_flash 0x00000 ../firmware.bin
  cd $BASE_DIR
}

downloadFirmWare
getOrUpdateEspTool
flashESP
