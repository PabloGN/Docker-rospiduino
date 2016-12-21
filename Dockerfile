# Add arduino to ros

FROM pablogn/rpi-ros-core-indigo 
MAINTAINER Pablo González Nalda pablo.gonzalez@ehu.eus

USER root

RUN apt-get update && \
	apt-get install --no-install-recommends -y arduino arduino-core arduino-mk \
	ros-indigo-rosserial-arduino ros-indigo-rosserial && \
	mkdir -p /usr/share/arduino/ && \
	cd /usr/share/arduino/ && \
	rm -rf ros_lib /var/lib/apt/lists/* && \
	bash -c "source /opt/ros/indigo/setup.sh && rosrun rosserial_arduino make_libraries.py . "

USER pi
	
# setup entrypoint
WORKDIR /home/pi/
ENTRYPOINT ["./rep.sh"]
CMD ["/bin/bash"]

