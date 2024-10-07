# Gatsby Docker Image

To build the image:

```bash
make build
```

To serve a site:

```bash
make develop
```

The Docker image can be found [here](https://hub.docker.com/repository/docker/datawookie/gatsby/general).

📢 If you have trouble using the image on a Mac then there are a couple of approaches:

1. change `PLATFORM` from `linux/amd64` to `linux/arm64` in the `Makefile` or
2. attempt a mult-architecture build (see [issue](https://github.com/datawookie/docker-gatsby/issues/2) for details).
