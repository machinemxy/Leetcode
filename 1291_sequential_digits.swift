// https://leetcode.com/problems/sequential-digits/

class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        let low = min(999999999, low)
        let high = min(999999999, high)
        let digitsLow = String(low).count
        let digitsHigh = String(high).count
        var result = [Int]()
        for dights in digitsLow...digitsHigh {
            for startNumber in 1...(10 - dights) {
                let number = buildNumber(digits: dights, startNumber: startNumber)
                if number >= low && number <= high {
                    result.append(number)
                }
            }
        }
        return result
    }

    private func buildNumber(digits: Int, startNumber: Int) -> Int {
        var currentNumber = startNumber
        var result = 0
        for _ in 1...digits {
            result = result * 10 + currentNumber
            currentNumber += 1
        }
        return result
    }
}
