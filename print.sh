BLACK="\e[0;30m"
BLUE="\e[0;34m"
GREEN="\e[0;32m"
CYAN="\e[0;36m"
RED="\e[0;31m"
PURPLE="\e[0;35m"
YELLOW="\e[0;33m"
RESET_FORMAT="\e[m"

BOLD="\e[1m"

function print_color() {
    color=$1
    text=$2
    echo -e "${color}${text}${RESET_FORMAT}"
}

function print_success() {
    print_color "$GREEN" "$1"
}

function print_error() {
    print_color "$RED" "$1"
}

function print_warning() {
    print_color "$YELLOW" "$1"
}

function print_bold() {
    echo -e "${BOLD}$1${RESET_FORMAT}"
}

