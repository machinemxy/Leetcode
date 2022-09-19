// https://leetcode.com/problems/find-duplicate-file-in-system/

class Solution {
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var dic = Dictionary<String, [String]>()
        for path in paths {
            let pathComponents = path.components(separatedBy: " ")
            let folder = pathComponents[0] + "/"
            for i in 1..<pathComponents.count {
                let pathComponent = pathComponents[i]
                let fileComponents = pathComponent.components(separatedBy: "(")
                let fileContent = fileComponents[1] // we can remove ")" but not necessary
                let filePath = folder + fileComponents[0]
                if var filePaths = dic[fileContent] {
                    filePaths.append(filePath)
                    dic[fileContent] = filePaths
                } else {
                    dic[fileContent] = [filePath]
                }
            }
        }
        return Array(dic.values).filter { $0.count > 1 }
    }
}
