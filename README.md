## Description
---
Dockerfile used by hub.docker.com to create a container for the [vsc-valve](https://github.com/usgs/vsc-valve) project.

## Usage
---
Tomcat memory/etc options can be passed via a CATALINA_OPTS environment variable. When starting the container, please mount a volume to:

* /app/valve3/WEB-INF/config

Which should contain the data.config and valve3.config files as described in the main vsc-valve source repo. Additionally, if you have filters, images, labels, or maps they should be mounted as (respectively):

* /app/valve3/filters.txt
* /app/valve3/images.txt
* /app/valve3/labels.txt
* /app/valve3/maps/*

Finally, you'll probably need to access a [vsc-vdx](https://hub.docker.com/r/wtollettusgs/vsc-vdx) container from this one. Consider using docker-compose to link the containers:

```
vdx:
  image: wtollettusgs/vsc-vdx:latest
  volumes:
     ...
  ...
valve:
  image: wtollettusgs/vsc-valve:latest
  volumes:
    ...
  links:
    vdx:vdx
```
And then in your /app/valve3/WEB-INF/config/data.config, set your VDX instance host to vdx:
```
# vdx instance
vdx=local
local.host=vdx
local.port=16050
```