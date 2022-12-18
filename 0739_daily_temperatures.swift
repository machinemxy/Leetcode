// https://leetcode.com/problems/daily-temperatures/description/

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [TemperatureHistory]()
        var result = Array(repeating: 0, count: temperatures.count)
        for (i, temperature) in temperatures.enumerated() {
            while !stack.isEmpty && stack.last!.temperature < temperature {
                let temperatureHistory = stack.removeLast()
                result[temperatureHistory.dayId] = i - temperatureHistory.dayId
            }
            stack.append(TemperatureHistory(temperature: temperature, dayId: i))
        }
        return result
    }
}

struct TemperatureHistory {
    let temperature: Int
    let dayId: Int
}
