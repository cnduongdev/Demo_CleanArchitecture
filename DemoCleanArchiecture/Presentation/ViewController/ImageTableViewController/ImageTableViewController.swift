//
//  ImageTableViewController.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import UIKit

class ImageTableViewController: UIViewController {

    // MARK: - Navigation
    
    var viewModel: ImageTableVM
    init(vm: ImageTableVMAbs) {
        self.viewModel = vm as! ImageTableVM
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
        // Do any additional setup after loading the vie
    }
    
}
