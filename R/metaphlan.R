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
  pres_th,
  clade=TRUE,
  biom_output=TRUE,
  THREADS=THREADS
){
  #construct the system call
  INPUT_FOLDER=file.path(getwd(), INPUT_FOLDER)
  q<-sprintf("INPUT_FOLDER= %s", INPUT_FOLDER)
  print(q)
  OUTPUT=file.path(getwd(), OUTPUT)
  q<-sprintf("OUTPUT= %s", OUTPUT)
  print(q)
  if(!dir.exists(OUTPUT)){system(paste0("mkdir ", OUTPUT))}

  q<- sprintf("PATTERN1: %s and PATTERN2: %s", PATTERN1, PATTERN2)
  print(q)

  R1=list.files(INPUT_FOLDER, pattern=PATTERN1, include.dirs=TRUE, full.names = TRUE)
}



merge_metaphlan_tables<- function(
  input_folder,
  profile_string,
  output
){


}
