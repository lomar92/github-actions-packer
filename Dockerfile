# see https://hub.docker.com/r/hashicorp/packer/tags for all available tags
FROM docker pull hashicorp/packer:latest

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
