//
//  ViewController.swift
//  mochi
//
//  Created by Angus Jelinek on 2/5/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.frame = CGRect(x: 0, y:0, width: 220, height: 50)
        button.center = view.center
        // Do any additional setup after loading the view.
    }

    @objc private func didTapButton() {
        guard let url = URL(string: "https://idp.rice.edu/idp/profile/cas/login?service=http://localhost:3000") else {
            return
        }

        let controller = WebViewController()
        controller.url = url
        present(controller, animated: true) {
            print("present web view")
        }
        
    }
    
}

