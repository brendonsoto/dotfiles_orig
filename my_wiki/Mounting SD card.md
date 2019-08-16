= Mounting a SD Card =
Why?
Because my Zoom R16 uses them and can't transfer files via USB.

1. Insert SD card
2. `sudo fdisk -l` << Look near the bottom for "Disk model: Card Reader"
3. Create a mounting point by running `sudo mkdir /mnt/myMntPoint`
4. `mount -t vfat /dev/sdb* /mnt/myMntPoint`

To unmount:
`umount /mnt/myMntPoint`
