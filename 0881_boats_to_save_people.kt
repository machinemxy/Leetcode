// https://leetcode.com/problems/boats-to-save-people/description/

class Solution {
    fun numRescueBoats(people: IntArray, limit: Int): Int {
        people.sort()
        var l = 0
        var r = people.size - 1
        var boats = 0
        while (l <= r) {
            if (people[l] + people[r] <= limit) {
                l++
                r--
            } else {
                r--
            }
            boats++
        }
        return boats
    }
}

// Not good solution
class Solution2 {
    fun numRescueBoats(people: IntArray, limit: Int): Int {
        val sortedPeople = arrayListOf<Int>()
        for (person in people) {
            sortedPeople.add(person)
        }
        sortedPeople.sortDescending()
        var boats = 0
        while (sortedPeople.isNotEmpty()) {
            boats++
            val firstPerson = sortedPeople[0]
            sortedPeople.removeAt(0)
            val rest = limit - firstPerson
            var l = 0
            var r = sortedPeople.size - 1
            while (l <= r) {
                val mid = (l + r) / 2
                val midPerson = sortedPeople[mid]
                if (midPerson <= rest) {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            if (l < sortedPeople.size) {
                sortedPeople.removeAt(l)
            }
        }
        return boats
    }
}
