# docker Installation

b03901023 許秉鈞

### Installation

```shell
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
    
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


```



#### error: No module named "apt_pkg"

```shell
$ sudo apt-get remove --purge python-apt  
$ sudo apt-get install python-apt -f  
$ sudo find / -name "apt_pkg.cpython-35m-x86_64-linux-gnu.so"  
$ cd /usr/lib/python3/dist-packages/  
$ sudo cp apt_pkg.cpython-35m-x86_64-linux-gnu.so apt_pkg.cpython-36m-x86_64-linux-gnu.so   
```

[Link](https://blog.csdn.net/jaket5219999/article/details/78464310)



```shell
$ sudo apt-get install docker-ce
```

#### Error: 'docker-ce' has no installation candidate

(WARNING: this version is not correct!! So you may want to skip this step because I uninstall the `docker-ce` and reinstall it again thereafter ><... you can just skip this and see next section)

```shell
$ sudo curl https://get.docker.com | sudo sh
$ sudo apt list docker-ce 2>&- | grep installed
docker-ce/xenial,now 18.05.0~ce~3-0~ubuntu amd64 [installed]
```

[Link](https://www.jianshu.com/p/172ce358a26e)

```shell
adrianhsu@adrianhsu:/usr/lib/python3/dist-packages$ sudo docker version
Client:
 Version:      18.05.0-ce
 API version:  1.37
 Go version:   go1.9.5
 Git commit:   f150324
 Built:        Wed May  9 22:16:25 2018
 OS/Arch:      linux/amd64
 Experimental: false
 Orchestrator: swarm

Server:
 Engine:
  Version:      18.05.0-ce
  API version:  1.37 (minimum version 1.12)
  Go version:   go1.9.5
  Git commit:   f150324
  Built:        Wed May  9 22:14:32 2018
  OS/Arch:      linux/amd64
  Experimental: false
  
adrianhsu@adrianhsu:~$ sudo docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.
...
```

#### Error: docker-ce version

```shell
$ sudo apt-get install -y nvidia-docker2
...
The following packages have unmet dependencies:
 nvidia-docker2 : Depends: docker-ce (= 18.03.1~ce-0~ubuntu) but 18.05.0~ce~3-0~ubuntu is to be installed or
                           docker-ee (= 18.03.1~ee-0~ubuntu) but it is not installable
```



#### solution - reinstall docker-ce

```shell
$ sudo apt-get remove docker-ce
$ apt-cache madison docker-ce
$ sudo apt-get install docker-ce=18.03.1~ce-0~ubuntu
$ sudo docker version
$ sudo docker run hello-world
```

#### Try install nvidia-docker again

```shell
$ sudo apt-get install -y nvidia-docker2
$ sudo pkill -SIGHUP dockerd
$ sudo docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi

Unable to find image 'nvidia/cuda:latest' locally
latest: Pulling from nvidia/cuda
297061f60c36: Pull complete
...
Digest: sha256:ea620731bb116b0ef882356f0f0ef8b32bc283dea7898d638c2166cc039c9243
Status: Downloaded newer image for nvidia/cuda:latest
Thu May 31 05:47:53 2018
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 390.30                 Driver Version: 390.30                    |
|-------------------------------+----------------------+----------------------+
...


```

#### Non-root

If you would like to use Docker as a non-root user, you should now consider adding your user to the "docker" group with something like:

```shell
$ sudo usermod -aG docker adrianhsu
sent invalidate(passwd) request, exiting
sent invalidate(group) request, exiting
```





# Fast Photo Style



``` shell
$ git clone https://github.com/NVIDIA/FastPhotoStyle
$ cd FastPhotoStyle/
$ docker build -t your-docker-image:v1.0 . # takes 10 mins
$ docker run -v /home/adrianhsu/FastPhotoStyle:/test_container --runtime=nvidia -i -t your-docker-image:v1.0 /bin/bash

root@0128acf2fe5f:/$ ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  test_container  tmp  usr  var
root@0128acf2fe5f:/$ cd test_container/
root@f3b829a589e5:/test_container$ ls
Dockerfile      USAGE.md      demo_result.png     photo_smooth.py                  smooth_filter.py
LICENSE.md      converter.py  download_models.py  photo_wct.py                     teaser.png
PhotoWCTModels  demo.py       download_models.sh  process_stylization.py           transfer_with_label.png
README.md       demo.sh       models.py           process_stylization_examples.py

root@f3b829a589e5:/test_container$ cd PhotoWCTModels/
root@f3b829a589e5:/test_container/PhotoWCTModels$ wget https://github.com/suquark/PhotoWCTModels/raw/d8a4e35f2a994eb7c6f261b5e8172ae6397040f2/photo_wct.pth
```

