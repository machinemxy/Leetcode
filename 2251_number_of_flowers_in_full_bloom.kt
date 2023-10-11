// https://leetcode.com/problems/number-of-flowers-in-full-bloom/

class Solution {
    fun fullBloomFlowers(flowers: Array<IntArray>, people: IntArray): IntArray {
        val events = mutableListOf<Event>()
        for (flower in flowers) {
            events.add(Event(flower[0], 0, null))
            events.add(Event(flower[1], 2, null))
        }
        people.forEachIndexed { personId, timing ->
            events.add(Event(timing, 1, personId))
        }
        events.sortWith(compareBy<Event> { it.timing }.thenBy { it.eventType })
        val result = IntArray(people.size)
        var flowerCount = 0
        for (event in events) {
            if (event.eventType == 0) {
                flowerCount++
            } else if (event.eventType == 1) {
                event.personId?.let { 
                    result[it] = flowerCount
                }
            } else {
                flowerCount--
            }
        }
        return result
    }
}

data class Event(
    val timing: Int,
    val eventType: Int, // 0: flower start, 1: person, 2: flower end
    val personId: Int?
)
