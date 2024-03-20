func backtracking(_ arr: [Int], _ count: Int) {
    guard count < n else {
        var minValue = Int.max
        for i in 0..<n {
            minValue = min(minValue, board[i][arr[i]])
        }
        result = max(result, minValue)
        return
    }

    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            backtracking(arr + [i], count + 1)
            visited[i] = false
        }
    }
}

let n = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var visited = Array(repeating: false, count: n)
var result = 0
backtracking([], 0)
print(result)