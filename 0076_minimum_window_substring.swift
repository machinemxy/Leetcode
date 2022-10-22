// https://leetcode.com/problems/minimum-window-substring/

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if s.isEmpty || t.isEmpty { return "" }
        let a = Array(s)
        var dic = Dictionary<Character, Int>()
        var missingCharCount = 0
        for c in t {
            dic[c] = dic[c, default: 0] + 1
            missingCharCount += 1
        }
        var minWindow = Int.max
        var minL = 0
        var minR = 0
        var l = 0
        for r in 0..<a.count {
            let cr = a[r]
            let countCr = dic[cr] ?? 0
            if countCr > 0 {
                missingCharCount -= 1
            }
            dic[cr] = countCr - 1
            
            // from l to r already included all require chars
            while missingCharCount == 0 {
                if r - l < minWindow {
                    minWindow = r - l
                    minL = l
                    minR = r
                }
                let cl = a[l]
                let countCl = dic[cl] ?? 0
                if countCl >= 0 {
                    missingCharCount += 1
                }
                dic[cl] = countCl + 1
                l += 1
            }
        }
        
        if minWindow == Int.max {
            return ""
        } else {
            return String(a[minL...minR])
        }
    }
}
