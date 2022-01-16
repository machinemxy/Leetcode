// https://leetcode.com/problems/solving-questions-with-brainpower/

class Solution {
    var memo = [Int]()

    func mostPoints(_ questions: [[Int]]) -> Int {
        memo = Array(repeating: 0, count: questions.count)

        for i in stride(from: questions.count - 1, through: 0, by: -1) {
            let skipScore = getRestPoints(index: i + 1)
            let solveScore = questions[i][0] + getRestPoints(index: i + 1 + questions[i][1])
            memo[i] = max(skipScore, solveScore)
        }

        return memo[0]
    }

    private func getRestPoints(index: Int) -> Int {
        if index >= memo.count {
            return 0
        } else {
            return memo[index]
        }
    }
}
