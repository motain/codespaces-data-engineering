ze() {
  items=("ALBERTO" "MARLON" "VALERY")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Start Zellij " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  fi
  zellij attach --create $config
}
