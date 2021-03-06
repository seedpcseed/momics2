#make and read configuration files for biobakery

KNEADDATA_DB_HUMAN="/projects/b1051/References/kneaddata_db_human_genome"
KNEADDATA_DB_16S="/projects/b1051/References/kneaddata_db_ribosomal_rna"
KNEADDATA_DB_MOUSE=""

STRAINPHLAN_DB_MARKERS="/projects/b1051/References/strainphlan_db_markers/"
STRAINPHLAN_DB_REFERENCE="/projects/b1051/References/strainphlan_db_reference/"

TRIMMOMATIC="/projects/b1051/Apps/trimmomatic/Trimmomatic-0.38/trimmomatic-0.38.jar"

METAPHLAN2_DB="/projects/b1051/Apps/metaphlan2/db_v20"

SINGULARITY_IMAGE="/projects/b1051/Apps/nuitrcs-biobakery-master-latest.simg"
SINGULARITY=TRUE
SINGULARITY_B="/projects/b1051/"
THREADS=8

SEQTYPE="fastqp"
FASTQ_MULTX="$HOME/Apps/ea-utils/fastq-multx"
FASTQ_MULTX_VARIABLES="-m 0 "


