Expression Weighted Celltype Enrichment with *EWCE*
================
Alan Murphy and Nathan Skene
2021-06-17

<!-- Readme.md is generated from Readme.Rmd. Please edit that file -->

<!-- badges: start -->

[![Build
Status](https://travis-ci.org/NathanSkene/EWCE.svg?branch=master)](https://travis-ci.org/NathanSkene/EWCE)
<!-- badges: end -->

# Note

This repository for *EWCE* is now deprecated. Please install EWCE from
Bioconductor (3.13, R 4.1). See
[NathanSkene/EWCE](https://github.com/NathanSkene/EWCE) for the new
repository and further information. One thing to note is that all
functions which previously used dot ‘.’ notations to separate words have
been updated to underscores ’\_’ (e.g, `bootstrap.enrichment.test()` is
now `bootstrap_enrichment_test()`). The package [vignette
website](https://nathanskene.github.io/EWCE/articles/EWCE.html) has been
updated to this new version of EWCE and gives further details.

# Introduction

The *EWCE* package is designed to facilitate expression weighted
celltype enrichment analysis as described in our Frontiers in
Neuroscience paper.<sup>1</sup>

The package was originally designed to work with the single cell
cortical transcriptome data from the Linnarsson lab<sup>2</sup> which is
available at <http://linnarssonlab.org/cortex/>. Using this package it
is possible to read in any single cell transcriptome data, provided that
you have a cell by gene expression matrix (with each cell as a seperate
column) and a seperate annotation dataframe, with a row for each cell.

The *EWCE* process involves testing for whether the genes in a target
list have higher levels of expression in a given cell type than can
reasonably be expected by chance. The probability distribution for this
is estimated by randomly generating gene lists of equal length from a
set of background genes.

The *EWCE* method can be applied to any gene list. In the paper we
reported it’s application to genetic and transcriptomic datasets, and in
this vignette we detail how this can be done.

Note that throughout this vignette we use the terms ‘cell type’ and
‘sub-cell type’ to refer to two levels of annotation of what a cell
type is. This is described in further detail in our paper<sup>1</sup>,
but relates to the two levels of annotation provided in the Linnarsson
dataset<sup>2</sup>. In this dataset a cell is described as having a
cell type (i.e. ‘Interneuron’) and subcell type (i.e. ‘Int11’ a.k.a
Interneuron type 11).

# Overview

The process for using *EWCE* essentially involves three steps.

First, one needs to load the relevant single cell transcriptome dataset.
Single cell transcriptome data is read in from a text file using the
`read_celltype_data`.

The user then obtains a gene set and a suitable background gene set. As
the choice of gene sets is up to the user we do not provide functions
for doing this. Appropriate choice of background set is discussed in the
associated publication.

Bootstrapping is then performed using the `bootstrap.enrichment.test`
function.

# Installing EWCE

The *EWCE* package is available from github. There is a version of EWCE
available in the Bioconductor archives but it is depreciated and should
not be used. A separate repository of EWCE is currently being added to
Bioconductor and should be available there from May 2021. In the
interim, use the neurogenomics/EWCE repository. To be able to install
the package one needs first to install R then run the following lines of
code:

    if (!require("devtools")) {
      install.packages("devtools")
    }
    devtools::install_github("neurogenomics/EWCE")

You can then load the package:

``` r
library(EWCE)
```

# Using with docker

Images with the latest version of EWCE are regularly pushed to
Dockerhub. If you already have docker installed you can load up a
working copy using the following commands. Note, that you will need to
replace the initial directory path with a location on your computer that
you wish to be able to access from within the docker image.

    docker pull nathanskene/ewce
    docker run --name=ewce -e PASSWORD=ewcedocker -p 8790:8790 -d -v /User/$USER:/var/ewce nathanskene/ewce:latest
    docker exec -ti ewce R

# Getting started

See the [vignette
website](https://nathanskene.github.io/EWCE/articles/EWCE.html) for
up-to-date instructions on usage.

If you have any problems please do file an issue here on github.

# Citation

If you use the EWCE package as well then please cite

[Skene, et al. Identification of Vulnerable Cell Types in Major Brain
Disorders Using Single Cell Transcriptomes and Expression Weighted Cell
Type Enrichment. Front. Neurosci,
2016.](https://www.frontiersin.org/articles/10.3389/fnins.2016.00016/full)

If you use the cortex/hippocampus single cell data associated with this
package then please cite the following papers:

[Zeisel, et al. Cell types in the mouse cortex and hippocampus revealed
by single-cell RNA-seq. Science,
2015.](http://www.sciencemag.org/content/early/2015/02/18/science.aaa1934.abstract)

# References

<div id="refs" class="references">

<div id="ref-skene_2016">

1\. Skene, N. & Grant, S. Identification of vulnerable cell types in
major brain disorders using single cell transcriptomes and expression
weighted cell type enrichment. *Frontiers in Neuroscience* (2016).
doi:[10.3389/fnins.2016.00016](https://doi.org/10.3389/fnins.2016.00016)

</div>

<div id="ref-zeisel2015cell">

2\. Zeisel, A. *et al.* Cell types in the mouse cortex and hippocampus
revealed by single-cell rna-seq. *Science* **347,** 1138–1142 (2015).

</div>

</div>
