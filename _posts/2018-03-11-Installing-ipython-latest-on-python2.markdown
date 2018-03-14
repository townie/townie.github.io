---
layout: post
title: installing iPython 5.X for python 2.7
date: 2018-03-11
tags: python2.7 ipython5 ipython
archive: false
comments: false
---

IPython removed support for python 2.7 with the release of iPython 6. This is a great setup forward
for the community and python in general, but this can cause some annoyances in the development workflow
for python 2 applications.

For some installations of python and package managers you can run into an error that looks like:


```
(python27) keith@sizzle:~/$ pip install ipython
Collecting ipython
  Downloading api/pypi/python-all/packages/fa/50/974211502bd72873728d44c3013fe79875c819c8fb69f778bcfd67bc7d38/ipython-6.2.1.tar.gz (5.1MB)
    100% |████████████████████████████████| 5.1MB 317kB/s
    Complete output from command python setup.py egg_info:

    IPython 6.0+ does not support Python 2.6, 2.7, 3.0, 3.1, or 3.2.
    When using Python 2.7, please install IPython 5.x LTS Long Term Support version.
    Beginning with IPython 6.0, Python 3.3 and above is required.

    See IPython `README.rst` file for more information:

        https://github.com/ipython/ipython/blob/master/README.rst

    Python sys.version_info(major=2, minor=7, micro=12, releaselevel='final', serial=0) detected.



    ----------------------------------------
Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-aAVlkY/ipython/
```

In order to get around this error and install the lastest supported highest version, set the version on install:

`pip install 'ipython<6.0'`

A simple one liner to install a compatiable version of iPython.

Cheers
