import UIKit
import SwiftUI

// MARK: - SecondViewController

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: UI-элементы
    
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
        view.keyboardType = .numberPad
        view.text = "+996"
        
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
        view.keyboardType = .emailAddress
        view.autocorrectionType = .no
        view.autocapitalizationType = .none // Заглавные буквы
        let imageView = UIImageView(image: UIImage(systemName: "envelope.fill"))
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
    
    private let carNumberLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Номер автомобиля"
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private let carNumberExampleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .lightBlue
        view.backgroundColor = .anotherWhite
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.text = "07KG015XAM"
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
        view.keyboardType = .asciiCapable // Английская раскладка
        view.autocapitalizationType = .allCharacters // Заглавные буквы
        view.clipsToBounds = false // Позволяем элементам выходить за границы
        let imageView = UIImageView(image: UIImage(systemName: "car"))
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
    
    private let passwordLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Пароль"
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private let eyeButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        return view
    }()
    
    private let passwordTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Введите пароль"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        view.layer.borderWidth = 1
        view.isSecureTextEntry = true
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
        view.isSecureTextEntry = true
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
    
    private let warningLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .red
        view.isHidden = true
        view.text = "Пароль должен содержать не менее 8 символом\nи содержать хотя бы один цифру"
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 12, weight: .regular)
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
    
    // MARK: Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .anotherWhite
        setup()
        setupCarNumberMask()

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
    
    // MARK: Установка функций
    
    private func setup() {
        setupEyeButtonAction()
        setupDelegates()
        setupTargets()
        setupGestureRecognizer()
        validateForm()
        setupSubviews()
        setupConstraints()
        setupAction()
        setupGestureRecognizer()
    }
    
    private func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(warningLabel)
        scrollView.addSubview(registerLabel)
        scrollView.addSubview(phoneNumberLabel)
        scrollView.addSubview(phoneNumberTextField)
        scrollView.addSubview(carNumberLabel)
        scrollView.addSubview(carNumberTextField)
        scrollView.addSubview(carNumberExampleLabel) // Добавляем метку отдельно, чтобы она была выше
        scrollView.addSubview(emailNumberLabel)
        scrollView.addSubview(emailNumberTextField)
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(eyeButton)
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
            
            registerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 4),
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
            
            carNumberExampleLabel.centerYAnchor.constraint(equalTo: carNumberTextField.topAnchor),
            carNumberExampleLabel.leadingAnchor.constraint(equalTo: carNumberTextField.leadingAnchor, constant: 24),
            
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
            
            eyeButton.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -4),
            eyeButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -12),
            
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
            
            warningLabel.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 4),
            warningLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            registerButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 36),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 32),
            loginLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20) // Ограничение нижней границы
        ])
        setupAttributedText()
    }
    
    private func setupEyeButtonAction() {
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
    }
    
    private func setupCarNumberMask() {
        // Создаем маску, которая перекроет верхнюю часть границы
        let maskLayer = CALayer()
        maskLayer.frame = CGRect(x: 0, y: 0, width: carNumberTextField.frame.width, height: 10) // Высота области перекрытия
        maskLayer.backgroundColor = UIColor.white.cgColor // Цвет совпадает с цветом фона

        // Добавляем маску к carNumberTextField
        carNumberTextField.layer.addSublayer(maskLayer)
    }
    
    private var isFormValid: Bool {
        return !phoneNumberTextField.text!.isEmpty &&
        !carNumberTextField.text!.isEmpty &&
        !passwordTextField.text!.isEmpty &&
        !repeatPasswordTextField.text!.isEmpty
    }
    
    private func setupGestureView() {
        /// 1.  Add tap gesture to view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupTargets() {
        phoneNumberTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        carNumberTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        repeatPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
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
    
    private func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
        tapGesture.cancelsTouchesInView = false // Позволяет элементам интерфейса обрабатывать нажатия
        view.addGestureRecognizer(tapGesture)
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
        guard let password = passwordTextField.text,
              let repeatPassword = repeatPasswordTextField.text else { return }

        // Проверяем длину пароля
        if password.count < 8 || repeatPassword.count < 8 {
            warningLabel.text = "Пароль должен содержать не менее 8 символов"
            showPasswordError()
            return
        }

        // Проверяем наличие хотя бы одной цифры
        let containsDigit = password.rangeOfCharacter(from: .decimalDigits) != nil
        if !containsDigit {
            warningLabel.text = "Пароль должен содержать хотя бы одну цифру"
            showPasswordError()
            return
        }

        // Проверяем совпадение паролей
        if password != repeatPassword {
            warningLabel.text = "Пароли не совпадают"
            showPasswordError()
            return
        }

        // Если все условия выполнены
        warningLabel.text = ""
        proceedToNextScreen()
    }

    private func showPasswordError() {
        // Очищаем текстовые поля
        passwordTextField.text = ""
        repeatPasswordTextField.text = ""

        // Меняем цвет границы на красный
        passwordTextField.layer.borderColor = UIColor.red.cgColor
        repeatPasswordTextField.layer.borderColor = UIColor.red.cgColor

        // Показываем предупреждение
        warningLabel.isHidden = false
    }

    private func resetPasswordFields() {
        // Сбрасываем границу на исходное состояние
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        repeatPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor

        // Скрываем предупреждение
        warningLabel.isHidden = true
    }

    private func proceedToNextScreen() {
        // Действие при успешной проверке
        let vc = OTPViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    // Добавляем обработку изменения текста для восстановления нормального состояния
    @objc private func textFieldDidChange(_ textField: UITextField) {
        // Сбрасываем состояние
        resetPasswordFields()
        validateForm() // Проверка общей формы
    }

    
    private func setupDelegates() {
        phoneNumberTextField.delegate = self
    }
    
    private func formatter(mask: String, phoneNumber: String) -> String {
        /// Оставляем только цифры, исключая префикс "+996"
        let digits = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = "+996 " // Фиксированный префикс
        var index = digits.startIndex
        /// Пропускаем первые три цифры префикса (996)
        if digits.hasPrefix("996") {
            index = digits.index(index, offsetBy: 3)
        }
        for character in mask where index < digits.endIndex {
            if character == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
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
    
    // MARK: objc функции
    
    @objc private func resetBorders() {
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        repeatPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc private func textFieldDidChange() {
        validateForm()
        resetBorders()
    }
    
    @objc private func handleBlueTextTap(_ gesture: UITapGestureRecognizer) {
        let text = loginLabel.attributedText?.string ?? ""
        let blueRange = (text as NSString).range(of: "Нажмите здесь,")
        if gesture.didTapAttributedTextInLabel(label: loginLabel, inRange: blueRange) {
            let nextVC = LoginController()
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    @objc private func togglePasswordVisibility() {
        // Переключение состояния isSecureTextEntry
        passwordTextField.isSecureTextEntry.toggle()
        repeatPasswordTextField.isSecureTextEntry.toggle()
        
        // Обновление изображения кнопки глаза
        let eyeImageName = passwordTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
        eyeButton.setImage(UIImage(systemName: eyeImageName), for: .normal)
    }
    
    /// 2. Add method to handle tap event on the view and dismiss keyboard
    @objc func didTapView(gesture: UITapGestureRecognizer) {
        // This should hide keyboard for the view
        view.endEditing(true)
    }
    
    // MARK: textField функции
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return false }
        /// Проверяем, что пользователь не удаляет или изменяет префикс "+996"
        if range.location < 4 {
            return false
        }
        /// Получаем новый текст после изменений
        let newString = (currentText as NSString).replacingCharacters(in: range, with: string)
        /// Форматируем новый текст
        let formattedText = formatter(mask: " (XXX) XX-XX-XX", phoneNumber: newString)
        /// Устанавливаем текст в поле
        textField.text = formattedText
        /// Возвращаем false, чтобы предотвратить стандартное поведение UITextField
        return false
    }

    
}

// MARK: - Canva для SecondViewController

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
