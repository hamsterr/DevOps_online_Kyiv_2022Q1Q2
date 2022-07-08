FROM ubuntu:latest
RUN apt -y update && \
    apt install  -y apache2  && \
    apt install -y curl
COPY init.sh .
RUN chmod +x init.sh
EXPOSE 80
CMD ["sh", "-c",  "./init.sh;bash"]
