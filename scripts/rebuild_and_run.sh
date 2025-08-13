#!/bin/bash
cd pkg/sandbox
sudo tar -czvf rootfs.tar.gz rootfs
cd ../..
go build
go install
qo build -f ./evaluation -p foo -k bar -u "2025-07-10 09:30"
sudo env "PATH=$PATH" qo start -i 20211 -a ./eval-archive.enc -p foo -k bar -d 1h30m
