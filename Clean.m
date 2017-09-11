clear all; close all; clc
objects = imaqfind %find video input objects in memory
delete(objects) %delete a video input object from memory

vid=videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');


vid.FrameGrabInterval = 1;
set(vid,'FramesPerTrigger',Inf);
start(vid);
%preview(vid);

while(vid.FramesAcquired <= 10000)
    
    set(vid,'ReturnedColorSpace','rgb');
    cdt = getsnapshot(vid);
    cdt2 = flip(cdt,2);
%     [BW,maskedRGBImage] = createMask(cdt2)
    
    imshow(cdt2);
    
%     s  = regionprops(BW, {'centroid','area'});
    
%     if isempty(s)
%         error('No ball found!');
%     else
%         [~, id] = max([s.Area]);
%   
%         %----------------SHOW GAME BALL
%         % Length of rectangle edges.
%         deltaxr = 10; deltayr = 10;
%         x = s(id).Centroid(1) - 5; y = s(id).Centroid(2) - 5;
%         
%         % Vector for rectangle object.
%         vr = [x, y, deltaxr, deltayr];
%         
%         % Bird polyline.
%         a = [x, y]; b = [x + deltaxr, y]; c = [x + deltaxr, y + deltayr]; d = [x, y + deltayr];
%         r = [a; b; c; d];
%         
%         % Draw objects.
%         r1 = rectangle('Position',vr,'EdgeColor','r','LineWidth',2);
%     end

         
         
  
end




