import Foundation

class ModalViewModel {
    
    var messageDidChange: ((Message) -> Void)?
    
    private(set) var message: Message {
        didSet {
            messageDidChange?(message)
        }
    }
    
    init(message: Message) {
        self.message = message
        startUpdatingMessage()
    }

    private func startUpdatingMessage() {
        Timer.scheduledTimer(withTimeInterval: Double.random(in: 5...15), repeats: true) { [weak self] _ in
            self?.updateMessage()
        }
    }

    private func updateMessage() {
        let messages = [
            "Отличных выходных!",
            "Наслаждайтесь майскими!",
            "Хорошего настроения!",
            "Отдыхайте и веселитесь!"
        ]
        message.text = messages.randomElement() ?? "Хороших выходных!"
    }
}
struct Message {
    var text: String
}
