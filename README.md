# GobiSDK

[![Version](https://img.shields.io/cocoapods/v/GobiSDK.svg?style=flat)](https://cocoapods.org/pods/GobiSDK)
[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://cocoapods.org/pods/GobiSDK)
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
    static var gobiTeamStoryId = "YZY5MJVKOWYWN2NIOTNIYTLIN2MXODGYOWZKNDU3YWZLNGM4MGUYMJNMMJIWNTG4"
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
### 5. Upload media to the story

GobiSDK supports uploading media to one or several stories.

Use `public static func addMedia(to storyID: String, from vc: UIViewController)` to post one story 

```swift
    Gobi.addMedia(to: storyKey, from: self)
```

Or use `public static func addMedia(to storyIDs: [String], from vc: UIViewController)` to let user choose from list to what stories add media.

```swift
    Gobi.addMedia(to: [storyKey], from: self)
```

When calling these methods GobiSDK will open camera and let use take photo or video, then add stickers, texts or draw something before uploading media. 

### 6. `GobiDelegate`

```swift
public protocol GobiDelegate {

    public func didReceiveStory(_ story: GobiStory)

    public func didFailWith(_ error: GobiError)

    public func didFinishShowingMedia()

    public func didFinishAddingMedia(success: Bool)

    public func didStartUploadingMedia(with id: String)

    public func didFailUploadingMedia(with id: String)

    public func didFinishUploadingMedia(with id: String)

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

#### public func didFinishAddingMedia(success: Bool)

The method is called when GobiSDK has successfully uploaded media or failed for some reason.

#### public func didStartUploadingMedia(with id: String)

The method is called when GobiSDK starts uploading media to the story. `id` is local unique identifier for the media. SDK supports uploading media in background, so this method could be called several times if uploading failed.

#### public func didFailUploadingMedia(with id: String)

The method is called when GobiSDK failed to upload media with provided id. SDK will retry uploading this asset later.

#### public func didFinishUploadingMedia(with id: String)

The method is called when GobiSDK successfully uploaded media with provided id.

## Usage Notes

#### 1. To hide status bar on video player make sure `View controller-based status bar appearance` is set to `YES` in `Info.plist` file.

#### 2. Make sure `Info.plist` containt `App Transport Security Settings` and `Allow Arbitrary Loads` is set to `YES`

## Author

Gobitech

## License

GobiSDK is available under the Apache 2.0 license. See the LICENSE file for more info.
