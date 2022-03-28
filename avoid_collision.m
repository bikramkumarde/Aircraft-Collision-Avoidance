function [c,x1,y1,h1,x2,y2,h2] = avoid_collision(currX1,currY1,head1,currX2,currY2,head2)
%This function is used by the controllers to check for collision in the
%communication zone and if a collision is possible, then determining an
%alternative route
nextX1 = currX1;    % initializing the variables to determine future aircraft position for 1st aircraft
nextY1 = currY1;
nextX2 = currX2;    % initializing the variables to determine future aircraft position for 2nd aircraft
nextY2 = currY2;
h1 = head1;
h2 = head2;
x1 = currX1;        % initializing the variables for the 1st aircraft
y1 = currY1;
x2 = currX2;        % initializing the variables for the 2nd aircraft
y2 = currY2;
c = 0;              %collision variable
if(h1==1)           % based on the heading, determining the next position of the 1st aircraft
    nextX1 = x1 +1;
elseif(h1==2)
    nextY1 = y1 +1;
elseif(h1==3)
    nextX1 = x1 -1;
elseif(h1==4)
    nextY1 = y1 -1;
end

if(h2==1)           % based on the heading, determining the next position of the 2nd aircraft
    nextX2 = x2 +1;
elseif(h2==2)
    nextY2 = y2 +1;
elseif(h2==3)
    nextX2 = x2 -1;
elseif(h2==4)
    nextY2 = y2 -1;
end

if(((nextX1 == nextX2)&&(nextY1 == nextY2))||((abs(nextX1-nextX2)<=1)&&(nextY1 == nextY2))|| ((abs(nextY1-nextY2)<=1)&&(nextX1 == nextX2)))   %checking whether the next position of both aircraft are the same which indicates a collision in the future
    h1 = h1+1;                  % turning the 1st aircraft anticlockwise by increasing heading value by 1
    h2 = h2+1;                  % turning the 2nd aircraft anticlockwise by increasing heading value by 1
    if(h1>4)                    % setting the heading values of 1st aircraft if they are out of range
        h1 = h1-4;
    end
    if(h2>4)                    % setting the heading values of 2nd aircraft if they are out of range
        h2 = h2 -4;
    end
    
    c =1;                       % setting the collision variable indicating a possible collision
    if(h1==1)                   % turning the 1st aircraft in the new diection according to updated heading values
        x1 = x1 +1;
    elseif(h1==2)               % heading 1 means increasing the x coordinates; heading 2 means increasing y coordinates/ moving in +y direction
        y1 = y1 +1;
    elseif(h1==3)               % heading 3 means decreasing the x coordinates; heading 4 means decreasing y coordinates/ moving in -y direction
        x1 = x1 -1;
    elseif(h1==4)
        y1 = y1 -1;
    end

    if(h2==1)                   % turning the 2nd aircraft in the new diection according to updated heading values
        x2 = x2 +1;
    elseif(h2==2)               % heading 1 means increasing the x coordinates; heading 2 means increasing y coordinates/ moving in +y direction
        y2 = y2 +1;
    elseif(h2==3)               % heading 3 means decreasing the x coordinates; heading 4 means decreasing y coordinates/ moving in -y direction
        x2 = x2 -1;
    elseif(h2==4)
        y2 = y2 -1;
    end
end
end

