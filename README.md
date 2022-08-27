# alpine-sshd

# Features

SSH接続できるコンテナー。

ポートは環境変数 `PORT` を指定して。

鍵認証のみ対応。作り方は[ここ](./docker/resource/keys/WhatIsThis.md)。

# Requirement

* Docker

# Usage

  ```bash
  # Clone
  git clone https://github.com/ta-kondo/alpine-sshd.git
  ```

  ```bash
  cd alpine-sshd
  # Build
  docker build --tag alpine-sshd ./docker/
  # Run
  docker run --rm --d --env PORT=22 --p 10022:22 --name alpine-sshd-container alpine-sshd
  # Stop
  docker stop alpine-sshd-container
  ```

  ```bash
  # ssh
  ssh -i ~/.ssh/login_key sshuser@localhost -p 10022
  ```

# Author

  * ta-kondo
  * E-mail @gmail.com

# License

None

# History

  - 2022.08.26
    - 新規作成
