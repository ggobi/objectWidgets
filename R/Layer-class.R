setClass("Layer", contains = "VIRTUAL")
setClass("LayerList", contains = "list")
setClassUnion("LayerListORNULL", c("LayerList","NULL"))

