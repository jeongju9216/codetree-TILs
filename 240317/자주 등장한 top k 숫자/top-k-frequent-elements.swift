let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var counts: [Int: Int] = [:]
for num in arr {
    counts[num, default: 0] += 1
}

let nums = counts.keys.sorted {
    let count1 = counts[$0] ?? 0
    let count2 = counts[$1] ?? 0

    if count1 != count2 {
        return count1 > count2
    } else {
        return $0 > $1
    }
}
nums[..<k].forEach { print($0, terminator: " ") }