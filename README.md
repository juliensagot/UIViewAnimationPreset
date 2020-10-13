# UIViewAnimationPreset
> Use presets with UIView.animate APIs

This simple `UIView` extension lets you **define** and **reuse animation presets** with `UIView.animate` APIs.

## Why?

Because system APIs to animate views are way too verbose to my taste and won't let you use presets which makes it hard to have consistent animations.

## Supported animations

Because our `UIView.animate(using preset: AnimationPreset)` function uses system APIs internally, this extension supports **regular**, **keyframe** and **spring** animations.

## Usage
```swift
import UIViewAnimationPreset

extension UIView.AnimationPreset {

    // We extend `UIView.AnimationPreset` so we can use our presets all over our app
    static var cellSelection: Self {
        let options: UIView.AnimationOptions = [.allowUserInteraction, .beginFromCurrentState]
        let kind = UIView.AnimationKind.spring(springDamping: 0.96, initialVelocity: 0, options: options)
        return .init(animationKind: kind, duration: .milliseconds(250))
    }
}

let view = UIView()

// Animate the view using our preset
UIView.animate(using: .cellSelection) { 
    view.transform = .init(scaleX: 0.94, y: 0.94) 
}
```

## Integration

### Swift Package Manager

To install `UIViewAnimationPreset` using **Swift Package Manager**, add it as a dependency into your `Package.swift` file:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/juliensagot/UIViewAnimationPreset.git", from: "1.0.0")
    ],
    ...
)
```
