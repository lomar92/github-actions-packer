# see https://hub.docker.com/r/hashicorp/packer/tags for all available tags
FROM hashicorp/packer:latest@sha256:7d243894883e02d179af1e5d94ed12ad49f07fd0e073e4cfd678cb4fee416580

COPY "entrypoint.sh" "/entrypoint.sh"

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
