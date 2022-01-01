// https://leetcode.com/problems/permutation-in-string/

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let a1 = Array(s1)
        let a2 = Array(s2)

        guard a2.count >= a1.count else {
            return false
        }

        let dic1 = toDic(a: a1)
        var dic2 = Dictionary<Character, Int>()
        for i in 0...(a2.count - a1.count) {
            if i == 0 {
                dic2 = toDic(a: Array(a2[0..<a1.count]))
                if dic1 == dic2 {
                    return true
                }
            } else {
                let oldChar = a2[i - 1]
                let newChar = a2[i + a1.count - 1]
                if let oldCount = dic2[oldChar] {
                    if oldCount == 1 {
                        dic2.removeValue(forKey: oldChar)
                    } else {
                        dic2[oldChar] = oldCount - 1
                    }
                }

                dic2[newChar] = (dic2[newChar] ?? 0) + 1
                if dic1 == dic2 {
                    return true
                }
            }
        }
        return false
    }

    private func toDic(a: [Character]) -> Dictionary<Character, Int> {
        var dic = Dictionary<Character, Int>()
        for c in a {
            dic[c] = (dic[c] ?? 0) + 1
        }
        return dic
    }
}
