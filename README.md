# docker_hands_on
도커 핸즈온

![docker](./flow.png)

Hands On 단계

centos 내에서 아래 단계 실행.

step 1.
 centos /home/docker 폴더 생성후 아래 폴더와 하위의 모든 파일들을 centos 로 옮긴다. 
 
 prod
 tomcat-base
 web-base 
 
step 2. 도커설치
 yum install docker -y
 service docker start
 ps -ef | grep docker
 chkconfig docker on 	//--부팅했을 때 docker 서비스 자동으로 실행

step 3. 로컬 저장소 생성
 sudo docker pull registry:latest
 sudo docker run -d -p 5000:5000 --name local-registry -v /tmp/registry:/tmp/registry registry

step 4. web-base 이미지 생성
 web-base 내의 docker_build.sh 구동하여 도커이미지를 생성한다.
 
step 5. tomcat-base 이미지 생성
 tomcat-base 내의 docker_build.sh 구동하여 도커이미지를 생성한다.

step 6. prod 배포 이미지 생성
 prod 내의 docker_build.sh 구동하여 도커이미지를 생성한다.
 
step 7. prod 이미지를 구동한다. (컨테이너 생성)
 prod 내의 prod_deploy.sh 구동하여 도커 컨테이너를 생성한다. (아파치, 톰캣이 구동됨)

step 8. 테스트
   http://centos아이피/index.html http://centos아이피/index.jsp 테스트 해본다.

step 9. 테스트
 prod 내의 index.html, index.jsp 를 수정해 가면서 step 6, step 7, step 8 를 다시 실행하여 테스트 해본다.
