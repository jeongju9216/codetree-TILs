let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = 0
for i in 0..<n {
    for j in i..<n {
        let nums = arr[i...j].map { Double($0) }
        let abs = Double(nums.reduce(0, +)) / Double(nums.count)
        if nums.contains(abs) {
            result += 1
        }
    }
}
print(result)