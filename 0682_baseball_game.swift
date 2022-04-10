// https://leetcode.com/problems/baseball-game/

class Solution {
    func calPoints(_ ops: [String]) -> Int {
        var scores = [Int]()

        for op in ops {
            if op == "+" {
                let count = scores.count
                scores.append(scores[count - 1] + scores[count - 2])
            } else if op == "D" {
                scores.append(scores.last! * 2)
            } else if op == "C" {
                scores.removeLast()
            } else if let score = Int(op) {
                scores.append(score)
            }
        }

        return scores.reduce(0) { $0 + $1 }
    }
}
