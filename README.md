# em-karpix-env
OS environment and config files for Karpix (EM linux OS)

# Control Box Docs 

## Karpix OS

The control box runs a custom linux known internally as "Karpix" after its creator.

## Basic Administration

Boot the box using the power switch. Once the user interface appears, hold CTRL and ALT, and type F1. A password prompt will appear, use:

## The "em" command

## Developer Docs

## File Layout

/opt
/opt/em
/opt/elog
/var
/var/em
/var/em/data
/var/elog
/mnt/data
/etc/em.conf
/etc/systemd/system
/tmp/em-state.json

## Hardware Schematics

## How To Set Up A New Control Box

* Flash the BIOS.
* Apply BIOS settings.
* Image the disk.
* Attach external sensors and peripherals.
* Set the Screen Resolution.
* Apply configuration settings.

## How To Update A Control Box

Download an image. For example: em-2.2.12.bz

In the office:
* Format a USB drive to FAT32
* Copy em-x.y.z file you downloaded to the USB (in this case em-2.2.5)
* Safe eject
 
Then on the boat:
* Insert USB into box
* Open the shell (ctrl-alt-f1) and sign in
* `mkdir /tmp/usb`
* Determine the drive name of the USB.
if data drive, USB is sdc1
if no data drive, USB is probably sdb1.
You can run `fdisk -l` to see all the disk names.
 
`mount /dev/sdc1 /tmp/usb`
 
* systemctl start boot.mount
* Then, to install the new image : `em upgrade /tmp/usb/em-2.2.5`
* For the Elog you need to add the harvester username and password to em.conf like so. The username can be anything. Password must be their EVTR password. This was done because it’s pretty insecure to store NOAA’s entire password database on every box.
 
* then turn off box, pull USB, turn on box.
* Select the new image : rapidly keep pressing down arrow key until you get GRUB menu, then pick the new version; this now becomes the default image
* Navigate to the Elog and sign in using the creds you set above. Go to the settings page and enter the operator permit number, names, and vessel permit numbers. it’s good to also set the harvester’s gear presets for them. You can create a test trip for training, and delete it afterwards with the drop down at the top of the trip page.

## Adjusting the Screen Resolution

```
ln -sf /etc/X11/monitor-eonon.conf /var/em/xorg-monitor.conf
```

## How to Change IPs on a Running Box

```
ip route del default via 10.10.40.254
-or- ip route del default
ip addr del 10.10.40.87 dev eth0
ip addr add <ip address>/24 dev eth0
ip route add default via <gateway ip>/24
```


