***configure a Web Server in podman with specific user***
-- Step 01
[root@server01 /]# yum install -y container-tools && yum install crun -y
/*
Last metadata expiration check: 3:43:22 ago on Mon 27 Jan 2025 04:59:00 PM +0545.
Dependencies resolved.
========================================================================================================================================================================================
 Package                                        Architecture                        Version                                                Repository                              Size
========================================================================================================================================================================================
Installing:
 container-tools                                noarch                              1-14.el9                                               appstream                              4.6 k
Upgrading:
 aardvark-dns                                   x86_64                              2:1.13.1-1.el9                                         appstream                              915 k
 buildah                                        x86_64                              2:1.38.1-1.el9                                         appstream                               11 M
 containers-common                              x86_64                              2:1-110.el9                                            appstream                              147 k
 netavark                                       x86_64                              2:1.13.1-1.el9                                         appstream                              4.2 M
 podman                                         x86_64                              5:5.3.2-1.el9                                          appstream                               17 M
Installing dependencies:
 passt                                          x86_64                              0^20250121.g4f2c8e7-3.el9                              appstream                              235 k
 passt-selinux                                  noarch                              0^20250121.g4f2c8e7-3.el9                              appstream                               28 k
 podman-docker                                  noarch                              5:5.3.2-1.el9                                          appstream                              102 k
 podman-remote                                  x86_64                              5:5.3.2-1.el9                                          appstream                               11 M
 python3-podman                                 noarch                              3:5.3.0-1.el9                                          appstream                              183 k
 python3-tomli                                  noarch                              2.0.1-5.el9                                            appstream                               33 k
 skopeo                                         x86_64                              2:1.17.0-2.el9                                         appstream                              9.0 M
 toolbox                                        x86_64                              0.1.1-1.el9                                            appstream                              3.2 M
 udica                                          noarch                              0.2.8-2.el9                                            appstream                               72 k

Transaction Summary
========================================================================================================================================================================================
Install  10 Packages
Upgrade   5 Packages

Total download size: 56 M
Downloading Packages:
(1/15): container-tools-1-14.el9.noarch.rpm                                                                                                             8.3 kB/s | 4.6 kB     00:00
(2/15): passt-selinux-0^20250121.g4f2c8e7-3.el9.noarch.rpm                                                                                               40 kB/s |  28 kB     00:00
(3/15): podman-docker-5.3.2-1.el9.noarch.rpm                                                                                                            142 kB/s | 102 kB     00:00
(4/15): python3-podman-5.3.0-1.el9.noarch.rpm                                                                                                           298 kB/s | 183 kB     00:00
(5/15): python3-tomli-2.0.1-5.el9.noarch.rpm                                                                                                             64 kB/s |  33 kB     00:00
(6/15): passt-0^20250121.g4f2c8e7-3.el9.x86_64.rpm                                                                                                       83 kB/s | 235 kB     00:02
(7/15): podman-remote-5.3.2-1.el9.x86_64.rpm                                                                                                            1.2 MB/s |  11 MB     00:09
(8/15): udica-0.2.8-2.el9.noarch.rpm                                                                                                                     75 kB/s |  72 kB     00:00
(9/15): aardvark-dns-1.13.1-1.el9.x86_64.rpm                                                                                                            246 kB/s | 915 kB     00:03
(10/15): toolbox-0.1.1-1.el9.x86_64.rpm                                                                                                                 245 kB/s | 3.2 MB     00:13
(11/15): containers-common-1-110.el9.x86_64.rpm                                                                                                         170 kB/s | 147 kB     00:00
(12/15): skopeo-1.17.0-2.el9.x86_64.rpm                                                                                                                 439 kB/s | 9.0 MB     00:20
(13/15): netavark-1.13.1-1.el9.x86_64.rpm                                                                                                               653 kB/s | 4.2 MB     00:06
(14/15): buildah-1.38.1-1.el9.x86_64.rpm                                                                                                                875 kB/s |  11 MB     00:12
(15/15): podman-5.3.2-1.el9.x86_64.rpm                                                                                                                  603 kB/s |  17 MB     00:28
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                   1.1 MB/s |  56 MB     00:52
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                1/1
  Upgrading        : containers-common-2:1-110.el9.x86_64                                                                                                                          1/20
  Installing       : skopeo-2:1.17.0-2.el9.x86_64                                                                                                                                  2/20
  Installing       : passt-0^20250121.g4f2c8e7-3.el9.x86_64                                                                                                                        3/20
  Running scriptlet: passt-selinux-0^20250121.g4f2c8e7-3.el9.noarch                                                                                                                4/20
  Installing       : passt-selinux-0^20250121.g4f2c8e7-3.el9.noarch                                                                                                                4/20
  Running scriptlet: passt-selinux-0^20250121.g4f2c8e7-3.el9.noarch                                                                                                                4/20
  Upgrading        : aardvark-dns-2:1.13.1-1.el9.x86_64                                                                                                                            5/20
  Upgrading        : netavark-2:1.13.1-1.el9.x86_64                                                                                                                                6/20
  Upgrading        : podman-5:5.3.2-1.el9.x86_64                                                                                                                                   7/20
  Installing       : podman-docker-5:5.3.2-1.el9.noarch                                                                                                                            8/20
  Installing       : toolbox-0.1.1-1.el9.x86_64                                                                                                                                    9/20
  Upgrading        : buildah-2:1.38.1-1.el9.x86_64                                                                                                                                10/20
  Installing       : udica-0.2.8-2.el9.noarch                                                                                                                                     11/20
  Installing       : python3-tomli-2.0.1-5.el9.noarch                                                                                                                             12/20
  Installing       : python3-podman-3:5.3.0-1.el9.noarch                                                                                                                          13/20
  Installing       : podman-remote-5:5.3.2-1.el9.x86_64                                                                                                                           14/20
  Installing       : container-tools-1-14.el9.noarch                                                                                                                              15/20
  Running scriptlet: podman-2:4.6.1-5.el9.x86_64                                                                                                                                  16/20
  Cleanup          : podman-2:4.6.1-5.el9.x86_64                                                                                                                                  16/20
  Cleanup          : buildah-1:1.31.3-1.el9.x86_64                                                                                                                                17/20
  Cleanup          : netavark-2:1.8.0-3.el9.x86_64                                                                                                                                18/20
  Cleanup          : containers-common-2:1-55.el9.x86_64                                                                                                                          19/20
  Cleanup          : aardvark-dns-2:1.7.0-1.el9.x86_64                                                                                                                            20/20
  Running scriptlet: passt-selinux-0^20250121.g4f2c8e7-3.el9.noarch                                                                                                               20/20
  Running scriptlet: aardvark-dns-2:1.7.0-1.el9.x86_64                                                                                                                            20/20
  Verifying        : container-tools-1-14.el9.noarch                                                                                                                               1/20
  Verifying        : passt-0^20250121.g4f2c8e7-3.el9.x86_64                                                                                                                        2/20
  Verifying        : passt-selinux-0^20250121.g4f2c8e7-3.el9.noarch                                                                                                                3/20
  Verifying        : podman-docker-5:5.3.2-1.el9.noarch                                                                                                                            4/20
  Verifying        : podman-remote-5:5.3.2-1.el9.x86_64                                                                                                                            5/20
  Verifying        : python3-podman-3:5.3.0-1.el9.noarch                                                                                                                           6/20
  Verifying        : python3-tomli-2.0.1-5.el9.noarch                                                                                                                              7/20
  Verifying        : skopeo-2:1.17.0-2.el9.x86_64                                                                                                                                  8/20
  Verifying        : toolbox-0.1.1-1.el9.x86_64                                                                                                                                    9/20
  Verifying        : udica-0.2.8-2.el9.noarch                                                                                                                                     10/20
  Verifying        : aardvark-dns-2:1.13.1-1.el9.x86_64                                                                                                                           11/20
  Verifying        : aardvark-dns-2:1.7.0-1.el9.x86_64                                                                                                                            12/20
  Verifying        : buildah-2:1.38.1-1.el9.x86_64                                                                                                                                13/20
  Verifying        : buildah-1:1.31.3-1.el9.x86_64                                                                                                                                14/20
  Verifying        : containers-common-2:1-110.el9.x86_64                                                                                                                         15/20
  Verifying        : containers-common-2:1-55.el9.x86_64                                                                                                                          16/20
  Verifying        : netavark-2:1.13.1-1.el9.x86_64                                                                                                                               17/20
  Verifying        : netavark-2:1.8.0-3.el9.x86_64                                                                                                                                18/20
  Verifying        : podman-5:5.3.2-1.el9.x86_64                                                                                                                                  19/20
  Verifying        : podman-2:4.6.1-5.el9.x86_64                                                                                                                                  20/20

Upgraded:
  aardvark-dns-2:1.13.1-1.el9.x86_64     buildah-2:1.38.1-1.el9.x86_64     containers-common-2:1-110.el9.x86_64     netavark-2:1.13.1-1.el9.x86_64     podman-5:5.3.2-1.el9.x86_64
Installed:
  container-tools-1-14.el9.noarch          passt-0^20250121.g4f2c8e7-3.el9.x86_64       passt-selinux-0^20250121.g4f2c8e7-3.el9.noarch       podman-docker-5:5.3.2-1.el9.noarch
  podman-remote-5:5.3.2-1.el9.x86_64       python3-podman-3:5.3.0-1.el9.noarch          python3-tomli-2.0.1-5.el9.noarch                     skopeo-2:1.17.0-2.el9.x86_64
  toolbox-0.1.1-1.el9.x86_64               udica-0.2.8-2.el9.noarch

Complete!
*/
-- Step 02
[root@server01 /]# useradd manish
-- Step 03
[root@server01 /]# passwd manish
/*
Changing password for user manish.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
*/
-- Step 04
[root@server01 /]# loginctl enable-linger manish
-- Step 05
****login with newly created user 'manish'****
-- Step 06
[manish@server01 ~]$ mkdir -p ~/.config/containers
--Step 07
[manish@server01 containers]$ cat ~/.config/containers/registries
/*
unqualified-search-registries = ["docker.io"]
 [[registry]]
insecure = true
blocked = false
location = "docker.io"
*/
-- Step 08
[manish@server01 containers]$ podman search httpd | grep centos
/*
docker.io/centos/httpd
*/
-- Step 09
[manish@server01 containers]$ podman pull docker.io/centos/httpd
/*
Trying to pull docker.io/centos/httpd:latest...
Getting image source signatures
Copying blob 628eaef4a9e0 done   |
Copying blob 30cf2fb1a57e done   |
Copying blob 20c0ca1c0cd5 done   |
Copying blob a02a4930cb5d done   |
Copying config 2cc07fbb50 done   |
Writing manifest to image destination
2cc07fbb5000234e85b7ef63b6253f397491959af2a24251b6ae20c207beb814
*/
-- Step 10
[manish@server01 containers]$ podman image list
/*
REPOSITORY              TAG         IMAGE ID      CREATED      SIZE
docker.io/centos/httpd  latest      2cc07fbb5000  6 years ago  267 MB
*/
-- Step 11
[manish@server01 containers]$ podman image inspect docker.io/centos/httpd:latest | grep 80/tcp
/*
                    "80/tcp": {}
*/
-- Step 12
[manish@server01 containers]$ podman run -d --name myhttpd -p 9090:80 docker.io/centos/httpd:latest
/*
bebcbb340c2ed82e697fd10026408ee978f74058cff14457c556873686e1d137
*/
-- Step 13
[manish@server01 containers]$ podman ps
/*
CONTAINER ID  IMAGE                          COMMAND        CREATED        STATUS        PORTS                 NAMES
bebcbb340c2e  docker.io/centos/httpd:latest  /run-httpd.sh  9 seconds ago  Up 9 seconds  0.0.0.0:9090->80/tcp  myhttpd
*/
-- Step 14
[root@bebcbb340c2e /]# cat /var/www/html/index.html
/*
<h1>Hello World!!</h1>
*/
-- Step 15
[manish@server01 containers]$ curl http://localhost:9090
/*
<h1>Hello World!!</h1>
*/
---------------------------Additional to access from web browser--------------
--Step 01
[root@server01 ssh]# semanage port -a -t http_port_t -p tcp 9090
--Step 02
[root@server01 ssh]# firewall-cmd --permanent --add-port=9090/tcp
/*
success
*/
-- Step 03
[root@server01 ssh]# firewall-cmd --reload
/*
success
*/
-- now we can browse http:192.168.121.100:9090 from web browser --