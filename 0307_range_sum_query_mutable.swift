// https://leetcode.com/problems/range-sum-query-mutable/

class NumArray {
    private var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }

    func update(_ index: Int, _ val: Int) {
        nums[index] = val
    }

    func sumRange(_ left: Int, _ right: Int) -> Int {
        nums[left...right].reduce(0, +)
    }
}
