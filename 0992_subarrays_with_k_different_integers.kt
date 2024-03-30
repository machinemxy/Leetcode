// https://leetcode.com/problems/subarrays-with-k-different-integers/description/

class Solution {
    fun subarraysWithKDistinct(nums: IntArray, k: Int): Int {
        var i = 0
        var j = -1
        val n = nums.size
        val map = mutableMapOf<Int, Int>()
        var result = 0
        while (true) {
            if (map.size < k) {
                j++
                if (j == n) {
                    break
                }
                val numJ = nums[j]
                map[numJ] = map.getOrDefault(numJ, 0) + 1
                if (map.size == k) {
                    for (l in j until n) {
                        if (map.keys.contains(nums[l])) {
                            result++
                        } else {
                            break
                        }
                    }
                }
            } else {
                i++
                if (i == n) {
                    break
                }
                val prevNumI = nums[i - 1]
                if (map.getOrDefault(prevNumI, 0) == 1) {
                    map.remove(prevNumI)
                } else {
                    map[prevNumI] = map.getOrDefault(prevNumI, 0) - 1
                    for (l in j until n) {
                        if (map.keys.contains(nums[l])) {
                            result++
                        } else {
                            break
                        }
                    }
                }
            }
        }
        return result
    }
}
