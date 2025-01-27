--Step 01
[root@server01 sysadmin]# lsblk
/*NAME                                                                                        MAJ:MIN RM  SIZE RO TYPE    MOUNTPOINTS
sda                                                                                           8:0    0   30G  0 disk
├─sda1                                                                                        8:1    0    1G  0 part    /boot
└─sda2                                                                                        8:2    0   29G  0 part
  ├─cs-root                                                                                 253:0    0   27G  0 lvm     /
  └─cs-swap                                                                                 253:1    0    2G  0 lvm     [SWAP]
sdb                                                                                           8:16   0    5G  0 disk
└─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-physical-originsub                     253:2    0    5G  0 stratis
  ├─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-mdv                             253:3    0  512M  0 stratis
  ├─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-thinmeta                        253:4    0    5M  0 stratis
  │ └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-thinpool-pool                      253:6    0  4.5G  0 stratis
  │   └─stratis-1-7e2a15bbfef6476a8109ed1fd67c25d7-thin-fs-9c8e64490a494ac7867949eb61704d15 253:7    0    1T  0 stratis /mystratis-data
  └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-thindata                        253:5    0  4.5G  0 stratis
    └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-thinpool-pool                      253:6    0  4.5G  0 stratis
      └─stratis-1-7e2a15bbfef6476a8109ed1fd67c25d7-thin-fs-9c8e64490a494ac7867949eb61704d15 253:7    0    1T  0 stratis /mystratis-data
sdc                                                                                           8:32   0    5G  0 disk
*/
--Step 02
[root@server01 sysadmin]# pvcreate /dev/sdc
/*
Physical volume "/dev/sdc" successfully created.
*/
--Step 03
[root@server01 sysadmin]# vgcreate testVG /dev/sdc
/*
Volume group "testVG" successfully created
*/
--Step 04
[root@server01 sysadmin]# vgdisplay testVG
/*
  --- Volume group ---
  VG Name               testVG
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               <5.00 GiB
  PE Size               4.00 MiB
  Total PE              1279
  Alloc PE / Size       0 / 0
  Free  PE / Size       1279 / <5.00 GiB
  VG UUID               EgF4ll-sLJi-8mdK-i1t1-0Kc4-mKiB-iVWT1q
*/
--Step 05
[root@server01 sysadmin]# lvcreate -L 4G -n testLV testVG
/*
  Logical volume "testLV" created.
*/
--Step 06
[root@server01 sysadmin]# mkfs -t xfs /dev/testVG/testLV
/*
meta-data=/dev/testVG/testLV     isize=512    agcount=4, agsize=262144 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=0
         =                       reflink=1    bigtime=1 inobtcount=1 nrext64=0
data     =                       bsize=4096   blocks=1048576, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
log      =internal log           bsize=4096   blocks=16384, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
*/
--Step 07
[root@server01 sysadmin]# mkdir -p /LVM-DIR
--Step 08
[root@server01 sysadmin]# blkid /dev/testVG/testLV
/*
/dev/testVG/testLV: UUID="a591acd5-640c-40cc-8b9b-9126afe41583" TYPE="xfs"
*/
--Step 09
[root@server01 sysadmin]# mount /dev/testVG/testLV /LVM-DIR
--Step 10
[root@server01 sysadmin]# mount -a
--Step 11
[root@server01 sysadmin]# lsblk
/*
NAME                                                                                        MAJ:MIN RM  SIZE RO TYPE    MOUNTPOINTS
sda                                                                                           8:0    0   30G  0 disk
├─sda1                                                                                        8:1    0    1G  0 part    /boot
└─sda2                                                                                        8:2    0   29G  0 part
  ├─cs-root                                                                                 253:0    0   27G  0 lvm     /
  └─cs-swap                                                                                 253:1    0    2G  0 lvm     [SWAP]
sdb                                                                                           8:16   0    5G  0 disk
└─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-physical-originsub                     253:2    0    5G  0 stratis
  ├─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-mdv                             253:3    0  512M  0 stratis
  ├─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-thinmeta                        253:4    0    5M  0 stratis
  │ └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-thinpool-pool                      253:6    0  4.5G  0 stratis
  │   └─stratis-1-7e2a15bbfef6476a8109ed1fd67c25d7-thin-fs-9c8e64490a494ac7867949eb61704d15 253:7    0    1T  0 stratis /mystratis-data
  └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-thindata                        253:5    0  4.5G  0 stratis
    └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-thinpool-pool                      253:6    0  4.5G  0 stratis
      └─stratis-1-7e2a15bbfef6476a8109ed1fd67c25d7-thin-fs-9c8e64490a494ac7867949eb61704d15 253:7    0    1T  0 stratis /mystratis-data
sdc                                                                                           8:32   0    5G  0 disk
└─testVG-testLV                                                                             253:8    0    4G  0 lvm     /LVM-DIR
*/
--Step 12
[root@server01 sysadmin]# cat /etc/fstab | grep -E /dev/testVG/testLV
/*
/dev/testVG/testLV /LVM-DIR     xfs     defaults        0 0
*/
