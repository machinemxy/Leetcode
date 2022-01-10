// https://leetcode.com/problems/add-binary/

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let aa: [Character] = Array(a).reversed()
        let ba: [Character] = Array(b).reversed()

        var temp = 0
        var reversedResult = [Character]()
        for i in 0..<max(aa.count, ba.count) {
            let av: Int
            if i < aa.count {
                av = Int(String(aa[i]))!
            } else {
                av = 0
            }

            let bv: Int
            if i < ba.count {
                bv = Int(String(ba[i]))!
            } else {
                bv = 0
            }

            let v = av + bv + temp
            if v >= 2 {
                reversedResult.append((v - 2).binaryToChar())
                temp = 1
            } else {
                reversedResult.append(v.binaryToChar())
                temp = 0
            }
        }

        if temp != 0 {
            reversedResult.append(temp.binaryToChar())
        }

        return String(reversedResult.reversed())
    }
}

extension Int {
    func binaryToChar() -> Character {
        if self == 0 {
            return "0"
        } else {
             return "1"
        }
    }
}
