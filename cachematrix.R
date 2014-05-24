## makeCacheMatrix and cacheSolve allows the caching of the inverse of a square matrix

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
