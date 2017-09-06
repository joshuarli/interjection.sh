# Contributing to interjection.sh

I'm glad you're interested in contributing! :tada: :tada: :tada:

Chances are, you're trying to add support for a new package management system. You'll want to add an appropriate `elif` block to the package manager detection and package output text processing logic in `interjection.sh`:

```sh
elif command -v your-package-manager > /dev/null 2>&1; then
    PACKAGES="$(your-logic-here)"
```

Don't forget to edit the `README` by adding a new bullet point under "Supported Package Management Systems"!

Thanks again for your efforts! :)
