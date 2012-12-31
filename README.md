# eyes-cli

CLI JSON inspector with [eyes.js](eyes) from [cloudhead](cloudhead).

## Install

```shell
$ npm install -g eyes-cli
```

## Usage

```shell
$ eyes --help
Usage: eyes [options] <file ...>

  Options:

    -h, --help            output usage information
    -V, --version         output the version number
    --no-pretty           no pretty formatting
    --no-color            no color
    -m, --max-length <n>  max length
```

## Examples

### Sources

#### From file:
```shell
$ ls
package.json component.json

$ eyes package.json
```

#### Or many files:
```shell
$ ls
package.json component.json

$ eyes package.json component.json
```

#### Pipe from any source:
```shell
$ curl -s "https://api.github.com/users/AndersDJohnson" | eyes
```

```shell
$ echo '{"foo": {"bar": 0}}' | eyes 
{
    foo: { bar: 0 }
}
```

[eyes]: https://github.com/cloudhead/eyes.js
[cloudhead]: https://github.com/cloudhead/
