## Cache-enabled inverse matrix computation

makeCacheMatrix and cacheSolve allows the caching of the inverse of a square matrix

### Usage:

makeCacheMatrix(x)

cacheSolve(m)

### Arguments
x     a square matrix
m     the "special" matrix object created and returned by makeCacheMatrix

### Examples (taken from the Examples of ?solve)
hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
h8 <- hilbert(8)
m1 <- makeCacheMatrix(h8)
inv <- cacheSolve(m1)

inv   # inverse of h8
cacheSolve(m1) # will print "getting cached data"
m1$set(inv)
inv   # inverse of the inverse, equals to h8
