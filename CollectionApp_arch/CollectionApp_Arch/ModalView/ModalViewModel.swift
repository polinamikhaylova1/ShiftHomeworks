import Foundation

struct Message {
    var text: String
}

final class ModalViewModel {
    
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
            "Отдыхайте и веселитесь!"
        ]
        message.text = messages.randomElement() ?? "Хороших выходных!"
    }
}

