
import Foundation
/*
 A teacher asks the class to open their books to a page number. A student can either start turning pages from the front of the book or from the back of the book. They always turn pages one at a time. When they open the book, page 1 is always on the right side:
 
 When they flip page 1, they see pages 2 and 3. Each page except the last page will always be printed on both sides. The last page may only be printed on the front, given the length of the book. If the book is n pages long, and a student wants to turn to page p, what is the minimum number of pages to turn? They can start at the beginning or the end of the book.
 */
func pageCount(n: Int, p: Int) -> Int {
    // Write your code here
    if (p == 1) {
        return 0
    } else if (n%2 == 0) && (p%2 == 1) && (p == (n - 1)) {
        return 1
    } else {
        return min((p / 2), ((n - p) / 2))
    }
}

/*
 Input
 6 2
 
 Output
 1
 
 Input
 5 4
 
 Output
 0
 */

// https://www.hackerrank.com/challenges/one-month-preparation-kit-drawing-book/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=one-month-preparation-kit&playlist_slugs%5B%5D=one-month-week-two
