// https://leetcode.com/problems/course-schedule-iii/

class Solution {
    private var selectedCourses = [Int]()

    func scheduleCourse(_ courses: [[Int]]) -> Int {
        let courses = courses.sorted(by: { $0[1] <= $1[1] })
        var days = 0
        for course in courses {
            insertCourse(course: course[0])
            days += course[0]
            if days > course[1] {
                let longestCourse = selectedCourses.removeLast()
                days -= longestCourse
            }
        }
        return selectedCourses.count
    }

    private func insertCourse(course: Int) {
        if selectedCourses.isEmpty {
            selectedCourses.append(course)
        } else {
            var l = 0
            var r = selectedCourses.count - 1
            while l <= r {
                let mid = (l + r) / 2
                let midVal = selectedCourses[mid]
                if course == midVal {
                    l = mid
                    break
                } else if course < midVal {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            selectedCourses.insert(course, at: l)
        }
    }
}
