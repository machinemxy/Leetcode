// https://leetcode.com/problems/container-with-most-water/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxCapacity = 0

        var lmax = 0
        for l in 0..<(height.count - 1) {
            if height[l] > lmax {
                lmax = height[l]
            } else {
                continue
            }

            var rmax = 0
            for r in stride(from: height.count - 1, to: l, by: -1) {
                if height[r] > rmax {
                    rmax = height[r]
                    let capacity = min(height[l], height[r]) * (r - l)
                    if capacity > maxCapacity {
                        maxCapacity = capacity
                    }
                } else {
                    continue
                }
            }
        }

        return maxCapacity
    }
}
