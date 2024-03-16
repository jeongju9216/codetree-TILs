func canPainted(_ x: Int, _ y: Int) -> Bool {
    let vertical = (0..<n).map { visited[$0][y] }
    let horizontal = visited[x]

    return vertical.filter { $0 }.count == 0 &&
           horizontal.filter { $0 }.count == 0
}

func backtracking(_ arr: [Int]) {
    guard arr.count < n else {
        let sum = arr.reduce(0, +)
        result = max(result, sum)
        return
    }

    for i in 0..<n {
        for j in 0..<n {
            if canPainted(i, j) {
                visited[i][j] = true
                backtracking(arr + [board[i][j]])
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
var result = Int.min
backtracking([])
print(result)