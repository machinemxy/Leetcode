// https://leetcode.com/problems/coin-change/

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }

        var result = 1
        var calculatedValues = Set<Int>()
        var values: Set<Int> = [0]

        while !values.isEmpty {
            var newValues = Set<Int>()

            for value in values {
                for coin in coins {
                    let newValue = value + coin
                    if calculatedValues.contains(newValue) {
                        continue
                    } else if newValue == amount {
                        return result
                    } else if newValue > amount {
                        continue
                    } else {
                        newValues.insert(newValue)
                        calculatedValues.insert(newValue)
                    }
                }
            }

            values = newValues
            result += 1
        }

        return -1
    }
}
