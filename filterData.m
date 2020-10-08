%-------------------------------------------------------------------------
%Objective: Calculate Rolling Average of Data
%Input: Unix Timestamp
%Output: Equivalent Datetime
%-------------------------------------------------------------------------


function Y_filter = filterData(Y)
    n = length(Y);
    Y_filter = zeros(size(Y));
    for i=1:n
        if(i > 3)
            Y_filter(i) = 1 / 4 * Y(i)...
                + 1 / 4 * Y(i - 1) ...
                + 1 / 4 * Y(i - 2) ...
                + 1 / 4 * Y(i - 3);
        else
            Y_filter(i) = Y(i);
        end
    end
end