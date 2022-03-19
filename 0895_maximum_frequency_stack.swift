// https://leetcode.com/problems/maximum-frequency-stack/

class FreqStack {
    var frequencyDic = Dictionary<Int, Int>()
    var stack = [Int]()

    init() {
        // do nothing
    }

    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append(val)
            frequencyDic[val] = (frequencyDic[val] ?? 0) + 1
            return
        }

        var insertPosition = stack.count
        var valFrequency = (frequencyDic[val] ?? 0) + 1
        var copiedFrequencyDic = frequencyDic
        while copiedFrequencyDic[stack[insertPosition - 1]]! > valFrequency {
            copiedFrequencyDic[stack[insertPosition - 1]]! -= 1
            insertPosition -= 1
        }
        stack.insert(val, at: insertPosition)
        frequencyDic[val] = valFrequency
    }

    func pop() -> Int {
        let last = stack.removeLast()
        let frequency = frequencyDic[last]!
        if frequency == 1 {
            frequencyDic.removeValue(forKey: last)
        } else {
            frequencyDic[last] = frequency - 1
        }
        return last
    }
}

/**
 * Your FreqStack object will be instantiated and called as such:
 * let obj = FreqStack()
 * obj.push(val)
 * let ret_2: Int = obj.pop()
 */
