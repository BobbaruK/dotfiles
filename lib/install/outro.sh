
outro() {
  PS3="Bravo boss! Ai $1 tot. Acum tre' sa alegi ce vrei sa faci cu viata ta: "

  select opt in "Logout" "Quit"; do
    case $opt in
      "Logout")
        pkill -KILL -u "$USER"
        break
        ;;

      "Quit")
        echo -e "\n$BG_GREEN Fucking quitter! $RESET\n"
        break
        ;;

      *)
        echo "Opțiune invalidă"
        ;;
    esac
  done
}

outro_install() {
  outro "instalat"
}

outro_uninstall() {
  outro "dezinstalat"
}
