outro() {
  echo -e "\n"

  echo -e "${BG_GREEN} Finished! $RESET"

  echo -e "\n"

  echo -e "Press ${BG_GREEN} Ctrl+C $RESET to ${UNDERLINE}abort${RESET}."

  for i in {10..0}; do
  echo -ne "\r${BG_RED} Executing pkill, killing all user processes $RESET ... $BG_RED $i $RESET"
    sleep 1
  done

  echo -e "\n"

  pkill -KILL -u "$USER"
}
