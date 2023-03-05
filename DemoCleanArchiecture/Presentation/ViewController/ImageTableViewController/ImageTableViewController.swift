//
//  ImageTableViewController.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import UIKit
import Combine

class ImageTableViewController: UIViewController {

    // MARK: - Navigation
    
    var popAnimator = PopAnimator()
    var viewModel: ImageTableVMAbs
    var factory: ImageTblFactoryAbs
    var originalFrame: CGRect = .zero
    
    var set = Set<AnyCancellable>()
    
    init(vm: ImageTableVMAbs, factory: ImageTblFactoryAbs) {
        self.viewModel = vm
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ImageTableViewRootView(frame: .zero, vm: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeCombine()
    }
    
    func observeCombine() {
        viewModel.getViewStateSubject().sink { [weak self] viewState in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                self.reactViewStateChange(viewState: viewState)
            }
        }.store(in: &set)
    }
    
    func reactViewStateChange(viewState: ImageTableState) {
        
        switch viewState {
        case .openImageDetailVC(let model, let frame):
            openImageDetailVC(model: model, frame: frame)
            break
        default:
            break
        }
    }
    
    func openImageDetailVC(model: ImageDataModel, frame: CGRect) {
        originalFrame = frame
        let imgDetailViewController = factory.makeImgDetailViewController(data: model.data, name: model.name)
        imgDetailViewController.transitioningDelegate = self
        imgDetailViewController.modalPresentationStyle = .fullScreen
        self.present(imgDetailViewController, animated: true)
    }
}

extension ImageTableViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        popAnimator.presenting = true
        popAnimator.originFrame = originalFrame
        return popAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        popAnimator.presenting = false
        return popAnimator
    }
}
