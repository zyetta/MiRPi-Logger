function [A1, A2, A3, A4, A5, A6, A7, A8, NAME] = DeviceSeparate(tbl, K)
    X = table2array(tbl(:, 1));
    Y = table2array(tbl(:, 3));


    i = 1;
    try
        Y1 = Y(tbl.Device == Conv(K(i), tbl.Device), :);
        X1 = X(tbl.Device == Conv(K(i), tbl.Device), :);  
    catch
        Y1 = -1;
        X1 = -1;
    end
    i = i + 1;
    try
        Y2 = Y(tbl.Device == Conv(K(i), tbl.Device), :);     
        X2 = X(tbl.Device == Conv(K(i), tbl.Device), :);  
    catch
        Y2 = -1;
        X2 = -1;
    end
    i = i + 1;
    try
        Y3 = Y(tbl.Device == Conv(K(i), tbl.Device), :);     
        X3 = X(tbl.Device == Conv(K(i), tbl.Device), :);    
    catch
        Y3 = -1;
        X3 = -1;
    end
    i = i + 1;
    try
        Y4 = Y(tbl.Device == Conv(K(i), tbl.Device), :);     
        X4 = X(tbl.Device == Conv(K(i), tbl.Device), :);     
    catch
        Y4 = -1;
        X4 = -1;
    end
    i = i + 1;
    try
        Y5 = Y(tbl.Device == Conv(K(i), tbl.Device), :);     
        X5 = X(tbl.Device == Conv(K(i), tbl.Device), :);
        X5 = unix2dt(X5);     
    catch
        Y5 = -1;
        X5 = -1;
    end
    i = i + 1;
    try
        Y6 = Y(tbl.Device == Conv(K(i), tbl.Device), :);     
        X6 = X(tbl.Device == Conv(K(i), tbl.Device), :);     
        X6 = unix2dt(X6);
    catch
        Y6 = -1;
        X6 = -1;
    end
    i = i + 1;
    try
        Y7 = Y(tbl.Device == Conv(K(i), tbl.Device), :);     
        X7 = X(tbl.Device == Conv(K(i), tbl.Device), :);     
    catch
        Y7 = -1;
        X7 = -1;
    end
    i = i + 1;
    try
        Y8 = Y(tbl.Device == Conv(K(i), tbl.Device), :);     
        X8 = X(tbl.Device == Conv(K(i), tbl.Device), :);     
    catch
        Y8 = -1;
        X8 = -1;
    end
 
    A1 = [X1, Y1];
    A2 = [X2, Y2];
    A3 = [X3, Y3];
    A4 = [X4, Y4];
    A5 = [X5, Y5];
    A6 = [X6, Y6];
    A7 = [X7, Y7];
    A8 = [X8, Y8];


    function X = Conv(X, row)
        if(isa(row,'double'))
            X = double(X);
        elseif(isa(row,'cell'))
            X = string(X);
        end
    end
end

