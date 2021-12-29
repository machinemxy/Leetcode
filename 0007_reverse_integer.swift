// https://leetcode.com/problems/reverse-integer/

class Solution {
    func reverse(_ x: Int) -> Int {
        var s = String(x)
        var below0 = false
        if let firstChar = s.first, firstChar == "-" {
            s.removeFirst()
            below0 = true
        }
        s = String(s.reversed())
        var result = Int(s)!
        if below0 {
            result = 0 - result
        }
        if result < Int(Int32.min) || result > Int(Int32.max) {
            result = 0
        }
        return result
    }
}
