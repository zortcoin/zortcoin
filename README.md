<p align="center">
  <img src="https://raw.githubusercontent.com/zortcoin/zortcoin/master/share/pixmaps/zortcoin128.png" />
</p>

What is Zortcoin?
----------------

It is a mixture of 4 different blockchains Bitcoin, Litecoin, Dogecoin and Bitcoin SV. Source code forked from bitcoin. There are 84 million coins, half of which are sent by default to around 5 million addresses. The other half is ready for mining. You can spend these coins using your same private keys.



Download
----------------

[zortcoin-0.21.1-win64-setup.exe](https://github.com/zortcoin/zortcoin/releases/download/v0.21.1/zortcoin-0.21.1-win64-setup.exe) for Windows 64 Bit



Compile from source
----------------

(Compilation may take a long time!)

for centos 7:

````
curl -s https://raw.githubusercontent.com/zortcoin/zortcoin/master/CENTOS7_AUTO_INSTALLER.sh | sudo bash
````

for ubuntu 18 & 20:

````
wget -qO - https://raw.githubusercontent.com/zortcoin/zortcoin/master/UBUNTU_AUTO_INSTALLER.sh | sudo bash
````


Simple Usage
----------------

If you have a desktop, you can use the graphical interface.

````
sudo zortcoin-qt
````


Create Wallet

````sudo zortcoin-cli createwallet ""````

Get Your Wallet Address

````sudo zortcoin-cli getaddressesbylabel ""````

Send 10 ZTC

````sudo zortcoin-cli sendtoaddress "Zortcoinadresshere" 10````


License
-------

Zortcoin Core is released under the terms of the MIT license. See [COPYING](COPYING) for more
information or see https://opensource.org/licenses/MIT.

Development Process
-------------------

The `master` branch is regularly built (see `doc/build-*.md` for instructions) and tested, but it is not guaranteed to be
completely stable. [Tags](https://github.com/zortcoin/zortcoin/tags) are created
regularly from release branches to indicate new official, stable release versions of Zortcoin Core.

The contribution workflow is described in [CONTRIBUTING.md](CONTRIBUTING.md)
and useful hints for developers can be found in [doc/developer-notes.md](doc/developer-notes.md).

Testing
-------

Testing and code review is the bottleneck for development; we get more pull
requests than we can review and test on short notice. Please be patient and help out by testing
other people's pull requests, and remember this is a security-critical project where any mistake might cost people
lots of money.

### Automated Testing

Developers are strongly encouraged to write [unit tests](src/test/README.md) for new code, and to
submit new unit tests for old code. Unit tests can be compiled and run
(assuming they weren't disabled in configure) with: `make check`. Further details on running
and extending unit tests can be found in [/src/test/README.md](/src/test/README.md).

There are also [regression and integration tests](/test), written
in Python, that are run automatically on the build server.
These tests can be run (if the [test dependencies](/test) are installed) with: `test/functional/test_runner.py`

The Travis CI system makes sure that every pull request is built for Windows, Linux, and macOS, and that unit/sanity tests are run automatically.

### Manual Quality Assurance (QA) Testing

Changes should be tested by somebody other than the developer who wrote the
code. This is especially important for large or high-risk changes. It is useful
to add a test plan to the pull request description if testing the changes is
not straightforward.


