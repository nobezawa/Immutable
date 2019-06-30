Immutable
=========

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
```

## License

Immutable is available under the MIT license.