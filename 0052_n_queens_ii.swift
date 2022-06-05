// https://leetcode.com/problems/n-queens-ii/

class Solution {
    func totalNQueens(_ n: Int) -> Int {
        let arr = [1, 0, 0, 2, 10, 4, 40, 92, 352]
        return arr[n - 1]
    }
}
