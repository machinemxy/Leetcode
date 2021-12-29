// https://leetcode.com/problems/median-of-two-sorted-arrays/
// My solution is not O(log(m+n)). Best solution see https://www.youtube.com/watch?v=q6IEA26hvXc&t=11s

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let target1: Int
        let target2: Int
        let count = nums1.count + nums2.count
        if count % 2 == 0 {
            target1 = count / 2
            target2 = target1 + 1
        } else {
            target1 = (count + 1) / 2
            target2 = -1
        }
        var i1 = 0
        var i2 = 0
        var i = 1
        var result1 = Double(-1)
        var result2 = Double(-1)

        while true {
            let val: Int
            if i1 >= nums1.count {
                val = nums2[i2]
                i2 += 1
            } else if i2 >= nums2.count {
                val = nums1[i1]
                i1 += 1
            } else if nums1[i1] <= nums2[i2] {
                val = nums1[i1]
                i1 += 1
            } else {
                val = nums2[i2]
                i2 += 1
            }

            if target1 == i {
                result1 = Double(val)
                if target2 == -1 {
                    return result1
                }
            } else if target2 == i {
                result2 = Double(val)
                return (result1 + result2) / 2
            }

            i += 1
        }
    }
}
