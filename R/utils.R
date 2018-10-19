str_eval=function(x) {return(eval(parse(text=x)))}

do_function=function(x, calls){
  sprintf("Call: %s", x)
  do.call(x, calls)
}

yaml_call<- function(x){
  do_function(x[[1]], list(x[[2]]))
}


run_workflow<- function(yml="workflow.yml"){
  c<- read_yaml(yml)
  counter=length(c)

  for(i in 1:counter){
    sprintf("| STEP: %s", c[[i]][[1]])
    yaml_call(c[[i]])
  }
}

