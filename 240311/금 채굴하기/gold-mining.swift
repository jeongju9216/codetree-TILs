let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func cost(_ k: Int) -> Int {
    k * k + (k + 1) * (k + 1)
}

func bfs(_ x: Int, _ y: Int, _ k: Int) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)            
    var queue: [(x: Int, y: Int, depth: Int)] = [(x, y, 0)]
    var index = 0
    
    var sum = board[x][y]
    visited[x][y] = true
    while index < queue.count {
        let (x, y, depth) = queue[index]
        index += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            let nd = depth + 1

            guard 0..<n ~= nx, 
                  0..<n ~= ny,
                  nd <= k,
                  !visited[nx][ny] else {
                continue
            }

            sum += board[nx][ny]
            visited[nx][ny] = true
            queue.append((nx, ny, nd))
        }
    }

    return sum
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var board: [[Int]] = []
var total = 0
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)

    total += input.filter { $0 == 1 }.count
}

var result = 0
var visited: [[Bool]] = []
var k = 0
var isFinished = false
while !isFinished {
    for i in 0..<n {
        for j in 0..<n {
            let numberOfGolds = bfs(i, j, k)
            if cost(k) <= numberOfGolds * m {
                result = max(result, numberOfGolds)
            }
            if numberOfGolds == total {
                isFinished = true
                break
            }
        }
    }

    k += 1
}

print(result)