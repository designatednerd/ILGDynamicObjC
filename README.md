# ILGDynamicObjC

[![CI Status](http://img.shields.io/travis/ilg/ILGDynamicObjC.svg?style=flat)](https://travis-ci.org/ilg/ILGDynamicObjC)
[![Version](https://img.shields.io/cocoapods/v/ILGDynamicObjC.svg?style=flat)](http://cocoapods.org/pods/ILGDynamicObjC)
[![License](https://img.shields.io/cocoapods/l/ILGDynamicObjC.svg?style=flat)](http://cocoapods.org/pods/ILGDynamicObjC)
[![Platform](https://img.shields.io/cocoapods/p/ILGDynamicObjC.svg?style=flat)](http://cocoapods.org/pods/ILGDynamicObjC)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
A version of Xcode which supports nullability annotations and generics - ie, Xcode 7 or higher. 

## Installation

ILGDynamicObjC is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ILGDynamicObjC"
```

## Notes on Swift Usage

These notes were last updated for Swift 2.1. Your mileage may vary on newer versions. 

For `ILGClasses`: 

- If you're using a mix of Obj-C and Swift, you will get classes passing your test in both languages - even if one of those classes can't be called from Obj-C. You can see a workaround for this in the (Obj-C Tests]()
- You can only check protocol conformance for either protocols declared in Objective-C or declared in Swift and annotated with `@objc`. These may be passed in like so:  
```swift
ILGClasses.classesConformingToProtocol(SwiftProtocolMarkedWithObjC.self)
```
- Because you can only use `@objc` Swift protocols, this doesn't work super well with using protocol extensions. When implementing a method in the protocol in a class, you need to add the `@objc` annotation to that as well. However, when you try to do that with a protocol extension, you get an error:"`@objc` can only be used with members of classes, `@objc` protocols, and concrete extensions of classes". And if you don't add the `@objc` annotation, you'll get all kinds of vague Segmentation Fault 11 errors. 
- Works fine with inheritance from a Swift class with no superclass
- Does not work with strutcts.


## Author

Isaac Greenspan, ilg@2718.us

## License

ILGDynamicObjC is available under the MIT license. See the LICENSE file for more info.
