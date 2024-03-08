let open = "(", close = ")"

let arr = Array(readLine()!).map { String($0) }

var result = 0
for i in 0..<arr.count {
    if arr[i] == open {
        let closeCount = arr[i..<arr.count].filter { $0 == close }.count
        result += closeCount
    }
}

print(result)