function X = IP2Pin(IP)
    P = readtable('./Profile.csv','HeaderLines',0,'ReadVariableNames',true);
    tbl_IP = table2array(P(:, 2));
    tbl_Pin = table2array(P(:, 2));
    class(tbl_IP)
    n = length(IP)
    X = size(IP)
    for i=1:n
        X(i) = string(table2array(P(tbl_IP == string(IP(i)), 1)));
    end 
end