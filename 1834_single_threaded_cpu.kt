// https://leetcode.com/problems/single-threaded-cpu/description/

class Solution {
    fun getOrder(tasks: Array<IntArray>): IntArray {
        val q1 = PriorityQueue<Task> { t1, t2 ->
            t1.enqueueTime - t2.enqueueTime
        }
        for ((i, t) in tasks.withIndex()) {
            val task = Task(i, t[0], t[1])
            q1.add(task)
        }
        val q2 = PriorityQueue<Task> { t1, t2 ->
            if (t1.processingTime == t2.processingTime) {
                t1.id - t2.id
            } else {
                t1.processingTime - t2.processingTime
            }
        }
        val result = mutableListOf<Int>()
        var time = 0

        while (q1.isNotEmpty() || q2.isNotEmpty()) {
            if (q2.isEmpty()) {
                time = q1.peek().enqueueTime
            } else {
                val task = q2.poll()
                time += task.processingTime
                result.add(task.id)
            }
            
            while(q1.isNotEmpty() && q1.peek().enqueueTime <= time) {
                val task = q1.poll()
                q2.add(task)
            }
        }

        return result.toIntArray()
    }
}

data class Task(
    var id: Int,
    var enqueueTime: Int,
    var processingTime: Int
)
