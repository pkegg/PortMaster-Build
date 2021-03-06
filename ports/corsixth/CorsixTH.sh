#!/bin/bash

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt

get_controls

GAMEDIR=/$directory/ports/CorsixTH

if   [[ $ANALOGSTICKS == '1' ]]; then
  GPTOKEYB_CONFIG="corsixth.gptk.leftanalog"
else
  GPTOKEYB_CONFIG="corsixth.gptk.rightanalog"
fi

cd /$directory/ports/CorsixTH

$ESUDO chmod 666 /dev/uinput
$GPTOKEYB "corsix-th" -c "./$GPTOKEYB_CONFIG" &
LD_LIBRARY_PATH="$PWD/libs" SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig" ./corsix-th --interpreter="$PWD/CorsixTH.lua" 2>&1 | tee ./log.txt
$ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events &
printf "\033c" >> /dev/tty1