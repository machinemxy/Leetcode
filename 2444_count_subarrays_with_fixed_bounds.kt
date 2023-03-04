// https://leetcode.com/problems/count-subarrays-with-fixed-bounds/description/

class Solution {
    fun countSubarrays(nums: IntArray, minK: Int, maxK: Int): Long {
        val numGroups = ArrayList<IntArray>()
        var start: Int? = null
        for (i in nums.indices) {
            val num = nums[i]
            if (num < minK || num > maxK) {
                start?.let {
                    numGroups.add(nums.copyOfRange(it, i))
                    start = null
                }
            } else if (start == null) {
                start = i
            }
        }
        start?.let {
            numGroups.add(nums.copyOfRange(it, nums.size))
        }

        var result: Long = 0
        if (maxK == minK) {
            for (numGroup in numGroups) {
                result += countIfMinEqualsMax(numGroup)
            }
        } else {
            for (numGroup in numGroups) {
                result += countIfMinUnequalsMax(numGroup, maxK, minK)
            }
        }
        return result
    }

    private fun countIfMinEqualsMax(numGroup: IntArray): Long {
        var result: Long = 0
        for (i in 1..numGroup.size) {
            result += i
        }
        return result
    }

    private fun countIfMinUnequalsMax(numGroup: IntArray, maxK: Int, minK: Int): Long {
        var result: Long = 0
        var noMinNoMax = 0
        var noMin = 0
        var noMax = 0
        for (i in numGroup.indices) {
            val num = numGroup[i]
            if (num == maxK) {
                noMin += (1 + noMinNoMax)
                noMinNoMax = 0
                result += (noMax * (numGroup.size - i))
                noMax = 0
            } else if (num == minK) {
                noMax += (1 + noMinNoMax)
                noMinNoMax = 0
                result += (noMin * (numGroup.size - i))
                noMin = 0
            } else {
                noMinNoMax ++
            }
        }
        return result
    }
}
