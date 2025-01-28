-- Step 01
[manish@server01 ~]$ podman ps
/*
CONTAINER ID  IMAGE                          COMMAND        CREATED         STATUS         PORTS                 NAMES
bebcbb340c2e  docker.io/centos/httpd:latest  /run-httpd.sh  23 minutes ago  Up 23 minutes  0.0.0.0:9090->80/tcp  myhttpd
*/
-- Step 02
[manish@server01 ~]$ mkdir -p ~/.config/systemd/user
-- Step 03
[manish@server01 ~]$ cd ~/.config/systemd/user/
-- Step 04
[manish@server01 user]$ podman generate systemd -n myhttpd --files --new
/*
DEPRECATED command:
It is recommended to use Quadlets for running containers and pods under systemd.

Please refer to podman-systemd.unit(5) for details.
/home/manish/.config/systemd/user/container-myhttpd.service
*/
-- Step 05
[manish@server01 user]$ ll ~/.config/systemd/user/
/*
total 4
-rw-r--r--. 1 manish manish 771 Jan 27 21:58 container-myhttpd.service
*/
-- Step 06
[manish@server01 user]$ systemctl --user daemon-reload
-- Step 07
[manish@server01 user]$ systemctl --user start container-myhttpd.service
-- Step 08
[manish@server01 user]$ systemctl --user enable container-myhttpd.service
/*
Created symlink /home/manish/.config/systemd/user/default.target.wants/container-myhttpd.service → /home/manish/.config/systemd/user/container-myhttpd.service.
*/
-- Step 09
[manish@server01 user]$ systemctl --user status container-myhttpd.service
/*
● container-myhttpd.service - Podman container-myhttpd.service
     Loaded: loaded (/home/manish/.config/systemd/user/container-myhttpd.service; enabled; preset: disabled)
     Active: active (running) since Mon 2025-01-27 22:01:50 +0545; 1min 51s ago
       Docs: man:podman-generate-systemd(1)
   Main PID: 23254 (conmon)
      Tasks: 2 (limit: 10683)
     Memory: 22.4M
        CPU: 699ms
     CGroup: /user.slice/user-1002.slice/user@1002.service/app.slice/container-myhttpd.service
             ├─23250 /usr/bin/pasta --config-net -t 9090-9090:80-80 --dns-forward 169.254.1.1 -u none -T none -U none --no-map-gw --quiet --netns /run/user/1002/netns/netns-eeaeb5d8-c>
             └─23254 /usr/bin/conmon --api-version 1 -c 4f9ecc82b62652e0296e8cd864c94644eeb44c026af7d7f3ef3397328cd2689e -u 4f9ecc82b62652e0296e8cd864c94644eeb44c026af7d7f3ef3397328cd>
*/
--------------------------------------after above configuration container is automatic start while reboot the machine----------------------------------------
