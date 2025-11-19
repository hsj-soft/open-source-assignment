#!/bin/bash

echo ">>> DB 폴더 작업 시작"

# 1. DB 폴더 확인 및 생성
if [ ! -d "DB" ]; then
    mkdir DB
fi

# 2. 파일 5개 생성 (file1~5.txt)
for i in {1..5}; do
    echo "내용 $i" > "DB/file$i.txt"
done
echo "파일 5개 생성 완료"

# 3. 압축하기 (files.tar)
# -c: 생성, -v: 과정출력, -f: 파일지정
tar -cvf DB/files.tar DB/file*.txt
echo "압축 완료"

echo ">>> train 폴더 작업 시작"

# 4. train 폴더 생성
if [ ! -d "train" ]; then
    mkdir train
fi

# 5. 심볼릭 링크 생성
# ln -s [원본위치] [링크이름]
# 주의: train 폴더 입장에서 원본은 한 단계 위(..)의 DB 폴더에 있음
for i in {1..5}; do
    ln -s ../DB/file$i.txt train/link_file$i.txt
done

echo "링크 생성 완료. 결과 확인:"
echo "--------------------------"
ls -l train/
