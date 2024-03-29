// https://leetcode.com/problems/simplify-path/

class Solution {
	func simplifyPath(_ path: String) -> String {
		let components = path.split(separator: "/")
		var storage = [String]()
		for component in components {
			if component == "" { continue }
			if component == "." { continue }
			if component == ".." {
				if !storage.isEmpty {
					storage.removeLast()
				}
			} else {
				storage.append(String(component))
			}
		}

		if storage.isEmpty {
			return "/"
		} else {
			var result = ""
			for component in storage {
				result += "/\(component)"
			}
			return result
		}
	}
}
