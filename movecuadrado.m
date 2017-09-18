figure(1)

x = [0 0 2 0 0]; 

y = [0 0 2 2 0]; 

hRect = plot(x, y, 'k'); % Stores handle to plotted lines 
% drawnow; 

for k = 1:45 % or whatever 

x = x+0.1*k^2; 

y = y+0.1*k; % Rectangle taking off into the sky! 

set(hRect, 'XData', x) 

set(hRect, 'YData', y) 

drawnow; 

pause(0.5) % Important to have a pause of at least 0.05 to not overwhelm the processor and drop plots 

end 