// https://leetcode.com/problems/trapping-rain-water/

class Solution {
    func trap(_ height: [Int]) -> Int {
        var maxHeight = 0
        var maxHeightIndex = 0
        for (i, block) in height.enumerated() {
            if block > maxHeight {
                maxHeight = block
                maxHeightIndex = i
            }
        }
        if maxHeight == 0 { return 0 }
        var result = 0
        if maxHeightIndex != 0 {
            var maxLeftHeight = 0
            for i in 0..<maxHeightIndex {
                let block = height[i]
                if block > maxLeftHeight {
                    maxLeftHeight = block
                } else {
                    result += maxLeftHeight - block
                }
            }
        }
        if maxHeightIndex != height.count - 1 {
            var maxRightHeight = 0
            for i in stride(from: height.count - 1, to: maxHeightIndex, by: -1) {
                let block = height[i]
                if block > maxRightHeight {
                    maxRightHeight = block
                } else {
                    result += maxRightHeight - block
                }
            }
        }
        return result
    }
}
