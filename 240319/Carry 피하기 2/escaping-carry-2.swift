func isCarry(_ num1: Int, _ num2: Int, _ num3: Int) -> Bool {
    let arr1: [Int] = String(num1).map { Int(String($0))! }.reversed()
    let arr2: [Int] = String(num2).map { Int(String($0))! }.reversed()
    let arr3: [Int] = String(num3).map { Int(String($0))! }.reversed()

    let maxLength = max(arr1.count, arr2.count, arr3.count)
    for i in 0..<maxLength {
        var sum = 0
        if arr1.count > i {
            sum += arr1[i]
        }

        if arr2.count > i {
            sum += arr2[i]
        }

        if arr3.count > i {
            sum += arr3[i]
        }

        if sum >= 10 {
            return true
        }
    }
    return false
}

let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}

var result = -1
for i in 0..<n {
    for j in 0..<n {
        for k in 0..<n {
            guard i != j && j != k && i != k else {
                continue
            }

            let num1 = arr[i]
            let num2 = arr[j]
            let num3 = arr[k]

            if !isCarry(num1, num2, num3) {
                result = max(result, num1 + num2 + num3)
            }
        }
    }
}
print(result)