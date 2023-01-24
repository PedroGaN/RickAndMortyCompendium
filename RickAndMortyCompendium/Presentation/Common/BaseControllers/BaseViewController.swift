//
//  BaseViewController.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation
import UIKit

public protocol BaseViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
}

private protocol BaseViewDependencies: AnyObject {
    associatedtype Presenter

    func getPresenter() -> Presenter?
}

class BaseViewController<Presenter>: UIViewController,
                                     BaseViewDependencies,
                                     BindableType,
                                     UIGestureRecognizerDelegate,
                                     UIAdaptivePresentationControllerDelegate {
    
    // MARK: - VIPER Dependencies

    public var presenter: BasePresenterProtocol!
    
    public func getPresenter() -> Presenter? {
        return presenter as? Presenter
    }

    // MARK: - Properties

    private var loadingView: UIView?
    
    // MARK: - Lifecycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()

        /// Add delegate to register the backward gesture
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        /// Add listener to register the pop gesture
        navigationController?.interactivePopGestureRecognizer?.addTarget(self, action: #selector(handlePopGesture))
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.willDisappear()
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.didDisappear()
    }
    
    // MARK: - BindableType
    /// Override method
    open func setupUI() {}

    // MARK: - BaseViewProtocol

    internal func showLoading() {
        showNativeLoading(parentView: view)
    }

    internal func hideLoading() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }

    // MARK: - Methods

    internal func showNativeLoading(parentView: UIView) {
        if loadingView == nil {
            let loadingHeight: CGFloat = 100
            let loadingRadius: CGFloat = 15
            let loadingView = UIView()
            loadingView.backgroundColor = .black
            loadingView.alpha = 0.4
            loadingView.setCorners(radius: loadingRadius)

            let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
            activityIndicatorView.center = parentView.center
            activityIndicatorView.startAnimating()

            loadingView.addSubview(childView: activityIndicatorView)
            parentView.addSubview(childView: loadingView, constraintType: .center)

            let heightConstraint = NSLayoutConstraint(item: loadingView, attribute: .height, relatedBy: .equal,
                                                      toItem: nil, attribute: .height,
                                                      multiplier: 1, constant: loadingHeight)
            let widthConstraint = NSLayoutConstraint(item: loadingView, attribute: .width, relatedBy: .equal,
                                                     toItem: loadingView, attribute: .height,
                                                     multiplier: 1, constant: 0)

            parentView.addConstraints([heightConstraint, widthConstraint])
            self.loadingView = loadingView
        }
    }
    
    // MARK: - UIGestureRecognizerDelegate functions

    /// Event associated with 'pop' gesture.
    @objc open func handlePopGesture(gesture: UIGestureRecognizer) {
        if gesture.state == .began {
            presenter.handlePopBeganGesture()
        } else if gesture.state == .ended {
            presenter.handlePopEndedGesture()
        }
    }

}
