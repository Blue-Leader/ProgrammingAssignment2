## This R file contains functions that will cache the inverse of a matrix, and 
## solve the matrix if the inverse is not already cached.

## This function defines 4 functions that set and return the values of a matrix
## and its inverse.  It also creates and returns a list of these functions.  
## 
## V5 - debugging complete - tested with larger matrices. 

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
        return(list(set = set, get = get, setinverse = setinverse,
              getinverse = getinverse))

}

## This function checks the value of the stored inverse matrix. If it is NULL,
## the function calculates (solves) and caches the inverse in the main function.
## It then returns the inverse matrix.

cacheSolve <- function(x, ...) {
        ## Check the value of the stored inverse and return it IF (not NULL)
        
        i <- x$getinverse()
        if (!is.null(i)) {
                message("Getting cached inverse...")
                return(i)
        }
        
        ## ELSE: Calculate and return a matrix that is the inverse of 'x'
        data <- x$get()
        
        ## solve the matrix to get the inverse - if no second arg specified, 
        ## solve() takes it to mean we want the identity and thus returns 
        ## the inverse matrix.
        
        matinverse <- solve(data, ...)
        
        ## cache and return the inverse matrix
        
        x$setinverse(matinverse)
        matinverse
        
}
