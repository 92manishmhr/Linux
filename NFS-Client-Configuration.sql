--Step 01
[root@practise sysadmin]# yum install nfs-utils -y
/*
Last metadata expiration check: 1:05:10 ago on Mon 27 Jan 2025 09:37:56 AM +0545.
Dependencies resolved.
========================================================================================================================================================================================
 Package                                         Architecture                            Version                                          Repository                               Size
========================================================================================================================================================================================
Installing:
 nfs-utils                                       x86_64                                  1:2.5.4-29.el9                                   baseos                                  461 k
Installing dependencies:
 gssproxy                                        x86_64                                  0.8.4-7.el9                                      baseos                                  110 k
 libev                                           x86_64                                  4.33-6.el9                                       baseos                                   52 k
 libverto-libev                                  x86_64                                  0.3.2-3.el9                                      baseos                                   14 k
 rpcbind                                         x86_64                                  1.2.6-7.el9                                      baseos                                   58 k

Transaction Summary
========================================================================================================================================================================================
Install  5 Packages

Total download size: 695 k
Installed size: 1.7 M
Downloading Packages:
(1/5): libverto-libev-0.3.2-3.el9.x86_64.rpm                                                                                                             21 kB/s |  14 kB     00:00
(2/5): libev-4.33-6.el9.x86_64.rpm                                                                                                                       42 kB/s |  52 kB     00:01
(3/5): gssproxy-0.8.4-7.el9.x86_64.rpm                                                                                                                   70 kB/s | 110 kB     00:01
(4/5): rpcbind-1.2.6-7.el9.x86_64.rpm                                                                                                                   124 kB/s |  58 kB     00:00
(5/5): nfs-utils-2.5.4-29.el9.x86_64.rpm                                                                                                                269 kB/s | 461 kB     00:01
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                   246 kB/s | 695 kB     00:02
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                1/1
  Running scriptlet: rpcbind-1.2.6-7.el9.x86_64                                                                                                                                     1/5
  Installing       : rpcbind-1.2.6-7.el9.x86_64                                                                                                                                     1/5
  Running scriptlet: rpcbind-1.2.6-7.el9.x86_64                                                                                                                                     1/5
Created symlink /etc/systemd/system/multi-user.target.wants/rpcbind.service → /usr/lib/systemd/system/rpcbind.service.
Created symlink /etc/systemd/system/sockets.target.wants/rpcbind.socket → /usr/lib/systemd/system/rpcbind.socket.

  Installing       : libev-4.33-6.el9.x86_64                                                                                                                                        2/5
  Installing       : libverto-libev-0.3.2-3.el9.x86_64                                                                                                                              3/5
  Installing       : gssproxy-0.8.4-7.el9.x86_64                                                                                                                                    4/5
  Running scriptlet: gssproxy-0.8.4-7.el9.x86_64                                                                                                                                    4/5
  Running scriptlet: nfs-utils-1:2.5.4-29.el9.x86_64                                                                                                                                5/5
  Installing       : nfs-utils-1:2.5.4-29.el9.x86_64                                                                                                                                5/5
  Running scriptlet: nfs-utils-1:2.5.4-29.el9.x86_64                                                                                                                                5/5
  Verifying        : gssproxy-0.8.4-7.el9.x86_64                                                                                                                                    1/5
  Verifying        : libev-4.33-6.el9.x86_64                                                                                                                                        2/5
  Verifying        : libverto-libev-0.3.2-3.el9.x86_64                                                                                                                              3/5
  Verifying        : nfs-utils-1:2.5.4-29.el9.x86_64                                                                                                                                4/5
  Verifying        : rpcbind-1.2.6-7.el9.x86_64                                                                                                                                     5/5

Installed:
  gssproxy-0.8.4-7.el9.x86_64        libev-4.33-6.el9.x86_64        libverto-libev-0.3.2-3.el9.x86_64        nfs-utils-1:2.5.4-29.el9.x86_64        rpcbind-1.2.6-7.el9.x86_64

Complete!
*/
--Step 02
[root@practise sysadmin]# systemctl start nfs-server.service
--Step 03
[root@practise sysadmin]# systemctl enable nfs-server.service
/*
Created symlink /etc/systemd/system/multi-user.target.wants/nfs-server.service → /usr/lib/systemd/system/nfs-server.service.
*/
--Step 04
[root@practise sysadmin]# systemctl status nfs-server.service
/*
● nfs-server.service - NFS server and services
     Loaded: loaded (/usr/lib/systemd/system/nfs-server.service; enabled; preset: disabled)
     Active: active (exited) since Mon 2025-01-27 10:43:45 +0545; 13s ago
       Docs: man:rpc.nfsd(8)
             man:exportfs(8)
   Main PID: 9811 (code=exited, status=0/SUCCESS)
        CPU: 88ms

Jan 27 10:43:45 practise.com.np systemd[1]: Starting NFS server and services...
Jan 27 10:43:45 practise.com.np systemd[1]: Finished NFS server and services.
*/
--Step 05
[root@practise sysadmin]# mkdir -p /nfsDIR
--Step 06
[root@practise sysadmin]# chown -R nobody /nfsDIR/
--Step 07
[root@practise sysadmin]# hostname -I
/*
192.168.121.200
*/
--Step 08
[root@practise sysadmin]# showmount -e 192.168.121.100
/*
Export list for 192.168.121.100:
/NFS_share_dir 192.168.121.200
*/
--Step 09
[root@practise sysadmin]# firewall-cmd --permanent --add-service={mountd,rpc-bind,nfs}
/*
success
*/
--Step 10
[root@practise sysadmin]# firewall-cmd --reload
/*
success
*/
--Step 11
[root@practise sysadmin]# firewall-cmd --list-all
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
--Step 12
[root@practise sysadmin]# firewall-cmd --permanent --add-service={mountd,rpc-bind,nfs}
/*
success
*/
--Step 13
[root@practise sysadmin]# firewall-cmd --reload
/*
success
*/
--Step 14
[root@practise sysadmin]# firewall-cmd --list-all
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
--Step 15
[root@practise sysadmin]# showmount -e 192.168.121.100
/*Export list for 192.168.121.100:
/NFS_share_dir 192.168.121.200
*/
--Step 16
[root@practise sysadmin]# mount -t nfs 192.168.121.100:/NFS_share_dir /nfsDIR/
--Step 17
[root@practise nfsDIR]# cat /etc/fstab | grep 192.168.121.100
/*
192.168.121.100:/NFS_share_dir /nfsDIR  nfs     defaults        0 0
*/
--Step 18
[root@practise nfsDIR]# df -Th
/*
Filesystem                     Type      Size  Used Avail Use% Mounted on
devtmpfs                       devtmpfs  4.0M     0  4.0M   0% /dev
tmpfs                          tmpfs     871M   84K  871M   1% /dev/shm
tmpfs                          tmpfs     349M  7.1M  342M   3% /run
/dev/mapper/cs-root            xfs        27G  6.5G   21G  24% /
/dev/sda1                      xfs       960M  413M  548M  43% /boot
tmpfs                          tmpfs     175M  232K  174M   1% /run/user/1001
tmpfs                          tmpfs     175M   52K  175M   1% /run/user/42
tmpfs                          tmpfs     1.0M     0  1.0M   0% /run/stratisd/ns_mounts
tmpfs                          tmpfs     175M   36K  175M   1% /run/user/1000
192.168.121.100:/NFS_share_dir nfs4       27G  6.4G   21G  24% /nfsDIR
*/
