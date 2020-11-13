//
//  ViewController.swift
//  ITP342DelegationPattern
//
//  Created by Boyuan Xu on 11/12/20.
//

import UIKit

protocol ViewControllerDelegate: class {
    func didSetButtonTitle(title: String)
}

class ViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    private func initUI() {
        view.backgroundColor = .systemBackground
        button.setTitle("Touch Me", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapAction), for: .touchUpInside)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 10
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonTapAction() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        present(secondVC, animated: true, completion: nil)
    }

}

extension ViewController: ViewControllerDelegate {
    
    func didSetButtonTitle(title: String) {
        button.setTitle(title, for: .normal)
    }
    
}
