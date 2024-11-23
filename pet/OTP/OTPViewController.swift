//
//  OTPViewController.swift
//  pet
//
//  Created by Isa Melsov on 21/11/24.
//

import UIKit
import SwiftUI

protocol OTPFieldDelegate: AnyObject {
    func backwardDeteced(textField: OTPTextField)
}

class OTPViewController: UIViewController, UITextFieldDelegate, OTPFieldDelegate {
    
    private var verifyButtonBottomConstraint: NSLayoutConstraint!
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .equalSpacing
        view.spacing = 16
        return view
    }()
    
    private let textField1: OTPTextField = {
        let view = OTPTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightBlue.cgColor
        view.font = UIFont.systemFont(ofSize: 24)
        view.borderStyle = .roundedRect
        view.keyboardType = .numberPad
        view.layer.cornerRadius = 8
        view.placeholder = "0"
        return view
    }()
    
    private let textField2: OTPTextField = {
        let view = OTPTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightBlue.cgColor
        view.font = UIFont.systemFont(ofSize: 24)
        view.borderStyle = .roundedRect
        view.keyboardType = .numberPad
        view.layer.cornerRadius = 8
        view.placeholder = "0"
        return view
    }()
    
    private let textField3: OTPTextField = {
        let view = OTPTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 24)
        view.borderStyle = .roundedRect
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightBlue.cgColor
        view.keyboardType = .numberPad
        view.layer.cornerRadius = 8
        view.placeholder = "0"
        return view
    }()
    
    private let textField4: OTPTextField = {
        let view = OTPTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightBlue.cgColor
        view.font = UIFont.systemFont(ofSize: 24)
        view.borderStyle = .roundedRect
        view.keyboardType = .numberPad
        view.layer.cornerRadius = 8
        view.placeholder = "0"
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 20, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.textColor = .lightGray
        view.text = "На вашу почту был отправлен код.\nВведите 4-х цифровой код\nподтверждения"
        return view
    }()
    
    private let verifyButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Проверить", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 8
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Введите код подтверждения"
        view.backgroundColor = .white
        setup()
        self.title = "Введите код подтверждения"
        
        // Подписка на уведомления клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        // Удаление наблюдателей
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupDelegate()
        setupAction()
        setupGestureRecognizer()
    }
    
    private func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tapGesture.cancelsTouchesInView = false // Позволяет передавать нажатия элементам интерфейса
            view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true) // Закрывает клавиатуру
    }
    
    private func setupSubviews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(textField1)
        stackView.addArrangedSubview(textField2)
        stackView.addArrangedSubview(textField3)
        stackView.addArrangedSubview(textField4)
        view.addSubview(descriptionLabel)
        view.addSubview(verifyButton)
    }
    
    private func setupConstraints() {
        verifyButtonBottomConstraint = verifyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField1.widthAnchor.constraint(equalToConstant: 60),
            textField1.heightAnchor.constraint(equalTo: textField1.widthAnchor),
            
            textField2.widthAnchor.constraint(equalToConstant: 60),
            textField2.heightAnchor.constraint(equalTo: textField1.widthAnchor),
            
            textField3.widthAnchor.constraint(equalToConstant: 60),
            textField3.heightAnchor.constraint(equalTo: textField1.widthAnchor),
            
            textField4.widthAnchor.constraint(equalToConstant: 60),
            textField4.heightAnchor.constraint(equalTo: textField1.widthAnchor),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            verifyButtonBottomConstraint,
            verifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            verifyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            verifyButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func setupAction() {
        verifyButton.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            let mainViewController = MainViewController()
            self.navigationController?.setViewControllers([mainViewController], animated: true)
        }, for: .touchUpInside)
    }

    
    private func setupDelegate() {
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        
        textField1.backDelegate = self
        textField2.backDelegate = self
        textField3.backDelegate = self
        textField4.backDelegate = self
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let keyboardHeight = keyboardFrame.height
            verifyButtonBottomConstraint.constant = -keyboardHeight - 16
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        verifyButtonBottomConstraint.constant = -40
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Сопоставление textField с порядком
        let textFields = [textField1, textField2, textField3, textField4]
        
        guard let index = textFields.firstIndex(of: textField as! OTPTextField),
              let currentTextField = textFields[safe: index] else {
            return false
        }

        // Проверка на пустую строку
        if string.isEmpty {
            currentTextField.text = string
            if let previousTextField = textFields[safe: index - 1] {
                previousTextField.becomeFirstResponder()
            }
            return false
        }

        // Ограничение ввода только цифр
        if let _ = Int(string) {
            currentTextField.text = string
            if let nextTextField = textFields[safe: index + 1] {
                nextTextField.becomeFirstResponder()
            }
            return false
        }

        return false
    }
    
    func backwardDeteced(textField: OTPTextField) {
        switch textField {
        case textField1:
            print("txt1 -> no change")
        case textField2:
            textField1.becomeFirstResponder()
        case textField3:
            textField2.becomeFirstResponder()
        case textField4:
            textField3.becomeFirstResponder()
        default:
            print("at default")
        }
    }
}


class OTPTextField: UITextField {
    weak var backDelegate: OTPFieldDelegate?
    override func deleteBackward() {
        super.deleteBackward()
        self.backDelegate?.backwardDeteced(textField: self)
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}



struct OTPViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return OTPViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

@available(iOS 13.0, *)
struct OTPViewController_Previews: PreviewProvider {
    static var previews: some View {
        OTPViewControllerPreview()
            .previewDevice("iPhone 14 Pro")
    }
}
