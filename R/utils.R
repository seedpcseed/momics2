str_eval=function(x) {return(eval(parse(text=x)))}

do_function=function(x, calls){
  sprintf("Call: %s", x)
  do.call(x, calls)
}
