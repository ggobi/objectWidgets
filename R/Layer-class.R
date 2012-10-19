setClass("LayerList", contains = "list")
setClassUnion("LayerListORNULL", c("LayerList","NULL"))
## validation
setValidity("LayerList", function(object){
  res <- unlist(lapply(object, is, "Layer"))
  if(all(res))
    TRUE
  else
    paste("Entry ", which(!res), " is not Layer object(returned by qlayer)")
})

## LayerList API 
LayerList <- function(...){
  lst <- list(...)
  if(length(lst) == 1 && is.list(lst[[1]]))
    lst <- lst[[1]]
  ## validation
  isLayer <- unlist(lapply(lst, is, "Layer"))
  if(!all(isLayer))
    stop(paste("Entry ", which(!isLayer), " is not Layer object(returned by qlayer)"))
  new("LayerList", lst)
}

