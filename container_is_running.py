#from typing import Optional

import docker


#def is_container_running(container_name: str) -> Optional[bool]:
def is_container_running(container_name: str):
    """Verify the status of a container by it's name

    :param container_name: the name of the container
    :return: boolean or None
    """
    RUNNING = "running"
    # Connect to Docker using the default socket or the configuration
    # in your environment
    docker_client = docker.from_env()
    # Or give configuration
    # docker_socket = "unix://var/run/docker.sock"
    # docker_client = docker.DockerClient(docker_socket)

    try:
        container = docker_client.containers.get(container_name)
    except docker.errors.NotFound as exc:
        print(f"Check container name!\n{exc.explanation}")
    else:
        container_state = container.attrs["State"]
        #return container_state["Status"] == RUNNING
    if container_state["Status"] == RUNNING:
        return "is running"
    else:
        return "not running"

if __name__ == "__main__":
    container_name = "INGSW-postgres-bash"
    result = is_container_running(container_name)
    print(result)
