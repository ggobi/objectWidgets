library(objectWidgets)
## ColorEnum is a special single Enum object
nm <- setColorEnum("red", levels = c("red", "black"))
## create an example of SingleEnum for geom 
geomSingleEnum <- setSingleEnum("geom", c("rect", "triangle"))
## create an example of MultipleEnum 
testMul <- setMultipleEnum("test", c("a", "b", "c"))
## special geom enum, see the example of GUI for the difference




## 
gpar.gen <- setRefClass("GraphicPars", fields = properties(list(a = "character",
                                     b = "numeric",
                                     c = "PositiveInteger",
                                     d = "Color",
                                     e = "NumericWithMin0Max1",
                                     f = "geomSingleEnum",
                                     g = "testMultipleEnum",
                                     h = nm),
                                     prototype = list(a = "hah",
                                       b = 2,
                                       c = PositiveInteger(3),
                                       d = Color("red"),
                                       e = new("NumericWithMin0Max1", 1),
                                       f = new("geomSingleEnum", "rect"),
                                       g = new("testMultipleEnum", c("a", "b")),
                                       h = new(nm, "red"))),
                         contains = "PropertySet")

obj <- gpar.gen$new()
obj$properties()
obj$a
ControlPanel(obj)
ControlPanel(obj, visible = list(a = TRUE,
                    b = FALSE,
                    c = FALSE,
                    d = FALSE,
                    e = TRUE,
                    f = TRUE,
                    g = TRUE,
                    h = FALSE))


obj$properties()


## still under test
## a application window
obj <- IModeGroup()
ControlPanel(ScaleIMode())
obj$menu()


setSingleEnum("PointSize", levels = c("1", "2", "5", "10"), contains = "GlyphEnum")
setGeneric("icons", function(obj, ...) standardGeneric("icons"))
setMethod("icons", "PointSizeSingleEnum", function(obj, pix.size = c(30, 30),
                                                  pixbg.col = "white",
                                                  point.fill = "black",
                                                  point.stroke = NA){

  lst <- lapply(levels(obj), function(i){
    scene <- qscene()
    layer <- qlayer(scene, function(layer, painter){
      qdrawCircle(painter, 20, 10, r = as.numeric(i),
                  fill = point.fill, stroke = point.stroke)
    },limits = qrect(0, 0, 40, 20))
    qpixmap <- Qt$QPixmap(pix.size[1], pix.size[2])
    qpixmap$fill(Qt$QColor("white"))
    pt <- Qt$QPainter(qpixmap)
    scene$render(pt)
    icon <- Qt$QIcon(qpixmap)
  })
  names(lst) <- levels(obj)
  lst
})
