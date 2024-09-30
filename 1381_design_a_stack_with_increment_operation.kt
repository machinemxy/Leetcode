// https://leetcode.com/problems/design-a-stack-with-increment-operation/description/

import kotlin.math.min

class CustomStack(private val maxSize: Int) {
    private val list = mutableListOf<Int>()

    fun push(x: Int) {
        if (list.size < maxSize) {
            list.add(x)
        }
    }

    fun pop(): Int {
        if (list.isEmpty()) {
            return -1
        } else {
            val last = list.removeLast()
            return last
        }
    }

    fun increment(k: Int, `val`: Int) {
        val times = min(k, list.size)
        for (i in 0 until times) {
            list[i] += `val`
        }
    }
}

/**
 * Your CustomStack object will be instantiated and called as such:
 * var obj = CustomStack(maxSize)
 * obj.push(x)
 * var param_2 = obj.pop()
 * obj.increment(k,`val`)
 */
 
