// https://leetcode.com/problems/bag-of-tokens/

class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        guard !tokens.isEmpty else { return 0 }

        var power = power
        let tokens = tokens.sorted()
        var score = 0
        var indexToChangePowerToPoint = 0
        var indexToChangePointToPower = tokens.count - 1

        while true {
            if power >= tokens[indexToChangePowerToPoint] {
                power -= tokens[indexToChangePowerToPoint]
                score += 1
                indexToChangePowerToPoint += 1
                if indexToChangePowerToPoint >= tokens.count {
                    return score
                }
            } else if score == 0 || indexToChangePointToPower <= indexToChangePowerToPoint {
                return score
            } else {
                score -= 1
                power += tokens[indexToChangePointToPower]
                indexToChangePointToPower -= 1
            }
        }
    }
}
