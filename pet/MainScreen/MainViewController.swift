//
//  MainViewController.swift
//  pet
//
//  Created by Isa Melsov on 21/11/24.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    private var newsData: [News] = [] // Храним данные для collectionView
    
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
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightBlue
        setup()
        fetchNewsList()
        print("CollectionView frame: \(collectionView.frame)") // Проверьте размеры

//        DispatchQueue.main.async {
//            self?.newsData = newsList
//            self?.collectionView.reloadData()
//        }

    }
    
    // MARK: - Setup Methods
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
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Networking
    func performFetchRequest(_ url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 404, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
    private func fetchNewsList() {
        let baseURL = "https://probka-1.onrender.com/"
        let endpoint = "api/news/getNews"
        
        guard let url = URL(string: baseURL + endpoint) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error fetching news list: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // 1. Печатаем данные в виде строки для проверки
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Server Response: \(jsonString)")
            } else {
                print("Failed to convert data to string")
            }
            
            // 2. Пытаемся декодировать данные в массив новостей
            do {
                let newsList = try JSONDecoder().decode([News].self, from: data)
                print("Decoded News List: \(newsList)") // Для отладки
                
                DispatchQueue.main.async {
                    self?.newsData = newsList
                    self?.collectionView.reloadData()
                }
            } catch let DecodingError.dataCorrupted(context) {
                print("Data corrupted: \(context)")
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found: \(context.debugDescription)")
            } catch let DecodingError.typeMismatch(type, context) {
                print("Type '\(type)' mismatch: \(context.debugDescription)")
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found: \(context.debugDescription)")
            } catch {
                print("Error decoding news list: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

    
    private func fetchNewsDetails(by id: Int, completion: @escaping (News) -> Void) {
        let baseURL = "https://probka-1.onrender.com/"
        let endpoint = "api/news/getNews/\(id)"
        
        guard let url = URL(string: baseURL + endpoint) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching news details: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Печатаем данные для отладки
            if let jsonString = String(data: data, encoding: .utf8) {
                print("News Details JSON Response: \(jsonString)")
            }
            
            // Декодируем данные
            do {
                let newsDetails = try JSONDecoder().decode(News.self, from: data)
                completion(newsDetails)
            } catch let DecodingError.dataCorrupted(context) {
                print("Data corrupted: \(context)")
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found: \(context.debugDescription)")
            } catch let DecodingError.typeMismatch(type, context) {
                print("Type '\(type)' mismatch: \(context.debugDescription)")
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found: \(context.debugDescription)")
            } catch {
                print("Error decoding news details: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

    private func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            completion(image)
        }
        task.resume()
    }
    

    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Number of items: \(newsData.count)") // Добавьте для проверки
        return newsData.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let newsItem = newsData[indexPath.item]
        cell.configure(with: UIImage(named: "placeholder"), text: newsItem.title)
        
        if let imageUrl = URL(string: newsItem.imageUrl) {
            loadImage(from: imageUrl) { image in
                DispatchQueue.main.async {
                    cell.configure(with: image, text: newsItem.title)
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300) // Убедитесь, что размеры адекватные
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Получаем ID выбранной новости
        let selectedNewsId = newsData[indexPath.item].idNews
        
        // Загружаем подробности о новости
        fetchNewsDetails(by: selectedNewsId) { [weak self] newsDetails in
            guard let self = self else { return }
            
            // Создаем NewsViewController с полученными данными
            DispatchQueue.main.async {
                let newsViewController = NewsViewController(news: newsDetails)
                self.navigationController?.pushViewController(newsViewController, animated: true)
            }
        }
    }


}



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
