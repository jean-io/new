#!/bin/bash

###########################################
#                                         #
#   Author (website)                      #
#   source                                #
#   License                               #
#                                         #
###########################################

function printHelp() {
  # Help Display
  # $1: if set and not empty, used as error code to exit

  echo "This is the help file"

  if [ ! -z "$1" ]; then
    exit $1
  fi
}

while [ $# -ge 1 ]; do
  is_option=0                 # Whether the current parameter is an option
  main_part=""                # Main option part ( ex: '-p c', value: 'p')
  optionnal_part=""           # Optionnal part (ex: '-p c', value 'c')
  is_opt_used=0               # Wether the optionnal part has been used
  is_optionnal_part_linked=0  # Wether the optionnal part was in the option or one param later

  arg="${1}"
  shift

  #
  # Parse parameters
  #
  # Detects if an option is being used (is_option=1) and stores its name
  # in 'main_part' and the eventual option argument in 'optionnal_part'
  #
  # Set is_opt_used to 1 if an option makes use of optionnal_part
  #
  if [ "${arg::2}" = "--" ]; then   # Long parameters
    is_option=1
    main_part="${arg:2}"
    main_part="${main_part/%=*}"
    if [ "$arg" != "${arg#*=}" ] && [ ! -z "${arg#*=}" ]; then
      optionnal_part="${arg#*=}"
    else
      optionnal_part="$1"
      is_optionnal_part_linked=1
    fi
  elif [ "${arg::1}" = "-" ]; then    # Short parameters
    is_option=1
    main_part="${arg:1:1}"
    if [ ! -z "${arg:2}" ]; then
      optionnal_part="${arg:2}"
    else
      optionnal_part="$1"
      is_optionnal_part_linked=1
    fi
  fi

  #
  # Manage options
  #
  if [ $is_option -eq 1 ]; then
    case "$main_part" in
      "h" | "help" )          # Display help & exit
        printHelp 0
        ;;
      "p" | "print")
        if [ ! -z "$optionnal_part" ]; then
          is_opt_used=1
          printf -- "$optionnal_part"
        else
          echo "The option $main_part expects a parameter" >&2
          printHelp 1 >&2
        fi
        ;;
      * )                     # Unrecognised option, throw error and exit
        echo "Unrecognised option: $arg" >&2
        printHelp 2 >&2
        ;;
    esac
  else
    # Not an option
    continue
  fi

  if [ $is_opt_used -ne 0 ] && [ $is_optionnal_part_linked -ne 0 ]; then
    shift
  fi
done

