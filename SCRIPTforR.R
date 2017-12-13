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
directory <- "/Path/To/The/Directory/Where/The/Counts/Are"
sampleFiles <- grep("M-LYR-IN-11-CONandDROUGHT",list.files(directory),value=TRUE)
#Looking at the EXCEL, the day when these were done was 2 in March 1 in April and 3 later in March
SampleDay <- c("DayOne", "DayOne", "DayThree", "DayTwo", "DayTwo", "DayTwo")
sampleCondition <- c("CON", "CON", "CON", "DROUGHT", "DROUGHT", "DROUGHT")
Names <- c("M-LYR-IN-11-CON-1", "M-LYR-IN-11-CON-2", "M-LYR-IN-11-CON-3", "M-LYR-IN-11-DROUGHT-1", "M-LYR-IN-11-DROUGHT-2", "M-LYR-IN-11-DROUGHT-3")
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
                                      levels = c('CON','DROUGHT'))
dds <- DESeq(ddsHTseq)

#This pulls out the main important information (that of the results) and saves it as res
res <- results(dds)

#This saves the res file as a csv file so you can look through it
resdataL <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized=T)), by='row.names',sort=F)
names(resdataL)[1] <- 'gene'
head(resdataL)
write.csv(resdataL, file="M-LYR-IN-11-ControlAndDrought.csv")

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
write.csv(resTesTwoFile, file="M-LYR-IN-11-ControlAndDrought-NormAndScaled.csv")

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
write.matrix(NotNormalized, file="M-LYR-IN-11-ControlAndDrought-NormAndScaled-NORnormalized.txt", sep="\t")

#A sample qqplot of counts
Numbers <- read.table("/Path/To/Where/Your/Directory/Is/MaybeNotNeeded/ImaNoobDunno/M-LYR-IN-11-ControlAndDrought-NormAndScaled-NORnormalized.txt", header = T, sep = "\t", check.names = F) 
qqplot(InitialCounts$"M-LYR-IN-11-CON-1",InitialCounts$"M-LYR-IN-11-CON-2", ylab="M-LYR-IN-11-CON2", xlab="M-LYR-IN-11-CON1", xlim=c(0,120000), ylim=c(0,120000))











###End###

######The Rest are musings and some of the ways to some things but they are not completely figured out here and not super necessary, but may be useful if you're curious... TweeDESeq was something I was trying out, didn't completely figure out, but realized I didn't really need
library("tweeDEseq")

resultsfile1 <- read.table("/Volumes/Deal-5TB/SUBEXP-ATAC/Medicago/Unscaled-DEseq/UNPAIRED/MT-ATAC-Nonunique-resTestTwo-RoundedUp.txt", header = T, sep = "\t", check.names = F) 
compareCountDist(resultsfile1$"MT-CON-1" , plot=TRUE, xlim=c(0,2000))



DIST <- read.table("/Volumes/Deal-5TB/SUBEXP-ATAC/Medicago/Unscaled-DEseq/UNPAIRED/UpInSUB-unpaired-padj/UpInSUB-unpaired-padj.tss.bed", header = T, sep = "\t", check.names = F) 
hist(DIST$Distance, breaks=3000, freq=NULL, xlim=c(-5000,5000), main = paste("Distance To Nearest TSS"), xlab = "bp")
hist(DIST$PeakEnd-DIST$PeakStart, breaks=3000, freq=NULL, xlim=c(100,1200), main = paste("UpInSUB THS Size"), xlab = "bp")

GEN <- read.table("/Volumes/Deal-5TB/SUBEXP-ATAC/Medicago/Unscaled-DEseq/UNPAIRED/UpInSUB-unpaired-padj/GenomeDistrib.txt", header = T, sep = "\t", check.names = F) 
hist(GEN$Chromosome, breaks=38, freq=NULL, col="blue", xlim=c(0,8), main = paste("UpInSUB THS Chromosome Distribution"), xlab = "Chromosome")

CHROMS <- read.table("/Users/markobajic/Desktop/RICE-DEseq/CHROMS.txt", header = T, sep = "\t", check.names = F) 
hist(CHROMS$Chromosome, col="blue", breaks=60, freq=NULL, xlim=c(0,13), main = paste("THSs Per Chromosome"), xlab = "Chromosome")

THSsizeAndDistToTSS <- read.table("/Users/markobajic/Desktop/RICE-DEseq/THSsizeAndDistToTSS.txt", header = T, sep = "\t", check.names = F) 
hist(THSsizeAndDistToTSS$THSsize, breaks=600000, freq=NULL, xlim=c(100,500), main = paste("THSs Size"), xlab = "bp")
hist(THSsizeAndDistToTSS$DistanceToTSS, breaks=600000, freq=NULL, xlim=c(-5000,5000), main = paste("Distance To Nearest TSS"), xlab = "bp")

hist(resultsfile1$"MT-CON-1", breaks=90000, freq=NULL, xlim=c(0,200), main = paste("Histogram of MTCON1 counts"), xlab = "counts")
hist(resultsfile1$"MT-CON-2", breaks=90000, freq=NULL, xlim=c(0,200), main = paste("Histogram of MTCON2 counts"), xlab = "counts")
hist(resultsfile1$"MT-CON-3", breaks=90000, freq=NULL, xlim=c(0,200), main = paste("Histogram of MTCON3 counts"), xlab = "counts")
hist(resultsfile1$"MT-SUB-1", breaks=90000, freq=NULL, xlim=c(0,200), main = paste("Histogram of MTSUB1 counts"), xlab = "counts")
hist(resultsfile1$"MT-SUB-2", breaks=90000, freq=NULL, xlim=c(0,200), main = paste("Histogram of MTSUB2 counts"), xlab = "counts")
hist(resultsfile1$"MT-SUB-3", breaks=90000, freq=NULL, xlim=c(0,200), main = paste("Histogram of MTSUB3 counts"), xlab = "counts")

qqplot(resultsfile1$"MT-CON-1",resultsfile1$"MT-CON-2", ylab="CON2", xlab="CON1", xlim=c(0,120000), ylim=c(0,120000))
qqplot(resultsfile1$"MT-CON-1",resultsfile1$"MT-CON-3", ylab="CON3", xlab="CON1", xlim=c(0,120000), ylim=c(0,120000))
qqplot(resultsfile1$"MT-CON-2",resultsfile1$"MT-CON-3", ylab="CON3", xlab="CON2", xlim=c(0,120000), ylim=c(0,120000))
qqplot(resultsfile1$"MT-CON-1",resultsfile1$"MT-SUB-1", ylab="SUB1", xlab="CON1", xlim=c(0,120000), ylim=c(0,120000))
qqplot(resultsfile1$"MT-CON-2",resultsfile1$"MT-SUB-2", ylab="SUB2", xlab="CON2", xlim=c(0,120000), ylim=c(0,120000))
qqplot(resultsfile1$"MT-CON-3",resultsfile1$"MT-SUB-3", ylab="SUB3", xlab="CON3", xlim=c(0,120000), ylim=c(0,120000))
qqplot(resultsfile1$"MT-SUB-1",resultsfile1$"MT-SUB-2", ylab="SUB2", xlab="SUB1", xlim=c(0,120000), ylim=c(0,120000))
qqplot(resultsfile1$"MT-SUB-1",resultsfile1$"MT-SUB-3", ylab="SUB3", xlab="SUB1", xlim=c(0,120000), ylim=c(0,120000))
qqplot(resultsfile1$"MT-SUB-2",resultsfile1$"MT-SUB-3", ylab="SUB3", xlab="SUB2", xlim=c(0,120000), ylim=c(0,120000))

qqplot(resultsfile1$CONavg, resultsfile1$SUBvg, ylab="SUBavg", xlab="CONavg")

InitialCounts <- read.table("/Volumes/Deal-5TB/SUBEXP-ATAC/Medicago/Unscaled-DEseq/UNPAIRED/MT-ATAC-Unpaired-InitialCOUNTS.txt", header = T, sep = "\t", check.names = F) 
compareCountDist(InitialCounts$"MT-CON-1" , plot=TRUE, xlim=c(0,2000))

qqplot(InitialCounts$"MT-CON-1",InitialCounts$"MT-CON-2", ylab="CON2", xlab="CON1", xlim=c(0,120000), ylim=c(0,120000))
qqplot(InitialCounts$"MT-CON-1",InitialCounts$"MT-CON-3", ylab="CON3", xlab="CON1", xlim=c(0,120000), ylim=c(0,120000))
qqplot(InitialCounts$"MT-CON-2",InitialCounts$"MT-CON-3", ylab="CON3", xlab="CON2", xlim=c(0,120000), ylim=c(0,120000))
qqplot(InitialCounts$"MT-CON-1",InitialCounts$"MT-SUB-1", ylab="SUB1", xlab="CON1", xlim=c(0,120000), ylim=c(0,120000))
qqplot(InitialCounts$"MT-CON-2",InitialCounts$"MT-SUB-2", ylab="SUB2", xlab="CON2", xlim=c(0,120000), ylim=c(0,120000))
qqplot(InitialCounts$"MT-CON-3",InitialCounts$"MT-SUB-3", ylab="SUB3", xlab="CON3", xlim=c(0,120000), ylim=c(0,120000))
qqplot(InitialCounts$"MT-SUB-1",InitialCounts$"MT-SUB-2", ylab="SUB2", xlab="SUB1", xlim=c(0,120000), ylim=c(0,120000))
qqplot(InitialCounts$"MT-SUB-1",InitialCounts$"MT-SUB-3", ylab="SUB3", xlab="SUB1", xlim=c(0,120000), ylim=c(0,120000))
qqplot(InitialCounts$"MT-SUB-2",InitialCounts$"MT-SUB-3", ylab="SUB3", xlab="SUB2", xlim=c(0,120000), ylim=c(0,120000))

qqplot(InitialCounts$CONavg, InitialCounts$SUBvg, ylab="SUBavg", xlab="CONavg")









OSUpandDownResults <- read.table("/Users/markobajic/Desktop/RICE-DEseq/OS-UpandDownResults.txt", header = T, sep = "\t", check.names = F) 
hist(OSUpandDownResults$UpInSUBDistToNearestTSS , breaks=4000, freq=NULL, xlim=c(-5000,5000), main = paste("UpInSUB Distance To Nearest TSS"), xlab = "bp")
hist(OSUpandDownResults$DownInSUBDistToNearestTSS , breaks=4000, freq=NULL, xlim=c(-5000,5000), main = paste("DownInSUB Distance To Nearest TSS"), xlab = "bp")
hist(OSUpandDownResults$UpInSUBTHSsize , breaks=600000, freq=NULL, xlim=c(100,500), main = paste("UpInSUB THS Size"), xlab = "bp")
hist(OSUpandDownResults$DownInSUBTHSsize , breaks=600000, freq=NULL, xlim=c(100,500), main = paste("DownInSUB THS Size"), xlab = "bp")

hist(CountsResultsAllFiles$ATCON3, breaks=6000000, freq=NULL, xlim=c(0,200), main = paste("Histogram of ATCON3 counts"), xlab = "counts")
hist(CountsResultsAllFiles$ATSUB3, breaks=6000000, freq=NULL, xlim=c(0,200), main = paste("Histogram of ATSUB3 counts"), xlab = "counts")
hist(CountsResultsAllFiles$ATCON4, breaks=6000000, freq=NULL, xlim=c(0,200), main = paste("Histogram of ATCON4 counts"), xlab = "counts")
hist(CountsResultsAllFiles$ATSUB4, breaks=6000000, freq=NULL, xlim=c(0,200), main = paste("Histogram of ATSUB4 counts"), xlab = "counts")














