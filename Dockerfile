FROM eclipse-temurin:21-jdk

# Environment
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV DISPLAY=:0

# Update and install base tools
# RUN apt update && apt	 install -y default-jdk
RUN apt-get update
RUN apt-get install -y wget 
RUN apt-get install -y curl 
RUN apt-get install -y git 
RUN apt-get install -y build-essential
RUN rm -rf /var/lib/apt/lists/*

 # Install Node.js (LTS) and Angular CLI
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g @angular/cli

# Set up user (avoid running as root)
RUN useradd -ms /bin/bash dev
USER dev
WORKDIR /home/dev

EXPOSE 8080

# Default command
CMD ["/bin/bash"]

