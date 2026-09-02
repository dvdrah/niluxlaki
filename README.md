# niluxlaki

Kali Linux, containerized, for authorized security testing and research.

## Build and run

```bash
docker compose build
docker compose run --rm kali
```

Or without Compose:

```bash
docker build -t niluxlaki/kali .
docker run -it --rm --name kali niluxlaki/kali
```

This starts an interactive shell as the non-root `kali` user (passwordless
`sudo` is available inside the container). A named volume (`kali-home`)
persists `/home/kali` across container restarts.

## Customizing the toolset

The `kali-linux-headless` metapackage is installed by default. For the full
desktop toolset use `kali-linux-default`, or trim the `apt-get install` list
in the `Dockerfile` to just the packages you need — a smaller image builds
and starts faster.

## Notes

- Only use this against systems and networks you're authorized to test.
- To reach a target network from the container, add the relevant `--network`
  or `network_mode` settings; none are configured by default.
