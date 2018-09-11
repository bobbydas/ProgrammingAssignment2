## Calculate the cached inverse matrix

## Function to create a cached inverse of a matrix 'x'
## Function returns a list of functions with global scope

makeCacheMatrix <- function(x = matrix()) {
## Check if x is a square matrix and use solve(x) for inverse

## Initialize cache matrix as NULL
cachedm <<- NULL

## Following functions set & get a matrix, set inverse and get inverse
## for a matrix.

set <- function(y) {
  x <<- y
  cachedm <<- NULL
  }

get <- function() x

set_inv <- function(solve) cachedm <<- solve

get_inv <- function() cachedm

## list with functions with global scope
list(set = set, get = get,
     set_inv = set_inv,
     get_inv = get_inv)

}

## Function uses defined scope functions from makeCacheMatrix
## function defined above to get cached inverse for a matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
cachedm <- x$get_inv()
if (!is.null(cachedm)) {
     message("retrieving cached data")
     return(cachedm)
     }
data <- x$get()
cachedm <- solve(data,...)
x$set_inv(cachedm)
cachedm

}
