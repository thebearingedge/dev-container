FROM ubuntu:20.04

COPY setup /setup/

RUN bash /setup/install.bash && rm -rf /setup

USER dev

EXPOSE 80 3000 3001 8081

WORKDIR /home/dev

ENTRYPOINT [ "/bin/bash", "-l" ]
