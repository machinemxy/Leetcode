// https://leetcode.com/problems/earliest-possible-day-of-full-bloom/

struct Flower {
    let plantTime: Int
    let growTime: Int
}

class Solution {
    func earliestFullBloom(_ plantTime: [Int], _ growTime: [Int]) -> Int {
        guard plantTime.count > 1 else { return plantTime[0] + growTime[0] }
        // Sort the seeds by their growTime in descending order.
        var flowers = plantTime.indices.map({ Flower(plantTime: plantTime[$0], growTime: growTime[$0]) }).sorted(by: { $0.growTime >= $1.growTime })
        var maxDays = flowers[0].plantTime + flowers[0].growTime
        var freeDays = 0
        for i in 1..<flowers.count {
            // If flowers[i] takes x less days than flowers[i - 1] to grow, the x days can be used to plant.
            freeDays += (flowers[i - 1].growTime - flowers[i].growTime)
            if flowers[i].plantTime > freeDays {
                maxDays += (flowers[i].plantTime - freeDays)
                freeDays = 0
            } else {
                freeDays -= flowers[i].plantTime
            }
        }
        return maxDays
    }
}
