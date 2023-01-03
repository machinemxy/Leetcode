// https://leetcode.com/problems/delete-columns-to-make-sorted/description/

class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        var strs = strs
        var deleted = 0
        while !strs[0].isEmpty {
            var prev: Character = "a"
            for i in 0..<strs.count {
                let current = strs[i].removeFirst()
                if current < prev {
                    deleted += 1
                    for j in (i + 1)..<strs.count {
                        strs[j].removeFirst()
                    }
                    break
                } else {
                    prev = current
                }
            }
        }
        return deleted
    }
}
