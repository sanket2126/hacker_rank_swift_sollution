//: [Previous](@previous)

import Foundation

// MARK: Given a time in 12-hour AM/PM format, convert it to military (24-hour) time.

//Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.
//- 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.

func timeConversion(s: String) -> String {
    // Write your code here
    let df = DateFormatter()
    df.dateFormat = "hh:mm:ssa"
    let dt = df.date(from: s) ?? Date()
    // print(dt)
    df.dateFormat = "HH:mm:ss"
    
    return df.string(from: dt) ?? ""
}

/*
 Input
 07:05:45PM
 
 Output
 19:05:45
 */
// https://www.hackerrank.com/challenges/one-month-preparation-kit-time-conversion/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=one-month-preparation-kit&playlist_slugs%5B%5D=one-month-week-one
