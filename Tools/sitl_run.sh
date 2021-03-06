#!/bin/bash
cp Tools/posix_lldbinit build_posix_sitl_simple/src/firmware/posix/.lldbinit
cp Tools/posix.gdbinit build_posix_sitl_simple/src/firmware/posix/.gdbinit
cd build_posix_sitl_simple/src/firmware/posix
mkdir -p rootfs/fs/microsd
mkdir -p rootfs/eeprom
touch rootfs/eeprom/parameters
if [ "$2" == "lldb" ]
then
	lldb -- mainapp ../../../../$1
elif [ "$2" == "gdb" ]
then
	gdb --args mainapp ../../../../$1
else
	./mainapp ../../../../$1
fi
