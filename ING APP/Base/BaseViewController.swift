//
//  BaseViewController.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit


fileprivate var loadingViewKey: UInt8 = 0
class BaseViewController: UIViewController {

    // MARK: - Properties
    private var viewModel: BaseViewModel
    private var loadingView: ActivityIndicatorView? {
        get {
            return objc_getAssociatedObject(self, &loadingViewKey) as? ActivityIndicatorView
        }
        set {
            objc_setAssociatedObject(self, &loadingViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: - Initializers
    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = BaseViewModel()
        super.init(coder: aDecoder)
    }
    
    public override init(nibName: String?, bundle: Bundle?) {
        viewModel = BaseViewModel()
        super.init(nibName: nibName, bundle: bundle)
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    public func showLoadingView() {
        if let lv = loadingView {
            self.view.bringSubviewToFront(lv)
        } else {
            loadingView = ActivityIndicatorView()
            self.view.addSubview(loadingView!)
            loadingView?.translatesAutoresizingMaskIntoConstraints = false
            let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[lv]|", options: .alignAllCenterY, metrics: nil, views: ["lv": loadingView!])
            NSLayoutConstraint.activate(hConstraints)
            let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[lv]|", options: .alignAllCenterX, metrics: nil, views: ["lv": loadingView!])
            NSLayoutConstraint.activate(vConstraints)
        }
    }
    
    public func hideLoadingView() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
    
    public func showErrorView(title: String, description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    


}
