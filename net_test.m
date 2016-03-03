# read the testing examples from input file and test the output. computes mse
function [retval] = net_test (net, ifile)
  fr = fopen(ifile);
  filedesc = str2num(fgetl(fr));
  # filedesc is vector of [number_of_examples input_dimension output_dimension]
  for i = 1:filedesc(1)
    in_val(i,:) = str2num(fgetl(fr));
    out_val(i,:) = str2num(fgetl(fr));
  endfor
  fclose(fr);
  out_val = out_val';
  in_val = in_val';

endfunction
