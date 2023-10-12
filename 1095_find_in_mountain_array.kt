// https://leetcode.com/problems/find-in-mountain-array/

/**
 * // This is MountainArray's API interface.
 * // You should not implement it, or speculate about its implementation
 * class MountainArray {
 *     fun get(index: Int): Int {}
 *     fun length(): Int {}
 * }
 */

class Solution {
    fun findInMountainArray(target: Int, mountainArr: MountainArray): Int {
        val mountainGetter = MountainGetter(mountainArr)
        val n = mountainArr.length()
        
        // find peak
        var l = 0
        var r = n - 1
        while (l <= r) {
            val mid = (l + r) / 2
            val checkResult = checkPeak(mid, n, mountainGetter)
            if (checkResult < 0) {
                l = mid + 1
            } else if (checkResult > 0) {
                r = mid - 1
            } else {
                l = mid
                r = l - 1
            }
        }
        val peak = l
        
        // search first part
        l = 0
        r = peak
        while (l <= r) {
            val mid = (l + r) / 2
            val midHeight = mountainGetter.get(mid)
            if (midHeight < target) {
                l = mid + 1
            } else if (midHeight > target) {
                r = mid - 1
            } else {
                return mid
            }
        }
        
        // search second part
        l = peak
        r = n - 1
        while (l <= r) {
            val mid = (l + r) / 2
            val midHeight = mountainGetter.get(mid)
            if (midHeight < target) {
                r = mid - 1
            } else if (midHeight > target) {
                l = mid + 1
            } else {
                return mid
            }
        }
        
        return -1
    }
    
    private fun checkPeak(i: Int, n: Int, mountainGetter: MountainGetter): Int {
        if (i == 0) {
            return -1
        } else if (i == n - 1) {
            return 1
        }
        val currentHeight = mountainGetter.get(i)
        val prevHeight = mountainGetter.get(i - 1)
        if (currentHeight < prevHeight) {
            return 1
        } else {
            val nextHeight = mountainGetter.get(i + 1)
            if (currentHeight > nextHeight) {
                return 0
            } else {
                return -1
            }
        }
    }
}

class MountainGetter(private val mountain: MountainArray) {
    private val cache = hashMapOf<Int, Int>()
    fun get(index: Int): Int {
        cache[index]?.let { 
            return it
        } ?: run {
            val height = mountain.get(index)
            cache[index] = height
            return height
        }
    }
}
