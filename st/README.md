# Suckless Terminal (st) with Docker on Debian/Ubuntu

Building [Luke Smith's fork of st](https://github.com/LukeSmithxyz/st) using Docker.
Creates a `.deb` file to install for Debian/Ubuntu systems.

## Installing

Run `./install.sh` to install the latest version of `st`.

The script does the following:

1. Fetches and pulls [Luke Smith's fork of st](https://github.com/LukeSmithxyz/st) into `st/`.
2. Copies `config.h` into the repo.
3. Builds the Docker image.
4. Builds `st` with the newly built Docker image, by running `docker-cmd.sh`.
5. Installs the `.deb`, which is created by `checkinstall` inside the Docker container, on your host machine.

## Create a `.desktop` entry

Add the `st.desktop` file to `/usr/share/applications` to add it many
application launchers. This will allow you to use launchers, such as `rofi` or `dmenu`,
to start `st`.

```bash
sudo cp st.desktop /usr/share/applications
```

You can also add it to `~/.local/share/applications`, to avoid using `sudo`.

```bash
cp st.desktop ~/.local/share/applications
```

## Errors

If you get a message about `__vte_prompt_command: command not found`, then
remove `/etc/profile.d/vte-2.91.sh` and restart `st`.
