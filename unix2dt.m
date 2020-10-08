%-------------------------------------------------------------------------
%Objective: Convert Unix Timestamp to Datetime Format
%Input: Unix Timestamp
%Output: Equivalent Datetime
%-------------------------------------------------------------------------
function A = unix2dt(X)
    if(X)
        try
            A = datetime( X, 'ConvertFrom', 'posixtime','TimeZone','Africa/Johannesburg');
        catch
            A = -1
        end
    end
end

