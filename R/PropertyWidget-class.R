setOldClass("character")
setOldClass("factor")
setOldClass("function")
setOldClass("logical")

setRefClass("PropertySetWidget",
         contains = c("Widget", "PropertySet"))

setClass("ColorWidget",
            contains = c("Widget", "Color"))

setClass("ColorEnumWidget",
            contains = c("Widget", "ColorEnum"))

setClass("GlyphEnumWidget",
            contains = c("Widget", "GlyphEnum"))


setClass("SingleEnumWidget",
            contains = c("Widget", "SingleEnum"))

setClass("MultipleEnumWidget",
            contains = c("Widget", "MultipleEnum"))

setClass("PositiveIntegerWidget",
            contains = c("Widget", "PositiveInteger"))

setClass("NegativeIntegerWidget",
            contains = c("Widget", "NegativeInteger"))

setClass("NonpositiveIntegerWidget",
            contains = c("Widget", "NonpositiveInteger"))

setClass("NonnegativeIntegerWidget",
            contains = c("Widget", "NonnegativeInteger"))

setClass("NumericWithRangeWidget",
            contains = c("Widget", "NumericWithRange"))

setClass("NumericWithMin0Max1Widget",
            contains = c("Widget", "NumericWithMin0Max1"))

setClass("characterWidget",
            contains = c("Widget", "character"))

setClass("logicalWidget",
            contains = c("Widget", "logical"))

setClass("factorWidget",
            contains = c("Widget", "factor"))

setClass("functionWidget",
            contains = c("Widget", "function"))




