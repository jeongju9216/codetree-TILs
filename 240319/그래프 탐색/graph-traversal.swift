func dfs(_ node: Int) {
    for next in graph[node] ?? [] {
        guard !visited[next] else { 
            continue 
        }

        visited[next] = true
        result += 1
        dfs(next)
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var graph: [Int: [Int]] = [:]
for _ in 0..<m {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    graph[input[0], default: []].append(input[1])
    graph[input[1], default: []].append(input[0])
}

var visited = Array(repeating: false, count: n + 1)
var result = 0
visited[1] = true
dfs(1)

print(result)