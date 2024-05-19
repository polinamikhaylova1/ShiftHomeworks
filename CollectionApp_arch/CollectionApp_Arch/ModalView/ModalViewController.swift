import UIKit

class ModalViewController: UIViewController {
    
    private var viewModel: ModalViewModel?
    private var modalView: ModalView!
    
    override func loadView() {
        modalView = ModalView()
        view = modalView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        modalView.closeButton.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        configureView()
    }
           
    func configure(with viewModel: ModalViewModel) {
        self.viewModel = viewModel
        self.viewModel?.messageDidChange = { [weak self] message in
            self?.modalView.titleLabel.text = message.text
        }
    }
           
    private func configureView() {
        if let viewModel = viewModel {
            modalView.titleLabel.text = viewModel.message.text
        }
    }
    
    @objc private func closeModal() {
        dismiss(animated: true, completion: nil)
    }
        
}


