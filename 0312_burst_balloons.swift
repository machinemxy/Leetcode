// https://leetcode.com/problems/burst-balloons/

// Recursion
class Solution {
    var memo = [[Int]]()
    var array = [Int]()

    func maxCoins(_ nums: [Int]) -> Int {
        var newNums = nums
        newNums.insert(1, at: 0)
        newNums.append(1)
        array = newNums
        let row = Array(repeating: Int.min, count: array.count)
        memo = Array(repeating: row, count: array.count)
        return shoot(l: 0, r: array.count - 1)
    }

    private func shoot(l: Int, r: Int) -> Int {
        guard l < (r - 1) else { return 0 }
        if memo[l][r] != Int.min {
            return memo[l][r]
        }

        var highest = 0
        for i in (l + 1)..<r {
            let selfValue = array[l] * array[i] * array[r]
            let totalValue = selfValue + shoot(l: l, r: i) + shoot(l: i, r: r)
            if totalValue > highest {
                highest = totalValue
            }
        }
        memo[l][r] = highest
        return highest
    }
}


// DP
class Solution2 {
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
