// https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words/

class Solution {
    func longestPalindrome(_ words: [String]) -> Int {
        var dic = [String: Int]()
        for word in words {
            dic[word] = dic[word, default: 0] + 1
        }
        var result = 0
        var middleStringPicked = false
        while !dic.isEmpty {
            let (word, count) = dic.first!
            if word.isSameLetter {
                if !middleStringPicked && count % 2 == 1 {
                    result += 2
                    middleStringPicked = true
                }
                result += count / 2 * 4
                
            } else {
                let reversedWord = word.reversedWord
                if let reversedWordCount = dic[reversedWord] {
                    let pairCount = min(count, reversedWordCount)
                    result += pairCount * 4
                    dic.removeValue(forKey: reversedWord)
                }
            }
            dic.removeValue(forKey: word)
        }
        return result
    }
}

extension String {
    var isSameLetter: Bool {
        self.first! == self.last!
    }
    
    var reversedWord: String {
        String([self.last!, self.first!])
    }
}
