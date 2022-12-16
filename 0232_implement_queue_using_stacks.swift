// https://leetcode.com/problems/implement-queue-using-stacks/description/

class MyQueue {
    var stack = [Int]()

    init() {}
    
    func push(_ x: Int) {
        var tempStack = [Int]()
        while !stack.isEmpty {
            tempStack.append(stack.removeLast())
        }
        stack.append(x)
        while !tempStack.isEmpty {
            stack.append(tempStack.removeLast())
        }
    }
    
    func pop() -> Int {
        stack.removeLast()
    }
    
    func peek() -> Int {
        stack.last!
    }
    
    func empty() -> Bool {
        stack.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
