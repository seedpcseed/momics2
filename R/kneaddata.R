#kneaddata scripts
#
#
#required are:
# kneaddata_database --download human_genome bowtie2 $DIR
# kneaddata_database --download ribosomal_RNA bowtie2 $DIR
#
# trimmomatic
# bowtie2
#
# may be required are:
# kneaddata_database --download human_transcriptome bowtie2 $DIR
# kneaddata_database --download mouse_C57BL bowtie2 $DIR
#
#
# reference sequences need to be indexed (the downloads are for bowtie2)
#
#

kneadData_single<- function(
  INPUT_FOLDER,
  REFERENCE_DB=KNEADDATA_DB_HUMAN,
  OUTPUT="kneaddata"
){
  OUTPUT=file.path(getwd(), OUTPUT)
  if(!dir.exists(OUTPUT)){sys.call("mkdir ", OUTPUT)}
  for(i in list.files(INPUT_FOLDER)){
    code=paste0("kneaddata --input ", i, " --reference-db ",
                REFERENCE_DB, " --output ", OUTPUT)
    if(SINGULARITY){
      code=paste0("singularity exec -B", SINGULARITY_B, " ", SINGULARITY_IMAGE, " ", code)
    }
    sys.call(code)
  }
}

kneadData_paired<-function(){

}

kneadData_cat<-function(
  INPUT_FOLDERS,
  OUTPUT_FOLDER
){  #for nextseq where the files are all split apart

}

kneadData_gather<- function(){ #where the sequencing files are separated in different folders

}
