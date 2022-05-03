// https://leetcode.com/problems/shortest-unsorted-continuous-subarray/

class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        var leftStack = [Int]()
        for i in 0..<nums.count {
            let num = nums[i]
            if leftStack.count == 0 {
                leftStack.append(num)
            } else if num >= leftStack.last! {
                leftStack.append(num)
            } else {
                // disorder happend
                if let minValueInRest = nums[i..<nums.count].min() {
                    while leftStack.count > 0 && minValueInRest < leftStack.last! {
                        leftStack.removeLast()
                    }
                }
                break
            }
        }

        if leftStack.count == nums.count {
            // It means the array already sorted.
            return 0
        }

        var rightStack = [Int]()
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            let num = nums[i]
            if rightStack.count == 0 {
                rightStack.append(num)
            } else if num <= rightStack.last! {
                rightStack.append(num)
            } else {
                // disorder happend
                if let maxValueInRest = nums[0...i].max() {
                    while rightStack.count > 0 && maxValueInRest > rightStack.last! {
                        rightStack.removeLast()
                    }
                }
                break
            }
        }

        return nums.count - leftStack.count - rightStack.count
    }
}
