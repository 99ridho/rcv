# RCV - Very Simple Chat View Controller

Chat view controller with basic functionality and simplicity. 

Only displaying text chats, plain UI :D

![aaa](http://i.imgur.com/MAkV35e.png)

## Status

WIP

## How to use

Copy `RCV.storyboard` and `RCV.swift` to your project manually.

Then, write this code to use this view controller on your source code:

```swift
let storyboard = UIStoryboard(name: "RCV", bundle: nil)
let cvc = storyboard.instantiateInitialViewController() as! RCVViewController

self.navigationController?.pushViewController(cvc, animated: true)
// -- OR -- //
self.present(viewControllerToPresent: cvc, animated: true, completion: nil)
```

## TODO

- improve UI & functionality
- making dynamic framework (cocoapods)
- keyboard handling
- ... and more
