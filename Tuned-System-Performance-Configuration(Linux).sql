--Step 01
[root@server01 /]# yum install -y tuned
/*Last metadata expiration check: 0:49:51 ago on Mon 27 Jan 2025 01:05:12 PM +0545.
Package tuned-2.21.0-1.el9.noarch is already installed.
Dependencies resolved.
==============================================================================================================================================================
 Package                                  Architecture                    Version                                       Repository                       Size
==============================================================================================================================================================
Upgrading:
 tuned                                    noarch                          2.25.0-0.1.rc1.el9                            baseos                          449 k
Installing dependencies:
 python3-inotify                          noarch                          0.9.6-25.el9                                  baseos                           53 k

Transaction Summary
==============================================================================================================================================================
Install  1 Package
Upgrade  1 Package

Total download size: 502 k
Downloading Packages:
(1/2): python3-inotify-0.9.6-25.el9.noarch.rpm                                                                                 26 kB/s |  53 kB     00:02
(2/2): tuned-2.25.0-0.1.rc1.el9.noarch.rpm                                                                                    156 kB/s | 449 kB     00:02
--------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                         103 kB/s | 502 kB     00:04
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                      1/1
  Installing       : python3-inotify-0.9.6-25.el9.noarch                                                                                                  1/3
  Upgrading        : tuned-2.25.0-0.1.rc1.el9.noarch                                                                                                      2/3
  Running scriptlet: tuned-2.25.0-0.1.rc1.el9.noarch                                                                                                      2/3
  Running scriptlet: tuned-2.21.0-1.el9.noarch                                                                                                            3/3
  Cleanup          : tuned-2.21.0-1.el9.noarch                                                                                                            3/3
  Running scriptlet: tuned-2.21.0-1.el9.noarch                                                                                                            3/3
  Running scriptlet: tuned-2.25.0-0.1.rc1.el9.noarch                                                                                                      3/3
  Running scriptlet: tuned-2.21.0-1.el9.noarch                                                                                                            3/3
  Verifying        : python3-inotify-0.9.6-25.el9.noarch                                                                                                  1/3
  Verifying        : tuned-2.25.0-0.1.rc1.el9.noarch                                                                                                      2/3
  Verifying        : tuned-2.21.0-1.el9.noarch                                                                                                            3/3

Upgraded:
  tuned-2.25.0-0.1.rc1.el9.noarch
Installed:
  python3-inotify-0.9.6-25.el9.noarch

Complete!
*/
--Step 02
[root@server01 /]# systemctl start tuned
--Step 03
[root@server01 /]# systemctl enable tuned
--Step 04
[root@server01 /]# systemctl status tuned
/*
● tuned.service - Dynamic System Tuning Daemon
     Loaded: loaded (/usr/lib/systemd/system/tuned.service; enabled; preset: enabled)
     Active: active (running) since Mon 2025-01-27 13:56:04 +0545; 12s ago
       Docs: man:tuned(8)
             man:tuned.conf(5)
             man:tuned-adm(8)
   Main PID: 12205 (tuned)
      Tasks: 4 (limit: 10683)
     Memory: 18.8M
        CPU: 2.314s
     CGroup: /system.slice/tuned.service
             └─12205 /usr/bin/python3 -Es /usr/sbin/tuned -l -P

Jan 27 13:56:02 server01 systemd[1]: Starting Dynamic System Tuning Daemon...
Jan 27 13:56:04 server01 systemd[1]: Started Dynamic System Tuning Daemon.
*/
--Step 05
[root@server01 /]# tuned-adm active
/*
Current active profile: virtual-guest
*/
--Step 06
[root@server01 /]# tuned-adm profile
/*Available profiles:
- accelerator-performance     - Throughput performance based tuning with disabled higher latency STOP states
- aws                         - Optimize for aws ec2 instances
- balanced                    - General non-specialized tuned profile
- balanced-battery            - Balanced profile biased towards power savings changes for battery
- desktop                     - Optimize for the desktop use-case
- hpc-compute                 - Optimize for HPC compute workloads
- intel-sst                   - Configure for Intel Speed Select Base Frequency
- latency-performance         - Optimize for deterministic performance at the cost of increased power consumption
- network-latency             - Optimize for deterministic performance at the cost of increased power consumption, focused on low latency network performance
- network-throughput          - Optimize for streaming network throughput, generally only necessary on older CPUs or 40G+ networks
- optimize-serial-console     - Optimize for serial console use.
- powersave                   - Optimize for low power consumption
- throughput-performance      - Broadly applicable tuning that provides excellent performance across a variety of common server workloads
- virtual-guest               - Optimize for running inside a virtual guest
- virtual-host                - Optimize for running KVM guests
Current active profile: virtual-guest
*/
--Step 07
[root@server01 /]# tuned-adm profile balanced --> we can change profile as we requires..
--Step 08
[root@server01 /]# tuned-adm active
/*
Current active profile: balanced
*/
---------------------------------------------------Additional-------------------------------
[root@server01 /]# tuned-adm profile --> list profiles
/*
Available profiles:
- accelerator-performance     - Throughput performance based tuning with disabled higher latency STOP states
- aws                         - Optimize for aws ec2 instances
- balanced                    - General non-specialized tuned profile
- balanced-battery            - Balanced profile biased towards power savings changes for battery
- desktop                     - Optimize for the desktop use-case
- hpc-compute                 - Optimize for HPC compute workloads
- intel-sst                   - Configure for Intel Speed Select Base Frequency
- latency-performance         - Optimize for deterministic performance at the cost of increased power consumption
- network-latency             - Optimize for deterministic performance at the cost of increased power consumption, focused on low latency network performance
- network-throughput          - Optimize for streaming network throughput, generally only necessary on older CPUs or 40G+ networks
- optimize-serial-console     - Optimize for serial console use.
- powersave                   - Optimize for low power consumption
- throughput-performance      - Broadly applicable tuning that provides excellent performance across a variety of common server workloads
- virtual-guest               - Optimize for running inside a virtual guest
- virtual-host                - Optimize for running KVM guests
*/