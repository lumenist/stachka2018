//
//  ViewController.swift
//  stachka2018
//
//  Copyright © 2018 *. All rights reserved.
//

import UIKit


final class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var nicknameTextField: UITextField!
    
    
    // MARK: - Properties
    
    private let transport = AlamofireTransport()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: - Actions
    
    @IBAction func onLog(_ sender: Any) {
        guard let text = nicknameTextField.text else { return }
        
        activityIndicator.startAnimating()
        
        transport.obtainProfile(name: text) { [weak self] in
            self?.activityIndicator.stopAnimating()
        }
    }

}

