
# Enable nix if present
[ -e ~/.nix-profile/etc/profile.d/nix.sh ] && . ~/.nix-profile/etc/profile.d/nix.sh

# Add personal utilities
export PATH=$HOME/bin:$PATH

# Use Sublime Text
export VISUAL='atom -w'
export EDITOR='atom -w'

# Set up workspace.
export CLICOLOR=1

# Set up environment variables needed for basic work.
# TODO(adamb) Move most of these to MRE.
TSUMOBI=$HOME/tsumobi
export AUDIT_BASE_DIR=$TSUMOBI/.audit
export HERMIT_NODE_CACHE=$TSUMOBI/.hermit-node-cache
export HERMIT_BUILDER_CAP=4
export HERMIT_BUILDER_RATION=4
export INSPECTOR_TIMELINE_DIR=$TSUMOBI/.audit
export QA_TAPJ_OUTPUT_DIR=$TSUMOBI/.tapj
export TAPJ_CACHE_BASE_DIR=$TSUMOBI/.tapj-cache
export SECURE_KEY_DIR=$TSUMOBI/.build-creds
export SECURE_KEY_DIR=$HOME/tsumobi/.build-creds
export HERMIT_PASSTHROUGH_ENV="CLICOLOR QA_TEST_PATTERN"

export NALLOC_DRIVER=virtual_box

export FOG_RC=/Users/adamb/.fog
export SLOTH_RO_SHARED_CACHE=fs:/Volumes/sloth-cache

# So massively parallel builds work.
ulimit -n 8192

# Set up base PATH

# For refinery workflow

# Add a few tsumobi utilities to PATH.
function gimme_unified_output() {
  echo $TSUMOBI/.gimme/output/unified/11/$1/$2/+macosx+x86_64
}

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
if [ -e /Users/adamb/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/adamb/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
