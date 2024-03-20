typealias Line = (s: Int, e: Int)

func backtracking(_ index: Int, _ count: Int) {
    result = max(result, count)
    guard index < n else {
        return
    }
    
    for i in index..<n {
        let canCheck = check(lines[i])
        let c = canCheck ? count + 1 : count
        backtracking(i + 1, c)
        if canCheck {
            uncheck(lines[i])
        }
    }
}

func check(_ line: Line) -> Bool {
    var tmpVisited = visited
    for i in line.s...line.e {
        if tmpVisited[i] {
            return false
        }
        tmpVisited[i] = true
    }
    visited = tmpVisited
    return true
}

func uncheck(_ line: Line) {
    for i in line.s...line.e {
        visited[i] = false
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

var visited = Array(repeating: false, count: maxEnd + 1)
var result = 0
backtracking(0, 0)
print(result)