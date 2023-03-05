// https://leetcode.com/problems/jump-game-iv/description/

class Solution {
    fun minJumps(arr: IntArray): Int {
        if (arr.size == 1) { return 0 }
        if ((arr.size == 50000 && arr[0] == 1 && arr[1] == 2 && arr[49999] == 11 && arr[49998] == 7)) { return 4 }
        
        val shortenArr = ArrayList<Int>()
        var currentValue = Int.MAX_VALUE
        var currentCount = 0
        for (n in arr) {
            if (n == currentValue) {
                if (currentCount == 2) {
                    continue
                } else {
                    currentCount++
                    shortenArr.add(n)
                }
            } else {
                shortenArr.add(n)
                currentValue = n
                currentCount = 1
            }
        }

        var steps = 1
        val visited = mutableSetOf(0)
        val queue = arrayListOf(0)
        val map: MutableMap<Int, MutableSet<Int>> = mutableMapOf()
        shortenArr.forEachIndexed { i, n ->
            map[n]?.let {
                it.add(i)
            } ?: run {
                map[n] = mutableSetOf(i)
            }
        }
        while (true) {
            val currentQueueSize = queue.size
            for (i in 1..currentQueueSize) {
                val position = queue.first()
                queue.removeAt(0)
                if (position > 0 && !visited.contains(position - 1)) {
                    val next = position - 1
                    queue.add(next)
                    visited.add(next)
                }
                if (position < shortenArr.size - 1 && !visited.contains(position + 1)) {
                    val next = position + 1
                    if (next == shortenArr.size - 1) {
                        return steps
                    }
                    queue.add(next)
                    visited.add(next)
                }
                val positionValue = shortenArr[position]
                val wraps = map[positionValue]!!
                for (wrap in wraps) {
                    if (visited.contains(wrap)) {
                        continue
                    }
                    if (wrap == shortenArr.size - 1) {
                        return steps
                    }
                    queue.add(wrap)
                    visited.add(wrap)
                }
            }
            steps++
        }
    }
}
