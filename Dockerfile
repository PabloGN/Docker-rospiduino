# Add arduino to ros

FROM pablogn/rpi-ros-core-indigo 
MAINTAINER Pablo González Nalda pablo.gonzalez@ehu.eus

USER root

RUN     apt-get update && \
	apt-get install --no-install-recommends -y arduino arduino-core arduino-mk \
	ros-indigo-rosserial ros-indigo-rosserial-arduino && \
	rm -rf /var/lib/apt/lists/*
	
# setup entrypoint
WORKDIR /home/pi/
ENTRYPOINT ["./rep.sh"]
CMD ["/bin/bash"]

USER pi
