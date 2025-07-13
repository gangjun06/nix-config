# Neovim Configuration

본 문서는 Nix 설정에 포함된 Neovim 구성에 대한 상세한 설명입니다.

## 개요

이 Neovim 설정은 **Nix와 LazyVim의 하이브리드 접근법**을 사용하여 현대적인 개발 환경을 제공합니다:
- Nix를 통한 Neovim 설치 및 인프라 관리
- LazyVim을 통한 플러그인 및 설정 관리
- VSCode 통합 지원

## 파일 구조

```
modules/shared/
├── home/nvim.nix          # Nix 통합 설정
└── files/nvim/            # Neovim 설정 파일들
    ├── init.lua           # 진입점
    ├── stylua.toml        # Lua 포매터 설정
    ├── lazyvim.json       # LazyVim extras 구성
    └── lua/
        ├── config/
        │   ├── lazy.lua   # Lazy.nvim 부트스트랩
        │   └── options.lua # 에디터 옵션
        ├── plugins/
        │   ├── colorschema.lua # 테마 설정
        │   └── lsp.lua    # LSP 구성
        └── vscode/
            └── init.lua   # VSCode 통합
```

## 주요 기능

### 언어 지원
LazyVim extras를 통해 다음 언어들을 지원합니다:

- **웹 개발**: TypeScript, JavaScript, Astro
- **시스템 프로그래밍**: Rust, Go, Nix  
- **마크업**: Markdown, JSON, YAML, TOML
- **DevOps**: Docker
- **AI 통합**: GitHub Copilot

### 코드 품질 도구

#### 포매팅
- **Prettier**: 웹 개발 파일용 (config 파일 불필요)
- **Stylua**: Lua 코드 포매팅 (2 spaces, 120 column width)

#### 린팅
- **ESLint**: JavaScript/TypeScript 린팅
- **Mason**: LSP 서버, 포매터, 린터 자동 설치

### 테마 구성

**기본 테마**: Catppuccin "mocha" 플레이버
```lua
-- modules/shared/files/nvim/lua/plugins/colorschema.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- mocha, macchiato, frappe, latte
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },
}
```

**대체 테마**: Tokyo Night, Habamax

## LSP 구성

### 주요 LSP 설정들
```lua
-- modules/shared/files/nvim/lua/plugins/lsp.lua
- Mason을 통한 Prettier 자동 설치
- 진단 virtual text 비활성화  
- 모노레포 지원을 위한 커스텀 root directory 패턴
- TypeScript 서버 포매팅 제어
- ESLint/Prettier 통합
```

### 에디터 옵션
```lua
-- modules/shared/files/nvim/lua/config/options.lua
vim.opt.clipboard = ""        -- 시스템 클립보드 비활성화
vim.opt.scrolloff = 10        -- 10줄 스크롤 오프셋
vim.opt.tabstop = 2          -- 2 스페이스 들여쓰기
vim.opt.mouse = ""           -- 마우스 비활성화
vim.opt.splitbelow = true    -- 아래쪽으로 분할
vim.opt.splitright = true    -- 오른쪽으로 분할
```

## VSCode 통합

VSCode 환경에서 실행될 때 최소한의 플러그인만 로드:
- **Flash.nvim**: 빠른 내비게이션
- **nvim-surround**: 텍스트 객체 조작

## 설치 및 사용법

### Nix를 통한 설치
Neovim은 `modules/shared/home/nvim.nix`를 통해 자동으로 설치됩니다:

```nix
programs.neovim = {
  enable = true;
};
```

### 설정 파일 심볼릭 링크
설정 파일들은 Nix store에서 자동으로 심볼릭 링크됩니다:

```nix
home.file.".config/nvim" = {
  source = config.lib.file.mkOutOfStoreSymlink "${userConfig.nixConfig}/modules/shared/files/nvim";
  recursive = true;
};
```

### 명령어 별칭
셸에서 다음 별칭들을 사용할 수 있습니다:
- `vim` → `nvim`
- `v` → `nvim`

## 플러그인 관리

### Lazy.nvim 부트스트랩
LazyVim은 자동으로 부트스트랩되며, 플러그인들은 Lazy.nvim을 통해 관리됩니다.

### Mason 통합
LSP 서버, 포매터, 린터들은 Mason을 통해 자동으로 설치되고 관리됩니다.

## 커스터마이징

### 플러그인 추가
새로운 플러그인은 `modules/shared/files/nvim/lua/plugins/` 디렉토리에 추가하면 됩니다.

### LazyVim Extras 활성화
`lazyvim.json` 파일에서 원하는 extras를 추가/제거할 수 있습니다.

### 키바인딩
현재는 LazyVim 기본 키바인딩을 사용하고 있으며, 커스텀 키바인딩은 없습니다.

## 개발 워크플로우

1. **파일 편집**: `v <파일명>` 또는 `nvim <파일명>`
2. **프로젝트 탐색**: LazyVim의 내장 파일 탐색기 사용
3. **LSP 기능**: 자동 완성, 진단, 정의로 이동 등
4. **Git 통합**: Lazygit 통합 (`<leader>gg`)
5. **터미널**: 내장 터미널 (`<leader>ft`)

## 문제 해결

### 플러그인 업데이트
```vim
:Lazy update
```

### Mason 패키지 관리
```vim
:Mason
```

### LSP 정보 확인
```vim
:LspInfo
```

## 주의사항

- VSCode 통합을 사용할 때는 일부 기능이 제한됨