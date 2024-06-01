import UIKit

protocol DetailView: AnyObject {
    func setTitle(_ title: String)
    func setDescription(_ description: String)
    func showModal()
}

final class DetailViewController: UIViewController, DetailView {
    
    private var presenter: DetailPresenter
    private var detailView = DetailOfItemsView()
    
    init(presenter: DetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        detailView = DetailOfItemsView()
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        presenter.didLoad(view: self)

    }
    
    @objc private func buttonTapped() {
        presenter.buttonTapped()
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
        let modalViewController = ModalViewController(viewModel: viewModel)
        modalViewController.configure(with: viewModel)
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
    }
}
