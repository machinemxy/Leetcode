// https://leetcode.com/problems/design-circular-queue/

class MyCircularQueue {
    var list = [Int]()
    var maxCount: Int

    init(_ k: Int) {
        maxCount = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard list.count < maxCount else { return false }
        list.append(value)
        return true
    }
    
    func deQueue() -> Bool {
        guard !list.isEmpty else { return false }
        list.remove(at: 0)
        return true
    }
    
    func Front() -> Int {
        list.first ?? -1
    }
    
    func Rear() -> Int {
        list.last ?? -1
    }
    
    func isEmpty() -> Bool {
        list.isEmpty
    }
    
    func isFull() -> Bool {
        list.count == maxCount
    }
}
