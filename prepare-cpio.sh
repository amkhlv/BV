#!/bin/bash



( 
    THIS_DIR="$(basename "$(pwd)")"
    cd ..
    find "$THIS_DIR" -type f -not -path "$THIS_DIR/.git*" -not -name '*~' -not -name '*.sh' -not -name 'server_bv.cpio.lzma' | cpio -ao 
) | lzma > server_bv.cpio.lzma

