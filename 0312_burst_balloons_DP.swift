// https://leetcode.com/problems/burst-balloons/

class Solution {
    var memo = Dictionary<LRPair, Int>()

    func maxCoins(_ nums: [Int]) -> Int {
        var newNums = nums
        newNums.insert(1, at: 0)
        newNums.append(1)

        for span in 1...(newNums.count - 1) {
            for l in 0..<(newNums.count - span) {
                let r = l + span
                if span == 1 {
                    memo[LRPair(l: l, r: r)] = 0
                    continue
                }

                var highest = Int.min
                for i in (l + 1)..<r {
                    let selfValue = newNums[l] * newNums[i] * newNums[r]
                    let totalValue = selfValue + (memo[LRPair(l: l, r: i)] ?? Int.min) + (memo[LRPair(l: i, r: r)] ?? Int.min)
                    highest = max(highest, totalValue)
                }
                memo[LRPair(l: l, r: r)] = highest
            }
        }

        return memo[LRPair(l: 0, r: newNums.count - 1)] ?? Int.min
    }
}

struct LRPair: Hashable {
    let l: Int
    let r: Int
}
