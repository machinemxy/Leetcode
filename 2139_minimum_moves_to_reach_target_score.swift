// https://leetcode.com/problems/minimum-moves-to-reach-target-score/

class Solution {
    func minMoves(_ target: Int, _ maxDoubles: Int) -> Int {
        guard target != 1 else { return 0 }

        var steps = 0
        var temp = target
        var restDoubles = maxDoubles

        while true {
            if restDoubles == 0 {
                return steps + temp - 1
            } else {
                if temp % 2 == 0 {
                    temp /= 2
                    steps += 1
                    restDoubles -= 1
                } else {
                    temp -= 1
                    steps += 1
                }

                if temp == 1 {
                    return steps
                }
            }
        }
    }
}
