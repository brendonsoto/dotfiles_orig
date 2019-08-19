= Setting up USB =
== OSX ==
1. Make sure you have the Manjaro ISO downloaded
2. Insert USB drive to copy Manjaro onto
3. Find the drive representing the USB drive using `diskutil list`
4. Start the process using `sudo dd bs=4098 if=/path/to/iso of=/path/to/usb`
