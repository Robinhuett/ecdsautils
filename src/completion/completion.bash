_ecdsautil_args() {
  case ${prev} in 
    (sign)
      COMPREPLY=( $(compgen -f -- ${cur}) )
      ;;
    (verify)
      #-s -p -n files
      ;;
  esac
}

_ecdsautil()
{
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="help generate-key show-key sign verify"

  case "${#COMP_WORDS[@]}" in
    ("2")
      COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
      ;;
    (*)
      _ecdsautil_args
      ;;
  esac
}

complete -F _ecdsautil ecdsautil
