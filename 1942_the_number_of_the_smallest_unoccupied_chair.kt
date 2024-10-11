// https://leetcode.com/problems/the-number-of-the-smallest-unoccupied-chair/description/

class Solution {
    fun smallestChair(times: Array<IntArray>, targetFriend: Int): Int {
        val timeLine = mutableListOf<Event>()
        times.forEachIndexed { index, ints ->
            val come = Event(index, true, ints[0])
            timeLine.add(come)
            val go = Event(index, false, ints[1])
            timeLine.add(go)
        }
        timeLine.sort()
        val chairs = BooleanArray(10000)
        val friendChairMap = mutableMapOf<Int, Int>()
        for (event in timeLine) {
            if (event.isComing) {
                var i = 0
                while (chairs[i]) {
                    i++
                }
                if (targetFriend == event.id) {
                    return i
                }
                chairs[i] = true
                friendChairMap[event.id] = i
            } else {
                val chair = friendChairMap.remove(event.id)
                chair?.let {
                    chairs[it] = false
                }
            }
        }
        return -1
    }
}

data class Event(
    val id: Int,
    val isComing: Boolean,
    val time: Int
): Comparable<Event> {
    override fun compareTo(other: Event): Int {
        return if (time == other.time) {
            return if (isComing == other.isComing) {
                0
            } else if (isComing) {
                1
            } else {
                -1
            }
        } else {
            time - other.time
        }
    }
}
