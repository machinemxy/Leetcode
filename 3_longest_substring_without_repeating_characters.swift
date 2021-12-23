// https://leetcode.com/problems/longest-substring-without-repeating-characters/

class Solution {
    var maxLength = 0
    var array = [String]()

    func lengthOfLongestSubstring(_ s: String) -> Int {
        array = Array(s).map { String($0) }

        for i in 0..<array.count {
            check(index: i, set: Set())
        }

        return maxLength
    }

    private func check(index: Int, set: Set<String>) {
        if index >= array.count {
            maxLength = max(maxLength, set.count)
            return
        }

        let letter = array[index]
        if set.contains(letter) {
            maxLength = max(maxLength, set.count)
            return
        } else {
            var newSet = set
            newSet.insert(letter)
            check(index: index + 1, set: newSet)
        }
    }
}
