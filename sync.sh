#!/bin/zsh
# datalaw.kr 의 표를 이 리포로 옮긴다. 수집기를 돌리고 site 를 빌드한 뒤에 실행한다.
# 사이트가 정본이고 이 리포는 배포판이다 — 여기서 CSV 를 손으로 고치지 말 것.
set -e
SITE=${SITE:-$HOME/projects/WORK/marketing/site}
REPO=${0:A:h}
[[ -d $SITE/public ]] || { echo "site/public 이 없다 — 먼저 hugo 빌드"; exit 1; }
for pair in \
  sanctions/pipc-sanctions mediation/mediation-cases \
  damages/damages-judgments timeline/law-timeline; do
  src="$SITE/public/${pair}.csv"; name="${pair:t}"
  [[ -f $src ]] || { echo "없음: $src"; continue; }
  cp "$src" "$REPO/data/${name}.csv"
  echo "sync: data/${name}.csv"
done
