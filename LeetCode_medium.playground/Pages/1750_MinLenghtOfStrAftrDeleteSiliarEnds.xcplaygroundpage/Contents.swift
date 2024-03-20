// MARK: 1750. Minimum Length of String After Deleting Similar Ends

//https://leetcode.com/problems/minimum-length-of-string-after-deleting-similar-ends/description/

func minimumLength(_ s: String) -> Int {
    var charArray : [Character] = Array(s)
    var i : Int = 0
    var j : Int = s.count-1
    while (i<j && (charArray[i]==charArray[j]) ) {
        var char = charArray[i]
        while(i<j && charArray[i]==char){
            i += 1
        }
        while(i<=j && charArray[j]==char){
            j -= 1
        }
        print(j,i)
    }
    return (j-i+1)
}

print("Result -", minimumLength("ca"))

print("Result -", minimumLength("cabaabac"))

print("Result -", minimumLength("aabccabba"))
