// https://leetcode.com/problems/sort-characters-by-frequency/

class Solution {
    func frequencySort(_ s: String) -> String {
        var dic = [Character: Int]()
        for c in s {
            dic[c, default: 0] += 1
        }
        let sortedDic = Array(dic).sorted { pair1, pair2 in
            pair1.value >= pair2.value
        }
        var result = ""
        for pair in sortedDic {
            result += String(repeating: pair.key, count: pair.value)
        }
        return result
    }
}
