#!/bin/bash

# 1. 환경변수 등록 단계
# .bashrc 파일에 환경변수를 등록하여 자식 셸에서도 인식되도록 함
echo "[1] $HOME/.bashrc 에 MYENV 추가"

# 기존 설정 초기화 후 등록 (중복 방지)
sed -i '/export MYENV=/d' ~/.bashrc
echo 'export MYENV="Hello Shell"' >> ~/.bashrc

# 현재 셸에도 즉시 적용
export MYENV="Hello Shell"
echo "현재 셸 \$MYENV='$MYENV'"


# 2. [조건1 확인] 임의의 셸 파일(서브셸)에서 변수 값이 유지됨을 확인
# bash -ic 명령어로 새로운 대화형 셸을 띄워 .bashrc가 잘 적용되었는지 테스트
echo "[2] 서브셸에서 값 유지 확인"
bash -ic 'echo ">>> subshell MYENV=$MYENV"' 2>/dev/null


# 3. [조건2 확인] 환경변수를 해제하면, 유지되지 않음을 확인
echo "[3] 해제 테스트 (unset)"
unset MYENV

# 현재 셸에서 값이 사라졌는지 확인
if [ -z "$MYENV" ]; then
    echo ">>> 현재 셸 after unset: '<unset>' (성공: 값이 사라짐)"
else
    echo ">>> 현재 셸 after unset: '$MYENV' (실패)"
fi

# 뒷정리: 테스트가 끝났으니 파일에서 설정을 지웁니다.
sed -i '/export MYENV=/d' ~/.bashrc
