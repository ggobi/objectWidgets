setClass("Widget", contains = "VIRTUAL")

## create *Widget classes
setGeneric("Widget", function(obj, ...) standardGeneric("Widget"))

## call obj$widget()
setGeneric("widget", function(obj, ...) standardGeneric("widget"))


