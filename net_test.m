# read the testing examples from input file and test the output. computes mse
function [retval] = net_test (net, ifile)
  fr = fopen(ifile);
  filedesc = str2num(fgetl(fr));
  # filedesc is vector of [number_of_examples input_dimension output_dimension]
  err = 0
  for i = 1:filedesc(1)
    in_val = str2num(fgetl(fr));
    out_val = str2num(fgetl(fr));
    r = sim(net, in_val');
    if (out_val != round(r))
      err++;
    endif
  endfor
  fclose(fr);
  
  printf("%d errors of %d examples: %f %% accuraccy\n", err, filedesc(1),
    (1 - (err / filedesc(1))) * 100);

endfunction