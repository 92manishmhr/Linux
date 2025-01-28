-- Step 01
[manish@server01 ~]$ cat index.html
/*
<h1>This is costum image</h1>
*/
-- Step 02
[manish@server01 ~]$ cat ~/Containerfile
/*
FROM docker.io/centos/httpd
MAINTAINER manish@manish.com
COPY ./index.html /var/wwww/html
*/
-- Step 03
[manish@server01 ~]$ podman build -t myconimg .
/*
STEP 1/3: FROM docker.io/centos/httpd
STEP 2/3: MAINTAINER manish@manish.com
--> c74353ea4f20
STEP 3/3: COPY ./webcontent/index.html /var/wwww/html/
COMMIT myconimg
--> a1bc5051fc32
Successfully tagged localhost/myconimg:latest
a1bc5051fc328f808fc950d1a7d34ef99c03350796fa05444224eea0f696a3bd
*/
-- Step 04
[manish@server01 ~]$ podman image list
/*
REPOSITORY              TAG         IMAGE ID      CREATED         SIZE
localhost/myconimg   latest      3bb46c437bf1  35 seconds ago  267 MB
*/
-- Step 05
[manish@server01 ~]$ podman run -d --name costumcon -p 8181:80 localhost/myconimg:latest
/*
d4aeb705648441b5c06254dc20c6a6fe02869060279795db739b5c9e3a0f6d3a1
*/
-- Step 06
[manish@server01 ~]$ podman ps
/*
CONTAINER ID  IMAGE                          COMMAND        CREATED         STATUS         PORTS                 NAMES
d4aeb7056484  localhost/myconimg:latest      /run-httpd.sh  56 seconds ago  Up 56 seconds  0.0.0.0:8181->80/tcp  costumcon
*/
-- Step 07
[manish@server01 ~]$ curl http://localhost:8181
/*
<h1>This is costum image conatiner </h1>
*/