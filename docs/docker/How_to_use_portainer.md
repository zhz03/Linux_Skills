# How to use portainer

```
docker volume create portainer_data
```

```
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

log in:

```
https://localhost:9443
```

To stop docker:

```
docker ps
```

you get:

```
CONTAINER ID   IMAGE                           COMMAND        CREATED          STATUS          PORTS                                                      NAMES
f65f4a83c688   portainer/portainer-ce:latest   "/portainer"   25 minutes ago   Up 25 minutes   0.0.0.0:8000->8000/tcp, 0.0.0.0:9443->9443/tcp, 9000/tcp   portainer
```



## Reference

[1] [https://docs.portainer.io/start/install-ce/server/docker/linux](https://docs.portainer.io/start/install-ce/server/docker/linux)

[2] [https://www.cnblogs.com/JerryMouseLi/p/15571897.html](https://www.cnblogs.com/JerryMouseLi/p/15571897.html)
