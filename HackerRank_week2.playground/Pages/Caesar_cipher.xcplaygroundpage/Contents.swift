
import Foundation

func caesarCipher(s: String, k: Int) -> String {
    let cap = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let small = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    var encrypted = ""
    for e in s {
        if let i = cap.firstIndex(of: String(e)) {
            encrypted.append(cap[(i+k) % cap.count])
        } else if let i = small.firstIndex(of: String(e)) {
            encrypted.append(small[(i+k) % small.count])
        } else {
            encrypted.append(e)
        }
    }
    return encrypted
}

print(caesarCipher(s: "middle-Outz", k: 2))

/* 
 Julius Caesar protected his confidential information by encrypting it using a cipher. Caesar's cipher shifts each letter by a number of letters. If the shift takes you past the end of the alphabet, just rotate back to the front of the alphabet. In the case of a rotation by 3, w, x, y and z would map to z, a, b and c.
 
 Original alphabet:      abcdefghijklmnopqrstuvwxyz
 Alphabet rotated +3:    defghijklmnopqrstuvwxyzabc
 
 */


/*
 Input
 11
 middle-Outz
 2
 
 Output
 okffng-Qwvb
 
 
 Explaination:
 Original alphabet:      abcdefghijklmnopqrstuvwxyz
 Alphabet rotated +2:    cdefghijklmnopqrstuvwxyzab

 m -> o
 i -> k
 d -> f
 d -> f
 l -> n
 e -> g
 -    -
 O -> Q
 u -> w
 t -> v
 z -> b

 */
