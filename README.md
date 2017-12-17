# interjection.sh
Interjection copypasta generator script based on your package manager.

Inspired by [this](https://www.reddit.com/r/linuxmasterrace/comments/6glb85/sorry_stallman/diraclm/) reddit post.

### Supported Package Management Systems

* `dpkg`
* `pacman`
* `pkginfo`
* `portage`
* `rpm`
* `xpkg`
* `brew`

Pull requests are more than welcome for those that are not currently supported! See [`CONTRIBUTING.md`](https://github.com/JoshuaRLi/interjection.sh/blob/master/CONTRIBUTING.md) for more information.


### Usage

```sh
curl -fsSL https://git.io/v7K5W > interjection.sh
sh interjection.sh
```

As the output can be quite large, you may want to pipe the stdout to a clipboard interface like `xclip`, like so:

```sh
sh interjection.sh | xclip -i
```

Or upload to a pastebin of your choice. Here's an example:

```sh
sh interjection.sh | curl -F c=@- https://ptpb.pw
```
