## INSTALLING WORDPRESS DOCKER IMAGE WITH ANSIBLE
---

Here, ansible was used to install docker and docker-compose. The docker-compose file was gotten from official wordpress docker image repository and ansible vault was used to encrypt the environment variable.

## STEPS
---

1. Clone this repository

    ```shell
    git clone https://github.com/metiko/CSP-G21.git
    ```
2. Change directory to the ansible folder

    ```shell
    cd CSP-G21/ansible
    ```
3. Install ansible

    ```shell
    sudo apt install ansible -y
    ```
4. (a) Fill out the configuration in the .env file located at roles/wordpress/files/.env  
   (b) Set up the inventory.txt file with prometheus and grafana instance under monitor-server and wordpress instances under Node-servers  
   (c) Provide the private_key_file path in the ansible.cfg 

5. Run the ansible playbook command

    ```shell
    ansible-playbook deploy.yml

6. Access the wordpress application

    Open your browser and visit http://[Node-servers-ip-address] to access the WordPress site.

7. Complete the WordPress setup:

    Follow the on-screen instructions to set up your WordPress instance, including database configuration and administrator account creation.

8. Access prometheus

    Open your browser and visit http://[monitor-server-ip-address]:9090  

9. Access grafana

    Open your browser and visit http://[Node-servers-ip-address]:3000

    **user** is admin, **password** is located at roles/grafana/defaults/main.yml

10. Go to AWS security group and open port 3000 and 9090

---

## Additional Notes

- Modify the `roles/docker_compose/files/docker-compose.yml` file as per your specific requirements, such as adjusting container resource limits or adding additional services.
- Refer to the [official Docker](https://docs.docker.com/desktop/) and Docker Compose documentation for more advanced usage and customization options.
