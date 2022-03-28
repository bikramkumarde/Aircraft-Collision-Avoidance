%Simple Controller
%This script is written to show the functioning of a simple controller when
%there is only one aircraft in the airspace. The source is a hollow square
%whereas desrination is a star. Moving aircraft is a solid squrare.
%A sample input is written
%[8 8 -7 -8]
prompt = 'Enter source and destination of aircraft: \nFormat [SourceX SourceY DestinationX DestinationY]\nLimits +-15\n';
inp1 = input(prompt);   %Take aircraft source and destination as user input
srcX1 = inp1(1);  %Parse the inputs
srcY1 = inp1(2);    %x and y coordinates of the source/start of the aircraft
dstX1 = inp1(3);    %x and y coordinates of the destination of the aircraft
dstY1 = inp1(4);

currX1 = srcX1;   %The current location of the aircraft is initialized to the source of the aircraft
currY1 = srcY1;

curr_head1 = 2;  % current heading initialized
ax = gca;
while(currX1 ~= dstX1 || currY1 ~= dstY1)   %loop to run until destination is reached/ current location becomes destination
    [currX1, currY1, curr_head1] = grid_traverse(currX1, currY1, dstX1, dstY1, curr_head1);  %function call to determine next position of aircraft based on current position
    scatter(srcX1, srcY1, 200, 'green', 's');    %Plotting source aircraft position of 1st aircraft as green square
    hold on;
    scatter(currX1, currY1, 200, 'green', 's', 'filled');   %Plotting the current aircraft postion as green square
    hold on;
    scatter(dstX1, dstY1, 200,'green', 'h', 'filled');    %Plotting the final destination of the aircraft as a green star
    axis([-15 15 -15 15], 'manual');
    ax.Box = 'on';
    grid on;
    grid minor;
    ax.MinorGridLineStyle = ':';
    hold off;
    pause(1);           % pausing for 1 sec so that graph can be visualized as motion of aircraft
end    
disp('Destination Reached !!!');     % Final message dispalyed after reaching destination