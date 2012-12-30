# eyes-cli

CLI JSON inspector with eyes.js (cloudhead/eyes.js).

## Install

```
npm install -g eyes-cli
```

## Usage

```
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
```
$ ls
package.json component.json

$ eyes package.json
```

#### Or many files:
```
$ ls
package.json component.json

$ eyes package.json component.json
```

#### Pipe from any source:
```
$ curl -s "https://api.github.com/users/AndersDJohnson" | eyes
```

```
$ echo '{"foo": {"bar": 0}}' | eyes 
{
    foo: { bar: 0 }
}
```

