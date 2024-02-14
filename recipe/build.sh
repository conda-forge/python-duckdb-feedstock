#!/bin/bash

set -euxo pipefail

if [[ "$target_platform" == "linux-ppc64le" ]]; then
  # avoid error 'relocation truncated to fit: R_PPC64_REL24'
  export CFLAGS="$(echo ${CFLAGS} | sed 's/-fno-plt//g')"
  export CXXFLAGS="$(echo ${CXXFLAGS} | sed 's/-fno-plt//g')"
fi

${PYTHON} -m pip install tools/pythonpkg -vv
