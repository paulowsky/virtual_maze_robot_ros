# robot_ros

An virtual maze ROS path finding robot with Python.

## Build

Build image with ip address from host machine.

```sh
docker build . -t robot_ros --build-arg "HOST=your_ip" --build-arg "PORT=1234"
```

## Run

Run container.

```sh
docker run -i --network="host" robot_ros
```

## Run with TTY

Run container in interactive mode with TTY to use customized commands.

```sh
docker run -it --network="host" robot_ros bash
```
