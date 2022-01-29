// https://leetcode.com/problems/largest-rectangle-in-histogram/
/*
The concept is, if we want to calculate the max area using heights[i] as height,
we need to figure out the left border and right border.
Then the area will be heights[i] * (rightBorders[i] - leftBOrders[i] + 1).
*/

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        guard heights.count > 0 else { return 0 }

        var stack = [Int]()
        var leftBorders = Array(repeating: 0, count: heights.count)
        var rightBorders = Array(repeating: 0, count: heights.count)

        for i in 0..<heights.count {
            let height = heights[i]
            while stack.count > 0 && height <= heights[stack.last!] {
                stack.removeLast()
            }
            leftBorders[i] = (stack.last ?? -1) + 1
            stack.append(i)
        }
        stack = [Int]()
        for i in stride(from: heights.count - 1, through: 0, by: -1) {
            let height = heights[i]
            while stack.count > 0 && height <= heights[stack.last!] {
                stack.removeLast()
            }
            rightBorders[i] = (stack.last ?? heights.count) - 1
            stack.append(i)
        }

        var result = 0
        for i in 0..<heights.count {
            let rect = heights[i] * (rightBorders[i] - leftBorders[i] + 1)
            result = max(result, rect)
        }
        return result
    }
}
