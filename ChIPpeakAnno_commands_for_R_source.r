######## Peak annotation ###########
infiles <- "" ###### PUT PATH TO .BED FILES CONVERTED FOR ANNOTATION HERE - BETWEEN "".#####

out.folder <- "" ###### PUT PATH TO FOLDER WHERE YOU WANT YOUR ANNOTATION FILES TO GO ########

files <- list.files(infiles,full=TRUE)

file.names <- list.files(infiles)

source("https://bioconductor.org/biocLite.R");
biocLite(c("rtracklayer", "ChIPpeakAnno", "GenomicFeatures"));

library("ChIPpeakAnno");
library("GenomicFeatures");
library("rtracklayer");
txdb <- loadDb("~/Downloads/Slycopersicum310.sqlite")
ge <- genes(txdb, columns=c("tx_name", "gene_id", "tx_type"))
for(i in 1:length(files)){
    peaksGR <- import(files[i])
    annotatedPeak <- annotatePeakInBatch(peaksGR, AnnotationData=genes(txdb))
    dfa <- data.frame(as.data.frame(annotatedPeak))
    write.table(dfa,paste(files.names[i],".xls",sep=""),quote=FALSE, sep="\t", col.names = NA)
}

#########################
