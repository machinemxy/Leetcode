// https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/

class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        let sumOfCardPoints = cardPoints.reduce(0, +)
        let windowSize = cardPoints.count - k
        if windowSize == 0 { return sumOfCardPoints }
        var windowSum = 0
        for i in 0..<windowSize {
            windowSum += cardPoints[i]
        }
        var minWindowSum = windowSum
        for i in 0..<k {
            windowSum -= cardPoints[i]
            windowSum += cardPoints[i + windowSize]
            if windowSum < minWindowSum {
                minWindowSum = windowSum
            }
        }

        return sumOfCardPoints - minWindowSum
    }
}
