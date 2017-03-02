# DHSegmentedControl


[![Version](https://img.shields.io/cocoapods/v/DHSegmentedControl.svg?style=flat)](http://cocoapods.org/pods/DHSegmentedControl)
[![License](https://img.shields.io/cocoapods/l/DHSegmentedControl.svg?style=flat)](http://cocoapods.org/pods/DHSegmentedControl)
[![Platform](https://img.shields.io/cocoapods/p/DHSegmentedControl.svg?style=flat)](http://cocoapods.org/pods/DHSegmentedControl)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![](https://i.stack.imgur.com/GG66O.gif "Screenshot")

## Requirements

## Installation

DHSegmentedControl is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DHSegmentedControl"
```

Usage
---

```swift
        // In appropriate function, maybe viewDidLoad(), we create the segments
        var segments = [DHSemgentTitleContainable]()
        
        segments.append(DHSegmentTitle("ALL"))
        segments.append(DHSegmentTitle("EAT"))
        segments.append(DHSegmentTitle("DRINK"))
        segments.append(DHSegmentTitle("DESSERT"))
        segments.append(DHSegmentTitle("EVENTS"))
        segments.append(DHSegmentTitle("SITES"))

        // With these segments we then create a Segmented Control
        let scrollabelSegmentControl = DHSegmentedControl(items: segments)
        
        //Later on set the frames of the control
        scrollabelSegmentControl.frame = segmentsContainer.bounds;
        scrollabelSegmentControl.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin,.flexibleWidth]
        scrollabelSegmentControl.addTarget(self, action: #selector(segmentControlValueChanged(segmentControl:)), for: .valueChanged)
        // In the end add the control to the view
        self.segmentsContainer.addSubview(scrollabelSegmentControl)
```
## Author

d_hudinwal, dinesh_hudinwal@hotmail.com

## License

DHSegmentedControl is available under the MIT license. See the LICENSE file for more info.
