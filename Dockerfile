FROM blr-artifactory.cloud.health.ge.com/docker-ext/python:3.10.2 AS build
COPY r.txt r.txt
RUN pip install --user --proxy=http://cis-india-pitc-bangalore.corporate.ge.com:80 -r r.txt
COPY . /app
WORKDIR /app
COPY src src
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["./src/service_portal.py"]