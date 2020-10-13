//
//  UIView+AnimationPreset.swift
//
//  Created by Julien SAGOT on 13/11/2020.
//  Copyright © 2020 Julien Sagot. All rights reserved.
//

import UIKit

extension UIView {

    public enum AnimationKind {
        /**
        The animation kind to perform regular animations.

        This animation kind uses the underlying [animateKeyframes(animate(withDuration:delay:options:animations:completion:)](https://developer.apple.com/documentation/uikit/uiview/1622451-animate) method.
        */
        case regular(options: AnimationOptions = [])
        /**
        The animation kind to use for creating a keyframe-based animation.

        The keyframes themselves are not part of the initial animation block you provide when picking this animation type. Inside the animations block, you must add the keyframe time and animation data by calling the addKeyframe(withRelativeStartTime:relativeDuration:animations:) method one or more times. Adding keyframes causes the animation to animate the view from its current value to the value of the first keyframe, then to the value of the next keyframe, and so on at the times you specify.
        If you do not add any keyframes in the animations block, the animation proceeds from start to end like a standard animation block. In other words, the system animates from the current view values to any new values over the specified duration.

        This animation kind uses the underlying [animateKeyframes(withDuration:delay:options:animations:completion:)](https://developer.apple.com/documentation/uikit/uiview/1622552-animatekeyframes) method.
        */
        case keyframe(options: KeyframeAnimationOptions = [])
        /**
        The animation kind to use for creating an animation based on a timing curve corresponding to the motion of a physical spring.
        * springDamping: The damping ratio for the spring animation as it approaches its quiescent state.
        To smoothly decelerate the animation without oscillation, use a value of 1.
        Employ a damping ratio closer to zero to increase oscillation.

        * initialVelocity: The initial spring velocity. For smooth start to the animation, match this value to the view’s velocity as it was prior to attachment.
        A value of 1 corresponds to the total animation distance traversed in one second.
        For example, if the total animation distance is 200 points and you want the start of the animation to match a view velocity of 100 pt/s, use a value of 0.5.

        This animation kind uses the underlying [animate(withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:)](https://developer.apple.com/documentation/uikit/uiview/1622594-animate) method.
        */
        case spring(springDamping: CGFloat, initialVelocity: CGFloat = 0, options: AnimationOptions = [])
    }

    public struct AnimationPreset {
        /// The kind of the animation.
        public let animationKind: AnimationKind
        /// The total duration of the animations. If you specify a negative value or 0, the changes are made without animating them.
        public let duration: DispatchTimeInterval
        /// The amount of time to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
        public let delay: DispatchTimeInterval?

        public init(animationKind: AnimationKind, duration: DispatchTimeInterval, delay: DispatchTimeInterval? = nil) {
            self.animationKind = animationKind
            self.duration = duration
            self.delay = delay
        }
    }

    public static func animate(using preset: AnimationPreset, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        let duration = TimeInterval(dispatchTimeInterval: preset.duration)
        let delay = TimeInterval(dispatchTimeInterval: preset.delay ?? .never)

        switch preset.animationKind {

        case .regular(let options):
            UIView.animate(withDuration: duration, delay: delay, options: options, animations: animations, completion: completion)

        case .keyframe(let options):
            UIView.animateKeyframes(withDuration: duration, delay: delay, options: options, animations: animations, completion: completion)

        case .spring(let damping, let initialVelocity, let options):
            UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: initialVelocity, options: options, animations: animations, completion: completion)
        }
    }

    public static func animate(using preset: AnimationPreset, animations: @escaping () -> Void) {
        animate(using: preset, animations: animations, completion: nil)
    }
}
