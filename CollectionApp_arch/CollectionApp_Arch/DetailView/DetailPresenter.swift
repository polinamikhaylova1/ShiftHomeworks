import Foundation

protocol DetailPresenterProtocol {
    func viewDidLoad()
    func buttonTapped()
}

class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailView?
    private let item: ItemViewModel
    private weak var viewController: DetailViewController?
    
    init(view: DetailView?, item: ItemViewModel) {
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
