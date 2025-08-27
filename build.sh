#!/bin/bash

module purge
module load sghpc-mpi-gcc-mlnx/25.6

CXX=hipcc
export CXX=hipcc
export CMAKE_PREFIX_PATH=/public/home/sghpc_sdk/Linux_x86_64/25.6/dtk/dtk-25.04.1-DCC-2506-0729-centos8/dcc/comgr/lib64/cmake/amd_comgr:$CMAKE_PREFIX_PATH


cmake .. \
-DARCHITECTURE="gfx936" \
-DBACKEND="hip_amd" \
-DCMAKE_CXX_FLAGS="--offload-arch=gfx936 -w" \
-DUSE_GPU_AWARE_MPI=ON \
-DUSE_GPU_P2P=OFF\
-DMPI_CXX_COMPILER=mpicxx \
-DMPI_C_COMPILER=mpicc \
-DCMAKE_HIP_COMPILER_ENV_VAR=HIPCC \




make -j32 rhmc
make -j32 multiRHSProf
