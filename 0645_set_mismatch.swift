// https://leetcode.com/problems/set-mismatch/

class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var duplicatedNum = 0
        var missingNum = 0
        var set = Set<Int>()
        
        for num in nums {
            if set.contains(num) {
                duplicatedNum = num
            } else {
                set.insert(num)
            }
        }
        
        for i in 1...nums.count {
            if !set.contains(i) {
                missingNum = i
                break
            }
        }
        
        return [duplicatedNum, missingNum]
    }
}
