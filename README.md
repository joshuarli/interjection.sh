# interjection.sh
Interjection copypasta generator script based on your package manager.

Inspired by [this](https://www.reddit.com/r/linuxmasterrace/comments/6glb85/sorry_stallman/diraclm/) reddit post.

### Supported Package Manager Backends

* `dpkg`
* `pacman`
* `pkginfo`

Pull requests are more than welcome for those that are not currently supported!


### Usage

```sh
curl -fsSL https://git.io/v7K5W > interjection.sh
sh interjection.sh
```

You might want to pipe the stdout to a clipboard interface like `xclip`, like so:

```sh
sh interjection.sh | xclip -i
```
