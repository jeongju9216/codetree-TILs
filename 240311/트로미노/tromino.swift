let dx = [
    [0, 1, 1],
    [0, 0, 1],
    [0, 1, 1],
    [0, 0, 1],
    [0, 0, 0],
    [0, 1, 2]
]
let dy = [
    [0, 0, 1],
    [0, 1, 0],
    [0, 0, -1],
    [0, 0, 1],
    [0, 1, 2],
    [0, 0, 0]
]

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]

var arr: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append(input)
}

var result = Int.min
for i in 0..<n {
    for j in 0..<m {        
        for k in 0..<dx.count {
            var isValid = true
            var sum = 0

            for t in 0..<dx[k].count {
                let nx = i + dx[k][t]
                let ny = j + dy[k][t]

                guard 0..<n ~= nx, 0..<m ~= ny else {
                    isValid = false
                    break
                }

                sum += arr[nx][ny]
            }

            if isValid {
                result = max(result, sum)
            }
        }
    }
}

print(result)