#!/usr/bin/env bash
LOGS="$HOME/.tmux/logs"
main() {
  local keystr cmdstr
  for orig in $( tmux list-keys | grep 'next-window' | grep -iv 'wheel' ); do
    keystr="$( awk '{printf '%s', $4}' <<< "$orig" )"
    cmdstr="$( awk '{printf '%s', $5}' <<< "$orig" )"
    [[ ! -d "$LOGS" ]] && mkdir -pv "$LOGS"
    printf "%s %s\n" "$keystr" "$cmdstr" >> "$LOGS"
  done
}
main

