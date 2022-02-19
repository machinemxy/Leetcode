// https://leetcode.com/problems/minimize-deviation-in-array/

class Solution {
    func minimumDeviation(_ nums: [Int]) -> Int {
        let evenNums: [Int] = nums.map { num in
            if num % 2 == 1 {
                return num * 2
            } else {
                return num
            }
        }
        var sortedNums = evenNums.sorted()
        var result = sortedNums.last! - sortedNums.first!

        while sortedNums.last! % 2 == 0 {
            let last = sortedNums.removeLast()
            insertNewElement(arr: &sortedNums, newElement: last / 2)
            result = min(result, sortedNums.last! - sortedNums.first!)
        }

        return result
    }

    private func insertNewElement(arr: inout [Int], newElement: Int) {
        if newElement <= arr.first! {
            arr.insert(newElement, at: 0)
        } else if newElement >= arr.last! {
            arr.append(newElement)
        } else {
            var l = 0
            var r = arr.count - 1
            while l <= r {
                let mid = (l + r) / 2
                let midValue = arr[mid]
                if newElement == midValue {
                    l = mid
                    break
                } else if newElement < midValue {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            arr.insert(newElement, at: l)
        }
    }
}
