// https://leetcode.com/problems/4sum/

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }

        var result = Set<[Int]>()
        let sortedNums = nums.sorted()

        for i in 0..<(nums.count - 3) {
            for j in (i + 1)..<(nums.count - 2) {
                var l = j + 1
                var r = nums.count - 1

                while l < r {
                    let sum = sortedNums[i] + sortedNums[j] + sortedNums[l] + sortedNums[r]
                    if sum == target {
                        result.insert([sortedNums[i], sortedNums[j], sortedNums[l], sortedNums[r]])
                        l += 1
                        r -= 1
                    } else if sum < target {
                        l += 1
                    } else {
                        r -= 1
                    }
                }
            }
        }

        return Array(result)
    }
}
