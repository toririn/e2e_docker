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

* fix `set_env.sh` your environment
  * (It can be used without changing)

* input cli

```
bash deploy.sh
```

* or deploy command yourself

```
bash set_env.sh
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

* push jenkins start button

### job setting

* install for SSH　PULUGIN

* build scripts setting

**ssh shell**

```
cd /usr/src/app
bundle install
bundle exec rspec spec/features/tests/test.feature
```

