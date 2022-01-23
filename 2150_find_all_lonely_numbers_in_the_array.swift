// https://leetcode.com/problems/find-all-lonely-numbers-in-the-array/

class Solution {
    private var sortedNums = [Int]()

    func findLonely(_ nums: [Int]) -> [Int] {
        sortedNums = nums.sorted()
        var result = [Int]()
        for i in 0..<sortedNums.count {
            if isLonely(i) {
                result.append(sortedNums[i])
            }
        }
        return result
    }

    private func isLonely(_ i: Int) -> Bool {
        let value = sortedNums[i]

        if i - 1 >= 0 {
            let left = sortedNums[i - 1]
            if value - left <= 1 {
                return false
            }
        }

        if i + 1 < sortedNums.count {
            let right = sortedNums[i + 1]
            if right - value <= 1 {
                return false
            }
        }

        return true
    }
}
