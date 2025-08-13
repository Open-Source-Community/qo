#!/bin/bash

DEST="../pkg/sandbox/rootfs/usr/share/man"

for cmd in bzip2 bunzip2 gzip gunzip zip unzip tar groups chmod chown chgrp kill killall pkill jobs whoami man ls cp mv rm mkdir rmdir find cat less more head tail grep sort uniq wc ln touch stat file sed awk cut tr paste join ps top uptime uname id su sudo doas ping wget curl ssh bg fg disown pgrep
do
    # Search only in the default man directories (no locales)
    while IFS= read -r manpage; do
        section_dir=$(basename "$(dirname "$manpage")")
        mkdir -p "$DEST/$section_dir"
        echo "Copying $manpage into $DEST/$section_dir/"
        cp "$manpage" "$DEST/$section_dir/"
    done < <(find /usr/share/man/man* -name "${cmd}.*" 2>/dev/null)
done

