let dx = [-1, 1, 0, 0]
let dy = [0 ,0, -1, 1]

func dfs(_ x: Int, _ y: Int) {
    let item = board[x][y]
    count += 1
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        guard 0..<n ~= nx, 0..<n ~= ny else {
            continue
        }

        if board[nx][ny] == item && !visited[nx][ny] {
            visited[nx][ny] = true
            dfs(nx, ny)
        }
    }
}

let n = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
var result = 0, popCount = 0
var count = 0
for i in 0..<n {
    for j in 0..<n {
        if !visited[i][j] {
            count = 0
            visited[i][j] = true
            dfs(i, j)
            
            if count >= 4 {
                popCount += 1
            }
            
            if result < count {
                result = count
            }
        }
    }
}

print("\(popCount) \(result)")