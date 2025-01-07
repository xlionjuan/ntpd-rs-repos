# ntpd-rs-repos

***Unofficial*** repos for [pendulum-project/ntpd-rs](https://github.com/pendulum-project/ntpd-rs).

> ntpd-rs is a tool for synchronizing your computer's clock, implementing the NTP and NTS protocols. It is written in Rust, with a focus on security and stability. It includes both client and server support.

## APT
### Add GPG key
```
curl -fsSL https://xlionjuan.github.io/ntpd-rs-repos/pubkey.key | sudo gpg --yes --dearmor --output /usr/share/keyrings/xlion-repo.gpg
```

### Add repo
```bash
echo "deb [signed-by=/usr/share/keyrings/xlion-repo.gpg] https://xlionjuan.github.io/ntpd-rs-repos/apt main main" | sudo tee /etc/apt/sources.list.d/xlion-ntpd-rs-repo.list
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

This repository is intended for distributing software. Unless otherwise specified, all scripts and configurations are licensed under the [GNU AGPLv3](LICENSE).**THIS DOES NOT INCLUDE THE DISTRIBUTED SOFTWARE ITSELF**. For the licenses of the distributed software, please refer to the software developers' websites, Git repositories, the packages' metadata, or contact the developers directly if you have any questions.