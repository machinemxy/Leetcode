// https://leetcode.com/problems/regular-expression-matching/

class Solution {
	func isMatch(_ s: String, _ p: String) -> Bool {
		let sl = Array(s).map { String($0) }
		var pl = [String]()
		var temp = ""
		for c in p {
			if c == "*" {
				pl.append(temp + String(c))
				temp = ""
			} else {
				if temp != "" {
					pl.append(temp)
				}
				temp = String(c)
			}
		}
		if temp != "" {
			pl.append(temp)
		}

		return isMatch(sl: sl, pl: pl)
	}

	private func isMatch(sl: [String], pl: [String]) -> Bool {
		if pl.filter({ $0.count == 1 }).count > sl.count {
			// pl is more than sl
			return false
		}

		var vsl = sl
		var vpl = pl
		var c = ""

		while true {
			if vsl.count == 0 && vpl.count == 0 {
				// all matched
				return true
			} else if vpl.count == 0 {
				// sl still left
				return false
			}

			let p = vpl.removeFirst()
			if p.count == 2 {
				c = String(p.first!)
				break
			} else {
				let s = vsl.removeFirst()
				if p == "." || p == s {
					continue
				} else {
					return false
				}
			}
		}

		for i in 0...(vsl.count - vpl.filter({ $0.count == 1 }).count) {
			var tpl = vpl
			for _ in 0..<i {
				tpl.insert(c, at: 0)
			}
			if isMatch(sl: vsl, pl: tpl) {
				return true
			}
		}
		return false
	}
}
