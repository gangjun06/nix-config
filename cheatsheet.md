# Neovim 단축키 치트시트

현재 설정된 LazyVim 기반 Neovim 환경의 상세한 플러그인별 단축키 모음입니다.

## 기본 설정 정보

- **기본 리더 키**: `<Space>` (스페이스)
- **테마**: Catppuccin Mocha
- **클립보드**: 시스템 클립보드 비활성화 (`""`)
- **마우스**: 비활성화
- **분할**: 아래쪽/오른쪽 기본

---

## 🚀 LazyVim 기본 단축키

### 파일 탐색 (Telescope)
```
<leader>ff        파일 찾기 (Find Files)
<leader>fg        실시간 grep 검색 (Live Grep)
<leader>fb        버퍼 목록 (Buffers)
<leader>fr        최근 파일 (Recent Files)
<leader>fc        명령어 히스토리 (Command History)
<leader>fh        도움말 태그 (Help Tags)
<leader>fk        키맵 (Keymaps)
<leader>fo        이전 파일들 (Old Files)
<leader>fw        현재 단어 검색 (Word under cursor)
<leader>fW        현재 단어 검색 (WORD under cursor)
<leader>fp        플러그인 파일 (Plugin Files) [커스텀]
```

### 파일 탐색기 (Neo-tree)
```
<leader>e         파일 탐색기 토글 (Explorer)
<leader>E         파일 탐색기 토글 (현재 파일 기준)
<leader>fe        파일 탐색기 (Telescope)
<leader>fE        파일 탐색기 CWD (Telescope)
```

### Git 통합 (LazyGit & Gitsigns)
```
<leader>gg        LazyGit 열기
<leader>gG        LazyGit (현재 파일의 repo)
<leader>gf        LazyGit 현재 파일 히스토리
<leader>gl        LazyGit 로그
<leader>gb        Git blame 라인
<leader>gB        Git blame 파일
<leader>gd        Git diff
<leader>gh        Git hunk 정보 (Hover)

# Gitsigns (Git Hunk 조작)
]c            다음 git hunk
[c            이전 git hunk
<leader>hs    Git hunk stage
<leader>hr    Git hunk reset
<leader>hu    Git hunk undo stage
<leader>hp    Git hunk preview
<leader>hd    Git hunk diff
<leader>hD    Git hunk diff (cached)
<leader>hb    Git blame line
<leader>hB    Git blame toggle
```

### 버퍼 관리
```
<S-h>             이전 버퍼
<S-l>             다음 버퍼
<leader>bb        버퍼 목록 (토글)
<leader>bd        버퍼 삭제
<leader>bD        버퍼 삭제 (다른 것들)
<leader>bo        다른 버퍼들 닫기
<leader>bp        이전 버퍼로 핀 토글
<leader>bP        핀된 버퍼 삭제
<leader>br        버퍼명 변경
```

### 윈도우 분할
```
<leader>w         윈도우 명령어들
<leader>wd        윈도우 삭제
<leader>w-        수평 분할
<leader>w|        수직 분할
<leader>ww        다른 윈도우로 이동
<C-h>             왼쪽 윈도우 포커스
<C-j>             아래쪽 윈도우 포커스
<C-k>             위쪽 윈도우 포커스
<C-l>             오른쪽 윈도우 포커스
```

### 윈도우 크기 조절
```
<C-Up>            수평 크기 증가
<C-Down>          수평 크기 감소
<C-Left>          수직 크기 감소
<C-Right>         수직 크기 증가
```

---

## 🔧 LSP (Language Server Protocol)

### 코드 네비게이션
```
gd                정의로 이동 (Go to Definition)
gr                참조 찾기 (References)
gI                구현으로 이동 (Implementation)
gy                타입 정의로 이동 (Type Definition)
gD                선언으로 이동 (Declaration)
K                 호버 정보 (Hover)
gK                시그니처 도움말 (Signature Help)
<C-k>             시그니처 도움말 (Insert 모드)
```

### 코드 수정
```
<leader>ca        코드 액션 (Code Action)
<leader>cA        소스 액션 (Source Action)
<leader>cc        코드 액션 실행 (Run Codelens)
<leader>cC        코드 액션 새로고침 (Refresh Codelens)
<leader>cr        이름 바꾸기 (Rename)
<leader>cR        이름 바꾸기 (All workspaces)
```

### 진단 (Diagnostics)
```
<leader>cd        라인 진단 (Line Diagnostics)
<leader>cD        워크스페이스 진단 (Workspace Diagnostics)
]d                다음 진단
[d                이전 진단
]e                다음 에러
[e                이전 에러
]w                다음 경고
[w                이전 경고
```

### 포매팅
```
<leader>cf        포맷 (Format)
<leader>cF        포맷 (Insert 모드)
```

---

## 🎯 활성화된 플러그인별 단축키

### AI Copilot
```
<Tab>             제안 수락 (completion 메뉴가 닫혀있을 때)
<M-]>             다음 제안
<M-[>             이전 제안
<M-Bslash>        제안 해제
<M-Right>         단어 수락
<M-C-Right>       라인 수락

# Copilot 패널
<leader>ap        Copilot 패널 토글
<leader>ar        Copilot 새로고침
<leader>as        Copilot 요약
<leader>ad        Copilot 진단 설명
```

### Flash.nvim (빠른 이동)
```
s                 플래시 점프 (Normal, Visual, Operator 모드)
S                 플래시 트리시터 (Treesitter)
r                 원격 플래시 (Operator 모드)
R                 트리시터 검색 (Operator/Visual 모드)
<C-s>             토글 플래시 검색 (Command 모드)
```

### Dial.nvim (숫자/날짜 증감)
```
<C-a>             증가 (Normal 모드)
<C-x>             감소 (Normal 모드)
g<C-a>            증가 (Visual 모드)
g<C-x>            감소 (Visual 모드)
```

### Mini.surround (텍스트 객체 감싸기)
```
sa{motion}{char}  추가 (Add surrounding)
sd{char}          삭제 (Delete surrounding)
sf{char}          찾기 (Find surrounding)
sh{char}          하이라이트 (Highlight surrounding)
sr{char}{char}    바꾸기 (Replace surrounding)
sn                마지막 작업 업데이트 (Update last search)
```

### Project.nvim (프로젝트 관리)
```
<leader>fp        프로젝트 목록
```

### Mini.hipatterns (패턴 하이라이트)
자동으로 작동:
- 16진수 색상 코드 하이라이트
- TODO, FIXME, HACK, NOTE 등 주석 하이라이트

---

## 🛠️ 언어별 특화 기능

### TypeScript/JavaScript
```
<leader>co        Import 정리 (Organize Imports)
<leader>cM        모든 missing imports 추가
<leader>cu        사용하지 않는 imports 제거
<leader>cD        TypeScript 진단 필터 토글
```

### Rust (rustaceanvim)
```
<leader>cR        Runnables
<leader>cE        Expand macro
<leader>cm        Move item up/down
<leader>cg        View hir/mir
<leader>cJ        Join lines
```

### Go
```
<leader>ci        GoInstallDeps
<leader>ct        GoMod tidy
<leader>ca        GoTestAdd
<leader>cA        GoTestsAll
<leader>ce        GoTestsExp
<leader>cg        GoGenerate
<leader>cf        GoFillStruct
<leader>cj        GoTagAdd json
<leader>cJ        GoTagRm json
```

### Docker
Dockerfile, docker-compose.yml 파일에서 LSP 지원

### Nix
```
<leader>cf        Nix 포맷팅 (alejandra)
```

---

## 🔍 검색 및 바꾸기 (Grug-far)

```
<leader>sr        검색 및 바꾸기
<leader>sw        현재 단어 검색 및 바꾸기
<leader>sf        현재 파일에서 검색 및 바꾸기
<leader>sc        비주얼 선택 검색 및 바꾸기
<leader>sg        검색 및 바꾸기 재시작
```

---

## 🖥️ 터미널

```
<leader>ft        터미널 (Root 디렉토리)
<leader>fT        터미널 (현재 디렉토리)
<C-/>             터미널 토글 (Floating)
<C-_>             터미널 토글 (같은 키, 일부 터미널에서)
<Esc><Esc>        터미널 Normal 모드 (터미널 내에서)
```

---

## 🎨 UI 및 토글

### 일반 토글
```
<leader>uf        포맷 토글 (자동 포맷)
<leader>uF        글로벌 포맷 토글
<leader>us        맞춤법 검사 토글
<leader>uw        단어 래핑 토글
<leader>uL        상대 라인 번호 토글
<leader>ul        라인 번호 토글
<leader>ud        진단 토글
<leader>uc        Conceallevel 토글
<leader>uh        inlay hints 토글
<leader>uT        Treesitter 하이라이트 토글
<leader>ub        배경 토글
<leader>ux        문법 하이라이트 토글
```

### Trouble (진단 패널)
```
<leader>xx        Trouble 토글
<leader>xX        Trouble 토글 (워크스페이스)
<leader>xL        Location List (Trouble)
<leader>xQ        Quickfix List (Trouble)
```

### 스크롤
```
<C-f>             아래로 스크롤 (floating windows)
<C-b>             위로 스크롤 (floating windows)
```

---

## 📝 에디팅

### 자동완성 (Blink.cmp)
```
<Tab>             다음 항목 / 스니펫 점프
<S-Tab>           이전 항목 / 스니펫 백점프
<C-b>             문서 위로 스크롤
<C-f>             문서 아래로 스크롤
<C-Space>         완성 토글
<C-e>             완성 중단
<CR>              선택 확인
```

### 스니펫
```
<Tab>             다음 스니펫 위치
<S-Tab>           이전 스니펫 위치
<C-j>             스니펫 다음 선택
<C-k>             스니펫 이전 선택
```

---

## 🔗 Which-key (도움말)

```
<leader>          리더 키 조합 표시
g                 'g' 키 조합 표시
z                 'z' 키 조합 표시
]                 ']' 키 조합 표시 (다음)
[                 '[' 키 조합 표시 (이전)
"                 레지스터 표시
<C-w>             윈도우 명령어 표시
```

---

## 🌟 추가 기능

### 세션 관리 (Persistence)
```
<leader>qs        세션 복원 (현재 디렉토리)
<leader>ql        마지막 세션 복원
<leader>qd        세션 중지 (저장하지 않음)
```

### LazyVim 관리
```
<leader>l         LazyVim 메뉴
<leader>L         LazyVim changelog
```

### 시작 시간 측정
```
<leader>st        시작 시간 표시 (vim-startuptime)
```

### Markdown 미리보기
```
<leader>cp        Markdown 미리보기 토글 (.md 파일에서)
```

---

## 🎮 VSCode 통합 모드

VSCode에서 사용 시 제한된 플러그인으로 실행:
- Flash.nvim (빠른 이동)
- nvim-surround (텍스트 감싸기)

### VSCode 전용 단축키
```
s                 Flash 점프 (VSCode에서도 동일)
sa/sd/sr          Surround 명령어들 (VSCode에서도 동일)
```

---

## 💡 팁과 요령

1. **리더 키 조합**: `<leader>` 누른 후 잠시 기다리면 which-key가 가능한 조합들을 표시
2. **도움말**: `:help` 명령어로 상세 도움말 확인
3. **플러그인 관리**: `:Lazy` 명령어로 플러그인 관리 UI 접근
4. **Mason**: `:Mason` 명령어로 LSP 서버, 포매터, 린터 관리
5. **건강 체크**: `:checkhealth` 명령어로 설정 상태 확인

---

## 🛠️ 문제 해결

### 플러그인 관련
```
:Lazy update      플러그인 업데이트
:Lazy clean       사용하지 않는 플러그인 정리
:Lazy restore     lazy-lock.json에서 복원
```

### LSP 관련
```
:LspInfo          LSP 서버 상태 확인
:LspRestart       LSP 서버 재시작
:Mason            LSP 도구 관리
```

### 진단 관련
```
:lua vim.diagnostic.reset()     진단 리셋
:lua vim.diagnostic.show()      진단 표시
```