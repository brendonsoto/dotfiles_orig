# How to Create a Bootable USB

:how-to:

1. Insert USB stick to computer
2. Run `lsblk` to check it's there\*
   (Mac: `diskutil list`)
3. Run `sudo dd bs=4M if=/path/to/iso of=/dev/sdb1 conv=fdatasync status=progress`
   (Mac: `sudo dd bs=4m if=/path/to/iso of=/dev/sdb1 conv=sync`)

- The output may look like:

```
sda  ...some info...
 |- sda1 ...
 |- sda2 ...
sdb ...
 |- sdb1 ...
```

It's normal for the flash drive to have a greater memory than what it's children may make you think.
