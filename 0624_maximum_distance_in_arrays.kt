// https://leetcode.com/problems/maximum-distance-in-arrays/description/

import kotlin.math.max
import kotlin.math.min

class Solution {
    fun maxDistance(arrays: List<List<Int>>): Int {
        var smallest = Int.MAX_VALUE
        var smallestIds = mutableListOf<Int>()
        for (i in arrays.indices) {
            val value = arrays[i][0]
            if (value < smallest) {
                smallest = value
                smallestIds = mutableListOf(i)
            } else if (value == smallest) {
                smallestIds.add(i)
            }
        }
        var largest = Int.MIN_VALUE
        if (smallestIds.size == 1) {
            val ignoreId = smallestIds[0]
            for (i in arrays.indices) {
                if (i == ignoreId) {
                    continue
                }
                largest = max(largest, arrays[i].last())
            }
        } else {
            for (i in arrays.indices) {
                largest = max(largest, arrays[i].last())
            }
        }
        var result = largest - smallest

        largest = Int.MIN_VALUE
        var largestIds = mutableListOf<Int>()
        for (i in arrays.indices) {
            val value = arrays[i].last()
            if (value > largest) {
                largest = arrays[i].last()
                largestIds = mutableListOf(i)
            } else if (value == largest) {
                largestIds.add(i)
            }
        }
        smallest = Int.MAX_VALUE
        if (largestIds.size == 1) {
            val ignoreId = largestIds[0]
            for (i in arrays.indices) {
                if (i == ignoreId) {
                    continue
                }
                smallest = min(smallest, arrays[i][0])
            }
        } else {
            for (i in arrays.indices) {
                smallest = min(smallest, arrays[i][0])
            }
        }
        result = max(result, largest - smallest)
        return result
    }
}
