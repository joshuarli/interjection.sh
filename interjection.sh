#!/usr/bin/env sh

if which dpkg > /dev/null 2>&1; then
    PACKAGES="$(dpkg --get-selections | tr -s [:blank:] | cut -f 1)"
elif which pacman > /dev/null 2>&1; then
    PACKAGES="$(pacman -Q | cut -d ' ' -f 1)"
elif which rpm > /dev/null 2>&1; then
    PACKAGES=$(rpm -qa --qf '%{NAME}\n')
elif which pkginfo > /dev/null 2>&1; then
    PACKAGES="$(pkginfo -i | cut -d ' ' -f 1)"
else
    # TODO portage and other package backends
    echo 'Your package manager is not supported.'
    exit 1
fi

SLASH="$(echo -en "$PACKAGES" | tr '\n' '/')"
PLUS="$(echo "$SLASH" | sed 's/\// plus /g')"
COMMA="$(echo "$SLASH" | sed 's/\//, /g')"

TEMPLATE="\
I'd just like to interject for a moment. What you're referring to as Linux,
is in fact, GNU/${SLASH}/Linux, or as I've recently taken to calling it, GNU plus ${PLUS}
plus Linux. Linux is not an operating system unto itself, but rather another free component
of a fully functioning GNU/${SLASH} system made useful by the GNU/${SLASH} corelibs, shell
utilities and vital system components comprising a full OS as defined by POSIX.

\n\nMany computer users run a modified version of the GNU/${SLASH} system every day,
without realizing it. Through a peculiar turn of events, the version of GNU/${SLASH}
which is widely used today is often called \"Linux\", and many of its users are
not aware that it is basically the GNU/${SLASH} system, developed by the GNU Project.

\n\nThere really is a Linux, and these people are using it, but it is just a
part of the system they use. Linux is the kernel: the program in the system
that allocates the machine's resources to the other programs that you run.
The kernel is an essential part of an operating system, but useless by itself;
it can only function in the context of a complete operating system. Linux is
normally used in combination with the GNU/${SLASH} operating system: the whole
system is basically GNU with ${COMMA}, and Linux added, or GNU/${SLASH}/Linux.
All the so-called \"Linux\" distributions are really distributions of GNU/${SLASH}/Linux.
"

echo -e $TEMPLATE
