// https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/

class Solution {
    var arr = [String]()
    var result = 0
    
    func maxLength(_ arr: [String]) -> Int {
        self.arr = arr
        check(currentSet: Set<Character>(), currentIndex: -1)
        return result
    }
    
    func check(currentSet: Set<Character>, currentIndex: Int) {
        for i in (currentIndex + 1)..<arr.count {
            if let newSet = addString(arr[i], to: currentSet) {
                result = max(result, newSet.count)
                check(currentSet: newSet, currentIndex: i)
            }
        }
    }
    
    func addString(_ s: String, to set: Set<Character>) -> Set<Character>? {
        var set = set
        for c in s {
            if set.contains(c) {
                return nil
            }
            set.insert(c)
        }
        return set
    }
}
