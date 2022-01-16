// https://leetcode.com/problems/maximize-distance-to-closest-person/

class Solution {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var firstSeat: Int?
        var lastSeat: Int?
        var maxDisBetweenTwoSeats = 0

        for i in 0..<seats.count {
            if seats[i] == 0 { continue }
            if firstSeat == nil {
                firstSeat = i
                lastSeat = i
            } else {
                let disBetweenTwoSeats = i - lastSeat!
                maxDisBetweenTwoSeats = max(maxDisBetweenTwoSeats, disBetweenTwoSeats)
                lastSeat = i
            }
        }

        let disIfSitFirst = firstSeat!
        let disIfSitLast = seats.count - 1 - lastSeat!
        let disIfSitMiddle = maxDisBetweenTwoSeats / 2
        return max(disIfSitFirst, disIfSitLast, disIfSitMiddle)
    }
}
