// https://leetcode.com/problems/validate-binary-tree-nodes/

class Solution {
    fun validateBinaryTreeNodes(n: Int, leftChild: IntArray, rightChild: IntArray): Boolean {
        val connected = BooleanArray(n)
        leftChild.forEachIndexed { i, next ->
            if (next != -1) {
                if (i == next) {
                    return false
                }
                if (connected[next]) {
                    return false
                }
                connected[next] = true
            }
        }
        rightChild.forEachIndexed { i, next ->
            if (next != -1) {
                if (i == next) {
                    return false
                }
                if (connected[next]) {
                    return false
                }
                connected[next] = true
            }
        }
        var headId = -1
        connected.forEachIndexed { i, isChild ->
            if (!isChild) {
                if (headId != -1) {
                    return false
                }
                headId = i
            }
        }
        if (headId == -1) {
            return false
        }
        val included = BooleanArray(n)
        included[headId] = true
        val deque = ArrayDeque<Int>()
        deque.add(headId)
        while (deque.isNotEmpty()) {
            val node = deque.removeFirst()
            val left = leftChild[node]
            if (left != -1) {
                if (included[left]) {
                    return false
                } else {
                    included[left] = true
                    deque.add(left)
                }
            }
            val right = rightChild[node]
            if (right != -1) {
                if (included[right]) {
                    return false
                } else {
                    included[right] = true
                    deque.add(right)
                }
            }
        }
        for (i in included) {
            if (!i) {
                return false
            }
        }
        return true
    }
}
