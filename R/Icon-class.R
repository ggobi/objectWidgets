setClass("Icon", contains = "VIRTUAL")
setClass("IconWidget", contains = "Widget")
setMethod("Widget", "Icon", function(obj, ...){
  new("IconWidget", ...)
})
