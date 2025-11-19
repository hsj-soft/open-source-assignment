#!/bin/bash

echo "----------------------------------------"
echo "1) 사용자 정보"
echo "2) GPU 또는 CPU 사용률 확인"
echo "3) 메모리 사용량 확인"
echo "4) 디스크 사용량 확인"
echo "5) 종료"
echo "----------------------------------------"
echo -n "확인할 정보의 번호를 입력하세요: "
read choice

case $choice in
    1)
        echo ">>> 사용자 정보:"
        whoami
        ;;
    2)
        echo ">>> GPU 및 CPU 사용률 확인 중..."
        
        # 1. GPU 확인
        if command -v nvidia-smi &> /dev/null; then
            echo "[GPU 상태]"
            nvidia-smi
        else
            echo "[GPU 상태] GPU를 찾을 수 없거나 드라이버가 없습니다."
        fi
        
        echo ""
        echo "[CPU 사용률]"
        # 대소문자 구분 없이 'cpu'가 들어간 줄 찾기
        cpu_info=$(top -b -n1 | grep -i "cpu" | head -n 1)
        
        if [ -z "$cpu_info" ]; then
            # top에서 정보를 못 찾으면 vmstat으로 대체
            echo "top 명령어 결과가 비어있어 vmstat으로 대체합니다:"
            vmstat 1 2
        else
            echo "$cpu_info"
        fi
        ;;
    3)
        echo ">>> 메모리 사용량:"
        free -h
        ;;
    4)
        echo ">>> 디스크 사용량:"
        df -h
        ;;
    5)
        echo "프로그램을 종료합니다."
        exit 0
        ;;
    *)
        echo "잘못된 입력입니다."
        ;;
esac
