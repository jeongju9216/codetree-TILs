func backtracking(_ current: [Int], _ index: Int) {
    guard current.count < m else {
        let xor = current[1...].reduce(current[0]) { $0 ^ $1 }
        result = max(result, xor)
        return
    }

    if index > n {
        return
    }

    for i in index..<n {
        backtracking(current + [arr[i]], i + 1)
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = Int.min
backtracking([], 0)

print(result)