## ======================================================================
## Enum used in IMode class
## ======================================================================
setSingleEnum("TooltipMode",
              levels = c("Off", "Identify", "Metainfo","Text", "Position"))

setSingleEnum("TooltipPos",
              levels = c("TopLeft", "TopRight", "BottomLeft", "BottomRight", "Float"))

setSingleEnum("BrushMode",
              levels = c("Transient", "Persistent", "Off"))

setSingleEnum("PointBrushMode",
              levels = c("Off", "ColorAndGlyph", "ColorOnly",
                         "GlyphOnly", "Shadow", "Unshadow"))

setSingleEnum("EdgeBrushMode",
              levels = c("Off", "ColorAndLine", "ColorOnly",
                         "LineOnly", "Shadow", "Unshadow"))

setSingleEnum("DragMode",
              levels = c("NoDrag", "ScrollHandDrag", "RubberBandDrag"))

setSingleEnum("ZoomMode",
              levels = c("Vertical", "Horizontal", "Both", "Off"))

## ======================================================================
## IMode class
## ======================================================================
setClass("IMode", contains = "VIRTUAL")

setMode <- function(name, modes,
                    contains = character(),
                    where = topenv(parent.frame()),
                    ...){
  nm <- paste(name, "Mode", sep = "")
  parsName <- paste(nm, "PropertySet", sep = "")
  pars <- setPropertySet(parsName, modes)
  setRefClass(nm, fields = list(pars = pars$className),
              contains = c("IMode",  "ItemWidget", contains),
              where = where,
              methods = list(
                initialize = function(t = as.character(class(.self)), ...){
                  .self$text <<- t 
                  callSuper(...)
                }))
}



ScaleMode.gen <- setMode("Scale",
                          list(dragMode = "DragModeSingleEnum",
                               zoomMode = "ZoomModeSingleEnum"))

ScaleMode <- function(dragMode = "ScrollHandDrag",
                      zoomMode = "Vertical",
                      ...){
  pars <- new("ScaleModePropertySet", dragMode = dragMode, zoomMode = zoomMode)
  obj <- ScaleMode.gen$new(pars = pars, ...)
}


BrushMode.gen <- setMode("Brush",
                          list(brushMode = "BrushModeSingleEnum",
                               pointBrushMode = "PointBrushModeSingleEnum",
                               edgeBrushMode = "EdgeBrushModeSingleEnum"))

BrushMode <- function(brushMode = "Off",
                      pointBrushMode = "Off",
                      edgeBrushMode = "Off",
                      ...){
  pars <- new("BrushModePropertySet", brushMode = brushMode,
              pointBrushMode = pointBrushMode,
              edgeBrushMode = edgeBrushMode)
  obj <- BrushMode.gen$new(pars = pars, ...)
}

setSingleEnum("Logical", levels = c("TRUE", "FALSE"))
IdentifyMode.gen <- setMode("Identify",
                            list(tooltipMode = "TooltipModeSingleEnum",
                                 tooltipPos = "TooltipPosSingleEnum",
                                 hoverMode = "LogicalSingleEnum"))

IdentifyMode <- function(tooltipMode = "Off",
                         tooltipPos = "Float",
                         hoverMode = "FALSE",
                         ...){
  pars <- new("IdentifyModePropertySet",
              tooltipMode = tooltipMode,
              tooltipPos = tooltipPos,
              hoverMode = hoverMode)
  obj <- IdentifyMode.gen$new(pars = pars, ...)
}


IModeGroupWidget.gen <- setGroupWidget("IMode")
IModeGroupWidget <- function(scaleMode = ScaleMode(),
                       brushMode = BrushMode(),
                       identifyMode = IdentifyMode(),
                       exclusive = TRUE,
                       text = "Interaction Group"){
  
  items <- ItemList(scaleMode = scaleMode,
                    brushMode = brushMode,
                    identifyMode = identifyMode)
  obj <- IModeGroupWidget.gen$new(items = items, exclusive = exclusive)
  obj$setText(text)
  obj
}

## setMethod("Widget", "ImodeGroup", function(obj, ...){
##   IModeGroupWidget(...)
## })
