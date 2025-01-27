*********LV Etend***********
--Step 01
[root@server01 sysadmin]# lsblk
/*
NAME                                                                                        MAJ:MIN RM  SIZE RO TYPE    MOUNTPOINTS
sda                                                                                           8:0    0   30G  0 disk
├─sda1                                                                                        8:1    0    1G  0 part    /boot
└─sda2                                                                                        8:2    0   29G  0 part
  ├─cs-root                                                                                 253:0    0   27G  0 lvm     /
  └─cs-swap                                                                                 253:1    0    2G  0 lvm     [SWAP]
sdb                                                                                           8:16   0    5G  0 disk
└─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-physical-originsub                     253:3    0    5G  0 stratis
  ├─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-mdv                             253:4    0  512M  0 stratis
  ├─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-thinmeta                        253:5    0    5M  0 stratis
  │ └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-thinpool-pool                      253:7    0  4.5G  0 stratis
  │   └─stratis-1-7e2a15bbfef6476a8109ed1fd67c25d7-thin-fs-9c8e64490a494ac7867949eb61704d15 253:8    0    1T  0 stratis /mystratis-data
  └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-thindata                        253:6    0  4.5G  0 stratis
    └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-thinpool-pool                      253:7    0  4.5G  0 stratis
      └─stratis-1-7e2a15bbfef6476a8109ed1fd67c25d7-thin-fs-9c8e64490a494ac7867949eb61704d15 253:8    0    1T  0 stratis /mystratis-data
sdc                                                                                           8:32   0    5G  0 disk
└─testVG-testLV                                                                             253:2    0    4G  0 lvm     /LVM-DIR
sdd                                                                                           8:48   0    5G  0 disk
*/
--Step 02
[root@server01 sysadmin]# vgs
 /*
  VG     #PV #LV #SN Attr   VSize   VFree
  cs       1   2   0 wz--n- <29.00g       0
  testVG   1   1   0 wz--n-  <5.00g 1020.00m
 */
--Step 03
 [root@server01 sysadmin]# lvs
/*
  LV     VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root   cs     -wi-ao---- <26.99g
  swap   cs     -wi-ao----  <2.01g
  testLV testVG -wi-ao----   4.00g
*/
--Step 04
[root@server01 sysadmin]# pvcreate /dev/sdd
/*
  Physical volume "/dev/sdd" successfully created.
*/
--Step 05
[root@server01 sysadmin]# vgextend testVG /dev/sdd
 /*
 Volume group "testVG" successfully extended
*/
--Step 06
[root@server01 sysadmin]# vgs
/*
  VG     #PV #LV #SN Attr   VSize   VFree
  cs       1   2   0 wz--n- <29.00g    0
  testVG   2   1   0 wz--n-   9.99g 5.99g
*/
--Step 07
[root@server01 sysadmin]# lvextend -L +5G /dev/testVG/testLV
/*
  Size of logical volume testVG/testLV changed from 4.00 GiB (1024 extents) to 9.00 GiB (2304 extents).
  Logical volume testVG/testLV successfully resized.
*/
--Step 08
[root@server01 sysadmin]# blkid /dev/testVG/testLV
/*
/dev/testVG/testLV: UUID="a591acd5-640c-40cc-8b9b-9126afe41583" TYPE="xfs"
*/
--Step 09
[root@server01 sysadmin]# xfs_growfs /dev/testVG/testLV
/*
meta-data=/dev/mapper/testVG-testLV isize=512    agcount=4, agsize=262144 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=0
         =                       reflink=1    bigtime=1 inobtcount=1 nrext64=0
data     =                       bsize=4096   blocks=1048576, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
log      =internal log           bsize=4096   blocks=16384, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data blocks changed from 1048576 to 2359296
*/
--Step 10
[root@server01 sysadmin]# lsblk
/*
NAME                                                                                        MAJ:MIN RM  SIZE RO TYPE    MOUNTPOINTS
sda                                                                                           8:0    0   30G  0 disk
├─sda1                                                                                        8:1    0    1G  0 part    /boot
└─sda2                                                                                        8:2    0   29G  0 part
  ├─cs-root                                                                                 253:0    0   27G  0 lvm     /
  └─cs-swap                                                                                 253:1    0    2G  0 lvm     [SWAP]
sdb                                                                                           8:16   0    5G  0 disk
└─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-physical-originsub                     253:3    0    5G  0 stratis
  ├─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-mdv                             253:4    0  512M  0 stratis
  ├─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-thinmeta                        253:5    0    5M  0 stratis
  │ └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-thinpool-pool                      253:7    0  4.5G  0 stratis
  │   └─stratis-1-7e2a15bbfef6476a8109ed1fd67c25d7-thin-fs-9c8e64490a494ac7867949eb61704d15 253:8    0    1T  0 stratis /mystratis-data
  └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-flex-thindata                        253:6    0  4.5G  0 stratis
    └─stratis-1-private-7e2a15bbfef6476a8109ed1fd67c25d7-thinpool-pool                      253:7    0  4.5G  0 stratis
      └─stratis-1-7e2a15bbfef6476a8109ed1fd67c25d7-thin-fs-9c8e64490a494ac7867949eb61704d15 253:8    0    1T  0 stratis /mystratis-data
sdc                                                                                           8:32   0    5G  0 disk
└─testVG-testLV                                                                             253:2    0    9G  0 lvm     /LVM-DIR
sdd                                                                                           8:48   0    5G  0 disk
└─testVG-testLV                                                                             253:2    0    9G  0 lvm     /LVM-DIR
*/
