# Add arduino to ros

FROM pablogn/rpi-ros-core-indigo 
MAINTAINER Pablo González Nalda pablo.gonzalez@ehu.eus

USER root

RUN apt-get update && \
        apt-get install --no-install-recommends -y arduino arduino-core arduino-mk \
        ros-indigo-rosserial-arduino ros-indigo-rosserial && \
        rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /home/pi/sketchbook/libraries && \
        cd /home/pi/sketchbook/libraries && \
        rm -rf ros_lib && \
        chmod a+x /opt/ros/indigo/setup.sh 

USER pi

RUN bash -c "source /opt/ros/indigo/setup.sh && rosrun rosserial_arduino make_libraries.py . "

# setup entrypoint
WORKDIR /home/pi/
ENTRYPOINT ["./rep.sh"]
CMD ["/bin/bash"]

