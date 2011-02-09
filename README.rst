
Thrift bindings for all SMAC modules
====================================


This repository contains the thrift sources needed to build the thrift clients
and interfaces to access the SMAC modules. You can either build them yourself
(see :ref:`howto`) or download them from the downloads section on the github
repository (see :ref:`prebuilt`).


.. _howto:

How to build
------------

To build the interfaces in one or more languages, simply invoke ``make`` from
this directory.

.. note::
   To be able to compile the interfaces, you need the ``thrift`` command line
   utility installed. Get it at http://thrift.apache.org/.

The default ``Makefile`` target creates a build for each language. You can
choose to build the interface for a single language by specifying it as a
target::

   make python

The built interfaces for the language of choice will be placed inside
``build/<language>``.

An additional ``make`` target, ``clean``, allows to cleanup all builds and the
temporary files which the build process may leave behind.


Available targets
-----------------

The following targets are available for your language of choice:

=======  ====================
Target   Generator
=======  ====================
html     html
twisted  py:twisted
python   py:new_style
java     java:beans
csharp   csharp
cocoa    cocoa:log_unexpected
=======  ====================


.. _prebuilt:

Pre-built interfaces
--------------------

Regularly updated builds are available as downloads on the github smac-api
repository: https://github.com/SMAC/smac-api/downloads.