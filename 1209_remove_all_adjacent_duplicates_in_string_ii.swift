// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/

class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack = [CharAndCount]()

        for c in s {
            if stack.count == 0 {
                stack.append(CharAndCount(char: c, count: 1))
            } else if stack.last!.char == c {
                let newCount = stack.last!.count + 1
                if newCount == k {
                    stack.removeLast()
                } else {
                    stack[stack.count - 1] = CharAndCount(char: c, count: newCount)
                }
            } else {
                stack.append(CharAndCount(char: c, count: 1))
            }
        }

        return stack.reduce("") { $0 + $1.toString() }
    }
}

fileprivate struct CharAndCount {
    let char: Character
    let count: Int

    func toString() -> String {
        String(repeating: char, count: count)
    }
}
