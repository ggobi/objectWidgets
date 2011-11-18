setGeneric("widget", function(obj, ...) standardGeneric("widget"))


## graphic parameters kind of special..
## setMethod("widget", "GraphicParameters", function(obj){
##   obj$widget()
## })

## ## return a QMenu
## setMethod("widget", "Group", function(obj){
##   obj$widget()
## })

## setMethod("widget", "QtVisnabView", function(obj, gr, title, show = TRUE,...){
##   obj$widget(show = show, gr = gr, title = title)
## })

