import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    private let urlTextField = UITextField()
    private let tableView = UITableView()
    private var images: [UIImage] = []
    private var cellHeights: [IndexPath: CGFloat] = [:]
    private let dogService = DogService()
    private var progressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let breed = textField.text, !breed.isEmpty {
            fetchImages(for: breed)
        } else {
            showError("Пожалуйста, введите допустимую породу")
        }
        return true
    }
    
    func fetchImages(for breed: String) {
        progressView.isHidden = false
        progressView.progress = 0.0
            
        dogService.fetchImages(for: breed, progress: { [weak self] progress in
            self?.progressView.progress = progress
        }) { [weak self] result in
            self?.progressView.isHidden = true
            switch result {
            case .success(let images):
                self?.images = images
                self?.tableView.reloadData()
                case .failure(let error):
                self?.showError("Failed to fetch images: \(error.localizedDescription)")
            }
        }
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        cell.imageView?.image = images[indexPath.row]
        
        let imageSize = images[indexPath.row].size
        let aspectRatio = imageSize.width / imageSize.height
        let cellWidth = tableView.frame.width
        let cellHeight = cellWidth / aspectRatio
        cellHeights[indexPath] = cellHeight
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath] ?? UITableView.automaticDimension
    }
}

private extension ViewController {
    func setupUI() {
        urlTextField.placeholder = "Введите породу на английском"
        urlTextField.borderStyle = .roundedRect
        urlTextField.delegate = self
        urlTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(urlTextField)
        
        progressView.isHidden = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ImageCell")
        view.addSubview(tableView)
        
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            urlTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            urlTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            urlTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            progressView.topAnchor.constraint(equalTo: urlTextField.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
