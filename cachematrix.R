## This R file contains functions that will cache an inverse matrix, and solve
## the inverse of the matrix if it is not already cached.

## This function defines 4 functions that set and return the values of a matrix
## and its inverse.  It also creates a list of these functions.  
## V3 - need to do some debugging. 

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        
        ## This function changes the internal value of the matrix and resets the
        ## inverse matrix - in the makeCacheMatrix function.
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        
        ## This function returns the value of the INPUT matrix 'x'.
        get <- function() x
        
        ## This function updates the value of the INVERSE matrix
        setinverse <- function(matinverse) i <<- matinverse
        
        ## This function returns the INVERSE matrix
        getinverse <- function() i
        
        ## This returns a list of functions as the output object of the function
        (list(set = set, get = get, setinverse = setinverse,
              getinverse = getinverse))

}

## This function checks the value of the stored inverse. If it is null,
## the function calculates and caches the inverse in the the main function.

cacheSolve <- function(x, ...) {
        ## Check the value of the stored inverse and return it if not NULL
        i <- x$getinverse()
        if (!is.null(i)) {
                message("Getting cached inverse...")
                return(i)
        }
        
        ## ELSE: Calulate and return a matrix that is the inverse of 'x'
        data <- x$get()
        
        ## solve the matrix to get the inverse - if no arg specified, solve() 
        ## takes it to mean we want the identity
        matinverse <- solve(data, ...)
        
        ## cache and return the result
        x$setinverse(matinverse)
        matinverse
        
}
