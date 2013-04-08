setClass("Group", contains = "VIRTUAL")



setRefClass("GroupWidget",
            properties(fields = list(
                      defaultId = "numeric",
                      exclusive = "logical",
                      curId = "numeric",
                      items = "ItemList"
                      )),
            methods = list(
              menu = function(w){
                stop("not implemented yet")
              },
           checkedId = function(){
             which(unlist(lapply(items, function(item){
               item$checked
             })))
           },
           setCheckedForAll = function(bool = FALSE){
             sapply(seq(length(items)), function(i){
               items[[i]]$checked <<- bool
             })
           },
           id = function(){
             which(unlist(lapply(items, function(item){
               item$checked
             })))
           },
           setId = function(idx){
             if(exclusive){
               .self$setCheckedForAll(FALSE)
               items[[idx]]$checked <<- TRUE
             }else{
               items[[idx]]$checked <<- TRUE
             }
             curId <<- id()
           },
           setExclusive = function(bool = TRUE){
             exclusive <<- bool
           },
           initialize = function(t = as.character(class(.self)),...){
             exclusive <<- TRUE
             defaultId <<- 1
             curId <<- 1
             .self$text <<- t
             .self$regSignal()
             callSuper(...)
           },
           regSignal = function(){
             exclusiveChanged$connect(function(){
               .self$setId(defaultId)
             })}),
            contains = c("Group", "AnnotatedWidget"))


setGroupWidget <- function(name, 
                           contains = character(),
                           where = topenv(parent.frame()), ...){
  nm <- paste(name, "GroupWidget", sep = "")
  setRefClass(nm, contains = c("GroupWidget", contains), where = where, ...)
}

