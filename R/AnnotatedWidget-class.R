AnnotatedWidget.gen <- setRefClass("AnnotatedWidget",
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

