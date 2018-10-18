str_eval=function(x) {return(eval(parse(text=x)))}

do_function=function(x, calls){
  sprintf("Call: %s", x)
  do.call(x, calls)
}

yaml_call<- function(x){
  do_function(str_eval(x[1]), list(x[2]))
}

