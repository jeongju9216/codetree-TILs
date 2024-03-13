let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var numbers: [Int] = []
var result: [Int] = []
for i in 0..<arr.count {
    numbers.append(arr[i])

    if i % 2 == 0 {
        numbers.sort(by: <)
        let midIndex = numbers.count / 2
        result.append(numbers[midIndex])
    }
}

for num in result {
    print(num, terminator: " ")
}