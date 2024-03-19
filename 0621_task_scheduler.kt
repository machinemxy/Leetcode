// https://leetcode.com/problems/task-scheduler/description/

import java.util.PriorityQueue

class Solution {
    fun leastInterval(tasks: CharArray, n: Int): Int {
        val map = mutableMapOf<Char, Int>()
        for (task in tasks) {
            map[task] = map.getOrDefault(task, 0) + 1
        }
        val taskQueue = PriorityQueue<Int>(compareByDescending { it })
        for (task in map.values) {
            taskQueue.add(task)
        }
        val coolDownDeque = ArrayDeque<CoolDownTask>()
        var time = 0
        while (taskQueue.isNotEmpty() || coolDownDeque.isNotEmpty()) {
            time++
            if (taskQueue.isNotEmpty()) {
                val task = taskQueue.poll()
                if (task > 1) {
                    coolDownDeque.add(CoolDownTask(time + n, task - 1))
                }
            }
            if (coolDownDeque.isNotEmpty()) {
                val first = coolDownDeque.first()
                if (first.coolDownFinishTime == time) {
                    coolDownDeque.removeFirst()
                    taskQueue.add(first.task)
                }
            }
        }
        return time
    }
}

data class CoolDownTask(
    val coolDownFinishTime: Int,
    val task: Int
)
