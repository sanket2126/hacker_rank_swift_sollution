
import Foundation

// In this challenge, the task is to debug the existing code to successfully execute all provided test files.

/*
 a = [2,3,5,1,4]
 
 Now if we permute the array as [1,4,5,3,2], the result is a zig zag sequence.

 Debug the given function findZigZagSequence to return the appropriate zig zag sequence for the given input array.
 */

// MARK: C++

/*
 #include <bits/stdc++.h>
 using namespace std;

 void findZigZagSequence(vector < int > a, int n){
     sort(a.begin(), a.end());
     int mid = (n + 1)/2;
     swap(a[mid], a[n-1]);

     int st = mid + 1;
     int ed = n - 1;
     while(st <= ed){
         swap(a[st], a[ed]);
         st = st + 1;
         ed = ed - 1;
     }
     for(int i = 0; i < n; i++){
         if(i > 0) cout << " ";
         cout << a[i];
     }
     cout << endl;
 }

 int main() {
     int n, x;
     int test_cases;
     cin >> test_cases;

     for(int cs = 1; cs <= test_cases; cs++){
         cin >> n;
         vector < int > a;
         for(int i = 0; i < n; i++){
             cin >> x;
             a.push_back(x);
         }
         findZigZagSequence(a, n);
     }
 }

 */
