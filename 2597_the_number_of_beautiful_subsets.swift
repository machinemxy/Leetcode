// https://leetcode.com/problems/the-number-of-beautiful-subsets/description/

class Solution {
    private var nums = [Int]()
    private var result = 0

    func beautifulSubsets(_ nums: [Int], _ k: Int) -> Int {
        self.nums = nums.sorted()
        check(i: 0, set: [], k: k)
        return result
    }

    private func check(i: Int, set: Set<Int>, k: Int) {
        guard i < nums.count else { return }
        let value = nums[i]
        if !set.contains(value - k) {
            result += 1
            var newSet = set
            newSet.insert(value)
            check(i: i + 1, set: newSet, k: k)
        }
        check(i: i + 1, set: set, k: k)
    }
}
