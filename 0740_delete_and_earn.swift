// https://leetcode.com/problems/delete-and-earn/

class Solution {
    var thisArray = [KeyValuePair]()
    var memo = Dictionary<LRPair, Int>()

    func deleteAndEarn(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums.first! }

        let nums = nums.sorted()
        var array = [[KeyValuePair]]()
        var subArray = [KeyValuePair]()
        var currentKey = nums[0]
        var currentValue = 1
        for i in 1..<nums.count {
            if nums[i] == currentKey {
                currentValue += 1
            } else if nums[i] == currentKey + 1 {
                subArray.append(KeyValuePair(key: currentKey, value: currentValue))
                currentKey = nums[i]
                currentValue = 1
            } else {
                subArray.append(KeyValuePair(key: currentKey, value: currentValue))
                array.append(subArray)
                subArray = []
                currentKey = nums[i]
                currentValue = 1
            }
        }
        subArray.append(KeyValuePair(key: currentKey, value: currentValue))
        array.append(subArray)

        var result = 0
        for i in 0..<array.count {
            thisArray = array[i]
            memo = [:]
            result += calc(pair: LRPair(l: 0, r: thisArray.count - 1))
        }
        return result
    }

    private func calc(pair: LRPair) -> Int {
        if pair.l > pair.r { return 0 }

        if let cachedResult = memo[pair] {
            return cachedResult
        }

        var result = 0
        for i in pair.l...pair.r {
            let currentScore = thisArray[i].key * thisArray[i].value

            let lScore: Int
            if i == pair.l {
                lScore = 0
            } else {
                lScore = calc(pair: LRPair(l: pair.l, r: i - 2))
            }

            let rScore: Int
            if i == pair.r {
                rScore = 0
            } else {
                rScore = calc(pair: LRPair(l: i + 2, r: pair.r))
            }

            let totalScore = currentScore + lScore + rScore
            result = max(result, totalScore)
        }

        memo[pair] = result
        return result
    }
}

struct KeyValuePair {
    let key: Int
    let value: Int
}

struct LRPair: Hashable {
    let l: Int
    let r: Int
}
