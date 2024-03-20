typealias Line = (s: Int, e: Int)

func backtracking(_ index: Int) {
    guard index < n else {
        counting()
        return
    }

    for i in index..<n {
        check(lines[i])
        backtracking(i + 1)
        uncheck(lines[i])
    }
}

func counting() {
    let maxCount = counts.max() ?? 0
    result = min(result, n - maxCount + 1)
}

func check(_ line: Line) {
    for i in line.s...line.e {
        counts[i] += 1
    }
}

func uncheck(_ line: Line) {
    for i in line.s...line.e {
        counts[i] -= 1
    }
}

let n = Int(readLine()!)!
var lines: [Line] = []
var maxEnd = 0
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    lines.append((input[0], input[1]))
    maxEnd = max(maxEnd, input[0], input[1])
}

var counts: [Int] = Array(repeating: 0, count: maxEnd + 1)
var result = Int.max
backtracking(0)
print(result)