// https://leetcode.com/problems/first-unique-character-in-a-string/

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let array = Array(s)
        var dic = Dictionary<Character, CharInfo>()
        for (i, c) in array.enumerated() {
            if dic.keys.contains(c) {
                dic[c]?.count += 1
            } else {
                dic[c] = CharInfo(count: 1, firstAppear: i)
            }
        }
        
        var result = Int.max
        for charInfo in dic.values {
            guard charInfo.count == 1 else { continue }
            result = min(result, charInfo.firstAppear)
        }
        return result == Int.max ? -1 : result
    }
}

fileprivate struct CharInfo {
    var count: Int
    var firstAppear: Int 
}
