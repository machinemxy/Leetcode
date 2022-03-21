// https://leetcode.com/problems/partition-labels/

class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var lastIndexDic = Dictionary<Character, Int>()
        for (i, c) in s.enumerated() {
            lastIndexDic[c] = i
        }

        var result = [Int]()
        var start = 0
        var maxLastIndex = 0
        for (i, c) in s.enumerated() {
            let lastIndex = lastIndexDic[c]!
            maxLastIndex = max(lastIndex, maxLastIndex)
            if maxLastIndex == i {
                result.append(i - start + 1)
                start = i + 1
            }
        }

        return result
    }
}
