// https://leetcode.com/problems/min-cost-climbing-stairs/

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var stack = [cost[0], cost[1]]

        if cost.count > 2 {
            for i in 2..<cost.count {
                let newCost = min(stack[0], stack[1]) + cost[i]
                stack[0] = stack[1]
                stack[1] = newCost
            }
        }

        return min(stack[0], stack[1])
    }
}
