# read the testing examples from input file and test the output. computes mse
function [retval] = net_test (net, ifile)
  err = 0
  [in_val out_val] = load_fdata(ifile)
  if length(in_val) != length(out_val)
    error("Data length and label lenght differ")
  endif
  for i = 1:length(in_val)
    r = sim(net, in_val(i));
    if (out_val(i) != round(r))
      err++;
    endif
  endfor
  fclose(fr);
  
  printf("%d errors of %d examples: %f %% accuraccy\n", err, filedesc(1),
    (1 - (err / filedesc(1))) * 100);

endfunction