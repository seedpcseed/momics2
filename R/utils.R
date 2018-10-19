library(rlist)

str_eval=function(x) {return(eval(parse(text=x)))}

do_function=function(x, calls){
  sprintf("Call: %s", x)
  calls=make_list(calls)
  do.call(str_eval(x), calls)
}

yaml_call<- function(x){
  do_function(x[[1]], x[[2]])
}

run_workflow<- function(yml="workflow.yml"){
    c<- read_yaml(yml)
    c<- c[[2]]
    counter=length(c)

    for(i in 1:counter){
      sprintf("| STEP: %s", c[[i]][[1]])
      yaml_call(c[[i]])
    }
  }

make_list<-function(str_call){
  df<-df<-data.frame(strsplit(str_call, "--"))
  build_list<- list()
  for(i in 2:nrow(df)){
    call<- unlist(strsplit(as.character(df[i,1]), "="))
    build_list<-list.append(build_list, assign(call[1], trimws(call[2])))
    names(build_list)[length(build_list)]<-call[1]
  }
  return(build_list)
}
