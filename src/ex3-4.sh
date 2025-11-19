#!/bin/bash

# 점수를 저장할 배열 선언
scores=()

echo "성적 관리 프로그램을 시작합니다."

# 무한 루프 (5번을 누르면 break로 탈출)
while true; do
    echo "" # 줄바꿈
    echo "1) 과목 성적 추가  2) 입력된 모든 점수 보기  3) 평균 점수 확인  4) 평균 등급(GPA) 변환  5) 종료"
    echo -n "메뉴 선택: "
    read choice

    case $choice in
        1)
            echo -n "추가할 점수 입력: "
            read score
            # 배열에 점수 추가
            scores+=($score)
            echo "점수가 추가되었습니다."
            ;;
        2)
            echo "현재 입력된 점수들: ${scores[@]}"
            ;;
        3)
            # 점수가 하나도 없으면 계산 불가
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
                continue
            fi

            # 합계 계산
            sum=0
            for s in "${scores[@]}"; do
                sum=$((sum + s))
            done

            # 평균 계산 (scale=1 사용)
            avg=$(echo "scale=1; $sum / ${#scores[@]}" | bc)
            echo "평균 점수: $avg"
            ;;
        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
                continue
            fi

            # 평균 다시 계산 (변수 재사용 또는 다시 계산)
            sum=0
            for s in "${scores[@]}"; do
                sum=$((sum + s))
            done
            avg=$(echo "scale=1; $sum / ${#scores[@]}" | bc)

            # 등급 판별 (90점 이상 A, 미만 B)
            if [ $(echo "$avg >= 90" | bc) -eq 1 ]; then
                echo "평균 등급: A"
            else
                echo "평균 등급: B"
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "잘못된 입력입니다. 1~5 사이의 숫자를 입력하세요."
            ;;
    esac
done
