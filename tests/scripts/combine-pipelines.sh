#!/bin/bash

TESTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
cd $TESTS_DIR

find pipelines -maxdepth 1 -name '*.yml' | xargs -L1 buildkite-agent pipeline upload