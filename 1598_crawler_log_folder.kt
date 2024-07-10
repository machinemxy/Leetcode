// https://leetcode.com/problems/crawler-log-folder/description/

class Solution {
    fun minOperations(logs: Array<String>): Int {
        var layer = 0
        for (log in logs) {
            if (log == "./") {
                continue
            } else if (log == "../") {
                if (layer > 0) {
                    layer--
                }
            } else {
                layer++
            }
        }
        return layer
    }
}
