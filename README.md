## Premise

* docker and docker-compose using

* install exsample

```
# docker
wget -qO- https://get.docker.com/ | sh
# docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```


## Deploy or Down docker

### Deploy

* fix `ruby/set_env.sh` your environment
  * (It can be used without changing)

* input command line

```
bash deploy.sh
```

* or deploy command yourself

```
bash ruby/set_env.sh
sudo docker-compose up -d
```

### Down

* down all docker

```
bash down.sh
```

* or command yourself

```
sudo docker-compose down
```


## Jenkins Setup

### First setup

* visit url and input authentication key

http://localhost:18080/login?from=%2F

* get authentication key

```
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

* create first admin user
  * input `user_id` and `password`

* push `start using jenkins` button

### job setting(exsample)

* build scripts setting

**ssh shell**

```
sshpass -p ${DOCKER_PASSWORD} ssh root@ruby "cd /usr/src/app && bundle && bundle exec rspec spec/features/tests/test.feature"
```

### ssh login only once for command line

```
docker exec -it jenkins /bin/bash
# for docker jenkins
ssh root@ruby
#=> yes

exit
```

### Job start

* push job for jenkins
  * result exsample

```

サンプル
  googleで検索ができること
    * googleを訪問 -> * googleのページが表示されている -> * 「長谷川豊」で検索する -> * 処理を待つ -> * 検索結果のページが表示されている

Top 1 slowest examples (26.27 seconds, 100.0% of total time):
  サンプル googleで検索ができること * googleを訪問 -> * googleのページが表示されている -> * 「長谷川豊」で検索する -> * 処理を待つ -> * 検索結果のページが表示されている
    26.27 seconds ./spec/features/tests/test.feature:5

Finished in 26.28 seconds (files took 0.81951 seconds to load)
1 example, 0 failures

Randomized with seed 53862

Finished: SUCCESS
```
