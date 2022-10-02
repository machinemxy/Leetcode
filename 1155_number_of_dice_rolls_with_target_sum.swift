// https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/

class Solution {
    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        if n == 1 { return target <= k ? 1 : 0 }
        if target > n * k { return 0 }
        var dic = Dictionary<NandTarget, Int>()
        for i in 1...k {
            dic[NandTarget(n: 1, target: i)] = 1
        }
        for i in 2...n {
            for j in i...min(k * i, target) {
                var sum = 0
                for l in 1...k {
                    if j - l < i - 1 { break }
                    if let prev = dic[NandTarget(n: i - 1, target: j - l)] {
                        sum += prev
                    }
                }
                dic[NandTarget(n: i, target: j)] = sum % 1000000007
            }
        }
        return dic[NandTarget(n: n, target: target)]!
    }
}

struct NandTarget: Hashable {
    let n: Int
    let target: Int
}
