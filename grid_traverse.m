function [x1,y1,h1] = grid_traverse(currX1, currY1, dstX1, dstY1, curr_head1)
%This function is used by the controller to navigate the aircraft from
%source to the destination
x1 = currX1;   %initializing the variables
y1 = currY1;
h1 = curr_head1;
if(currX1<dstX1)  %setting the heading of the aircraft
    target_h = 1;   %Heading values:- 1: +ve X direction
elseif(currY1<dstY1)          %       2: +ve Y direction
    target_h = 2;             %       3: -ve X direction
elseif(currX1>dstX1)          %       4: -ve Y direction
    target_h = 3;             %       0: No movement required
elseif(currY1>dstY1)
    target_h = 4;
else
    target_h = 0;
end

if ((curr_head1 == 1 && target_h == 4) || (curr_head1 == 4 && target_h == 1))   % performing the turn when a change of heading/direction is required
    h1 = target_h;                                                              % setting the heading values when the values are 1 or 4
else
    if(curr_head1< target_h)              % increasing the heading value for an anti clockwise turn by 90 degrees
        h1 = curr_head1 +1;
    elseif(curr_head1 > target_h)
        h1 = curr_head1 -1;                 % decreasing the heading value for a clockwise turn by 90 degrees
    end
end
    
if(target_h ~=0)
    if(h1==1)   % changinng the coordinates of the aircraft / moving the aircraft according to the heading
        x1 = currX1 +1;
    elseif(h1==2)
        y1 = currY1 +1;     % heading 1 means increasing the x coordinates; heading 2 means increasing y coordinates/ moving in +y direction
    elseif (h1==3)
        x1 = currX1 -1;     % heading 3 means decreasing the x coordinates; heading 4 means decreasing y coordinates/ moving in -y direction
    else
        y1 = currY1 -1;
    end
else
    h1 = 0;    % heading 0 indicates no change in coordinates
end
end

