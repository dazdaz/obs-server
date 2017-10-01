# obs-server

[![](https://images.microbadger.com/badges/version/lifestorm/obs-server.svg)](https://hub.docker.com/r/lifestorm/obs-server)
[![](https://images.microbadger.com/badges/image/lifestorm/obs-server.svg)](https://microbadger.com/images/lifestorm/obs-server)

## Install

- Build the image
	```
	docker build -t my_obs_server .
	```

## Run

- With a local build

	```
	docker run -p 5901:5901 -p 6901:6901 -p 2722:22 -ti my_obs_server
	```

- On production

	```
	docker pull lifestorm/obs-server
	docker run -p 5901:5901 -p 6901:6901 -p 2722:22 -ti lifestorm/obs-server
	```

## Connect

- You can connect to SSH with `root` as the `root` password

	```
	ssh -l root -p 2722 localhost
	```

- You can connect to VNC

	- with a VNC client on port `5901` with password `vncpwd`
	- With your browser at <http://localhost:6901?password=vncpwd>

## Work
