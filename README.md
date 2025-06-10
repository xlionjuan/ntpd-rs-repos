# ntpd-rs-repos

***Unofficial*** repos for [pendulum-project/ntpd-rs](https://github.com/pendulum-project/ntpd-rs).

> ntpd-rs is a tool for synchronizing your computer's clock, implementing the NTP and NTS protocols. It is written in Rust, with a focus on security and stability. It includes both client and server support.

## APT
### Add GPG key
```
curl -fsSL https://xlionjuan.github.io/ntpd-rs-repos/pubkey.key | sudo gpg --yes --dearmor --output /usr/share/keyrings/xlion-repo.gpg
```

### Add repo

Please install [xlion-repo-archive-keyring](https://github.com/xlionjuan/xlion-repo-archive-keyring) package, you need to have `jq` and `curl` installed, this command will query GitHub API to get letest keyring package and install it. If you're mind installing by this way, please go to [its releases](https://github.com/xlionjuan/xlion-repo-archive-keyring/releases) and verify it with SHA256.

```
sudo apt-get update && sudo apt-get install -y jq curl && url=$(curl -s https://api.github.com/repos/xlionjuan/xlion-repo-archive-keyring/releases/latest | jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url') && tmpfile="/tmp/$(basename "$url")" && curl -L "$url" -o "$tmpfile" && sudo dpkg -i "$tmpfile"
```

## RPM
```bash
curl -fsSl https://xlionjuan.github.io/ntpd-rs-repos/rpm/xlion-ntpd-rs-repo.repo | sudo tee /etc/yum.repos.d/xlion-ntpd-rs-repo.repo
```

<details>
<summary>Mask existing NTP ......</summary>
<br>

Please make sure you know what you're doing!

```bash
sudo systemctl mask systemd-timesyncd.service
```

```bash
sudo systemctl mask chronyd.service
```

</details>

## License

This repository is intended for distributing software. Unless otherwise specified, all scripts and configurations are licensed under the [GNU AGPLv3](LICENSE). **THIS DOES NOT INCLUDE THE DISTRIBUTED SOFTWARE ITSELF**. For the licenses of the distributed software, please refer to the software developers' websites, Git repositories, the packages' metadata, or contact the developers directly if you have any questions.