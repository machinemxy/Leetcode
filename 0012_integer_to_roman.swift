// https://leetcode.com/problems/integer-to-roman/
// brutal solution

class Solution {
    func intToRoman(_ num: Int) -> String {
        var result = ""
        var t = num

        if t >= 1000 {
            let thousands = t / 1000
            if thousands == 1 {
                result += "M"
            } else if thousands == 2 {
                result += "MM"
            } else {
                result += "MMM"
            }
            t = t % 1000
        }

        if t >= 100 {
            let hundreds = t / 100
            if hundreds == 1 {
                result += "C"
            } else if hundreds == 2 {
                result += "CC"
            } else if hundreds == 3 {
                result += "CCC"
            } else if hundreds == 4 {
                result += "CD"
            } else if hundreds == 5 {
                result += "D"
            } else if hundreds == 6 {
                result += "DC"
            } else if hundreds == 7 {
                result += "DCC"
            } else if hundreds == 8 {
                result += "DCCC"
            } else {
                result += "CM"
            }
            t = t % 100
        }

        if t >= 10 {
            let tens = t / 10
            if tens == 1 {
                result += "X"
            } else if tens == 2 {
                result += "XX"
            } else if tens == 3 {
                result += "XXX"
            } else if tens == 4 {
                result += "XL"
            } else if tens == 5 {
                result += "L"
            } else if tens == 6 {
                result += "LX"
            } else if tens == 7 {
                result += "LXX"
            } else if tens == 8 {
                result += "LXXX"
            } else {
                result += "XC"
            }
            t = t % 10
        }

        if t > 0 {
            if t == 1 {
                result += "I"
            } else if t == 2 {
                result += "II"
            } else if t == 3 {
                result += "III"
            } else if t == 4 {
                result += "IV"
            } else if t == 5 {
                result += "V"
            } else if t == 6 {
                result += "VI"
            } else if t == 7 {
                result += "VII"
            } else if t == 8 {
                result += "VIII"
            } else {
                result += "IX"
            }
        }

        return result
    }
}
