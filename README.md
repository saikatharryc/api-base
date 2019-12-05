# Judge0 API Base
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://github.com/judge0/api-base/blob/master/LICENSE)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/hermanzdosilovic)

## About
**Judge0 API Base** is an base API Docker image with installed compilers, interpreters and sandbox environment - [isolate](https://github.com/ioi/isolate).

## Compilers and Interpreters
Each compiler and interpreter is compiled during image build, or if precompiled binary was available for x86_64 architecture then this binary is used.

We used this approach of compiling each compiler and interpreter instead of installing available packages because we have full control of choosing where this compiler and interpreter will be installed. That also gives us ability to install some compilers and interpreters that are not available with package manager.

As a consequence, Judge0 API Base image is large (8.82 GB uncompressed) and build time takes few hours, but we successfully installed more than 40 different compilers and interpreters and more of them can be added easily.

We are open to any suggestions on how to reduce size of this image but retain flexibility of adding/removing new compilers and interpreters.

Here is a list of supported languages:

|#|Name|
|:---:|:---:|
|1 |Bash (4.4)|
|2 |C (gcc 7.2.0)|
|3|C++ (g++ 7.2.0)|
|4|C# (mono 5.4.0.167)|
|5|Clojure (1.8.0)|
|6|Crystal (0.23.1)|
|7|Elixir (1.5.1)|
|8|Erlang (OTP 20.0)|
|9|Go (1.9)|
|10|Haskell (ghc 8.2.1)|
|11|Insect (5.0.0)|
|12|Java (OpenJDK 9)|
|13|JavaScript (nodejs 8.5.0)|
|14|OCaml (4.05.0)|
|15|Octave (4.2.0)|
|16|Pascal (fpc 3.0.0)|
|17|Python (3.6.0)|
|18|Python (2.7.9)|
|19|Ruby (2.5.0)|
|20|Rust (1.20.0)|
|21|Text (plain text)|

## Sandbox Environment
Sandbox environment is also included in this image. For sandbox environment we are using [isolate](https://github.com/ioi/isolate) (licensed under [GPL v2](https://github.com/ioi/isolate/blob/master/LICENSE)).

>Isolate is a sandbox built to safely run untrusted executables, offering them a limited-access environment and preventing them from affecting the host system. It takes advantage of features specific to the Linux kernel, like namespaces and control groups.

Huge thanks to [Martin Mareš](https://github.com/gollux) and [Bernard Blackham](https://github.com/bblackham) for developing and maintaining this project. Also, thanks to all other people who contributed to isolate project.

Isolate was used as sandbox environment (part of [CMS](https://github.com/cms-dev/cms) system) on big programming contests like [International Olympiad in Informatics](http://www.ioinformatics.org/index.shtml) (a.k.a. IOI) in 2012, and we trust that this sandbox environment works and does its job.

## Building Docker Image
If you want to build your own Judge0 API Base image:

1. Clone or download this project.
2. Make changes if you want.
3. Run `docker build -t yourRepoName .`
4. Grab some coffee, this **will** take some time.

## Pulling Docker Image
Take a look at [Docker Hub](https://hub.docker.com/r/judge0/api-base/tags/). There are version tags and `latest` tag.

`latest` tag will always be equal to highest version tag. Dockerfiles for all versions will be available in [tags](https://github.com/judge0/api-base/tags) or [releases](https://github.com/judge0/api-base/releases) pages of GitHub.

To pull version `0.3.0`:

1. `docker pull judge0/api-base:0.3.0`
2. Grab some coffee, this **might** take a while.

## Adding New Compiler or Interpreter
Adding new compiler or interpreter is easy as long as you know how to compile it properly or as long as you know what precompiled binary you need to download.

You should add installation of your favorite compiler between installation of last compiler and isolate installation. Installation of isolate should always be the last, because it is then easier to rebuild image when new version of isolate is available.

You should also install your favorite compiler inside `/usr/local/` folder. For example `gcc v6.3.0` is installed inside `/usr/local/gcc-6.3.0` folder.

Please note that when you add new compiler or interpreter there is still some work that needs to be done for it to be usable on [**Judge0 API**](https://api.judge0.com), but adding it to Judge0 API Base image is the first step. After that read documentation of [Judge0 API](https://github.com/judge0/api) for the next steps.

## Donate
If you like Judge0, please consider making a [donation](https://www.paypal.me/hermanzdosilovic) to support this project.
