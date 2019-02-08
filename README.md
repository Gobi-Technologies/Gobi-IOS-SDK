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

### 1. Import Gobi SDK

```swift
import GobiSDK
```

### 2. Initialize `Gobi` for example in view controller `viewDidLoad()`

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    Gobi.with("ZDY5OGI0YZQ3MJG0MWE3ZDA0YWEXZDLK", delegate: self)
}
```

Note that delegate instance should conform to `GobiDelegate` protocol.

Delagate parameter is optional, so if it's not required to get any callbacks initialization could look like

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    Gobi.with("ZDY5OGI0YZQ3MJG0MWE3ZDA0YWEXZDLK")
}
```

### 3. Store your story keys

```swift
struct Stories {
    static var gobiTeamStoryId = "OWEXMJUWM2FKMTE5M2U3NWIXZTIZZDK0NJQ2NJUYNZRKOGZHNZM1ZJFINWVHMJBK"
}
```

## Usage
### 1. Get info about a story

```swift
func loadStory() {
    Gobi.getStoryData(for: Stories.gobiTeamStoryId)
}
```

When story info is received the delegate method `func didReceiveStory(_ story: GobiStory)` is called.

### 2. Show a story

Use method `Gobi.showStory(with id: String, from vc: UIViewController)` to show new images and video for story `id` and present it on `vc`.

```swift
    Gobi.showStory(with: Stories.gobiTeamStoryId, from: self)
```

### 3. Rewind a story

Use method `Gobi.rewindStory(with id: String, from vc: UIViewController)` to show all available images and video for story `id` and present it on `vc`.

```swift
    Gobi.rewindStory(with: Stories.gobiTeamStoryId, from: self)
```

### 4. Check if story has new images and video to decide show or rewind

```swift
func showStory(_ story: GobiStory) {
    if story.unreadCount > 0 {
        Gobi.showStory(with: Stories.gobiTeamStoryId, from: self)
    } else {
        Gobi.rewindStory(with: Stories.gobiTeamStoryId, from: self)
    }
}
```

### 5. `GobiDelegate`

```swift
public protocol GobiDelegate {

    public func didReceiveStory(_ story: GobiStory)

    public func didFailWith(_ error: GobiError)

    public func didFinishShowingMedia()
}
```

#### public func didReceiveStory(_ story: GobiStory)

The method is called when story is retrived from `Gobi` after calling `Gobi.getStoryData(for: Stories.gobiTeamStoryId)`

#### public func didFailWith(_ error: GobiError)

The method is called when any requested action cannot be completed. `GobiError` is an enum:

```swift
public enum GobiError : Error, ErrorStringConvertible {

    case invalidCustomerId

    case invalidStoryKey

    case requestFailed(String)

    case failedToLoadStory

    case failedToLoadMedia

    case noNewImagesInStory

    case noImagesInStory

    public var errorDescription: String { get }
}
```

#### public func didFinishShowingMedia()

The method is called when GobiSDK finished playing story and controller is dismissed. If UI shows the GobiStory it could be good place to call `getStoryData` to load updated information like thumbnail, unread count, etc.

## Usage Notes

#### 1. To hide status bar on video player make sure `View controller-based status bar appearance` is set to `YES` in `Info.plist` file.

#### 2. Make sure `Info.plist` containt `App Transport Security Settings` and `Allow Arbitrary Loads` is set to `YES`

## Author

Gobitech

## License

GobiSDK is available under the MIT license. See the LICENSE file for more info.
