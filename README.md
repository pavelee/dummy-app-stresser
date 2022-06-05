# Dummy App Stresser

## What's that?

It's an simple enviorment to run robot that will fetch your app page constantly. 

It could be usefult in example of simulating some movements on your app.


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
docker exec runner docker run  -e ROBOT_OPTIONS="-v page:YOUR_APP_ADDRESS -v lifetime:0 -v latency:0" robot:latest
```

-   lifetime - time in seconds the robot will stand, if 0 it will be infinite
-   latency - time in seonds the robot will wait until the next page fetch

### Run container with robot in background

It's really easy to run few robots at once. Just execute them in the background.

```
docker exec runner docker run -d -e ROBOT_OPTIONS="-v page:YOUR_APP_ADDRESS -v lifetime:0 -v latency:0" robot:latest
```

## Fast clean-up

You can terminate robot job by killing the runner:

```
docker kill runner
```

## Connect to your localhost

To connect with your localhost instead http://localhost:MY_PORT use 

```
http://host.docker.internal:MY_PORT
```

