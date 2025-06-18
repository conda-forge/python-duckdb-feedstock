#!/bin/bash

set -euxo pipefail

if [[ "$target_platform" == "linux-ppc64le" ]]; then
  # avoid error 'relocation truncated to fit: R_PPC64_REL24'
  export CFLAGS="$(echo ${CFLAGS} | sed 's/-fno-plt//g') -fplt"
  export CXXFLAGS="$(echo ${CXXFLAGS} | sed 's/-fno-plt//g') -fplt"
fi

if [[ "$target_platform" == "linux-aarch64" ]]; then
  # linux_aarch64 with the jemalloc extension has trouble finding pthread symbols
  export CFLAGS="${CFLAGS} -pthread"
  export CXXFLAGS="${CXXFLAGS} -pthread"
fi

export OVERRIDE_GIT_DESCRIBE=v$PKG_VERSION-0-g2063dda

${PYTHON} -m pip install --no-deps --no-build-isolation tools/pythonpkg -vv
