#!/usr/bin/env sh

if command -v apk > /dev/null 2>&1; then
    PACKAGES="$(apk info)"
elif command -v dpkg > /dev/null 2>&1; then
    PACKAGES="$(dpkg --get-selections | tr -s '[:blank:]' | cut -f1)"
elif command -v pacman > /dev/null 2>&1; then
    PACKAGES="$(pacman -Qq)"
elif command -v rpm > /dev/null 2>&1; then
    PACKAGES=$(rpm -qa --qf '%{NAME}\n')
elif command -v pkginfo > /dev/null 2>&1; then
    PACKAGES="$(pkginfo -i | cut -d' ' -f1)"
elif command -v xpkg > /dev/null 2>&1; then
    PACKAGES="$(xpkg)"
elif command -v xbps-install > /dev/null 2>&1; then
    echo "Package 'xtools' is not installed. You can install it with 'xbps-install xtools'"
    exit 1
elif command -v equery > /dev/null 2>&1; then
    PACKAGES="$(equery list -F '$name' '*')"
elif command -v emerge > /dev/null 2>&1; then
    # TODO: --complement is a GNU cut feature, not POSIX cut
    PACKAGES="$(ls -d -1 /var/db/pkg/*/* | cut -c 13- | cut -d/ -f1 --complement | sed 's/-[0-9].*//')"
elif command -v brew > /dev/null 2>&1; then
    PACKAGES="$(brew list)"
elif command -v nixos-version > /dev/null 2>&1; then
    PACKAGES="$(ls -d -1 /nix/store/*/ | cut -c 45- | sed 's/.$//' | sed 's/-[0-9].*//' | sort | uniq)"
else
    # TODO other package backends
    echo 'Your package manager is not supported.'
    exit 1
fi

SLASH="$(printf %s "$PACKAGES" | tr '\n' '/')"
PLUS="$(printf %s "$SLASH" | sed 's/\// plus /g')"
COMMA="$(printf %s "$SLASH" | sed 's/\//, /g')"

TEMPLATE="\
I'd just like to interject for a moment. What you're referring to as Linux, \
is in fact, GNU/${SLASH}/Linux, or as I've recently taken to calling it, GNU plus ${PLUS} \
plus Linux. Linux is not an operating system unto itself, but rather another free component \
of a fully functioning GNU/${SLASH} system made useful by the GNU/${SLASH} corelibs, shell \
utilities and vital system components comprising a full OS as defined by POSIX.

Many computer users run a modified version of the GNU/${SLASH} system every day, \
without realizing it. Through a peculiar turn of events, the version of GNU/${SLASH} \
which is widely used today is often called \"Linux\", and many of its users are \
not aware that it is basically the GNU/${SLASH} system, developed by the GNU Project.

There really is a Linux, and these people are using it, but it is just a \
part of the system they use. Linux is the kernel: the program in the system \
that allocates the machine's resources to the other programs that you run. \
The kernel is an essential part of an operating system, but useless by itself; \
it can only function in the context of a complete operating system. Linux is \
normally used in combination with the GNU/${SLASH} operating system: the whole \
system is basically GNU with ${COMMA}, and Linux added, or GNU/${SLASH}/Linux. \
All the so-called \"Linux\" distributions are really distributions of GNU/${SLASH}/Linux.
"

printf %s "$TEMPLATE"
