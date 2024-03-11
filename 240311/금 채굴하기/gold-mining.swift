let dx = [0, -1, 1, 0, 0]
let dy = [0, 0, 0, -1, 1]

func findGold(_ x: Int, _ y: Int, _ depth: Int) -> Int {
    guard depth < m else { 
        return board[x][y]
    }

    var sum = 0
    for i in 0..<dx.count {
        let nx = x + dx[i]
        let ny = y + dy[i]

        guard 0..<n ~= nx, 
              0..<n ~= ny,
              !visited[nx][ny] else {
            continue
        }

        visited[nx][ny] = true
        sum += findGold(nx, ny, depth + 1)
    }

    return sum
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var result = 0
var visited: [[Bool]] = []
for i in 0..<n {
    for j in 0..<n {
        visited = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
        let sum = findGold(i, j, 0)
        result = max(result, sum)
    }
}

print(result)