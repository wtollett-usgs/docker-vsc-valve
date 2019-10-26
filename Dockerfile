FROM tomcat:7.0

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

RUN curl -sSL --remote-name https://github.com/usgs/vsc-valve/releases/download/v3.7.3/Valve3.war
RUN mkdir -p /app
RUN unzip Valve3.war -d /app/valve3 && rm Valve3.war
