# GobiSDK

[![Version](https://img.shields.io/cocoapods/v/GobiSDK.svg?style=flat)](https://cocoapods.org/pods/GobiSDK)
[![License](https://img.shields.io/cocoapods/l/GobiSDK.svg?style=flat)](https://cocoapods.org/pods/GobiSDK)
[![Platform](https://img.shields.io/cocoapods/p/GobiSDK.svg?style=flat)](https://cocoapods.org/pods/GobiSDK)

## Installation

GobiSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GobiSDK'
```

## Get your access key

Get them from Gobitech AS on email, `contact@gobiapp.com`.

## Integrate in the app

### 1. Initialize `Gobi` for example in view did load method

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    Gobi.with("ZDY5OGI0YZQ3MJG0MWE3ZDA0YWEXZDLK", delegate: self)
}
```

### 2. Store your story keys

```swift
struct Stories {
    static var gobiTeamStoryId = "OWEXMJUWM2FKMTE5M2U3NWIXZTIZZDK0NJQ2NJUYNZRKOGZHNZM1ZJFINWVHMJBK"
}
```

## Author

Gobitech

## License

GobiSDK is available under the MIT license. See the LICENSE file for more info.
