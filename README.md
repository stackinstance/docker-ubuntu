# docker-centos
Step 1: run command: 
```
composer require stackinstance/docker-centos:dev-master --dev
```

Step 2: run command: 
```
vendor/stackinstance/docker-centos/install.sh
```

Step 3: Open docker terminal and run command: 
```
vendor/stackinstance/docker-centos/docker/tools/rebuild.sh
```

Your project **root** will be mapped to the **/var/www** directory on the Docker instance. The **web root** folder is mapped to the **web** directory in your project.

## Website
- http://bundles.stackinstance.com
- http://www.stackinstance.com
- https://codedump.io
- http://www.codetrust.nl

