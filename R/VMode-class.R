## ======================================================================
##  ViewMode delegate di
## ======================================================================
setClass("ViewMode", contains = "VIRTUAL")
setVMode <- function(name, modes,
                    contains = character(),
                    where = topenv(parent.frame())){
  nm <- paste(name, "ViewMode", sep = "")
  pars <- setPropertySet(nm, modes)
  parsName <- paste(nm, "PropertySet", sep = "")
  setRefClass(nm, fields = list(pars = parsName),
              contains = c("ViewMode", "Item", contains),
              where = where,
              methods = list(
                initialize = function(t = as.character(class(.self)), ...){
                  .self$text <<- t 
                  callSuper(...)
                }))
}

