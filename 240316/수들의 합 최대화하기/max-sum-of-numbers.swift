func backtracking(_ sum: Int, _ count: Int) {
    guard count < n else {
        result = max(result, sum)
        return
    }

    for i in 0..<n where !visited[i] {
        visited[i] = true
        backtracking(sum + board[count][i], count + 1)
        visited[i] = false    
    }
}

let n = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var visited = Array(repeating: false, count: n)
var result = Int.min
backtracking(0, 0)
print(result)