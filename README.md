node写的IP黑白名单




## Installation

```sh
npm install cd-cluster -g
```

## Usage

### Slave Side

```sh
cd-slave start [options] [port=8081]
```

Options:

    -h, --help           output usage information
    -t, --token [token]  a token used to verify requests

### Master Side

```sh
cd-master start [port=8080]
```

Visit `http://hostname:port` and enjoy.

[npm-url]: https://npmjs.org/package/cd-cluster
[npm-image]: https://badge.fury.io/js/cd-cluster.svg
