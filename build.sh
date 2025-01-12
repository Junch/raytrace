#!/bin/bash

BUILDDIR=_build
cmake -B ${BUILDDIR} -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
cmake --build ${BUILDDIR} --target all
