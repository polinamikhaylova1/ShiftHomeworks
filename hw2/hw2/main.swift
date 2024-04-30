import Foundation

let concurrentArray = ConcurrentArray<Int>()
let queue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
let task1 = DispatchWorkItem {
    for i in 0..<10 {
        concurrentArray.append(i)
        print("Task 1 added element: \(i)")
    }
}
let task2 = DispatchWorkItem {
    for i in 10..<20 {
        concurrentArray.append(i)
        print("Task 2 added element: \(i)")
    }
}

queue.async(execute: task1)
queue.async(execute: task2)

DispatchQueue.global().async {
    task1.wait()
    task2.wait()
    print("Количество элементов в массиве: \(concurrentArray.count)")
    print("Массив пустой: \(concurrentArray.isEmpty)")
    let elementToCheck = 5
    print("Массив содержит элемент \(elementToCheck): \(concurrentArray.contains(elementToCheck))")
    let indexToAccess = 3
    if let element = concurrentArray[indexToAccess] {
        print("Элемент по индексу \(indexToAccess): \(element)")
    } else {
        print("Нет элемента по индексу \(indexToAccess)")
    }
    let indexToRemove = 2
    concurrentArray.remove(at: indexToRemove)
    print("Удален элемент по индексу \(indexToRemove)")
    print("Количество элементов в массиве после удаления: \(concurrentArray.count)")
}
dispatchMain()
