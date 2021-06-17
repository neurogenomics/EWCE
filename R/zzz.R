.onLoad <- function(libname, pkgname){
    #print deprecation warning
    msg <-paste0("DEPRECATION NOTICE:\nThis version of the EWCE package is now",
                 " deprecated. Please install EWCE from Bioconductor (3.13) ",
                 "with\nR >= 4.1. See the new repository for more information ",
                 "(https://github.com/NathanSkene/EWCE).One thing \nto note ",
                 "is that all functions which previously used dot '.' notation",
                 "s to separate words have been updated\nto underscores '_' ", 
                 "(e.g, `bootstrap.enrichment.test()` is now ",
                 "`bootstrap_enrichment_test()`). The package\nvignette websit",
                 "e (https://nathanskene.github.io/EWCE/articles/EWCE.html) ",
                 "has been updated to this new\nversion of EWCE and gives ",
                 "further details.")
    message(msg)
}