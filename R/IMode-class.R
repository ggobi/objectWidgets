## ======================================================================
## Enum used in iMode class
## ======================================================================
setSingleEnum("TooltipMode", levels = c("Off", "Identify", "Metainfo","Text",
                               "Position"))
TooltipMode <- function(x = c("Off", "Identify",
                          "Metainfo","Text",
                               "Position")){
  x <- match.arg(x)
  new("TooltipModeSingleEnum", x)
}

setSingleEnum("TooltipPos", levels = c("TopLeft", "TopRight",
                                       "BottomLeft", "BottomRight",
                                       "Float"))
TooltipPos <- function(x = c("TopLeft", "TopRight",
                                       "BottomLeft", "BottomRight",
                                       "Float")){
  x <- match.arg(x)
  new("TooltipPosSingleEnum", x)
}


setSingleEnum("BrushMode", levels = c("Transient", "Persistent", "Off"))

BrushMode <- function(x = c("Transient", "Persistent", "Off")){
  x <- match.arg(x)  
  new("BrushModeSingleEnum", x)
}

setSingleEnum("PointBrushMode", levels = c("Off", "ColorAndGlyph",
                                  "ColorOnly", "GlyphOnly",
                                  "Shadow", "Unshadow"))

PointBrushMode <- function(x = c("Off", "ColorAndGlyph",
                                  "ColorOnly", "GlyphOnly",
                                  "Shadow", "Unshadow")){
  x <- match.arg(x)  
  new("PointBrushModeSingleEnum", x)
  
}
setSingleEnum("EdgeBrushMode", levels = c("Off", "ColorAndLine",
                                 "ColorOnly", "LineOnly", "Shadow", "Unshadow"))

EdgeBrushMode <- function(x = c("Off", "ColorAndLine",
                                 "ColorOnly", "LineOnly", "Shadow", "Unshadow")){
  x <- match.arg(x)  
  new("EdgeBrushModeSingleEnum", x)
}

setSingleEnum("DragMode",
              levels = c("NoDrag", "ScrollHandDrag", "RubberBandDrag"))

DragMode <- function(x = c("NoDrag", "ScrollHandDrag", "RubberBandDrag")){
  x <- match.arg(x)  
  new("DragModeSingleEnum", x)
}

setSingleEnum("ZoomMode", levels = c("Vertical", "Horizontal", "Both", "Off"))
ZoomMode <- function(x = c("Vertical", "Horizontal", "Both", "Off")){
  x <- match.arg(x)  
  new("ZoomModeSingleEnum", x)
}


## setGeneric("getQtEnum", function(x,...) standardGeneric("getQtEnum"))
## setMethod("getQtEnum", "DragModeSingleEnum", function(x){
##   val <- switch(x,
##                 NoDrag = Qt$QGraphicsView$NoDrag,
##                 ScrollHandDrag = Qt$QGraphicsView$ScrollHandDrag,
##                 RubberBandDrag = Qt$QGraphicsView$RubberBandDrag)
## })

## ======================================================================
## iMode class
## ======================================================================
setClass("IMode", contains = "VIRTUAL")
setIMode <- function(name, fields,
                     where = topenv(parent.frame())){

  nm <- paste(name, "IMode", sep = "")
  ## pars <- setPropertySet(nm, modes)
  ## parsName <- paste(nm, "PropertySet", sep = "")
  setRefClass(nm, fields = properties(fields),
              contains = c("IMode", "Item", "PropertySet"),
              where = where,
              methods = list(
                initialize = function(t = as.character(class(.self)), ...){
                  .self$text <<- t 
                  callSuper(...)
                }))
}


ScaleMode.gen <- setIMode("Scale",
                          fields = list(dragMode = "DragModeSingleEnum",
                            zoomMode = "ZoomModeSingleEnum"))
## ScaleMode return a object which is PropertySet
ScaleIMode <- function(dragMode = "ScrollHandDrag",
                      zoomMode = "Vertical"){
  obj <- ScaleMode.gen$new(dragMode = DragMode(dragMode),
                           zoomMode = ZoomMode(zoomMode))
}

BrushMode.gen <- setIMode("Brush",
                          list(brushMode = "BrushModeSingleEnum",
                               pointBrushMode = "PointBrushModeSingleEnum",
                               edgeBrushMode = "EdgeBrushModeSingleEnum"))

BrushIMode <- function(brushMode = "Off",
                      pointBrushMode = "Off",
                      edgeBrushMode = "Off"){

  obj <- BrushMode.gen$new(brushMode = BrushMode(brushMode),
                           pointBrushMode = PointBrushMode(pointBrushMode),
                           edgeBrushMode = EdgeBrushMode(edgeBrushMode))
}

setSingleEnum("Logical", levels = c("TRUE", "FALSE"))
IdentifyMode.gen <- setIMode("Identify",
                            list(tooltipMode = "TooltipModeSingleEnum",
                                 tooltipPos = "TooltipPosSingleEnum",
                                 hoverMode = "LogicalSingleEnum"))
HoverMode <- function(x = c("TRUE", "FALSE")){
  x <- match.arg(x)
  new("LogicalSingleEnum", x)
}
IdentifyIMode <- function(tooltipMode = "Off",
                         tooltipPos = "Float",
                         hoverMode = "FALSE"){

  obj <- IdentifyMode.gen$new(tooltipMode = TooltipMode(tooltipMode),
                              tooltipPos = TooltipPos(tooltipPos),
                              hoverMode = HoverMode(hoverMode))
}



IModeGroup.gen <- setGroup("IMode")
IModeGroup <- function(scaleIMode = ScaleIMode(),
                       brushIMode = BrushIMode(),
                       identifyIMode = IdentifyIMode(),
                       exclusive = TRUE,
                       text = "Interaction Group"){
## browser()
## BrushMode()
## list(
##      ## scaleMode = scaleMode,
##                     brushMode = brushMode)
##                     ## identifyMode = identifyMode)
  items <- ItemList(scaleIMode = scaleIMode,
                    brushIMode = brushIMode,
                    identifyIMode = identifyIMode)
  obj <- IModeGroup.gen$new(items = items, exclusive = exclusive)
  obj$setText(text)
  obj
}


obj <- IModeGroup()
ControlPanel(ScaleIMode())
## obj$widget(1)
obj$menu()
