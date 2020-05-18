makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

makeCacheMatrix <- function(x = matrix()) {
    inv_mat<- NULL
    setMat<- function(my_mat){
      x <<- my_mat
      inv_mat <<- NULL
    }
    getMat <- function() x
    setInvMat <- function(inverse) inv_mat <<- inverse
    getInvMat <- function() inv_mat
    list(setMat = setMat, getMat = getMat,
         setInvMat = setInvMat,
         getInvMat = getInvMat)
}

cacheSolve <- function(x, ...) {
  inv_mat <- x$getInvMat()
  if(!is.null(inv_mat)) {
    message("getting cached data for inverse of matrix")
    return(inv_mat)
  }
  my_mat <- x$getMat()
  inv_mat <- solve(my_mat, ...) 
  x$setInvMat(inv_mat)
  inv_mat
}