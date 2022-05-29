// https://leetcode.com/problems/maximum-product-of-word-lengths/

class Solution {
    func maxProduct(_ words: [String]) -> Int {
        let wordInfos = words.map { WordInfo($0) }

        var result = 0
        for i in 0..<(wordInfos.count - 1) {
            let wordInfo1 = wordInfos[i]
            for j in (i + 1)..<wordInfos.count {
                let wordInfo2 = wordInfos[j]
                let multiplyResult = wordInfo1.charCount * wordInfo2.charCount
                if multiplyResult > result {
                    if wordInfo1.distinctChars.union(wordInfo2.distinctChars).count == wordInfo1.distinctChars.count + wordInfo2.distinctChars.count {
                        result = multiplyResult
                    }
                }
            }
        }

        return result
    }
}

fileprivate struct WordInfo {
    let charCount: Int
    let distinctChars: Set<Character>

    init(_ str: String) {
        var charCount = 0
        var distinctChars = Set<Character>()
        for c in str {
            charCount += 1
            distinctChars.insert(c)
        }

        self.charCount = charCount
        self.distinctChars = distinctChars
    }
}
