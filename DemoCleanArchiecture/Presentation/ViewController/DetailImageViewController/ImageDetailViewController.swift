//
//  ImageDetailViewController.swift
//  DemoCleanArchiecture
//
//  Created by Apple on 04/03/2023.
//

import UIKit

class ImageDetailViewController: UIViewController {

    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var viewModel: ImageDetailVMAbs
    init(vm: ImageDetailVMAbs) {
        self.viewModel = vm
        super.init(nibName: "ImageDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBlurView()
        bindDataToView()
    }
    
    private func setUpBlurView() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.addSubview(blurEffectView)
        blurEffectView.frame = blurView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func bindDataToView() {
        nameLabel.text = viewModel.getImageName()
        imgView.image = UIImage(data: viewModel.getImageData())
    }

    @IBAction func buttonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
