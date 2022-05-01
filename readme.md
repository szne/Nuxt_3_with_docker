# Nuxt-3-with-docker

Docker-composeでnuxt 3の開発環境を構築する物です。

## Requirements

- Git
- Docker
- Docker-compose

## Usage

GitHubからクローンしてコンテナを立ち上げる

```cmd
git clone https://github.com/szne/Nuxt-3-with-docker.git
ren nuxt_3_with_docker your-project-name
cd your-project-name
docker compose up -d
```

コンテナ内に入ってnpx nuxiを使用しnuxt/starterをインストール

```cmd
docker-compose exec app /bin/sh
```

```sh
npx nuxi init .
```

docker-composeを書き換えDockerを再起動

```diff
version: '3.8'

services:
  app:
    build: .
    volumes:
      - ./src:/src:cached
-       # - node_modules:/src/node_modules
+       - node_modules:/src/node_modules
      # ↑ コメントアウトを解除
    working_dir: "/src"
    ports:
      - "3000:3000"
    tty: true
    environment:
    - HOST=0.0.0.0
    - port=3000
    - CHOKIDAR_USEPOLLING=true

volumes:
  node_modules:
```

```sh
/src # exit
> docker compose down 
> docker compose up -d
```

Nuxt 3のインストール

```sh
> docker-compose exec app sh
/src # yarn install
```

For more information, see <https://zenn.dev/szn/articles/nuxt-3-with-docker-compose>
