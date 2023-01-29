// https://leetcode.com/problems/lfu-cache/description/

class LFUCache {
    let capacity: Int
    var nodeDic = [Int: Node]()
    var groupDic = [Int: Group]()
    var minGroup: Group

    init(_ capacity: Int) {
        self.capacity = capacity
        let group1 = Group()
        groupDic[1] = group1
        minGroup = group1
    }
    
    func get(_ key: Int) -> Int {
        guard let node = nodeDic[key] else { return -1 }
        addFrequency(node: node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        
        if let node = nodeDic[key] {
            node.value = value
            addFrequency(node: node)
        } else {
            if nodeDic.count == capacity {
                let nodeToRemove = minGroup.head!
                if minGroup.head === minGroup.tail {
                    minGroup.head = nil
                    minGroup.tail = nil
                } else {
                    let newHead = nodeToRemove.next
                    newHead?.prev = nil
                    minGroup.head = newHead
                }
                nodeDic.removeValue(forKey: nodeToRemove.key)
            }
            let group1 = groupDic[1]!
            minGroup = group1
            let newNode = Node(key: key, value: value)
            nodeDic[key] = newNode
            if group1.head == nil {
                group1.head = newNode
                group1.tail = newNode
            } else {
                let currentTail = group1.tail
                currentTail?.next = newNode
                newNode.prev = currentTail
                group1.tail = newNode
            }
        }
    }
    
    func addFrequency(node: Node) {
        let nextNode = node.next
        let prevNode = node.prev
        prevNode?.next = nextNode
        nextNode?.prev = prevNode
        let currentGroup = groupDic[node.frequency]!
        if currentGroup.head === node {
            currentGroup.head = nextNode
        }
        if currentGroup.tail === node {
            currentGroup.tail = prevNode
        }
        node.frequency += 1
        if !groupDic.keys.contains(node.frequency) {
            groupDic[node.frequency] = Group()
        }
        let newGroup = groupDic[node.frequency]!
        if newGroup.head == nil {
            newGroup.head = node
            newGroup.tail = node
            node.prev = nil
            node.next = nil
        } else {
            let currentTail = newGroup.tail
            currentTail?.next = node
            node.prev = currentTail
            node.next = nil
            newGroup.tail = node
        }
        if minGroup === currentGroup && currentGroup.head == nil {
            minGroup = newGroup
        }
    }
}

class Node {
    var key: Int
    var value: Int
    var frequency: Int
    var prev: Node?
    var next: Node?
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
        frequency = 1
    }
}

class Group {
    var head: Node?
    var tail: Node?
    
    init() {}
}
