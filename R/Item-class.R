setRefClass("Item", contains = c("AnnotatedWidget", "VIRTUAL"),
            fields = list(
              checked = "logical"
              ),
            methods = list(
              setChecked = function(bool = TRUE){
                checked <<- bool
              },
              isChecked = function(){
                checked
              },
              initialize = function(...){
                checked <<- FALSE
                callSuper(...)
              }))

## setOldClass("list")
setClass("ItemList", 
         prototype = prototype(elementType = "Item"),
         contains = "list")

ItemList <- function(...){
  items <- list(...)
  if (length(items) == 1 && is.list(items[[1L]]))
    items <- items[[1L]]
  if (!all(sapply(items, is, "Item")))
    stop("all elements in '...' must be Item objects")
  res <- new("ItemList", items)
}

## setClass("SimpleItemList", contains = c("ItemList", "SimpleList"),
##          prototype = prototype(elementType = "Item"))
## need to remove the dependency on IRanges
## ItemList <- function(...)
## {
##   items <- list(...)
##   if (length(items) == 1 && is.list(items[[1L]]))
##     items <- items[[1L]]
##   if (!all(sapply(items, is, "Item")))
##     stop("all elements in '...' must be Item objects")
##   ans <- IRanges:::newSimpleList("SimpleItemList", items)
##   ans
## }

