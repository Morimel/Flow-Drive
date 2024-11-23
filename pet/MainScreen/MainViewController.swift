//
//  MainViewController.swift
//  pet
//
//  Created by Isa Melsov on 21/11/24.
//

import UIKit
import SwiftUI

// MARK: - MainViewController

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: Элементы
    
    private let titleArray = ["Title 1", "Title 2", "Title 3", "Title 4", "Title 5"]
    private let imageArray = ["img1", "img2", "img3", "img4", "img5"]
        
    // MARK: UI-элементы
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 10
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Здравствуйте!"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .anotherWhite
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let bonusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .lightBlue
        return view
    }()
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightBlue.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    private let bonusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Бонусная\nкарта"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let pointsLaabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "\(0)"
        view.textColor = .white
        view.font = .systemFont(ofSize: 40, weight: .bold)
        return view
    }()
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightBlue
        setup()
        
    }
    
    // MARK: - Уствновка функций
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupDelegates()
    }
    
    private func setupSubviews() {
        view.addSubview(welcomeLabel)
        view.addSubview(whiteView)
        whiteView.addSubview(bonusView)
        bonusView.addSubview(logoImage)
        bonusView.addSubview(bonusLabel)
        bonusView.addSubview(pointsLaabel)
        whiteView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            whiteView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 32),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            bonusView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 32),
            bonusView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            bonusView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            bonusView.heightAnchor.constraint(equalToConstant: 200),
            
            logoImage.centerYAnchor.constraint(equalTo: bonusView.topAnchor),
            logoImage.leadingAnchor.constraint(equalTo: bonusView.leadingAnchor, constant: 30),
            logoImage.widthAnchor.constraint(equalToConstant: 50),
            logoImage.heightAnchor.constraint(equalToConstant: 50),
            
            bonusLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 12),
            bonusLabel.leadingAnchor.constraint(equalTo: bonusView.leadingAnchor, constant: 24),
            
            pointsLaabel.topAnchor.constraint(equalTo: bonusLabel.bottomAnchor, constant: 24),
            pointsLaabel.leadingAnchor.constraint(equalTo: bonusView.leadingAnchor, constant: 24),
            
            collectionView.topAnchor.constraint(equalTo: bonusView.bottomAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Методы UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        let titleItem = titleArray[indexPath.item]
        let imageItem = imageArray[indexPath.item]
        cell.configure(with: UIImage(named: imageItem), text: titleItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = NewsViewController()
        vc.titleText = titleArray[indexPath.row]
        vc.imageName = imageArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - Canva для MainViewController

struct MainViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return MainViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

@available(iOS 13.0, *)
struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainViewControllerPreview()
            .previewDevice("iPhone 14 Pro")
    }
}
