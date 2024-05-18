import Foundation

protocol DetailView: AnyObject {
    func setTitle(_ title: String)
    func setDescription(_ description: String)
    func showModal()
}

protocol DetailPresenter {
    func viewDidLoad()
    func buttonTapped()
}
