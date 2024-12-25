if ("/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" | path exists) {
    let bash_env = (bash -c 'source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh; env' | lines | split column '=')

    let current_env = ($env | transpose key value)
    let new_env = ($bash_env | each { |item| 
       let key = $item.column1
       let value = $item.column2

       if ($current_env | where key == $key | is-empty) {
           load-env { $key: $value }
       } else {
           return null
       }
    } | compact)

    # set Path

    let bash_env_path = ($bash_env | where column1 == PATH | get column2 | split row ':')
    let new_env_path = ($current_env | where key == PATH | get value.0)
    let path_diff_arr = ($bash_env_path | each { |path| 
        if ($new_env_path | where $it == $path | is-empty) {
            $path
        } else {
            null
        }
    } | compact)

    $env.PATH = ($env.PATH | append $path_diff_arr)
}