// https://leetcode.com/problems/determine-if-two-strings-are-close/

class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        var dic1 = [Character: Int]()
        for c in word1 {
            dic1[c, default: 0] += 1
        }
        
        var dic2 = [Character: Int]()
        for c in word2 {
            dic2[c, default: 0] += 1
        }
        
        return dic1.keys == dic2.keys && dic1.values.sorted() == dic2.values.sorted()
    }
}
