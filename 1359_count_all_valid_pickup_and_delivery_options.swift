// https://leetcode.com/problems/count-all-valid-pickup-and-delivery-options/

class Solution {
    func countOrders(_ n: Int) -> Int {
        if n == 1 { return 1 }

        var arr = Array(repeating: 0, count: n)
        arr[0] = 1
        for i in 2...n {
            arr[i - 1] = ((i - 1) * 2 + 1) * i * arr[i - 2] % 1000000007
        }
        return arr[n - 1]
    }
}
