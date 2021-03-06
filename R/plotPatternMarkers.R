#' plotPatternMarkers
#'
#' @param data <the dataset from which the patterns where generated>
#' @param patternMarkers <the list of genes generated from the patternMarkers function>
#' @param patternPalette <a vector indicating what color should be used for each pattern>
#' @param sampleNames <names of the samples to use for labeling >
#' @param samplePalette < a vector indicating what color should be used for each sample>
#' @export
#' @return heatmap of the \code{data} values for the \code{patternMarkers}
#' @import gplots
#' @seealso \code{\link{gplot}} and  \code{\link{heatmap.2}}
#' @examples \dontrun{
#' plotPatternMarkers(data=p,patternMarkers=PatternMarkers,patternPalette=NA,sampleNames=pd$sample,
#' samplePalette=pd$color,colDenogram=TRUE,heatmapCol="bluered", scale='row')
#'}

plotPatternMarkers <- function(
	data=NA,# the dataset from which the patterns where generated
    patternMarkers=PatternMarkers,# the list of genes generated from the patternMarkers function
    patternPalette=NA,# a vector indicating what color should be used for each pattern
    sampleNames=NA,#names of the samples to use for labeling
    samplePalette=NA,# a vector indicating what color should be used for each sample
    colDenogram=TRUE,# logical indicating whether to
    heatmapCol="bluered",
    scale='row',
    ...){

if(is.na(samplePalette)){samplePalette<-rep("black",dim(data)[2])}

### coloring of genes
patternCols <- rep(NA, length(unique(unlist(patternMarkers))))
names(patternCols) <- unique(unlist(patternMarkers))
for (i in 1:length(patternMarkers)) {
    patternCols[patternMarkers[[i]]] <- patternPalette[i]
}

corr.dist = function(x) as.dist(1-cor(t(x)))
avg = function(x) hclust(x, method="average")

heatmap.2(as.matrix(data[unique(unlist(patternMarkers)),]),
          symkey=F,
          scale=scale,
          col=heatmapCol,
          distfun=corr.dist,
          hclustfun=avg,
          Rowv=F,Colv=colDenogram,trace='none',
          RowSideColors = as.character(patternCols[unique(unlist(patternMarkers))]),
          labCol= sampleNames, labRow="", #unique(unlist(patternMarkers)),
          cexCol=.8,
          ColSideColors = as.character(samplePalette),
          rowsep = cumsum(sapply(patternMarkers,length)))
}
