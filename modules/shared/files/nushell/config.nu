# config.nu

# Common ls aliases and sort them by type and then name
# Inspired by https://github.com/nushell/nushell/issues/7190
def lla [...args] { ls -la ...(if $args == [] {["."]} else {$args}) | sort-by type name -i }
def la  [...args] { ls -a  ...(if $args == [] {["."]} else {$args}) | sort-by type name -i }
def ll  [...args] { ls -l  ...(if $args == [] {["."]} else {$args}) | sort-by type name -i }
def l   [...args] { ls     ...(if $args == [] {["."]} else {$args}) | sort-by type name -i }

# Completions
# mainly pieced together from https://www.nushell.sh/cookbook/external_completers.html

# carapce completions https://www.nushell.sh/cookbook/external_completers.html#carapace-completer
# + fix https://www.nushell.sh/cookbook/external_completers.html#err-unknown-shorthand-flag-using-carapace
# enable the package and integration bellow
let carapace_completer = {|spans: list<string>|
  carapace $spans.0 nushell ...$spans
  | from json
  | if ($in | default [] | where value == $"($spans | last)ERR" | is-empty) { $in } else { null }
}
# some completions are only available through a bridge
# eg. tailscale
# https://carapace-sh.github.io/carapace-bin/setup.html#nushell
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'

# # fish completions https://www.nushell.sh/cookbook/external_completers.html#fish-completer
# let fish_completer = {|spans|
#   ${lib.getExe pkgs.fish} --command $'complete "--do-complete=($spans | str join " ")"'
#   | $"value(char tab)description(char newline)" + $in
#   | from tsv --flexible --no-infer
# }

# zoxide completions https://www.nushell.sh/cookbook/external_completers.html#zoxide-completer
let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
}

# multiple completions
# the default will be carapace, but you can also switch to fish
# https://www.nushell.sh/cookbook/external_completers.html#alias-completions
let multiple_completers = {|spans|
  ## alias fixer start https://www.nushell.sh/cookbook/external_completers.html#alias-completions
  let expanded_alias = scope aliases
  | where name == $spans.0
  | get -i 0.expansion

  let spans = if $expanded_alias != null {
    $spans
    | skip 1
    | prepend ($expanded_alias | split row ' ' | take 1)
  } else {
    $spans
  }
  ## alias fixer end

  match $spans.0 {
    __zoxide_z | __zoxide_zi => $zoxide_completer
    _ => $carapace_completer
  } | do $in $spans
}

$env.config = {
  show_banner: false,
  completions: {
    case_sensitive: false # case-sensitive completions
    quick: true           # set to false to prevent auto-selecting completions
    partial: true         # set to false to prevent partial filling of the prompt
    algorithm: "fuzzy"    # prefix or fuzzy
    external: {
      # set to false to prevent nushell looking into $env.PATH to find more suggestions
      enable: true 
      # set to lower can improve completion performance at the cost of omitting some options
      max_results: 100 
      completer: $multiple_completers
    }
  }
} 
$env.PATH = ($env.PATH | 
  split row (char esep) |
  append /usr/bin/env
)

# ----------

$env.PATH = ($env.PATH | 
  split row (char esep) |
  append /usr/bin/env
)

$env.GPG_TTY = (tty)
$env.ZSH = ($env.HOME + "/.oh-my-zsh")
$env.NVM_DIR = ($env.HOME + "/.nvm")
$env.PKG_CONFIG_PATH = "/opt/homebrew/opt/curl/lib/pkgconfig"
$env.PNPM_HOME = ($env.HOME + "/Library/pnpm")
$env.BUN_INSTALL = ($env.HOME + "/.bun")
$env.HOMEBREW_EDITOR = "nvim"

$env.PATH = ($env.PATH |
  prepend "/Users/gangjun/go/bin" |
  prepend "/Users/gangjun/.local/share/fig/plugins/git-open" |
  prepend "/Users/gangjun/miniforge3/condabin" |
  prepend "/opt/homebrew" |
  prepend "/opt/mysql-client/bin" |
  prepend "/opt/homebrew/opt/pcsc-lite/sbin" |
  prepend "/opt/homebrew/opt/pcsc-lite/bin" |
  prepend "/Users/gangjun/.nvm/versions/node/v16.13.0/bin" |
  prepend "/Library/Frameworks/Python.framework/Versions/3.10/bin" |
  prepend "/opt/homebrew/bin" |
  prepend "/opt/homebrew/sbin" |
  prepend "/usr/local/bin" |
  prepend "/usr/bin" |
  prepend "/bin" |
  prepend "/usr/sbin" |
  prepend "/sbin" |
  prepend "/Users/gangjun/.cargo/bin" |
  prepend "/Users/gangjun/.fig/bin" |
  prepend "/Users/gangjun/.local/bin" |
  prepend "/Users/gangjun/.yarn/bin" |
  prepend "/opt/homebrew/opt/libpq/bin" |
  prepend "$BUN_INSTALL/bin" |
  prepend $"($env.PNPM_HOME)" |
  prepend "/opt/homebrew/opt/curl/bin" |
  prepend "/Users/gangjun/.spicetify" |
  prepend "/Users/gangjun/Library/Python/3.9/bin"
)

# Nix integration
source ~/.config/nushell/apply-nix.nu
$env.PATH = ($env.PATH |
  prepend "/nix/var/nix/profiles/default/bin" |
  prepend $"/etc/profiles/per-user/(whoami)/bin" |
  prepend "/run/current-system/sw/bin" |
  prepend $"($env.HOME)/.nix-profile/bin"
)

# Apply git alias
source ~/.config/nushell/git-alias.nu


# NVM initialization
def load-nvmrc [] {
  let node_version = (nvm version)
  let nvmrc_path = (nvm_find_nvmrc)

  if ($nvmrc_path != null) {
    let nvmrc_node_version = (nvm version ((cat $nvmrc_path).out))

    if ($nvmrc_node_version == "N/A") {
      nvm install --silent
    } else if ($nvmrc_node_version != $node_version) {
      nvm use --silent
    }
  } else if ($node_version != (nvm version default)) {
    nvm use default --silent
  }
}