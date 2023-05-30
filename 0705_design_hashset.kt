// https://leetcode.com/problems/design-hashset/description/

class MyHashSet() {
    private val array = BooleanArray(1000001)
    
    fun add(key: Int) {
        array[key] = true
    }

    fun remove(key: Int) {
        array[key] = false
    }

    fun contains(key: Int): Boolean {
        return array[key]
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * var obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * var param_3 = obj.contains(key)
 */
