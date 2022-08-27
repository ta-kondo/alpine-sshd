# キー置き場

## ここはどこ

  ```
  ./docker/resource/keys/
  ```

## ここは何？

### 秘密鍵／公開鍵をここに置く

  - こんな感じ

    ```bash
    root@mypc:/work/alpine-sshd/docker/resource$ ls -la ./keys/
    total 44
    drwxr-xr-x 2 root root 4096 Aug 27 14:57 .
    drwxr-xr-x 3 root root 4096 Aug 27 14:34 ..
    -rw-r--r-- 1 root root  407 Aug 27 14:39 HOWTO.md
    -rw------- 1 root root  411 Aug 26 18:46 login_key
    -rw-r--r-- 1 root root   98 Aug 26 18:46 login_key.pub
    -rw------- 1 root root  505 Aug 26 18:45 ssh_host_ecdsa_key
    -rw-r--r-- 1 root root  178 Aug 26 18:45 ssh_host_ecdsa_key.pub
    -rw------- 1 root root  411 Aug 26 18:44 ssh_host_ed25519_key
    -rw-r--r-- 1 root root   98 Aug 26 18:44 ssh_host_ed25519_key.pub
    -rw------- 1 root root 2602 Aug 26 18:44 ssh_host_rsa_key
    -rw-r--r-- 1 root root  570 Aug 26 18:44 ssh_host_rsa_key.pub
    root@mypc:/work/alpine-sshd/docker/resource$
    ```

  - 自分で作るならこう

    ```bash
    # ログイン用。公開鍵はコンテナ内に配置される
    ssh-keygen -t ed25519 -f login_key
    # sshd用。秘密鍵がコンテナ内に配置される
    ssh-keygen -t rsa -f ssh_host_rsa_key
    ssh-keygen -t ecdsa -f ssh_host_ecdsa_key
    ssh-keygen -t ed25519 -f ssh_host_ed25519_key
    ```
