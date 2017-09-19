clear all; close all; clc

%  Bird (rectangle).
% Position.
xr = 30;  yr = 50;
xr2 = 26; yr2 = 52;
xr3 = 30; yr3 = 60;

% Length of rectangle edges.
deltaxr = 10; deltayr = 10;
deltaxr2 = 5; deltayr2 = 5;
deltaxr3 = 5; deltayr3 = 5;

for k = 1:9

% Vector for rectangle object.
vr = [xr, yr, deltaxr, deltayr];
vr2 = [xr2, yr2, deltaxr2, deltayr2];
vr3 = [xr3, yr3, deltaxr3, deltayr3];

% Draw objects.
re1 = rectangle('Position',vr,'LineWidth',1);
re2 = rectangle('Position',vr2,'LineWidth',1,'EdgeColor','g');
re3 = rectangle('Position',vr3,'LineWidth',1,'EdgeColor','b');

area2 = bboxOverlapRatio(vr,vr2);
area3 = bboxOverlapRatio(vr,vr3);

% if area > 0 
% %     Stop the game and display GAME OVER.
%     text(xr,yr,'GAME OVER','Color','b','FontSize', 20);
% end
if area > 0 
%     Stop the game and display GAME OVER.
    text(xr,yr,'GAME OVER','Color','g','FontSize', 20);
end



pause(0.5)

rx = randi(80); 
 xr = xr+2;  
yr = yr+6;  
end

