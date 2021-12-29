// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numIdDic = Dictionary<Int, Int>()

        for (i, num) in nums.enumerated() {
            if numIdDic.keys.contains(num) {
                // duplicated number
                if num * 2 == target {
                   return [numIdDic[num]!, i]
                }
            } else {
                numIdDic[num] = i
            }
        }

        for numIdPair in numIdDic {
            let anotherNum = target - numIdPair.key
            if let anotherId = numIdDic[anotherNum] {
                if anotherId != numIdPair.value {
                    return [numIdPair.value, anotherId].sorted()
                }
            }
        }

        return []
    }
}
