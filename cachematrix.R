##makeCacheMatrix creates a special vector containing a list of four functions to:
##1-set the matrix given
##2-return the matrix
##3-set the inverse of the matrix given
##4-return the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        I <- NULL
        set <- function(y) {
                x <<- y
                I <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) I <<- inverse
        getinverse <- function() I
        list(set = set, get = get, setinverse = setinverse,
             getinverse = getinverse)               
}


##cacheSolve return the inverse of the matrix in makeCacheMatrix
##There are 2 scenarios:
##If the inverse has already been computed, it gets it using getinverse without computation
##Otherwise, it compute the inverse and return the result after setting it in the cache


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	  I <- x$getinverse()
        if (!is.null(I)) {
                message("getting cached data")
                return(m)
        }
        inverse <- x$get()
        I <- solve(inverse, ...)
        x$setinverse(I)
        I
}
