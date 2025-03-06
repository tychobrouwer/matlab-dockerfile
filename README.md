# MATLAB Docker Image with Custom Toolboxes

This repository contains a Dockerfile and scripts to build and run a custom MATLAB Docker image with additional toolboxes and support packages. The image is based on the official MathWorks MATLAB Docker image and includes a set of predefined toolboxes that can be customized according to your needs.

##Features

- **Custom MATLAB Toolboxes**: The Docker image includes a set of additional MATLAB toolboxes and support packages, such as Communications Toolbox, Computer Vision Toolbox, and more.

- **Persistent Storage**: The container is configured to mount a local directory (```/home/me/Projects```) to the container's ```/home/matlab/Projects``` directory, allowing for persistent storage of your MATLAB projects.

- **USB Device Support**: The container is set up to access USB devices, which is useful for hardware-related MATLAB toolboxes like Image Acquisition Toolbox and connecting to a Raspberry Pi.

## Prerequisites

- **Docker**: Ensure Docker is installed on your system.

- **MATLAB License**: You need a valid MATLAB license to use this image. You can either mount a license file, specify a license server, or login using your MathWorks account when the container is running.

## Getting Started

1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/custom-matlab-docker.git
cd custom-matlab-docker
```

2. Build the Docker Image

To build the Docker image, run the following command:

```bash
docker build -t matlab_with_toolboxes:R2024b .
```

This will create a Docker image named ```matlab_with_toolboxes``` with the tag ```R2024b```. You can modify the ```MATLAB_RELEASE``` and ```ADDITIONAL_PRODUCTS``` arguments in the ```Dockerfile``` to customize the MATLAB release and the list of toolboxes to be installed.

3. Run the Docker Container
To start the MATLAB container, use the provided ```start.sh``` script:

```bash
./start.sh
```

This script will:

- Start the Docker service.

- Run the MATLAB container with the following configurations:

    - Mount the local Projects directory to ```/home/matlab/Projects``` inside the container.

    - Allow access to USB devices.

    - Use the host network for accessing for example a Raspberry Pi.

    - Allocate 512MB of shared memory.

    - If the container is already running, the script will attach to the existing container.

4. Access MATLAB

Once the container is running, MATLAB will start in browser mode. You can access it by navigating to ```localhost:8888```.

## Customizing the Docker Image

Detailed instructions are on the official [MATLAB dockerfile GitHub](https://github.com/mathworks-ref-arch/matlab-dockerfile)

### Adding More Toolboxes

To add more toolboxes to the Docker image, modify the ```ADDITIONAL_PRODUCTS``` argument in the ```Dockerfile```. For all possible toolboxes see the official [MATLAB dockerfile example](https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/mpm-input-files/R2024b/mpm_input_r2024b.txt)


### Using a License Server

If you are using a network license, you can specify the license server by uncommenting the following lines in the ```Dockerfile``` and providing the appropriate ```LICENSE_SERVER``` value:

```dockerfile
ARG LICENSE_SERVER
ENV MLM_LICENSE_FILE=$LICENSE_SERVER
```

You can then build the image with the license server information:

```bash
docker build --build-arg LICENSE_SERVER=27000@MyServerName -t matlab_with_toolboxes:R2024b .
```

### Persistent Storage

The container is configured to mount the local ```/home/me/Projects``` directory to ```/home/matlab/Projects``` inside the container. This allows you to persist your MATLAB projects and data across container restarts. You can modify the ```start.sh``` script to change the local directory path if needed.

### USB Device Support

The container is set up to access USB devices, which is useful for hardware-related MATLAB toolboxes like Image Acquisition Toolbox. The ```--privileged``` flag and the ```-v /dev/bus/usb:/dev/bus/usb``` option in the ```start.sh``` script enable this functionality.


