let arr = Array(readLine()!)

let std = 2
let open = "(("
let close = "))"

var result = 0
for i in 0..<arr.count-1 {
    let string1 = String(arr[i..<i+std])
    if string1 == open {
        for j in i+1..<arr.count-1 {
            let string2 = String(arr[j..<j+std])
            if string2 == close {
                result += 1
            }
        }
    }
}

print(result)