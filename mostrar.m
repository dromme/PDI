clear all; close all; clc
objects = imaqfind %find video input objects in memory
delete(objects) %delete a video input object from memory

vid=videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');

% Set parameters for video
% Acquire only one frame each time
set(vid,'FramesPerTrigger',5);
% Go on forever until stopped
set(vid,'TriggerRepeat',Inf);

% vid.FrameGrabInterval = 1;
% set(vid,'FramesPerTrigger',Inf);
start(vid);

%preview(vid);
%Inicializar las posiciones de los bloques
 x2=20;y2=20;
while(vid.FramesAcquired <= 10000)
    
    
    cdt0 = getsnapshot(vid);
    cdt = flip(cdt0,2);
    [fil,col,cap]=size(cdt);
    cdt2 = cdt;
    r = cdt(:,:,1);
    g = cdt(:,:,2);
    b = cdt(:,:,3);
    justBlue = b - r/2 - g/2;
    bw = justBlue > 33;
    cdt = bwareaopen(bw, 20);
    
    imshow(cdt2);impixelinfo
    
    
    s  = regionprops(bw, {'centroid','area'});
    if isempty(s)
        
    else
            %id = find([s.Area] > 1000 & [s.Area] < 100000 );
            [~, id] = max([s.Area]);  % Quiero que siga los objetos más de taltal y el
            hold on
            %plot(s(id).Centroid(1),s(id).Centroid(2),'wp','MarkerSize',20,'MarkerFaceColor','r');
           
            x = s(id).Centroid(1) - 5;
            y = s(id).Centroid(2) - 5;
            po = [x, y, 13, 13];
            r1 = rectangle('Position',po,'EdgeColor','r','LineWidth',2);
            
            
        %disp(['Center location is (',num2str(s(id).Centroid(1),4),', ',num2str(s(id).Centroid(2),4),')'])
    end
    
    
    %%Aquí van los bloques
   
    po2 = [x2, y2, 120, 60];
    r2 = rectangle('Position',po2,'EdgeColor','b','LineWidth',2,'FaceColor','b');
    
%     hRect = plot(x, y, '-k'); % Stores handle to plotted lines
    
    hold off
    if y2>480
        y2=0;
    else
        y2=y2+20;
    end
    
    
end





