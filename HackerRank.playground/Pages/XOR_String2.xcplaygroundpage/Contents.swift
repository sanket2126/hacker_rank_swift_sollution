
import Foundation

// Given two strings consisting of digits 0 and 1 only, find the XOR of the two strings.

/*
 Input
 10101
 00101
 
 Output
 10000
*/

// MARK: C++
/*
 string strings_xor(string s, string t) {

     string res = "";
     for(int i = 0; i < s.size(); i++) {
         if(s[i] == t[i])
             res += '0';
         else
             res += '1';
     }

     return res;
 }

 int main() {
     string s, t;
     cin >> s >> t;
     cout << strings_xor(s, t) << endl;
     return 0;
 }
 */
