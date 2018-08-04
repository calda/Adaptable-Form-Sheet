//
//  AFSModalViewController.swift
//  Adaptable-Form-Sheet
//
//  Created by Cal Stephens on 8/10/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

import UIKit

// MARK: - AFSModalOptionsProvider

public protocol AFSModalOptionsProvider {
    var backgroundDimmerOpacity: CGFloat? { get }
    var dismissWhenUserTapsDimmer: Bool? { get }
    var animationDuration: TimeInterval? { get }
}

public extension AFSModalOptionsProvider {
    var backgroundDimmerOpacity: CGFloat? { return nil }
    var dismissWhenUserTapsDimmer: Bool? { return nil }
    var animationDuration: TimeInterval? { return nil }
}


// MARK: - AFSModalViewController

open class AFSModalViewController: UIViewController {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupForTransition()
    }
    
    public required override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupForTransition()
    }
    
    private func setupForTransition() {
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }
    
}


// MARK: - UIViewControllerTransitioningDelegate

extension AFSModalViewController: UIViewControllerTransitioningDelegate {

    open func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController) -> UIPresentationController?
    {
        return AFSPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    open func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return AFSAnimatedTransitioning(direction: .presenting)
    }
    
    open func animationController(
        forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return AFSAnimatedTransitioning(direction: .dismissing)
    }
    
    open func interactionControllerForPresentation(
        using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    {
        return AFSAnimatedTransitioning(direction: .presenting)
    }
    
    open func interactionControllerForDismissal(
        using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    {
        return AFSAnimatedTransitioning(direction: .dismissing)
    }
    
}
