Zortcoin Core
=============

Setup
---------------------
Zortcoin Core is the original Zortcoin client and it builds the backbone of the network. It downloads and, by default, stores the entire history of Zortcoin transactions, which requires a few hundred gigabytes of disk space. Depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

To download Zortcoin Core, visit [bitcoincore.org](https://bitcoincore.org/en/download/).

Running
---------------------
The following are some helpful notes on how to run Zortcoin Core on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/zortcoin-qt` (GUI) or
- `bin/zortcoind` (headless)

### Windows

Unpack the files into a directory, and then run zortcoin-qt.exe.

### macOS

Drag Zortcoin Core to your applications folder, and then run Zortcoin Core.

### Need Help?

* See the documentation at the [Zortcoin Wiki](https://en.zortcoin.it/wiki/Main_Page)
for help and more information.
* Ask for help on [#zortcoin](https://webchat.freenode.net/#zortcoin) on Freenode. If you don't have an IRC client, use [webchat here](https://webchat.freenode.net/#zortcoin).
* Ask for help on the [ZortcoinTalk](https://zortcointalk.org/) forums, in the [Technical Support board](https://zortcointalk.org/index.php?board=4.0).

Building
---------------------
The following are developer notes on how to build Zortcoin Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](dependencies.md)
- [macOS Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [FreeBSD Build Notes](build-freebsd.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [NetBSD Build Notes](build-netbsd.md)
- [Gitian Building Guide (External Link)](https://github.com/zortcoin-core/docs/blob/master/gitian-building.md)

Development
---------------------
The Zortcoin repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Productivity Notes](productivity.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Source Code Documentation (External Link)](https://doxygen.bitcoincore.org/)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [JSON-RPC Interface](JSON-RPC-interface.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [ZortcoinTalk](https://zortcointalk.org/) forums, in the [Development & Technical Discussion board](https://zortcointalk.org/index.php?board=6.0).
* Discuss project-specific development on #zortcoin-core-dev on Freenode. If you don't have an IRC client, use [webchat here](https://webchat.freenode.net/#zortcoin-core-dev).
* Discuss general Zortcoin development on #zortcoin-dev on Freenode. If you don't have an IRC client, use [webchat here](https://webchat.freenode.net/#zortcoin-dev).

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [zortcoin.conf Configuration File](zortcoin-conf.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [Reduce Memory](reduce-memory.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)
- [PSBT support](psbt.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
