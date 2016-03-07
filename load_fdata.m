function [d l] = load_fdata(filename)
  fr = fopen(filename);
  filedesc = str2num(fgetl(fr));
  # filedesc is vector of [number_of_examples input_dimension output_dimension]
  for i = 1:filedesc(1)
    d(i, :) = str2num(fgetl(fr));
    l(i, :) = str2num(fgetl(fr));
  endfor
  d = d';
  l = l';
  fclose(fr);
endfunction