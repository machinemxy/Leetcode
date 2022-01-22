// https://leetcode.com/problems/stone-game-iv/

class Solution {
    var memo = Dictionary<Int, Bool>()

    func winnerSquareGame(_ n: Int) -> Bool {
        if n == 0 { return false }
        if let cache = memo[n] { return cache }

        var i = 1
        while i * i <= n {
            let rest = n - i * i
            if winnerSquareGame(rest) == false {
                memo[n] = true
                return true
            }
            i += 1
        }

        memo[n] = false
        return false
    }
}
