# em-karpix-env
OS environment and config files for Karpix (EM linux OS)

![logo](https://raw.githubusercontent.com/Ecotrust-Canada/em-karpix-env/master/root/karpix-logo.png)

# Control Box Docs 

## Karpix OS

The control box runs a custom linux known internally as "Karpix" after its creator. This repository contains select parts of th eroot filesystem in order to allow versioning parts of the OS. Binary files aren't included generally, and configuration files generally are.

The purpose of this linux build is to provide an environment to run the [EM Control Box System](https://github.com/Ecotrust-Canada/em-control-box).

## Rebuilding The Kernel

Download the new kernel to /usr/src from kernel.org, extract and enter.

```
cd /usr/src
wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.12.15.tar.bz2
tar -jxvf linux*
cd /usr/src/linux-3.12.15
make mrproper
```

Get the last config.
```
cp /opt/em/src/config-2.8.14-stage1 /usr/src/linux-3.12.15/.config
make oldconfig
```

Build the kernel

```
make -j4 bzImage
```

Build and install modules 
```
make -j4 modules && make modules_install
make -C /usr/src/linux-3.12.15 M=/opt/em/src clean
make -C /usr/src/linux-3.12.15 M=/opt/em/src modules
mkdir -p /lib/modules3.12.15-em/kernel/drivers/char
cp /opt/em/src/fanout.ko /lib/modules/3.12.15-em/kernel/drivers/char/
```

Build the ethernet driver
```
cd /opt/em/src/e1000e-3.0.4.1/src
make clean
make BUILD_KERNEL=3.12.15 CFLAGS_EXTRA=-DDISABLE_PCI_MSI install
depmod -a
```
	
Install the kernel
```
cp arch/x86/boot/bzImage /opt/em/images/em-3.12.15
```
