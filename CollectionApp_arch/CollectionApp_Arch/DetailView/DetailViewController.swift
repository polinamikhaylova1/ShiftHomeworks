import UIKit

protocol DetailView: AnyObject {
    func setTitle(_ title: String)
    func setDescription(_ description: String)
    func showModal()
}

final class DetailViewController: UIViewController, DetailView {
    
    var presenter: DetailPresenter?
    private var detailView = DetailOfItemsView()
    
    override func loadView() {
        detailView = DetailOfItemsView()
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        presenter?.viewDidLoad()
    }
    
    @objc private func buttonTapped() {
        presenter?.buttonTapped()
    }
    
    
}

extension DetailViewController {
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func setDescription(_ description: String) {
        detailView.descriptionLabel.text = description
    }
    
    func showModal() {
        let message = Message(text: "Хороших выходных!")
        let viewModel = ModalViewModel(message: message)
        let modalViewController = ModalViewController()
        modalViewController.configure(with: viewModel)
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
    }
}
