Immutable
=========

[![Build Status](https://travis-ci.org/nobezawa/Immutable.svg?branch=master)](https://travis-ci.org/nobezawa/Immutable)

Immutable is an practical functional library for Swift.

## Description
Inspiration / [ramda](https://github.com/ramda/ramda) / [immutable-js](https://github.com/immutable-js/immutable-js)  
Immutable provides immutable function and currying function.

## Authors
Takuro Nobezawa

## Usage

```swift
import Immutable

let one = 1
let two = 2

print(I.add(one)(two))
// => 3

let list = [1, 2, 3]

print(I.take(1, list))
// => [1]

let add1 = I.add(1)
let add2 = I.add(2)

let add3 = (add1 >>> add2)

print((add3)(1))
// => 4
```

## Support

- add
- equals
- map
- append
- prepend
- first
- last
- take
- drop
- filter
- reject
- all
- bind
- find
- concat
- move

## License

Immutable is available under the MIT license.
