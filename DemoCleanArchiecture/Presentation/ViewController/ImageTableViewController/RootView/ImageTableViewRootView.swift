//
//  ImageTableViewRootView.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation
import UIKit

class ImageTableViewRootView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ImageTableVMAbs
    
    var selectedImage: UIImageView?
    
    init(frame: CGRect, vm: ImageTableVMAbs) {
        self.viewModel = vm
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private func commitInit() {
        Bundle.main.loadNibNamed("ImageTableViewRootView", owner: self)
        self.addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUpView()
    }
    
    private func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
    }
}

extension ImageTableViewRootView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        viewModel.removeExistOpration(indexPath: indexPath)
        viewModel.executeDownloadImage(indexPath: indexPath, completion: { [weak self] data in
            guard let `self` = self else { return }
            cell.configureCell(data: data)
        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfDataSource()
    }
    
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.cancelOperation(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ImageCell else { return }
        selectedImage = cell.imgView
        let originalFrame = selectedImage!.superview!.convert(selectedImage!.frame, to: nil)
        viewModel.handleDidSelected(at: indexPath, frame: originalFrame)
    }
}
