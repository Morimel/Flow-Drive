import UIKit
import SwiftUI

class SecondViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let registerLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Регистрация"
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
        
        // Установка внутреннего отступа и изображения слева
        let imageView = UIImageView(image: UIImage(systemName: "person.fill"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightBlue
        
        let padding: CGFloat = 10
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.width + padding, height: 0))
        imageView.frame = CGRect(x: padding / 2, y: 0, width: 20, height: 20) // Размер изображения
        imageView.center.y = containerView.center.y // Центрируем изображение по вертикали
        containerView.addSubview(imageView)
        
        view.leftView = containerView
        view.leftViewMode = .always
        return view
    }()
    
    
    private let emailNumberLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "E-mail"
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private let emailNumberTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Введите e-mail"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 20
        
        // Установка внутреннего отступа и изображения слева
        let imageView = UIImageView(image: UIImage(systemName: "envelope.fill"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightBlue
        
        let padding: CGFloat = 10
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.width + padding, height: 0))
        imageView.frame = CGRect(x: padding / 2, y: 0, width: 20, height: 20) // Размер изображения
        imageView.center.y = containerView.center.y // Центрируем изображение по вертикали
        containerView.addSubview(imageView)
        
        view.leftView = containerView
        view.leftViewMode = .always
        return view
    }()
    
    
    
    private let carNumberLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Номер автомобиля"
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private let carNumberTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Номер автомобиля"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 20
        
        // Установка внутреннего отступа и изображения слева
        let imageView = UIImageView(image: UIImage(systemName: "car"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightBlue
        
        let padding: CGFloat = 10
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.width + padding, height: 0))
        imageView.frame = CGRect(x: padding / 2, y: 0, width: 20, height: 20) // Размер изображения
        imageView.center.y = containerView.center.y // Центрируем изображение по вертикали
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
        view.placeholder = "Введите пароль"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 20
        
        // Установка внутреннего отступа и изображения слева
        let imageView = UIImageView(image: UIImage(systemName: "key.fill"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightBlue
        
        let padding: CGFloat = 10
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.width + padding, height: 0))
        imageView.frame = CGRect(x: padding / 2, y: 0, width: 20, height: 20) // Размер изображения
        imageView.center.y = containerView.center.y // Центрируем изображение по вертикали
        containerView.addSubview(imageView)
        
        view.leftView = containerView
        view.leftViewMode = .always
        return view
    }()
    
    private let repeatPasswordLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Повторите пароль"
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private let repeatPasswordTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Повторите пароль"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 20
        
        // Установка внутреннего отступа и изображения слева
        let imageView = UIImageView(image: UIImage(systemName: "key.fill"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightBlue
        
        let padding: CGFloat = 10
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.width + padding, height: 0))
        imageView.frame = CGRect(x: padding / 2, y: 0, width: 20, height: 20) // Размер изображения
        imageView.center.y = containerView.center.y // Центрируем изображение по вертикали
        containerView.addSubview(imageView)
        
        view.leftView = containerView
        view.leftViewMode = .always
        return view
    }()
    
    private let registerButton: UIButton = {
        let view = UIButton()
        view.setTitle("Зарегистрироваться", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightBlue
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .anotherWhite
        setup()
        /// 1.  Add tap gesture to view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
        view.addGestureRecognizer(tapGesture)
        
        
        
        phoneNumberTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            carNumberTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            repeatPasswordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        validateForm()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /// 6. Add observers to recieve UIKeyboardWillShow UIKeyboardWill hide notification
        addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /// 7. Remove observers to NOT recieve notifications when viewController is in the background
        removeObservers()
    }
    
    /// 2. Add method to handle tap event on the view and dismiss keyboard
    @objc func didTapView(gesture: UITapGestureRecognizer) {
        // This should hide keyboard for the view
        view.endEditing(true)
    }
    
    /// 3. Add observers for 'UIKeyboardWillShow' and 'UIKeyboardWillHide' notification
    func addObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] notification in
            self?.keyboardWillShow(notification: notification)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { [weak self] notification in
            self?.keyboardWillHide(notification: notification)
        }
    }
    
    /// 4.  Add method to handle keyboardWillShow notification, we're using this method to adjust scrollView to show hidden textField under keyboard
    func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
                let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        scrollView.contentInset = contentInset
//        scrollView.scrollIndicatorInsets = contentInset
    }
    
    /// 5. Method to reset scrollView when keyboard is hidden
    func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    /// 6. Method to remove observers
    func removeObservers() {
        NotificationCenter.default.removeObserver(self )
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupAction()
        setupGestureRecognizer()
    }
    
    private func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
            tapGesture.cancelsTouchesInView = false // Позволяет элементам интерфейса обрабатывать нажатия
            view.addGestureRecognizer(tapGesture)
    }
    
    
    
    private func setupSubviews() {
        view.addSubview(scrollView)
            scrollView.addSubview(registerLabel)
            scrollView.addSubview(phoneNumberLabel)
            scrollView.addSubview(phoneNumberTextField)
            scrollView.addSubview(carNumberLabel)
            scrollView.addSubview(carNumberTextField)
        scrollView.addSubview(emailNumberLabel)
        scrollView.addSubview(emailNumberTextField)
            scrollView.addSubview(passwordLabel)
            scrollView.addSubview(passwordTextField)
            scrollView.addSubview(repeatPasswordLabel)
            scrollView.addSubview(repeatPasswordTextField)
            scrollView.addSubview(registerButton)
            scrollView.addSubview(loginLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            registerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 12),
            registerLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            registerLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),

            phoneNumberLabel.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 20),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),

            phoneNumberTextField.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),

            carNumberLabel.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 24),
            carNumberLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            carNumberLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),

            carNumberTextField.topAnchor.constraint(equalTo: carNumberLabel.bottomAnchor, constant: 10),
            carNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            carNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            carNumberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailNumberLabel.topAnchor.constraint(equalTo: carNumberTextField.bottomAnchor, constant: 24),
            emailNumberLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            emailNumberLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),

            emailNumberTextField.topAnchor.constraint(equalTo: emailNumberLabel.bottomAnchor, constant: 10),
            emailNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailNumberTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordLabel.topAnchor.constraint(equalTo: emailNumberTextField.bottomAnchor, constant: 24),
            passwordLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            passwordLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),

            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            repeatPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            repeatPasswordLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            repeatPasswordLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),

            repeatPasswordTextField.topAnchor.constraint(equalTo: repeatPasswordLabel.bottomAnchor, constant: 10),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 50),

            registerButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 34),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            registerButton.heightAnchor.constraint(equalToConstant: 50),

            loginLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 32),
            loginLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20) // Ограничение нижней границы
        ])
        setupAttributedText()
    }
    
    
    
    
    private var isFormValid: Bool {
        return !phoneNumberTextField.text!.isEmpty &&
               !carNumberTextField.text!.isEmpty &&
               !passwordTextField.text!.isEmpty &&
               !repeatPasswordTextField.text!.isEmpty
    }
    
    private func validateForm() {
        if isFormValid {
            registerButton.isEnabled = true
            registerButton.backgroundColor = .systemBlue // Задаем активный цвет
        } else {
            registerButton.isEnabled = false
            registerButton.backgroundColor = .lightGray // Задаем неактивный цвет
        }
    }

    private func validatePasswords() {
        if passwordTextField.text != repeatPasswordTextField.text {
            // Пароли не совпадают
            passwordTextField.text = ""
            repeatPasswordTextField.text = ""
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            repeatPasswordTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            // Пароли совпадают, переходим на следующий экран
            let vc = OTPViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    
    @objc private func resetBorders() {
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        repeatPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc private func textFieldDidChange() {
        validateForm()
        resetBorders()
    }




    
    private func setupAction() {
        registerButton.addAction(UIAction { [weak self] _ in
            self?.validatePasswords()
        }, for: .touchUpInside)
    }

    
    
    private func setupAttributedText() {
        let text = "Нажмите здесь, если есть аккаунт"
        let attributedString = NSMutableAttributedString(string: text)
        // Синяя часть (текст "Нажмите здесь,")
        let blueRange = (text as NSString).range(of: "Нажмите здесь,")
        attributedString.addAttribute(.foregroundColor, value: UIColor.lightBlue, range: blueRange)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: blueRange)
        // Чёрная часть (остальной текст)
        let blackRange = (text as NSString).range(of: " если есть аккаунт")
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: blackRange)
        loginLabel.attributedText = attributedString
        // Добавляем GestureRecognizer для нажатия на синюю часть
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBlueTextTap(_:)))
        loginLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleBlueTextTap(_ gesture: UITapGestureRecognizer) {
        let text = loginLabel.attributedText?.string ?? ""
        let blueRange = (text as NSString).range(of: "Нажмите здесь,")
        if gesture.didTapAttributedTextInLabel(label: loginLabel, inRange: blueRange) {
            let nextVC = LoginController()
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
}

struct SecondViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return SecondViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

@available(iOS 13.0, *)
struct SecondViewController_Previews: PreviewProvider {
    static var previews: some View {
        SecondViewControllerPreview()
            .previewDevice("iPhone 14 Pro")
    }
}
