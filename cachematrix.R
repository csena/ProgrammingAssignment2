## makeCacheMatrix and cacheSolve allows the caching of the inverse of a square matrix
### Usage:
# makeCacheMatrix(x)
# cacheSolve(m)
### Arguments
# x     a square matrix
# m     the "special" matrix object created and returned by makeCacheMatrix
### Examples (taken from the Examples of ?solve)
# hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
# h8 <- hilbert(8)
# m1 <- makeCacheMatrix(h8)
# inv <- cacheSolve(m1)
# inv   # inverse of h8
# cacheSolve(m1) # will print "getting cached data"
# m1$set(inv)
# inv   # inverse of the inverse, equals to h8


## Creates a special matrix object that can cache its inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        
        s <- NULL
        
        # sets the matrix x
        set <- function(y) {
                x <<- y
                # setting s to NULL guarantees that if the matrix changes
                # s will be recalculated in the next call to cacheSolve
                s <<- NULL
        }
        
        # returns the matrix
        get <- function() x
        
        # sets the inverse 
        setsolve <- function(solve) s <<- solve
        # returns the inverse
        getsolve <- function() s
        # list of functions associated to the special matrix object
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## Implements a similar function to solve, with the capability of caching 
## the potentially intense-computation of the inverse 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        s <- x$getsolve()
        if (!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data)
        x$setsolve(s)
        s
}
