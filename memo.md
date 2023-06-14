포트폴리오 관련 메모

VO 클래스 : 테이블 기반
DTO 클래스 : 메소드 호출할 때 값을 전달하는 파라미터

bootstrap 사용하여 화면 구성 시 화면 깨지면
개발자 도구 - network에서 새로고침하여 어떤 파일에 문제가 있는지 확인 후
source에서 페이지 소스 보기에서 해당 파일 링크 확인하여 jsp 파일의 경로 대체

화면 상단, 하단, 사이드바 등 공통,반복적으로 사용하는 디자인 요소는 별도의 jsp파일을 만들어 관리한다.

Lombok 사용시 @Inject 대체
@Setter(onMethod_ = {@Autowired}) // jdk 1.8 _ 언더바 사용

ResponseEntity 사용하는 목적
1. 확인용 http 상태코드 보낼 수 있음
2. header 작업 가능 ex) type - json

메일발송
- pom.xml : 2개 라이브러리
SMTP Mail Server
구글 보안 설정 - 2단계 인증 - 앱 비밀번호 - 기타 : 인증번호 생성
web.xml에 email관련 xml 경로 설정

checkbox 기본 설정 : 체크=on, 체크X=null. 임의값 설정 원하면 value 추가

jsp에 파라미터가 존재하지만 값이 없을 경우 null이 아니라 공백으로 처리됨

pom.xml에 라이브러리 추가한 후에는 기본적으로 bean을 등록해서 사용한다

DAO : Mapper와 비슷한 개념으로 쓰이는 클래스

파일 첨부 시 form 태그의 enctype 추가(변경)해야 함.

파일 업로드 기능 1) 스프링 자체 제공 : 3.1버전부터 가능 2) 외부 라이브러리 이용 commons-fileupload. ex01 참조

서버측에 파일 경로를 보낼 때 역슬래시(\)를 인식 못하는 문제 발생. 역슬래시를 슬래시로 바꿔줘야 한다.

<data-이름="값"> 을 이용하여 태그에 값을 숨겨둘 수 있다. 자바스크립트에서 data("이름")으로 호출가능

체크박스에는 attr을 사용할 수 없다. prop 사용

Controller GetMapping에 produces = {MediaType.APPLICATION_JSON_UTF8_VALUE이 있으면 자바스크립트 $.getJSON에서 url을 받을 때 마지막에 ".json"을 추가해야한다.

ajax 작업 후에는 해당 선택자를 이용할 수 없다. ajax 작업 하기 전에 미리 선택자를 이용한 작업 위치를 변수로 저장해둔 후에 그 변수를 이용하는 방법 사용.
(참고 : 주문상세 상품 삭제 - ajax로 데이터 삭제 후 화면 출력단에서 해당 행 제거)

날짜 범위 검색할 때는 끝나는 날짜에 <= 하면 안되고 < '끝나는 날짜' + 1로 검색해야함. 날짜 기준이 00:00이기 때문에 <=로 검색 시 제외되는 범위 발생.

jackson databind : 리턴값을 json형태로 변환
google json-simple(gson) : 데이터를 json형태로 만드는 역할

독립적인 프로젝트(개인프로젝트)

1) 원격 리포지터리 복사(Clone)를 이용한 방식
	- 깃헙사이트 : 리포지터리 생성
	https://github.com/Philarl/testmall01.git
	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
	
	c:\gittest 폴더생성 및 이동
	Git Bash or 명령프롬프트
	git clone https://github.com/Philarl/testmall01.git
	cd testmall01
	파일작업
	git add 파일명 or git add .
	git commit -m "comment"
	
	git remote -v // 원격 리포지터리 이름 origin 확인
	git push origin master
	
2) 로컬 리포지터리를 이용한 방식

	Remote 리포지터리 생성
	깃헙 사이트 : 리포지터리 생성. 인증토큰 생성.
	https://github.com/Philarl/testmall01.git
	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
	
echo "# testmall01" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Philarl/testmall01.git
git push -u origin main

어플리케이션 배포
VMware Workstation Pro에서 server 스냅샷 설정 (스냅샷 있는 경우)
VMware Workstation Player server에서 작업
apt-get update
apt-get install openjdk-8-jdk
apt-get install -y openjdk-8-jre
java -version
javac -version


cd /
cd /usr/lib/jvm/java-8-openjdk-amd64
vi ~/.bashrc

입력
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export CATALINA_HOME=/usr/local/tomcat/tomcat-9
export PATH="$PATH:$JAVA_HOME/bin;$CATALINA_HOME/bin;"

source ~/.bashrc

확인
$JAVA_HOME

cd /usr/local/

mkdir tomcat

cd tomcat

wget tomcat9 download url
tar -xvzf apach TAB키사용

mv apachTAB키사용 tomcat-9

vi ~/.bashrc 
입력
export CATALINA_HOME=/usr/local/tomcat/tomcat-9

source ~/.bashrc

cd tomcat-9

ls

vi conf/server.xml 편집할 것 


cd ..
ls -l
webapps 폴더 권한 확인

chmod -R 777 webapps

./bin/startup.sh

ps aux | grep tomcat 서비스 상태 확인


브라우저 : 127.0.0.1:8080

ckeditor 관련 작업
web.xml, servlet-context.xml의 ckeditor 업로드 관련 폴더 경로 변경(윈도우->리눅스)

tomcat conf 폴더에서 vi server.xml
</Host> 안에
<Context path="ckeditor/upload" "docBase=/usr/local/tomcat/tomcat-9/webapps/upload" reloadable="false"></Context>

스프링 mvc 프레임워크 배포
-war
패키징 작업
spring - 프로젝트 - run as - maven clean (기존 war 삭제)
maven install

스프링 부트
-war
-jar