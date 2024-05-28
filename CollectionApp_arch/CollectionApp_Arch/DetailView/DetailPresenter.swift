import Foundation

protocol DetailPresenterProtocol {
    func didLoad(view: DetailView)
    func buttonTapped()
}

class DetailPresenter: DetailPresenterProtocol {

    private weak var view: DetailView?
    private let item: ItemViewModel
    
    init(view: DetailView?, item: ItemViewModel) {
        self.item = item
    }
    
    func didLoad(view: DetailView) {
        self.view = view
        view.setTitle(item.labelText)
        view.setDescription(item.descriptionText)
    }
    
    func buttonTapped() {
        view?.showModal()
    }
}
