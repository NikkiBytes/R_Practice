# https://www.kaggle.com/rzsquirrel/knn-example
library(class)
library(caret)

# load data
proteomes <- as.matrix(read.csv("77_cancer_proteomes_CPTAC_itraq.csv", 
                                header=FALSE))
study <- read.csv("clinical_data_breast_cancer.csv")
pam50 <- read.csv("PAM50_proteins.csv")

# note that the patients (observations) are along the cols 
# and not the rows

# remove columns that we won't use
proteomes <- proteomes[, -c(2,3,(ncol(proteomes)-2):ncol(proteomes))]

# set row names
rownames(proteomes) <- proteomes[,1]
proteomes <- proteomes[,-1]

# reformat TCGA (patient) id's
proteomes[1,] <- substr(proteomes[1,],1,7) # Exclude first and last 3
study$Complete.TCGA.ID <- substr(study$Complete.TCGA.ID,6,12)
# set col names
colnames(proteomes) <- proteomes[1,]
proteomes <-  proteomes[1,]

# add tumor type from study to proteomes matrix 
proteomes <- rbind(as.character(study$Tumor[match(colnames(proteomes), study$Complete.TCGA.ID)]),
                   proteomes)
#dim(proteomes)
