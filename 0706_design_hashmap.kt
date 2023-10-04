// https://leetcode.com/problems/design-hashmap/

class MyHashMap() {
    val array = IntArray(1000001) { -1 }
    
    fun put(key: Int, value: Int) {
        array[key] = value
    }

    fun get(key: Int): Int {
        return array[key]
    }

    fun remove(key: Int) {
        array[key] = -1
    }
}
