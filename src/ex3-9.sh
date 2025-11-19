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
    echo "3) 팀원 검색 (이름으로 검색)"
    echo "4) 수행 내용 검색 (날짜로 검색)"
    echo "5) 종료"
    echo "----------------------------------------"
    echo -n "메뉴 선택: "
    read choice

    case $choice in
        1)
            # 1. 팀원 정보 추가
            echo -n "이름: "
            read name
            
            echo -n "생일 (없으면 Enter): "
            read birth
            
            echo -n "전화번호 (없으면 Enter): "
            read phone

            info_str=""
            if [ -n "$birth" ]; then
                info_str="$info_str 생일:$birth"
            fi
            if [ -n "$phone" ]; then
                info_str="$info_str 전화번호:$phone"
            fi

            echo "[INFO] $name : $info_str" >> "$DB_FILE"
            echo ">>> 팀원 정보가 저장되었습니다."
            ;;
        2)
            # 2. 활동 기록
            echo -n "날짜(YYYY-MM-DD): "
            read date
            echo -n "누구와 함께 했나요? (이름): "
            read who
            echo -n "내용: "
            read content
            
            echo "[LOG] $date : $who : $content" >> "$DB_FILE"
            echo ">>> 활동 내용이 저장되었습니다."
            ;;
        3)
            # 3. 이름 검색
            echo -n "검색할 팀원 이름: "
            read q_name
            echo "================ 검색 결과 ================"
            grep -i "$q_name" "$DB_FILE"
            echo "==========================================="
            ;;
        4)
            # 4. 날짜 검색 (중복 제거 로직 추가)
            echo -n "검색할 날짜(YYYY-MM-DD): "
            read q_date
            echo "================ 활동 내역 ================"
            grep "$q_date" "$DB_FILE"
            
            echo "-------------- 참여 팀원 정보 --------------"
            # 중복 제거: sort -u 를 추가하여 같은 이름은 한 번만 검색
            grep "$q_date" "$DB_FILE" | awk -F ' : ' '{print $2}' | sort -u | while read member_name; do
                clean_name=$(echo $member_name | xargs)
                # 정보가 여러 줄일 경우도 대비
                grep "\[INFO\] $clean_name" "$DB_FILE"
            done
            echo "==========================================="
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "잘못된 입력입니다."
            ;;
    esac
    echo ""
done
