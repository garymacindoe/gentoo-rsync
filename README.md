# gentoo-rsync
Scripts and config to set up a local portage rsync mirror on a non-Gentoo host

As root, copy `/etc/cron.d/00-rsync-gentoo-portage` and
`/opt/gentoo-rsync/rsync-gentoo-portage.sh` into place, then:
```
mkdir -pv /var/rsync/gentoo-portage /var/lib/portage
useradd -d /var/lib/portage -r -U portage
chown -R portage:portage /var/rsync/gentoo-portage /var/lib/portage
chmod ugo+x /opt/gentoo-rsync/rsync-gentoo-portage.sh
```

https://wiki.gentoo.org/wiki/Local_Mirror
https://wiki.gentoo.org/wiki/Project:Infrastructure/Mirrors/Rsync
https://wiki.gentoo.org/wiki/Cron
