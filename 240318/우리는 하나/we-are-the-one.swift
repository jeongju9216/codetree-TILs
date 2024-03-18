typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func isContains(_ cities: [Point], _ point: Point) -> Bool {
    for city in cities {
        if city.x == point.x && city.y == point.y {
            return true
        }
    }
    return false
}

func dfs(_ cities: [Point]) {
    guard cities.count < k else {
        let count = bfs(cities)
        result = max(result, count)
        return
    }

    for i in 0..<n {
        for j in  0..<n {
            if !isContains(cities, (i, j)) {
                dfs(cities + [(i, j)])
            }
        }
    }
}

func bfs(_ cities: [Point]) -> Int {
    var queue = cities
    var index = 0
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    for city in cities {
        visited[city.x][city.y] = true
    }

    while index < queue.count {
        let (x, y) = queue[index]
        let height = board[x][y]
        index += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            guard 0..<n ~= nx,
                  0..<n ~= ny,
                  !visited[nx][ny] 
            else {
                continue
            }
            
            let nh = board[nx][ny]
            let diff = abs(nh - height)
            if diff >= u && diff <= d {
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }

    return queue.count
}

let nkud = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nkud[0], k = nkud[1], u = nkud[2], d = nkud[3]
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var result = 0
dfs([])
print(result)