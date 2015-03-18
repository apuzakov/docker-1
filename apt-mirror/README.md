# Setup #
Here you can see the general approach to setup and create your package mirror, which is explained afterwards

```
sudo docker create -v /var/spool/apt-mirror ubuntu
sudo docker run --rm --volumes-from pkg_mirror --rm thomass/apt-mirror
sudo docker run -it --name www_pkg_data --volumes-from pkg_mirror -v /usr/local/apache2/htdocs ubuntu bash
sudo docker run -d --name apache_mirror -p 8888:80 --volumes-from www_pkg_data httpd
```

## Step 1: ##

You should keep all mirror files in a _data volume container_ which is created here

## Step 2: ##

The apt-mirror container downloads the current sources from archive.ubuntu.com and stores the data in the previously created _data volume container_.

The apt-mirror image has it's own ```mirror.list``` which can be overridden by mounting the file as volume to this container: ```-v mirror.list:/etc/apt/mirror.list```

## Step 3: ##

Later a webserver would offer the mirror data. Within this _data volume container_ we map the directory ```/var/spool/apt-mirror``` to the content directory of the webserver, here ```/usr/local/apache2/htdocs```. Inside the _data volume container_ we have to run:
```
ln -s /var/spool/apt-mirror/mirror/archive.ubuntu.com/ubuntu/ /usr/local/apache2/htdocs
```

## Step 4: ##

The last step is offering the mirror data. Here we use the official docker httpd, which is grabbing it's public data from the linked volume under ```/usr/local/apache2/htdocs```.

# Usage #

Replace the URL inside your ```/etc/apt/sources.list``` with the one from the apache server. For instance:

```
sed -i s/archive.ubuntu.com/<ipToDockerServer>:8888/g /etc/apt/sources.list
```
