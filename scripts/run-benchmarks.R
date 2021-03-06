methods = list(
  MAGeCK = run.mageck,
  edgeR = run.edgeR,
  sgRSEA = run.sgRSEA,
  PBNPA = run.PBNPA,
  ScreenBEAM = run.ScreenBEAM,
  CC2= run.CC2py,
  DESeq2 = run.DESeq2
)

for(d in names(dataset)) {
  df.dat <- dataset[[d]][,-1]
  cache.dir <- file.path("/Users/hwan/Sandbox/CC2Sim/cache/nature-biotech", d )
  dir.create(cache.dir, showWarnings = T, recursive = T, mode = "0777")
  run(df.dat, methods, cache.dir)
}
