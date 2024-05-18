import Foundation

class DetailPresenterImpl: DetailPresenter {
    
    weak var view: DetailView?
    private let item: Item
    
    init(view: DetailView, item: Item) {
        self.view = view
        self.item = item
    }
    
    func viewDidLoad() {
        view?.setTitle(item.labelText)
        view?.setDescription(item.descriptionText)
    }
    
    func buttonTapped() {
        view?.showModal()
    }
}
