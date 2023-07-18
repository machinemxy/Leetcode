// https://leetcode.com/problems/lru-cache/description/

class LRUCache(val capacity: Int) {
    private val map = mutableMapOf<Int, Int>()
    private val orderList = mutableListOf<Int>()

    fun get(key: Int): Int {
        map[key]?.let {
            orderList.remove(key)
            orderList.add(0, key)
            return it
        } ?: run {
            return -1
        }
    }

    fun put(key: Int, value: Int) {
        if (map.containsKey(key)) {
            orderList.remove(key)
            orderList.add(0, key)
        } else {
            if (orderList.size == capacity) {
                val lastKey = orderList[capacity - 1]
                orderList.removeAt(capacity - 1)
                map.remove(lastKey)
            }
            orderList.add(0, key)
        }
        map[key] = value
    }
}
