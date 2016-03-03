# creates a new trained network
function net = net_train(ifile)
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
  limits = min_max(in_val);
  topology = [2 2 1];
  net = newff(limits, topology, {"tansig", "tansig", "purelin"},
        "trainlm", "learngdm", "mse");
  net = train(net, in_val, out_val);
endfunction