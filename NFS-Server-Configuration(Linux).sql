***Server Configuration***
--Step
[root@server01 sysadmin]# yum install -y nfs-utils
/*
Last metadata expiration check: 1:09:57 ago on Mon 27 Jan 2025 09:13:34 AM +0545.
Dependencies resolved.
========================================================================================================================================================================================
 Package                                         Architecture                            Version                                          Repository                               Size
========================================================================================================================================================================================
Installing:
 nfs-utils                                       x86_64                                  1:2.5.4-29.el9                                   baseos                                  461 k
Installing dependencies:
 gssproxy                                        x86_64                                  0.8.4-7.el9                                      baseos                                  110 k
 keyutils                                        x86_64                                  1.6.3-1.el9                                      baseos                                   74 k
 libev                                           x86_64                                  4.33-6.el9                                       baseos                                   52 k
 libverto-libev                                  x86_64                                  0.3.2-3.el9                                      baseos                                   14 k
 rpcbind                                         x86_64                                  1.2.6-7.el9                                      baseos                                   58 k

Transaction Summary
========================================================================================================================================================================================
Install  6 Packages

Total download size: 769 k
Installed size: 1.8 M
Downloading Packages:
(1/6): keyutils-1.6.3-1.el9.x86_64.rpm                                                                                                                   19 kB/s |  74 kB     00:03
(2/6): gssproxy-0.8.4-7.el9.x86_64.rpm                                                                                                                   22 kB/s | 110 kB     00:05
(3/6): libev-4.33-6.el9.x86_64.rpm                                                                                                                       10 kB/s |  52 kB     00:05
(4/6): libverto-libev-0.3.2-3.el9.x86_64.rpm                                                                                                            3.7 kB/s |  14 kB     00:03
(5/6): rpcbind-1.2.6-7.el9.x86_64.rpm                                                                                                                    14 kB/s |  58 kB     00:04
(6/6): nfs-utils-2.5.4-29.el9.x86_64.rpm                                                                                                                 33 kB/s | 461 kB     00:13
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                    37 kB/s | 769 kB     00:20
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                1/1
  Running scriptlet: rpcbind-1.2.6-7.el9.x86_64                                                                                                                                     1/6
  Installing       : rpcbind-1.2.6-7.el9.x86_64                                                                                                                                     1/6
  Running scriptlet: rpcbind-1.2.6-7.el9.x86_64                                                                                                                                     1/6
Created symlink /etc/systemd/system/multi-user.target.wants/rpcbind.service → /usr/lib/systemd/system/rpcbind.service.
Created symlink /etc/systemd/system/sockets.target.wants/rpcbind.socket → /usr/lib/systemd/system/rpcbind.socket.

  Installing       : libev-4.33-6.el9.x86_64                                                                                                                                        2/6
  Installing       : libverto-libev-0.3.2-3.el9.x86_64                                                                                                                              3/6
  Installing       : gssproxy-0.8.4-7.el9.x86_64                                                                                                                                    4/6
  Running scriptlet: gssproxy-0.8.4-7.el9.x86_64                                                                                                                                    4/6
  Installing       : keyutils-1.6.3-1.el9.x86_64                                                                                                                                    5/6
  Running scriptlet: nfs-utils-1:2.5.4-29.el9.x86_64                                                                                                                                6/6
  Installing       : nfs-utils-1:2.5.4-29.el9.x86_64                                                                                                                                6/6
  Running scriptlet: nfs-utils-1:2.5.4-29.el9.x86_64                                                                                                                                6/6
  Verifying        : gssproxy-0.8.4-7.el9.x86_64                                                                                                                                    1/6
  Verifying        : keyutils-1.6.3-1.el9.x86_64                                                                                                                                    2/6
  Verifying        : libev-4.33-6.el9.x86_64                                                                                                                                        3/6
  Verifying        : libverto-libev-0.3.2-3.el9.x86_64                                                                                                                              4/6
  Verifying        : nfs-utils-1:2.5.4-29.el9.x86_64                                                                                                                                5/6
  Verifying        : rpcbind-1.2.6-7.el9.x86_64                                                                                                                                     6/6

Installed:
  gssproxy-0.8.4-7.el9.x86_64  keyutils-1.6.3-1.el9.x86_64  libev-4.33-6.el9.x86_64  libverto-libev-0.3.2-3.el9.x86_64  nfs-utils-1:2.5.4-29.el9.x86_64  rpcbind-1.2.6-7.el9.x86_64

Complete!
*/
--Step 02
[root@server01 sysadmin]# yum info nfs-utils
/*
Last metadata expiration check: 1:11:57 ago on Mon 27 Jan 2025 09:13:34 AM +0545.
Installed Packages
Name         : nfs-utils
Epoch        : 1
Version      : 2.5.4
Release      : 29.el9
Architecture : x86_64
Size         : 1.2 M
Source       : nfs-utils-2.5.4-29.el9.src.rpm
Repository   : @System
From repo    : baseos
Summary      : NFS utilities and supporting clients and daemons for the kernel NFS server
URL          : http://linux-nfs.org/
License      : MIT and GPLv2 and GPLv2+ and BSD
Description  : The nfs-utils package provides a daemon for the kernel NFS server and
             : related tools, which provides a much higher level of performance than the
             : traditional Linux NFS server used by most users.
             :
             : This package also contains the showmount program.  Showmount queries the
             : mount daemon on a remote host for information about the NFS (Network File
             : System) server on the remote host.  For example, showmount can display the
             : clients which are mounted on that host.
             :
             : This package also contains the mount.nfs and umount.nfs program.
*/
--Step 02
[root@server01 sysadmin]# firewall-cmd --permanent --add-service={mountd,rpc-bind,nfs}
/*
success
*/
--Step 03
[root@server01 sysadmin]# firewall-cmd --reload
/*
success
*/
--Step 04
[root@server01 sysadmin]# firewall-cmd --list-all
/*
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: ens33
  sources:
  services: cockpit dhcpv6-client mountd nfs rpc-bind ssh
  ports:
  protocols:
  forward: yes
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
*/
--Step 05
[root@server01 sysadmin]# mkdir -p /NFS_share_dir
--Step 06
[root@server01 sysadmin]# chown -R nobody /NFS_share_dir
--Step 07
[root@server01 sysadmin]# ll -ld /NFS_share_dir
/*
drwxr-xr-x. 2 nobody root 6 Jan 27 10:31 /NFS_share_dir
*/
--Step 08
[root@server01 sysadmin]# systemctl start nfs-server.service
--Step 09
[root@server01 sysadmin]# systemctl enable nfs-server.service
/*
Created symlink /etc/systemd/system/multi-user.target.wants/nfs-server.service → /usr/lib/systemd/system/nfs-server.service.
*/
--Step 10
[root@server01 sysadmin]# systemctl status nfs-server.service
/*
● nfs-server.service - NFS server and services
     Loaded: loaded (/usr/lib/systemd/system/nfs-server.service; enabled; preset: disabled)
    Drop-In: /run/systemd/generator/nfs-server.service.d
             └─order-with-mounts.conf
     Active: active (exited) since Mon 2025-01-27 10:33:31 +0545; 11s ago
       Docs: man:rpc.nfsd(8)
             man:exportfs(8)
   Main PID: 7973 (code=exited, status=0/SUCCESS)
        CPU: 78ms

Jan 27 10:33:31 server01 systemd[1]: Starting NFS server and services...
Jan 27 10:33:31 server01 systemd[1]: Finished NFS server and services.
*/
--Step 11
[root@server01 sysadmin]# vi /etc/exports
--Step 12
[root@server01 sysadmin]# cat /etc/exports
/*
/NFS_share_dir  192.168.121.200(rw)
*/
--Step 13
[root@server01 sysadmin]# exportfs -a
--Step 14
[root@server01 sysadmin]# systemctl restart nfs-server.service


