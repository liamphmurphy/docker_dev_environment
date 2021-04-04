FROM archlinux:latest

# set username
ENV USER=lime

# get needed packages for my dev work && make a spot for mounted project volumes
RUN pacman -Syyu --noconfirm && pacman -S go python gcc git --noconfirm && mkdir /mnt/projects
RUN useradd -m $USER && mkdir /home/$USER/.ssh && curl https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh > /home/$USER/.bash-powerline.sh && echo 'source /home/$USER/.bash-powerline.sh' >> /home/$USER/.bashrc

# move git keys over
COPY /ssh/ /home/$USER/.ssh

WORKDIR /mnt/projects

# become $USER
USER $USER
