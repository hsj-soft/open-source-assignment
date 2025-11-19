#!/bin/bash

DB_FILE="DB.txt"

# DB 파일이 없으면 생성
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

while true; do
    echo "----------------------------------------"
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "----------------------------------------"
    echo -n "메뉴 선택: "
    read choice

    case $choice in
        1)
            echo -n "이름: "
            read name
            echo -n "정보(생일 또는 전화번호): "
            read info
            # 파일 끝에 내용 추가 (append)
            echo "[INFO] $name : $info" >> "$DB_FILE"
            echo "저장되었습니다."
            ;;
        2)
            echo -n "날짜(YYYY-MM-DD): "
            read date
            echo -n "내용: "
            read content
            echo "[LOG] $date : $content" >> "$DB_FILE"
            echo "저장되었습니다."
            ;;
        3)
            echo -n "검색할 팀원 이름: "
            read query
            echo ">>> 검색 결과:"
            # 대소문자 구분 없이(-i) 검색
            grep -i "$query" "$DB_FILE"
            ;;
        4)
            echo -n "검색할 날짜 또는 내용: "
            read query
            echo ">>> 검색 결과:"
            grep -i "$query" "$DB_FILE"
            ;;
        5)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "잘못된 입력입니다."
            ;;
    esac
    echo ""
done
