crispr.link <- "http://www.nature.com/nbt/journal/v34/n6/extref/nbt.3536-S3.xlsx"
crispri.link <- "http://www.nature.com/nbt/journal/v34/n6/extref/nbt.3536-S4.xlsx"

fetch_file <- function(link) {
  require(readxl)
  tmp <- tempfile()
  download.file(link, tmp)
  read_xlsx(tmp)
}
df.crispr <-fetch_file(crispr.link)
df.crispri <-fetch_file(crispri.link)

crispr.RT112 <- select(df.crispr, 2, 3, 1, 4, 5:7, 8:10)
crispr.UMUC3 <- select(df.crispr, 2, 3, 1, 4, 17:22)

crispr.RT112 %>% group_by(Gene) %>% summarise(mean=mean(Essential))
crispri.RT112 <- select(df.crispri, 2, 3, 1, 4, 8:10, 11:13)


dataset <- list("CRISPR.RT112"= crispr.RT112,
                "CRISPR.UMUC3" = crispr.UMUC3,
                "CRISPRi.RT112" = crispri.RT112)

for(d in names(dataset)) {
  colnames(dataset[[d]]) <- c("X", "gene", "sgRNA", "class", "B1", "B2", "B3", "A1", "A2", "A3")
}
save(dataset, file="inst/extdata/nature-biotech.Rdata")
