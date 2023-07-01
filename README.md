# ALTSCHOOL AFRICA CAPSTONE PROJECT GROUP 21

![HERO](<Architectural diagram.jpeg>)

## Description

The project aims to deploy a scalable and secure **WordPress application** infrastructure on AWS, providing a reliable platform for content management and web publishing. By leveraging a popular IaC tool such as Terraform, a build automation tool such as Jenkins, and AWS services such as EC2 instance, which will include auto-scaling groups, we will ensure high availability, seamless scalability, and robust security measures to deliver optimal WordPress experience while minimizing operational overhead and cost.

This GitHub repository contains all the code necessary to deploy this application.

## Team Members
- [Okwesirieze Amadi](https://github.com/AOKingsax)
- [Prince Onyeanuna](https://github.com/Aahil13)
- [Oluwaseyi akinnawo](https://github.com/seyicodes)
- [Ayodeji Hamzat](https://github.com/DejiDavid)

## How to Use

### Prerequisites

- [Docker](https://docs.docker.com/desktop/) and [Docker Compose](https://docs.docker.com/compose/install/) should be installed on your local machine.

### Setup Instructions

1. Clone this repository:

    ```shell
    git clone https://github.com/metiko/CSP-G21.git
    ```

2. Navigate to the project directory:

    ```shell
    cd CSP-G21
    ```

3. Create a `.env` file and provide the necessary environment variables:

    ```shell
    cp .env.example .env
    ```

    Update the values in `.env` with your specific configuration.

4. Start the application using Docker Compose:

    ```shell
    docker-compose -f docker-compose.yml up -d
    ```

5. Access the WordPress application:

    Open your browser and visit http://localhost:8080 to access the WordPress site.

6. Complete the WordPress setup:

    Follow the on-screen instructions to set up your WordPress instance, including database configuration and administrator account creation.

## Additional Notes

- Modify the `docker-compose.yml` file as per your specific requirements, such as adjusting container resource limits or adding additional services.
- For production deployments, ensure proper security measures, such as SSL termination, are implemented.
- Refer to the [official Docker](https://docs.docker.com/desktop/) and Docker Compose documentation for more advanced usage and customization options.
