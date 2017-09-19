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
x1=20;y1=0;
x2=490;y2=0;
%tamanobloques =  DEspues poner a dc2 random entre ciertos numeros, para que los bloques cambien de tamaño
vel=10;

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
        
        % Game Ball.
        x = s(id).Centroid(1) - 5;
        y = s(id).Centroid(2) - 5;
        p = [x, y, 13, 13];
        
        % Bloques.
        p1 = [x1, y1, 160, 40];
        p2 = [x2, y2, 160, 50];
        
        %Dibujar
        b1 = rectangle('Position',p1,'EdgeColor','g','LineWidth',1);
        b2 = rectangle('Position',p2,'EdgeColor','g','LineWidth',1);
        %Dibujar
        r = rectangle('Position',p,'EdgeColor','r','LineWidth',2);
        
        %¿Chocan?
        area2 = bboxOverlapRatio(p,p1);
        area3 = bboxOverlapRatio(p,p2);
        
        if area2 > 0
            %     Stop the game and display GAME OVER.
            text(x,y,'GAME OVER','Color','r','FontSize', 20);
        end
        
        if area3 > 0
            %     Stop the game and display GAME OVER.
            text(x,y,'GAME OVER','Color','r','FontSize', 20);
        end
        
        
        
        
        %disp(['Center location is (',num2str(s(id).Centroid(1),4),', ',num2str(s(id).Centroid(2),4),')'])
    end
    
    
    
    hold off
    
    if y2>480
        y2=0;
    else
        y2=y2+vel;
    end
    
    if y1>480
        y1=0;
    else
        y1=y1+vel;
    end
    
    
end





