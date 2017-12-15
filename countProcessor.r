#If needed
#source("https://bioconductor.org/biocLite.R")
#biocLite("DESeq2")
#source("https://bioconductor.org/biocLite.R")
#library("genefilter")
#source("https://bioconductor.org/biocLite.R")
#library("pheatmap")
#source("https://bioconductor.org/biocLite.R")
#biocLite("IHW")
#install.packages("whateverismissingtypeitinhereandruntoinstall")
#source("https://bioconductor.org/biocLite.R")
#biocLite("tweeDEseq")

library("DESeq2")
library("kdecopula")
library("foreign")
library("ggplot2")
library("MASS")
library("pheatmap")
library( "gplots" )
library( "RColorBrewer" )

#This Creates the table for telling DEseq where to get data and how to identify it. For M-LYR-IN-11
directory <- "$$COUNTS_DIRECTORY$$"
sampleFiles <- grep("$$COUNTS_SUBSET$$",list.files(directory),value=TRUE)
#Looking at the EXCEL, the day when these were done was 2 in March 1 in April and 3 later in March
SampleDay <- c("DayOne", "DayOne", "DayThree", "DayTwo", "DayTwo", "DayTwo")
sampleCondition <- c($$COUNTS_FILES_NAMES_CONDITIONS_CSV$$)
Names <- c($$COUNTS_FILES_NAMES_CSV$$)
sampleTable <- data.frame(sampleName = Names,
                          fileName = sampleFiles,
                          condition = sampleCondition,
                          Batch = SampleDay)
sampleTable
#VIEWTHETABLE


ddsHTseq <- DESeqDataSetFromHTSeqCount( sampleTable = sampleTable,
                                        directory = directory,
                                        design = ~condition) 
colData(ddsHTseq)$condition <- factor(colData(ddsHTseq)$condition,
                                      levels = c($$COUNTS_DISTINCTCONDITIONS_CSV$$))
dds <- DESeq(ddsHTseq)

#This pulls out the main important information (that of the results) and saves it as res
res <- results(dds)

#This saves the res file as a csv file so you can look through it
resdataL <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized=T)), by='row.names',sort=F)
names(resdataL)[1] <- 'gene'
head(resdataL)
write.csv(resdataL, file="$$COUNTS_PROCESSED_OUTPUT$$")

#To take a peak at the data
sum(resdataL$padj < 0.05, na.rm=TRUE )
sum(resdataL$pvalue < 0.05, na.rm=TRUE )


#This is to normalize the data corresponding to library size. The values for defining the sizeFactors need to be figured out in Excel. I find the average of the BAM file read sizes and then what ratio the actual size is to the average.
ddsTestTwo <- dds
sizeFactors(ddsTestTwo) <- c(1.47465219908724,	1.17355589147808,	0.79820200634968,	0.17154769787256,	2.15570202958165,	0.22634021221656)
sizeFactors(ddsTestTwo)
ddsTestTwo <- estimateDispersions(ddsTestTwo)
ddsTestTwo <- nbinomWaldTest(ddsTestTwo)
resTestTwo <- results(ddsTestTwo)

#Saving the cleaned up results
resTesTwoFile <- merge(as.data.frame(resTestTwo), as.data.frame(counts(ddsTestTwo,normalized=T)), by='row.names',sort=F)
names(resTesTwoFile)[1] <- 'gene'
head(resTesTwoFile)
write.csv(resTesTwoFile, file="$$COUNTS_PROCESSED_OUTPUT2$$")

#This plots an MA of the rsults, the ylim may need to be adjusted 
plotMA(resTestTwo, ylim = c(-8,8))

#Just another peak here
sum(resTestTwo$padj < 0.05, na.rm=TRUE )
sum(resTestTwo$pvalue < 0.05, na.rm=TRUE )

#One of the ways to plot a PCA
rld <- rlogTransformation(ddsTestTwo, blind=T)
print(plotPCA(rld, intgroup = c("condition","Batch")))


#First group is to make a Volcano plot for padjusted and LFC values and the second is for pvalue and LFC
with(resTestTwoDFr, plot(log2FoldChange, -log10(padj), pch=20, main="Volcano plot"))
with(subset(resTestTwoDFr, abs(log2FoldChange)>0.6), points(log2FoldChange, -log10(padj), pch=20, col="blue"))
with(subset(resTestTwoDFr, padj<.1 & abs(log2FoldChange)>0.6), points(log2FoldChange, -log10(padj), pch=20, col="orange"))
with(subset(resTestTwoDFr, padj<.05 ), points(log2FoldChange, -log10(padj), pch=20, col="gray"))
with(subset(resTestTwoDFr, padj<.05 & abs(log2FoldChange)>1), points(log2FoldChange, -log10(padj), pch=20, col="red"))


with(resTestTwoDFr, plot(log2FoldChange, -log10(pvalue), pch=20, main="Volcano plot"))
with(subset(resTestTwoDFr, abs(log2FoldChange)>0.6), points(log2FoldChange, -log10(pvalue), pch=20, col="blue"))
with(subset(resTestTwoDFr, pvalue<.1 & abs(log2FoldChange)>0.6), points(log2FoldChange, -log10(pvalue), pch=20, col="orange"))
with(subset(resTestTwoDFr, pvalue<.05 ), points(log2FoldChange, -log10(pvalue), pch=20, col="gray"))
with(subset(resTestTwoDFr, pvalue<.05 & abs(log2FoldChange)>1), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))



#Saving the cleaned up results ONE MORE TIME, but NOT normalizing because for stuff below counts want to be whole numbers :/
NotNormalized <- merge(as.data.frame(resTestTwo), as.data.frame(counts(ddsTestTwo,normalized=F)), by='row.names',sort=F)
write.matrix(NotNormalized, file="$$COUNTS_PROCESSED_OUTPUT3$$", sep="\t")

#A sample qqplot of counts
Numbers <- read.table("$$COUNTS_PROCESSED_OUTPUT3$$", header = T, sep = "\t", check.names = F) 
qqplot(InitialCounts$"$$GROUP_EL1$$",InitialCounts$"$$GROUP_EL2$$", ylab="$$GROUP_EL2$$", xlab="$$GROUP_EL1$$", xlim=c(0,120000), ylim=c(0,120000))


###End###


