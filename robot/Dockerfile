FROM ros:noetic

# Update source lists
RUN apt -yqq update

# Install dependencies
RUN apt -yqq install \
    python3-pip \
    ros-$(rosversion -d)-cv-bridge

RUN pip install opencv-python

# Create CATKIN folder
WORKDIR /root/catkin_ws

# Copy project
COPY . .

# Get execution permission to project
RUN chmod -R +x src

# Setup ROS project and Compile
RUN ./setup.sh

# ENV vars
ARG HOST
ARG PORT
ENV MAZE_HOST=$HOST
ENV MAZE_PORT=$PORT

# Run roslaunch
CMD [ "./run.sh" ]
