# Use miniconda as the base image with the specified version.
FROM continuumio/miniconda3:23.10.0-1
ENV LANG en_US.UTF-8
ENV TZ US/Pacific
ARG DEBIAN_FRONTEND=noninteractive

# Create a directory for the dps-unit-test application
RUN mkdir -p /app/dps-unit-test

# Copy application files to the working directory
COPY ./ /app/dps-unit-test

# Assign execute permissions to the scripts
RUN chmod +x /app/dps-unit-test/run-test.sh

