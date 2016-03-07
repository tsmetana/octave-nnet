# creates a new trained network
function net = net_train(ifile)
  [in_val out_val] = load_fdata(ifile)
  if length(in_val) != length(out_val)
    error("Data length and label lenght differ")
  endif
  limits = min_max(in_val);
  topology = [2 2 1];
  net = newff(limits, topology, {"tansig", "tansig", "purelin"},
        "trainlm", "learngdm", "mse");
  net = train(net, in_val, out_val);
endfunction