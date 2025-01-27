***Swap-Increase***
--Step 01
[root@practise sysadmin]# lsblk
/*
NAME        MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
sda           8:0    0  30G  0 disk
├─sda1        8:1    0   1G  0 part /boot
└─sda2        8:2    0  29G  0 part
  ├─cs-root 253:0    0  27G  0 lvm  /
  └─cs-swap 253:1    0   2G  0 lvm  [SWAP]
sdb           8:16   0   2G  0 disk
*/
--Step 02
[root@practise sysadmin]# free -h
/*
               total        used        free      shared  buff/cache   available
Mem:           1.7Gi       936Mi       504Mi        13Mi       467Mi       804Mi
Swap:          2.0Gi          0B       2.0Gi
*/
--Step 03
[root@practise sysadmin]# fdisk -l /dev/sda
/*
Disk /dev/sda: 30 GiB, 32212254720 bytes, 62914560 sectors
Disk model: VMware Virtual S
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x64c16d3b

Device     Boot   Start      End  Sectors Size Id Type
/dev/sda1  *       2048  2099199  2097152   1G 83 Linux
/dev/sda2       2099200 62914559 60815360  29G 8e Linux LVM
*/
--Step 04
[root@practise sysadmin]# fdisk /dev/sdb
/*
Welcome to fdisk (util-linux 2.37.4).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x254e465a.

--Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
--Select (default p):

Using default response p.
--Partition number (1-4, default 1):
--First sector (2048-4194303, default 2048):
--Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-4194303, default 4194303):

Created a new partition 1 of type 'Linux' and of size 2 GiB.

--Command (m for help): t

Selected partition 1
--Hex code or alias (type L to list all): L

00 Empty            24 NEC DOS          81 Minix / old Lin  bf Solaris
01 FAT12            27 Hidden NTFS Win  82 Linux swap / So  c1 DRDOS/sec (FAT-
02 XENIX root       39 Plan 9           83 Linux            c4 DRDOS/sec (FAT-
03 XENIX usr        3c PartitionMagic   84 OS/2 hidden or   c6 DRDOS/sec (FAT-
04 FAT16 <32M       40 Venix 80286      85 Linux extended   c7 Syrinx
05 Extended         41 PPC PReP Boot    86 NTFS volume set  da Non-FS data
06 FAT16            42 SFS              87 NTFS volume set  db CP/M / CTOS / .
07 HPFS/NTFS/exFAT  4d QNX4.x           88 Linux plaintext  de Dell Utility
08 AIX              4e QNX4.x 2nd part  8e Linux LVM        df BootIt
09 AIX bootable     4f QNX4.x 3rd part  93 Amoeba           e1 DOS access
0a OS/2 Boot Manag  50 OnTrack DM       94 Amoeba BBT       e3 DOS R/O
0b W95 FAT32        51 OnTrack DM6 Aux  9f BSD/OS           e4 SpeedStor
0c W95 FAT32 (LBA)  52 CP/M             a0 IBM Thinkpad hi  ea Linux extended
0e W95 FAT16 (LBA)  53 OnTrack DM6 Aux  a5 FreeBSD          eb BeOS fs
0f W95 Ext'd (LBA)  54 OnTrackDM6       a6 OpenBSD          ee GPT
10 OPUS             55 EZ-Drive         a7 NeXTSTEP         ef EFI (FAT-12/16/
11 Hidden FAT12     56 Golden Bow       a8 Darwin UFS       f0 Linux/PA-RISC b
12 Compaq diagnost  5c Priam Edisk      a9 NetBSD           f1 SpeedStor
14 Hidden FAT16 <3  61 SpeedStor        ab Darwin boot      f4 SpeedStor
16 Hidden FAT16     63 GNU HURD or Sys  af HFS / HFS+       f2 DOS secondary
17 Hidden HPFS/NTF  64 Novell Netware   b7 BSDI fs          fb VMware VMFS
18 AST SmartSleep   65 Novell Netware   b8 BSDI swap        fc VMware VMKCORE
1b Hidden W95 FAT3  70 DiskSecure Mult  bb Boot Wizard hid  fd Linux raid auto
1c Hidden W95 FAT3  75 PC/IX            bc Acronis FAT32 L  fe LANstep
1e Hidden W95 FAT1  80 Old Minix        be Solaris boot     ff BBT

Aliases:
   linux          - 83
   swap           - 82
   extended       - 05
   uefi           - EF
   raid           - FD
   lvm            - 8E
   linuxex        - 85
--Hex code or alias (type L to list all): 82
Changed type of partition 'Linux' to 'Linux swap / Solaris'.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
*/
--Step 05
[root@practise sysadmin]# lsblk
/*
NAME        MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
sda           8:0    0  30G  0 disk
├─sda1        8:1    0   1G  0 part /boot
└─sda2        8:2    0  29G  0 part
  ├─cs-root 253:0    0  27G  0 lvm  /
  └─cs-swap 253:1    0   2G  0 lvm  [SWAP]
sdb           8:16   0   2G  0 disk
└─sdb1        8:17   0   2G  0 part
*/
--Step 06
[root@practise sysadmin]# mkswap /dev/sdb1
/*
Setting up swapspace version 1, size = 2 GiB (2146430976 bytes)
no label, UUID=43d4ae13-8c6c-4823-baef-2cf780822c9c
*/
--Step 07
[root@practise sysadmin]# blkid /dev/sdb1
/*
/dev/sdb1: UUID="43d4ae13-8c6c-4823-baef-2cf780822c9c" TYPE="swap" PARTUUID="254e465a-01"
*/
--Step 07
[root@practise sysadmin]# swapon /dev/sdb1
--Step 08
[root@practise sysadmin]# lsblk
/*
NAME        MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
sda           8:0    0  30G  0 disk
├─sda1        8:1    0   1G  0 part /boot
└─sda2        8:2    0  29G  0 part
  ├─cs-root 253:0    0  27G  0 lvm  /
  └─cs-swap 253:1    0   2G  0 lvm  [SWAP]
sdb           8:16   0   2G  0 disk
└─sdb1        8:17   0   2G  0 part [SWAP]
*/
--Step 09
[root@practise sysadmin]# free -h
/*
               total        used        free      shared  buff/cache   available
Mem:           1.7Gi       936Mi       504Mi        13Mi       467Mi       804Mi
Swap:          4.0Gi          0B       4.0Gi
*/
--Step 10
[root@practise sysadmin]# mount -a
--Step 11
[root@practise sysadmin]# cat /etc/fstab | grep -E /dev/sdb1
/*
/dev/sdb1       none    swap    defaults        0 0
*/
