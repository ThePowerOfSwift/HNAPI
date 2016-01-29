# HNAPI

[![CI Status](http://img.shields.io/travis/lexrus/HNAPI.svg?style=flat)](https://travis-ci.org/lexrus/HNAPI)
[![Version](https://img.shields.io/cocoapods/v/HNAPI.svg?style=flat)](http://cocoapods.org/pods/HNAPI)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Language](https://img.shields.io/badge/language-Swift%202-orange.svg)](https://swift.org)
[![License](https://img.shields.io/cocoapods/l/HNAPI.svg?style=flat)](http://cocoapods.org/pods/HNAPI)
[![Platform](https://img.shields.io/cocoapods/p/HNAPI.svg?style=flat)](http://cocoapods.org/pods/HNAPI)

HackerNews API Provider built with Moya + ObjectMapper + RxSwift.

## Usage

``` swift
let provider = RxMoyaProvider<HNAPI>()
_ = provider.request(.User("Lex")).mapObject(User).subscribeNext { user in
    print(user.id, user.created)
}
```

## Tests

To run the tests, clone the repo,
and run `pod install` from the root directory first.
Open the HNAPI.xcworkspace and select HNAPI scheme.
Hit command+u to test.

## Dependencies

1. [RxSwift](https://github.com/ReactiveX/RxSwift/)
2. [Moya](https://github.com/Moya/Moya)
3. [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)
4. * [Moya-ObjectMapper](https://github.com/ivanbruel/Moya-ObjectMapper)

## CocoaPods

HNAPI is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HNAPI"
```
## Carthage

HNAPI is also compatible with [Carthage](https://github.com/Carthage/Carthage).
Add the following line to your Cartfile:

```
github "lexrus/HNAPI"
```

Read the [official instruction](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

## License

HNAPI is available under the MIT license. See the LICENSE file for more info.
