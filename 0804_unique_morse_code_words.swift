// https://leetcode.com/problems/unique-morse-code-words/

class Solution {
	func uniqueMorseRepresentations(_ words: [String]) -> Int {
		var morseSet = Set<String>()
		for word in words {
			morseSet.insert(word.toMorseCode())
		}
		return morseSet.count
	}
}

extension String {
	func toMorseCode() -> String {
		self.reduce("") { $0 + $1.toMorseCode() }
	}
}

extension Character {
	func toMorseCode() -> String {
		switch self {
			case "a": return ".-"
			case "b": return "-..."
			case "c": return "-.-."
			case "d": return "-.."
			case "e": return "."
			case "f": return "..-."
			case "g": return "--."
			case "h": return "...."
			case "i": return ".."
			case "j": return ".---"
			case "k": return "-.-"
			case "l": return ".-.."
			case "m": return "--"
			case "n": return "-."
			case "o": return "---"
			case "p": return ".--."
			case "q": return "--.-"
			case "r": return ".-."
			case "s": return "..."
			case "t": return "-"
			case "u": return "..-"
			case "v": return "...-"
			case "w": return ".--"
			case "x": return "-..-"
			case "y": return "-.--"
			case "z": return "--.."
			default: return ""
		}
	}
}
