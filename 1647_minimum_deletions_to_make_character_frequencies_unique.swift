// https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/

class Solution {
    func minDeletions(_ s: String) -> Int {
        let sortedS = s.sorted()
        var numberSet = Set<Int>()
        var currentC: Character = "a"
        var currentCAppearTimes = 0
        var result = 0
        for c in sortedS {
            if c == currentC {
                currentCAppearTimes += 1
            } else {
                while currentCAppearTimes > 0 {
                    if numberSet.contains(currentCAppearTimes) {
                        currentCAppearTimes -= 1
                        result += 1
                    } else {
                        numberSet.insert(currentCAppearTimes)
                        break
                    }
                }
                currentC = c
                currentCAppearTimes = 1
            }
        }

        while currentCAppearTimes > 0 {
            if numberSet.contains(currentCAppearTimes) {
                currentCAppearTimes -= 1
                result += 1
            } else {
                numberSet.insert(currentCAppearTimes)
                break
            }
        }

        return result
    }
}
