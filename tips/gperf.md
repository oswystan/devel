# workflow of google perftools

## install

```shell
## on ubuntu18.04
$ sudo apt install google-perftools libgoogle-perftools-dev
$ sudo ln -s /usr/lib/x86_64-linux-gnu/libprofiler.so.0 /usr/lib/libprofiler.so
```

## cpu profiling

```shell
## profiling a.out
$ LD_PRELOAD=/usr/lib/libprofiler.so CPUPROFILE=a.prof ./a.out
## show svg in your browser 
$ google-pprof --web a.out a.prof
```

> You do **NOT** need to do anything in your app, that is GREAT.

## heap checking

```shell
## compile you app with -ltcmalloc
$ g++ youapp.cpp -ltcmalloc

## run your app by the following command
$ PPROF_PATH=/usr/bin/google-pprof HEAPPROFILE=heaprof HEAPCHECK=normal ./your-app

## show the information on web (NOTICE: use the generated file name to replace the headprof.0001.heap)
$ google-pprof --web your-app heaprof.0001.heap
## or
$ google-pprof --text your-app heaprof.0001.heap
```

