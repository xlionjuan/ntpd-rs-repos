# ntpd-rs-repos

[![Create Repo for ntpd-rs latest](https://github.com/xlionjuan/ntpd-rs-repos/actions/workflows/latest.yml/badge.svg)](https://github.com/xlionjuan/ntpd-rs-repos/actions/workflows/latest.yml)

***Unofficial*** repos for [pendulum-project/ntpd-rs](https://github.com/pendulum-project/ntpd-rs).

> ntpd-rs is a tool for synchronizing your computer's clock, implementing the NTP and NTS protocols. It is written in Rust, with a focus on security and stability. It includes both client and server support.

## APT
### Add GPG key

Please install [xlion-repo-archive-keyring](https://github.com/xlionjuan/xlion-repo-archive-keyring) package, you need to have `jq` and `curl` installed, this command will query GitHub API to get latest keyring package and install it. If you mind installing it this way, please go to [its releases](https://github.com/xlionjuan/xlion-repo-archive-keyring/releases) and verify it with SHA256.

```
sudo apt-get update && sudo apt-get install -y jq curl && url=$(curl -s https://api.github.com/repos/xlionjuan/xlion-repo-archive-keyring/releases/latest | jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url') && tmpfile="/tmp/$(basename "$url")" && curl -L "$url" -o "$tmpfile" && sudo dpkg -i "$tmpfile"
```

### Add repo
<!--
```bash
echo "deb [signed-by=/usr/share/keyrings/xlion-repo.gpg] https://xlionjuan.github.io/ntpd-rs-repos/apt main main" | sudo tee /etc/apt/sources.list.d/xlion-ntpd-rs-repo.list
```
-->

```bash
curl -fsSL https://xlionjuan.github.io/ntpd-rs-repos/apt/xlion-ntpd-rs-repo.sources | sudo tee /etc/apt/sources.list.d/xlion-ntpd-rs-repo.sources
```

## RPM

```bash
curl -fsSL https://xlionjuan.github.io/ntpd-rs-repos/rpm/xlion-ntpd-rs-repo.repo | sudo tee /etc/yum.repos.d/xlion-ntpd-rs-repo.repo
```

The fingerprint is:

```
1521 F219 00DB 3201 95AF A358 2BE8 3361 1FF6 0389
```

Pending rotated key: 

```
3E32 B16A 4821 C54B 53A2 58F2 8EBA 83B8 784E 3812
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
