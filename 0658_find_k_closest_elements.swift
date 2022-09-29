// https://leetcode.com/problems/find-k-closest-elements/

class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var l = Int.min
        var r = Int.max
        for i in arr.indices {
            if arr[i] < x {
                continue
            }
            if arr[i] == x {
                l = i
                r = i
                break
            }
            if arr[i] > x {
                l = i
                r = i - 1
                break
            }
        }
        if l == Int.min {
            // all data in arr smaller than x
            return Array(arr.suffix(k))
        }
        
        while (r - l + 1) < k {
            var lDiff = Int.max
            var rDiff = Int.max
            if l > 0 {
                lDiff = x - arr[l - 1]
            }
            if r < arr.count - 1 {
                rDiff = arr[r + 1] - x
            }
            if lDiff <= rDiff {
                l -= 1
            } else {
                r += 1
            }
        }
        return Array(arr[l...r])
    }
}
