setGeneric("widget", function(obj, ...) standardGeneric("widget"))

setMethod("widget", "PropertySet", function(obj, visible){
  ControlPanel(obj, visible = visible)
})

