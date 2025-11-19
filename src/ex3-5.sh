#!/bin/bash

echo "프로그램을 시작합니다."

# 1. 내부 함수 정의
my_function() {
    echo "함수 안으로 들어왔습니다."
    
    # 입력받은 인자($1)를 포함하여 명령어 문자열 생성
    cmd="ls $1"
    
    echo "실행할 명령어: $cmd"
    
    # 2. eval을 사용하여 문자열을 명령어로 실행
    eval $cmd
}

# 3. 사용자 입력 받기
echo -n "ls 명령어의 옵션을 입력하세요 (예: -l): "
read option

# 4. 함수 호출 (입력값을 인자로 전달)
my_function $option

echo "프로그램을 종료합니다."
