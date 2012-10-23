setClass("Item", contains = "VIRTUAL")
setRefClass("ItemWidget", contains = c("AnnotatedWidget", "Item"),
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

setClass("ItemWidgetList",  contains = "list")
setValidity("ItemWidgetList", function(object){
  res <- unlist(lapply(object, is, "ItemWidget"))
  if(all(res))
    TRUE
  else
    paste("Entry ", which(!res), " is not ItemWidget class")
})

## FIXME: add validation
ItemWidgetList <- function(...)
{
  items <- list(...)
  if (length(items) == 1 && is.list(items[[1L]]))
    items <- items[[1L]]
  if (!all(sapply(items, is, "Item")))
    stop("all elements in '...' must be Item objects")
  new("ItemWidgetList",  items)
  ans
}

