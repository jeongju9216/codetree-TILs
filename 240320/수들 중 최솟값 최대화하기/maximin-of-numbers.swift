func canPaint(_ x: Int, _ y: Int) -> Bool {
    for i in 0..<n {
        if visited[i][y] {
            return false
        }
    }

    for i in 0..<n {
        if visited[x][i] {
            return false
        }
    }

    return true
}

func backtracking(_ arr: [Int], _ count: Int) {
    guard count < n else {
        result = max(result, arr.min()!)
        return
    }

    for i in 0..<n {
        for j in 0..<n {
            if canPaint(i, j) {
                visited[i][j] = true
                backtracking(arr + [board[i][j]], count + 1)
                visited[i][j] = false
            }
        }
    }
}

let n = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var result = 0
backtracking([], 0)
print(result)