// https://leetcode.com/problems/sort-array-by-parity-ii/

class Solution {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var evens = [Int]()
        var odds = [Int]()
        for num in nums {
            if num % 2 == 0 {
                evens.append(num)
            } else {
                odds.append(num)
            }
        }

        var result = [Int]()
        for i in 0..<evens.count {
            result.append(evens[i])
            result.append(odds[i])
        }

        return result
    }
}
