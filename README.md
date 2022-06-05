# Dummy App Stresser

## How to run?

### Build runner image

```
docker build -t runner .
```

### Run container with runner

```
docker run -d --name=runner --privileged --init runner:latest
```

### Build robot image inside runner container

```
docker exec runner docker build -t robot /srv/dummy_app_stresser
```

### Run container with robot

```
docker exec runner docker run -e ROBOT_OPTIONS="-v page:YOUR_APP_ADDRESS -v lifetime:0 -v latency:0" robot:latest
```

-   lifetime - time in seconds the robot will stand, if 0 it will be infinite
-   latency - time in seonds the robot will wait until the next page fetch

### Run container with robot in background

```
docker exec runner docker run -d -e ROBOT_OPTIONS="-v page:YOUR_APP_ADDRESS -v lifetime:0 -v latency:0" robot:latest
```
