// https://leetcode.com/problems/string-to-integer-atoi/

class Solution {
    func myAtoi(_ s: String) -> Int {
        var numberStarted = false
        var isPositive = true
        var rString = ""

        for c in s {
            if numberStarted {
                if c.isNumber {
                    if c == "0" && rString == "" {
                        continue
                    } else {
                        rString.append(c)
                    }
                } else {
                    break
                }
            } else {
                if c == "+" {
                    numberStarted = true
                } else if c == "-" {
                    isPositive = false
                    numberStarted = true
                } else if c.isNumber {
                    numberStarted = true
                    if c == "0" && rString == "" {
                        continue
                    } else {
                        rString.append(c)
                    }
                } else if c == " " {
			        continue
                } else {
                    break
                }
            }
        }

        if rString.count > 10 {
            if isPositive {
                return Int(Int32.max)
            } else {
                return Int(Int32.min)
            }
        } else {
            var result = Int(rString) ?? 0
            if isPositive {
                if result > Int(Int32.max) {
                    return Int(Int32.max)
                } else {
                    return result
                }
            } else {
                result = 0 - result
                if result < Int(Int32.min) {
                    return Int(Int32.min)
                } else {
                    return result
                }
            }
        }
    }
}
