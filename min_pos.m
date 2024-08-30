function [min , pos]=min_pos(v)

%finds the minimum in a vector and its position
%v -> vector
%min -> minimum value
%pos -> position of the minimum

min=v(1);
pos=1;
for i=2:length(v)
    if min>v(i)
        min=v(i);
        pos=i;
    end
end
