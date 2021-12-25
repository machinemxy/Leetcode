// https://leetcode.com/problems/basic-calculator-ii/

class Solution {
    func calculate(_ s: String) -> Int {
        var n1 = ""
        var n2 = ""
        var n3 = ""
        var op1 = ""
        var op2 = ""
        var ts = s
        var tc = ""

        while true {
            guard let c = ts.first else {
                return calc(n1: n1, n2: n2, n3: n3, op1: op1, op2: op2)
            }

            ts = String(ts.dropFirst())
            tc = String(c)

            if tc == " " {
                continue
            } else if tc == "+" || tc == "-" {
                if op1 == "" {
                    op1 = tc
                } else {
                    n1 = String(calc(n1: n1, n2: n2, n3: n3, op1: op1, op2: op2))
                    n2 = ""
                    n3 = ""
                    op2 = ""
                    op1 = tc
                }
            } else if tc == "*" || tc == "/" {
                if op1 == "" {
                    op1 = tc
                } else if op1 == "*" || op1 == "/" {
                    n1 = String(calc(n1: n1, n2: n2, op: op1))
                    op1 = tc
                    n2 = ""
                } else {
                    n2 = String(calc(n1: n2, n2: n3, op: op2))
                    op2 = tc
                    n3 = ""
                }
            } else {
                if op1 == "" {
                    n1 += tc
                } else if op2 == "" {
                    n2 += tc
                } else {
                    n3 += tc
                }
            }
        }
    }

    private func calc(n1: String, n2: String, n3: String, op1: String, op2: String) -> Int {
        let i1 = Int(n1) ?? 1
        let i2 = Int(n2) ?? 1
        let i3 = Int(n3) ?? 1

        if op2 == "" {
            return calc(i1: i1, i2: i2, op: op1)
        } else {
            let temp = calc(i1: i2, i2: i3, op: op2)
            return calc(i1: i1, i2: temp, op: op1)
        }
    }

    func calc(n1: String, n2: String, op: String) -> Int {
        let i1 = Int(n1) ?? 1
        let i2 = Int(n2) ?? 1

        return calc(i1: i1, i2: i2, op: op)
    }

    private func calc(i1: Int, i2: Int, op: String) -> Int {
        if op == "+" {
            return i1 + i2
        } else if op == "-" {
            return i1 - i2
        } else if op == "*" {
            return i1 * i2
        } else {
            return i1 / i2
        }
    }
}
