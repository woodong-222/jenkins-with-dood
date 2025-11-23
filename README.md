# Jenkins with Docker (DooD) Custom Image

이 프로젝트는 **Docker 컨테이너 안에서 Docker를 사용할 수 있는(DooD)** 젠킨스 커스텀 이미지입니다.

---

## 이미지 사용

`docker-compose.yml` 작성
```yml
services:
  jenkins:
    image: woo204/jenkins-with-dood:latest
    container_name: jenkins
    restart: unless-stopped
    user: root
    ports:
      - "20831:8080"
      - "50000:50000"
    volumes:
      - ./jenkins_home:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
```

`docker-compose.yml`이 있는 디렉토리에서 명령어 실행
```bash
docker compose up -d
```

## 이미지 빌드 및 푸시
이 `Dockerfile`을 수정하거나 직접 빌드해서 Docker Hub에 올리는 방법입니다.

```bash
docker login

# 형식: docker build -t <ID>/<이미지명>:<태그> .
docker buildx build --push -t woo204/jenkins-with-dood:latest .
```