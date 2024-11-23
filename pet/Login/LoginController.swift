//
//  ViewController.swift
//  pet
//
//  Created by Isa Melsov on 13/11/24.
//

import UIKit
import SwiftUI

//MARK: - LoginController

class LoginController: UIViewController {
    
    // MARK: UI-элементы
    
    private let loginBigLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Вход"
        view.font = .systemFont(ofSize: 52, weight: .medium)
        view.textColor = .lightBlue
        return view
    }()
    
    private let phoneNumberLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Номер телефона "
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private let phoneNumberTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Номер телефона"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 20
        /// Установка внутреннего отступа и изображения слева
        let imageView = UIImageView(image: UIImage(systemName: "person.fill"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightBlue
        let padding: CGFloat = 10
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.width + padding, height: 0))
        imageView.frame = CGRect(x: padding / 2, y: 0, width: 20, height: 20) /// Размер изображения
        imageView.center.y = containerView.center.y /// Центрируем изображение по вертикали
        containerView.addSubview(imageView)
        view.leftView = containerView
        view.leftViewMode = .always
        return view
    }()
    
    private let passwordLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Пароль"
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private let passwordTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Пароль"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 20
        let imageView = UIImageView(image: UIImage(systemName: "key.fill"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightBlue
        let padding: CGFloat = 10
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.width + padding, height: 0))
        imageView.frame = CGRect(x: padding / 2, y: 0, width: 20, height: 20)
        imageView.center.y = containerView.center.y
        containerView.addSubview(imageView)
        view.leftView = containerView
        view.leftViewMode = .always
        return view
    }()
    
    private let loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Войти", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 24
        return view
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    // MARK: ЖИзненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .anotherWhite
        setup()
    }
    
    // MARK: - Установка функций
    
    private func setup() {
        setupTargets()
        validateForm()
        setupSubviews()
        setupConstraints()
        setupAction()
        setupGestureRecognizer()
    }
    
    // MARK: Установка UI-элементов
    
    private func setupSubviews() {
        view.addSubview(loginBigLabel)
        view.addSubview(phoneNumberLabel)
        view.addSubview(phoneNumberTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(loginLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginBigLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginBigLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            
            phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            phoneNumberLabel.topAnchor.constraint(equalTo: loginBigLabel.bottomAnchor, constant: 20),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 24),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
        setupAttributedText()
    }
    
    private func setupTargets() {
        phoneNumberTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false /// Позволяет передавать нажатия элементам интерфейса
        view.addGestureRecognizer(tapGesture)
    }
    
    // Пример использования функции в кнопке входа
    
    private var isFormValid: Bool {
        return !phoneNumberTextField.text!.isEmpty &&
        !passwordTextField.text!.isEmpty
    }
    
    private func validateForm() {
        if isFormValid {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .systemBlue
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .lightGray
        }
    }
    
    private func validatePasswords() {
        if ((passwordTextField.text?.isEmpty) == nil) || ((phoneNumberTextField.text?.isEmpty) == nil) {
            passwordTextField.text = ""
            phoneNumberTextField.text = ""
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            phoneNumberTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            // Пароли совпадают, переходим на следующий экран
            let vc = MainViewController()
            navigationController?.setViewControllers([vc], animated: true)
        }
    }
    
    private func setupAction() {
        loginButton.addAction(UIAction { [weak self] _ in
            self?.validatePasswords()
        }, for: .touchUpInside)
    }
    
    // MARK: Установка кастомного текста
    
    private func setupAttributedText() {
        let text = "Нажмите здесь, если нет аккаунта"
        let attributedString = NSMutableAttributedString(string: text)
        // Синяя часть (текст "Нажмите здесь,")
        let blueRange = (text as NSString).range(of: "Нажмите здесь,")
        attributedString.addAttribute(.foregroundColor, value: UIColor.lightBlue, range: blueRange)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: blueRange)
        // Чёрная часть (остальной текст)
        let blackRange = (text as NSString).range(of: " если нет аккаунта")
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: blackRange)
        loginLabel.attributedText = attributedString
        /// Добавляем GestureRecognizer для нажатия на синюю часть
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBlueTextTap(_:)))
        loginLabel.addGestureRecognizer(tapGesture)
    }
    
    // MARK: objc функции
    
    @objc private func handleBlueTextTap(_ gesture: UITapGestureRecognizer) {
        let text = loginLabel.attributedText?.string ?? ""
        let blueRange = (text as NSString).range(of: "Нажмите здесь,")
        if gesture.didTapAttributedTextInLabel(label: loginLabel, inRange: blueRange) {
            let nextVC = SecondViewController()
            navigationController?.setViewControllers([nextVC], animated: true)
        }
    }
        
    @objc private func dismissKeyboard() {
        view.endEditing(true) /// Закрывает клавиатуру
    }
    
    @objc private func resetBorders() {
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        phoneNumberTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc private func textFieldDidChange() {
        validateForm()
        resetBorders()
    }
    
}

//MARK: - Сanva для LoginController

struct ViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return LoginController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

@available(iOS 13.0, *)
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview()
            .previewDevice("iPhone 14 Pro")
    }
}
