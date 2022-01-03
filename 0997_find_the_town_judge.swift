// https://leetcode.com/problems/find-the-town-judge/

class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var trustSb = Array(repeating: false, count: n)
        var trusted = Array(repeating: 0, count: n)

        for t in trust {
            let id1 = t[0] - 1
            let id2 = t[1] - 1
            trustSb[id1] = true
            trusted[id2] += 1
        }

        for i in 0..<trustSb.count {
            if !trustSb[i] && trusted[i] == (n - 1) {
                return i + 1
            }
        }

        return -1
    }
}
