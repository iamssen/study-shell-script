RED='\033[0;31m';
BLUE='\033[0;34m';
NORMAL='\033[0;00m';

function log_success() { echo -e "${BLUE}[pass] $1${NORMAL}"; }
function log_failure() { echo -e "${RED}[fail] $1${NORMAL}"; }

function assert() {
  expected=$1
  actual=$2

  if [ "$expected" == "$actual" ]; then
    return 0
  else
    log_failure "$expected != $actual"
    exit 1
  fi
}
