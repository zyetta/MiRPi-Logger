%-------------------------------------------------------------------------
%Objective: Convert Unix Timestamp to Datetime Format
%Input: Unix Timestamp
%Output: Equivalent Datetime
%-------------------------------------------------------------------------
function A = unix_conv(X)
    A = datetime( X, 'ConvertFrom', 'posixtime','TimeZone','Africa/Johannesburg');
end

