#!/bin/bash
num1=$1
num2=$2

# 인자가 없는 경우 예외 처리
if [ -z "$num1" ] || [ -z "$num2" ]; then
    echo "오류: 두 개의 숫자를 입력해야 합니다."
    echo "사용법: ./src/ex3-1.sh [숫자1] [숫자2]"
    exit 1
fi

# 사칙연산 수행 (정수 범위)
echo "$num1 + $num2 = $((num1 + num2))"
echo "$num1 - $num2 = $((num1 - num2))"
echo "$num1 * $num2 = $((num1 * num2))"
echo "$num1 / $num2 = $((num1 / num2))"
