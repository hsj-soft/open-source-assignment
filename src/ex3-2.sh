#!/bin/bash

echo -n "x값을 입력하세요: "
read x

if [ -z "$x" ]; then
    echo "오류: 값을 입력해야 합니다."
    exit 1
fi

# 소수점 5자리까지 계산하도록 지정 (이유는 모르겠으나 10.5를 넣었을때 자꾸 54.6으로 계산값이 틀리게 나옴)
result=$(echo "scale=5; 0.5 * $x * $x" | bc)

echo "x가 $x 일 때, y = $result 입니다."
