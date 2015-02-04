## Scripts

- docker-container-cleanup

  This script removes containers that are no longer running.

- docker-image-cleanup

  This script removes dangling images (images that are neither tagged
  nor a dependent of a tagged image).


## Systemd units

Systemd service and timer units for running the above scripts:

- docker-container-cleanup.service
- docker-container-cleanup.timer
- docker-image-cleanup.service
- docker-image-cleanup.timer

To enable daily runs of these scripts:

    # systemctl enable docker-container-cleanup.timer
    # systemctl start docker-container-cleanup.timer
    # systemctl enable docker-image-cleanup.timer
    # systemctl start docker-image-cleanup.timer

