#
#
#
#
#scripts for metaphlan2


metaphlan<- function(
  INPUT_FOLDER,
  OUTPUT,
  PATTERN="R1_kneaddata.fastq",
  input_type="fastq",
  METAPHLAN2_DB=METAPHLAN2_DB,
  tax_lev=7,
  ignore_eukaryotes=FALSE,
  ignore_bacteria=FALSE,
  ignore_archaea=FALSE,
  ignore_viruses=FALSE,
  clade=TRUE,
  biom_output=TRUE,
  THREADS=THREADS,
  MERGE=TRUE
){
  #construct the system call
  INPUT_FOLDER=file.path(getwd(), INPUT_FOLDER)
  q<-sprintf("INPUT_FOLDER= %s", INPUT_FOLDER)
  print(q)
  OUTPUT=file.path(getwd(), OUTPUT)
  q<-sprintf("OUTPUT= %s", OUTPUT)
  print(q)
  if(!dir.exists(OUTPUT)){system(paste0("mkdir ", OUTPUT))}

  q<- sprintf("PATTERN: %s", PATTERN)
  print(q)

  R1=list.files(INPUT_FOLDER, pattern=PATTERN1, include.dirs=TRUE, full.names = TRUE)

  for(i in R1){
    first_split<- strsplit(as.character(i), "/")
    seq_name<- strsplit(as.character(first_split[[1]])[length(first[[1]])], ".",
                        fixed=TRUE)[[1]][[1]]

    output_file<- file.path(OUTPUT, paste0(seq_name, ".tax_level_", tax_lev,
                                           ".metaphlan.txt"))
    code=paste0("metaphlan2.py ",
                i,
                " --nproc ", THREADS,
                " --input_type ", input_type,
                " --bowtie2db ", METAPHLAN2_DB,
                " --tax_lev ", tax_lev,
                " --ignore_eukaryotes ", ignore_eukaryotes,
                " --ignore_bacteria ", ignore_bacteria,
                " --ignore_viruses", ignore_viruses,
                " --ignore_archea", ignore_archaea,
                " --clade ", clade,
                " --biom ", biom_output,
                " > ", output_file)
    if(SINGULARITY){
      code=paste0("singularity exec -B ", SINGULARITY_B, " ", SINGULARITY_IMAGE, " ", code)
    }
    q<-sprintf("Code: %s", code)
    print(q)
    system(code)
  }
}


merge_metaphlan_tables<- function(
  INPUT_FOLDER,
  PATTERN,
  OUTPUT
){


}
