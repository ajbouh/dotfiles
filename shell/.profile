
# Enable nix if present
[ -e ~/.nix-profile/etc/profile.d/nix.sh ] && . ~/.nix-profile/etc/profile.d/nix.sh

# Add personal utilities
export PATH=$HOME/bin:$PATH

# Use Sublime Text
export VISUAL='subl -w'
export EDITOR='subl -w'

# Set up workspace.
export CLICOLOR=1

# Set up environment variables needed for basic work.
# TODO(adamb) Move most of these to MRE.
TSUMOBI=$HOME/tsumobi
export AUDIT_BASE_DIR=$TSUMOBI/.audit
export HERMIT_DEV=$TSUMOBI/.hermit
export INSPECTOR_TIMELINE_DIR=$TSUMOBI/.audit
export QA_TAPJ_OUTPUT_DIR=$TSUMOBI/.tapj
export SECURE_KEY_DIR=$TSUMOBI/.build-creds
export UI_RESOURCE_LOCK=$TSUMOBI/.ui-resource-lock

export NALLOC_DRIVER=virtual_box

export FOG_RC=/Users/adamb/.fog
export SLOTH_RO_SHARED_CACHE=fs:/Volumes/sloth-cache

# So massively parallel builds work.
ulimit -n 8192

# Set up base PATH
export PATH="$TSUMOBI/mre/bin:$PATH"

# For refinery workflow
SSL_CREDS=$HOME/.ssl
export GIT_SSL_CERT=$SSL_CREDS/adamb.crt
export GIT_SSL_KEY=$SSL_CREDS/adamb.key
export GIT_SSL_CAINFO=$SSL_CREDS/ca.crt

# Add a few tsumobi utilities to PATH.
function gimme_unified_output() {
  echo $TSUMOBI/.gimme/output/unified/9/$1/$2/+macosx+x86_64
}
export PATH=$(gimme_unified_output nalloc bundle)/bin:$(gimme_unified_output fetch bundle)/bin:$(gimme_unified_output arena bundle)/bin:$PATH

function abort {
  echo "$@" >&2
  exit 1
}

function sleuth {
  TOPIC=$1
  [ -n "$TOPIC" ] || abort "fatal: no topic given"

  SLEUTH_DIR="$HOME/sleuthing/$(date +%F)-$TOPIC"
  mkdir -p $SLEUTH_DIR
  cd $SLEUTH_DIR
}

function hack {
  TOPIC=$1
  [ -n "$TOPIC" ] || abort "fatal: no topic given"

  HACK_DIR="$HOME/hacking/$TOPIC"
  mkdir -p $HACK_DIR
  cd $HACK_DIR
}
