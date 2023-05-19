#!/usr/bin/env bash
#/bin/bash


TF_INC=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
TF_LIB=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')
TF_CFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))') )
TF_LFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))') )


nvcc tf_grouping_g.cu -o tf_grouping_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC
g++ -std=c++11 tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -O2 -D_GLIBCXX_USE_CXX11_ABI=0 \
-I /usr/local/cuda/include -L/usr/local/cuda/lib64 ${TF_CFLAGS[@]} ${TF_LFLAGS[@]} -lcudart \
-I$TF_INC -L$TF_LIB -ltensorflow_framework
