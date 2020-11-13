//
//  SecondViewController.swift
//  ITP342DelegationPattern
//
//  Created by Boyuan Xu on 11/12/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?
    let textField = UITextField()
    let button = UIButton()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        textField.delegate = self
    }

    private func initUI() {
        view.backgroundColor = .systemBackground
        textField.placeholder = "Send a message via the delegate!"
        button.setTitle("Send and dismiss", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapAction), for: .touchUpInside)
        stackView.axis = .vertical
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(button)
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func buttonTapAction() {
        delegate?.didSetButtonTitle(title: textField.text ?? "")
        dismiss(animated: true, completion: nil)
    }

}

extension SecondViewController: UITextFieldDelegate {
    
    // Dismiss keyboard on return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
}
