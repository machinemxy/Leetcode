// https://leetcode.com/problems/number-complement/

class Solution {
    func findComplement(_ num: Int) -> Int {
        var t = num
        var array = [Int]()

        while true {
            if t == 1 || t == 0 {
                array.append(t)
                break
            } else {
                array.append(t % 2)
                t = t / 2
            }
        }

        let newArray = array.map { 1 - $0 }
        var multiplier = 1
        var result = 0
        for i in newArray {
            result += i * multiplier
            multiplier *= 2
        }

        return result
    }
}
