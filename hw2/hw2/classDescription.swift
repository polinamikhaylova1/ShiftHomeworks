import Foundation

class ConcurrentArray <T> {
    private var array = [T]()
    private let queue = DispatchQueue(label: "com.example.concurrentArrayQueue", attributes: .concurrent)
    
    var isEmpty: Bool {
        return queue.sync {array.isEmpty}
    }
    
    var count: Int {
        return queue.sync {array.count}
    }
    
    
    func remove(at index: Int) {
           queue.async(flags: .barrier) {
               guard index >= 0, index < self.array.count else { return }
               self.array.remove(at: index)
           }
    }

    subscript(index: Int) -> T? {
            get {
                var result: T?
                queue.sync {
                    if index >= 0, index < self.array.count {
                        result = self.array[index]
                    }
                }
                return result
            }
            set {
                guard let newValue = newValue else { return }
                queue.async(flags: .barrier) {
                    if index >= 0, index < self.array.count {
                        self.array[index] = newValue
                    }
                }
            }
        }
    func append(_ item: T){
        queue.async(flags:.barrier) {
            self.array.append(item)
        }
    }
        
    func contains(_ element: T) -> Bool where T: Equatable {
        var result = false
        queue.sync {
            result = self.array.contains(element)
        }
        return result
    }
}
