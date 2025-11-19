#!/bin/bash

# 파일이 있는지 확인
if [ ! -f "src/my_prog.py" ]; then
    echo "오류: src/my_prog.py 파일이 없습니다."
    exit 1
fi

echo "셸 스크립트에서 Python 프로그램을 호출합니다."

# 파이썬 스크립트 실행
python3 src/my_prog.py "$@"

