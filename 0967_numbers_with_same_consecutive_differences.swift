// https://leetcode.com/problems/numbers-with-same-consecutive-differences/

class Solution {
    func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
        var arrayResult = [[1], [2], [3], [4], [5], [6], [7], [8], [9]]
        while arrayResult[0].count < n {
            var newArrayResult = [[Int]]()
            for array in arrayResult {
                let lastNumber = array.last!
                if lastNumber - k >= 0 {
                    var newArray = array
                    newArray.append(lastNumber - k)
                    newArrayResult.append(newArray)
                }
                if k != 0 && lastNumber + k <= 9 {
                    var newArray = array
                    newArray.append(lastNumber + k)
                    newArrayResult.append(newArray)
                }
            }
            arrayResult = newArrayResult
        }

        return arrayResult.map { array in
            var sum = 0
            for num in array {
                sum = sum * 10 + num
            }
            return sum
        }
    }
}
