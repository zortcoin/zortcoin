#!/usr/bin/env bash
# Copyright (c) 2016-2019 The Zortcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

ZORTCOInD=${ZORTCOInD:-$BINDIR/zortcoind}
ZORTCOInCLI=${ZORTCOInCLI:-$BINDIR/zortcoin-cli}
ZORTCOInTX=${ZORTCOInTX:-$BINDIR/zortcoin-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/zortcoin-wallet}
ZORTCOInQT=${ZORTCOInQT:-$BINDIR/qt/zortcoin-qt}

[ ! -x $ZORTCOInD ] && echo "$ZORTCOInD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
read -r -a ZTCVER <<< "$($ZORTCOInCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }')"

# Create a footer file with copyright content.
# This gets autodetected fine for zortcoind if --version-string is not set,
# but has different outcomes for zortcoin-qt and zortcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$ZORTCOInD --version | sed -n '1!p' >> footer.h2m

for cmd in $ZORTCOInD $ZORTCOInCLI $ZORTCOInTX $WALLET_TOOL $ZORTCOInQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${ZTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${ZTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
