typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func melting() -> Int {
    var queue: [Point] = [(0, 0)]
    var index = 0
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    var ice: [Point] = []
    while index < queue.count {
        let (x, y) = queue[index]
        index += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            guard 0..<n ~= nx, 0..<n ~= ny, !visited[nx][ny] else {
                continue
            }

            visited[nx][ny] = true
            if board[nx][ny] == 0 {
                queue.append((nx, ny))
            } else {
                ice.append((nx, ny))
            }
        }
    }

    for (x, y) in ice {
        board[x][y] -= 1
    }

    return ice.count
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var time = 0
var lastMelting = 0
while true {
    let numberOfMeltings = melting()
    if numberOfMeltings == 0 {
        break
    }
    time += 1
    lastMelting = numberOfMeltings
}

print(time, lastMelting)