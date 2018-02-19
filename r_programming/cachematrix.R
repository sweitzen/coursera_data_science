## cachematrix.R
## This file contains functions implemented as a demonstration of the 
## superassignment operator '<<-'.

## makeCacheMatrix
## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        ## Initialize inv, which stores the inverse matrix, locally.
        inv <- NULL
        
        ## Overwrite matrix x in calling environment, and re-initialize inv 
        ## when x is changed.
        set <- function(y) {
                x   <<- y
                inv <<- NULL
        }
        
        ## Return matrix x.
        get <- function() x 
        
        ## Cache provided inverse matrix as inv.
        setinv <- function(inverse) inv <<- inverse
        
        ## Return matrix inv, the inverse of x.
        getinv <- function() inv
        
        ## Return a list of the functions created.
        list(set = set, 
             get = get,
             setinv = setinv,
             getinv = getinv)
}


## cacheSolve
## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix. If the inverse has already been calculated (and the matrix
## has not changed), then cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Get inverse matrix inv.
        inv <- x$getinv()
        
        ## Test whether 'inv' is null.
        if(!is.null(inv)) {
                ## inv is not null; return cached inverse matrix inv.
                message("getting cached data")
                return(inv)
        }
        
        ## inv is null, so we must calculate inverse of original matrix.
        ## Get original matrix.
        data <- x$get()
        
        ## Solve original matrix for its inverse.
        inv <- solve(data, ...)
        
        ## Push this inverse matrix into the cache for future reference.
        x$setinv(inv)
        
        ## Return inverse matrix.
        inv
}
