function [safe] = safety_check(currX1,currY1,head1,currX2,currY2,head2)
%This is a safety monitor function
%This function is used to check whether there is an occurence of collision when the two planes are in motion
if((abs(currX1-currX2)<=0.5)&&(abs(currY1-currY2)<=0.5)&&(head1~=0)&&(head2~=0)) %checking if the location of the aircraft are closer than the distance allowed/ closer than 1 grid length
    safe = 1;   % safe = 1 indicates that collision has occured
else
    safe = 0;  % safe = 0 means no collision
end
end

