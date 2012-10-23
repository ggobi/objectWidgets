AnnotatedWidget.gen <- setRefClass("AnnotatedWidget", contains = "Widget",
                                   fields = list(icon = "Icon",
                                     text = "character"),
                                   methods = list(
                                     setIcon = function(value){
                                       icon <<- value
                                     },
                                     setText = function(value){
                                       text <<- value
                                     },
                                     getIcon = function(){
                                       .self$icon
                                     },
                                     getText = function(){
                                       .self$text
                                     }))

