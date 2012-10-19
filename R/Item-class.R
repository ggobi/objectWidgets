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

setClass("ItemList",  contains = "list")
setValidity("ItemList", function(object){
  res <- unlist(lapply(object, is, "Item"))
  if(all(res))
    TRUE
  else
    paste("Entry ", which(!res), " is not Item class")
})

## FIXME: add validation
ItemList <- function(...)
{
  items <- list(...)
  if (length(items) == 1 && is.list(items[[1L]]))
    items <- items[[1L]]
  if (!all(sapply(items, is, "Item")))
    stop("all elements in '...' must be Item objects")
  ans <- IRanges:::newSimpleList("ItemList", items)
  ans
}

