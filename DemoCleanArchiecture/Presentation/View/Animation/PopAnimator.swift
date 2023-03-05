//
//  PopAnimator.swift
//  DemoCleanArchiecture
//
//  Created by Apple on 04/03/2023.
//

import Foundation
import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var originFrame: CGRect = .zero
    var presenting = true
    var duration: TimeInterval = 0.4
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: .from),
              let toView = transitionContext.view(forKey: .to) else { return }
        
        let herbView = presenting ? toView : fromView
        let initialFrame = presenting ? originFrame : herbView.frame
        let finalFrame =  presenting ? herbView.frame : originFrame
        
        let scaleX = presenting ? (initialFrame.width / finalFrame.width) :  (finalFrame.width / initialFrame.width)
        let scaleY = presenting ? (initialFrame.height / finalFrame.height) : (finalFrame.height / initialFrame.height)
        
        let transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        
        if presenting {
            herbView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            herbView.transform = transform
            herbView.clipsToBounds = true
        }
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(herbView)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8) {
            herbView.transform = self.presenting ? .identity : transform
            herbView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        } completion: { _ in
            transitionContext.completeTransition(true)
        }
    }
}
