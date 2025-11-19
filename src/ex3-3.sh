#!/bin/bash

# 1. 점수 입력 받기
echo -n "첫 번째 과목 점수: "
read score1
echo -n "두 번째 과목 점수: "
read score2

# 입력값 확인
if [ -z "$score1" ] || [ -z "$score2" ]; then
    echo "오류: 점수를 모두 입력해야 합니다."
    exit 1
fi

# 2. 등급 판단 함수 (90 이상 A, 미만 B)
get_grade() {
    # bc로 비교 (참이면 1, 거짓이면 0)
    if [ $(echo "$1 >= 90" | bc) -eq 1 ]; then
        echo "A"
    else
        echo "B"
    fi
}

# 3. 각 과목 등급 출력
grade1=$(get_grade $score1)
grade2=$(get_grade $score2)

echo "과목 1 등급: $grade1"
echo "과목 2 등급: $grade2"

# 4. 평균 계산 및 평균 등급 출력
# (점수 합계) / 2
avg=$(echo "scale=1; ($score1 + $score2) / 2" | bc)

# 평균 등급 확인
avg_grade=$(get_grade $avg)

echo "평균 등급: $avg_grade"
