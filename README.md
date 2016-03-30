# LevenshteinSwift

Compute Levenshtein string differences using swift.

Started as a direct port of Mark Aufflick's Objective-C "NSString+Levenshtein", but it's evolved a bit from there, especially with regards to Swiftian idioms.

Pull requests welcome.

Roadmap? Implement some of the optimizations noted here:

http://stackoverflow.com/questions/26990394/slow-swift-arrays-and-strings-performance

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

    let score = "abc".asciiLevenshteinDistance("abb")
    // => 1

## Requirements

LevenshteinSwift uses Foundation, and is currently building for Swift 2.2 (Xcode 7.3). It has no external dependancies. 

## Installation

### CocoaPods

LevenshteinSwift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LevenshteinSwift"
```

### Swift Package Manager

You can install LevenshteinSwift using your Package.swift file, like so:

    import PackageDescription
    
    let package = Package(
      name: "ndx_client",
      dependencies: [
        .Package(url: "https://github.com/kylef/commander", majorVersion: 0)
      ]
    )

Then just throw an `import LevenshteinSwift` at the top of any files you'd like to use the extension in.

## License

LevenshteinSwift is available under the MIT license. See the LICENSE file for more info.
