#! /usr/bin/env bash

# 安装 cargo 与 rustc
if ! has_cmd cargo; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi