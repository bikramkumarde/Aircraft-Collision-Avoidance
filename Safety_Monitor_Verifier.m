%Safety Monitor Testing
%This code is kept to verify whether the safety monitor works perfectly or
%not. In the existing complete controller, there was no case of collision
%with the collision avoidance algorithm being used. This code is a simple
%traversal code and with collsion coordinates, it would show that the
%safety monitor prints the error message.
%Head-on collision coordinates
%[-10 4 10 4]
%[12 4 -12 4]
%Perpendicular collision coordiinates
%[-10 10 10 10]
%[8 -8 8 12]
%No collision
%[-10 10 10 10]
%[8 -8 8 8]


prompt1 = 'Enter source and destination of 1st aircraft: \nFormat [SourceX SourceY DestinationX DestinationY]\nLimits +-15\n';
inp1 = input(prompt1);      %Take aircraft source and destination of 1st aircraft as user input
srcX1 = inp1(1);            %Parse the inputs
srcY1 = inp1(2);            %x and y coordinates of the source/start of the 1st aircraft
dstX1 = inp1(3);            %x and y coordinates of the destination of the 1st aircraft
dstY1 = inp1(4);

currX1 = srcX1;             %The current location of the 1st aircraft is initialized to the source of the 1st aircraft
currY1 = srcY1;

prompt2 = 'Enter source and destination of 2nd aircraft: \nFormat [SourceX SourceY DestinationX DestinationY]\nLimits +-15\n';
inp2 = input(prompt2);          %Take aircraft source and destination of 2nd aircraft as user input
srcX2 = inp2(1);                %Parse the inputs
srcY2 = inp2(2);                %x and y coordinates of the source/start of 2nd the aircraft
dstX2 = inp2(3);                %x and y coordinates of the destination of 2nd the aircraft
dstY2 = inp2(4);

currX2 = srcX2;                 %The current location of the 2nd aircraft is initialized to the source of the 2nd aircraft
currY2 = srcY2;

if(currX1<dstX1)            %setting the heading of the 1st aircraft
    head1 = 1;              %Heading values:- 1: +ve X direction
elseif(currY1<dstY1)        %       2: +ve Y direction
    head1 = 2;              %       3: -ve X direction
elseif(currX1>dstX1)        %       4: -ve Y direction
    head1 = 3;              %       0: No movement required
elseif(currY1>dstY1)
    head1 = 4;
else
    head1 = 0;
end

if(currX2<dstX2)             %setting the heading of the 2nd aircraft
    head2 = 1;               %Heading values:- 1: +ve X direction
elseif(currY2<dstY2)         %       2: +ve Y direction
    head2 = 2;               %       3: -ve X direction
elseif(currX2>dstX2)         %       4: -ve Y direction
    head2 = 3;               %       0: No movement required
elseif(currY2>dstY2)
    head2 = 4;
else
    head2 = 0;
end
ax = gca;
while((currX1~=dstX1)||(currX2~=dstX2)||(currY1~=dstY1)||(currY2~=dstY2))       %loop to run until destination is reached/ current location becomes destination for both aircrafts
    [currX1,currY1,head1] = grid_traverse(currX1, currY1, dstX1, dstY1, head1);     %function call to determine next position of 1st aircraft based on current position
    [currX2,currY2,head2] = grid_traverse(currX2, currY2, dstX2, dstY2, head2);     %function call to determine next position of aircraft based on current position
    scatter(srcX1, srcY1, 200, 'green', 's');    %Plotting source aircraft position of 1st aircraft as green hollow square
    hold on;
    scatter(currX1, currY1, 200, 'green', 's', 'filled');   %Plotting the current aircraft postion of 1st aircraft as green square
    hold on;
    scatter(dstX1, dstY1,200,'green', 'h', 'filled');    %Plotting the final destination of the 1st aircraft as green star
    hold on;
    scatter(srcX2, srcY2, 200, 'red', 's');             %Plotting source aircraft position of 2nd aircraft as red square
    hold on;
    scatter(currX2, currY2, 200, 'red', 's', 'filled');   %Plotting the current aircraft postion of 2nd aircraft as red square
    hold on;
    scatter(dstX2, dstY2,200,'red', 'h', 'filled');    %Plotting the final destination of the 2nd aircraft as red star
    hold on;
    axis([-15 15 -15 15], 'manual');
    ax.Box = 'on';
    grid on;
    grid minor;
    ax.MinorGridLineStyle = ':';
    hold off;
    pause(1);                                % pausing for 1 sec so that graph can be visualized as motion of aircraft
    safe = safety_check(currX1,currY1,head1,currX2,currY2,head2);   % checking with safety monitor for possible collision
    if(safe == 1)
        disp('Alert !!!');   % Alert message for collision
        disp('Collision detected !!!');
        break;
    end
end
if(safe == 0)
    disp('Congrats !!!');            % Final message dispalyed after reaching destination if no collision has occurred
    disp('Destination reached successfully!!!');
end