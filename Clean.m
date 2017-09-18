clear all; close all; clc
objects = imaqfind %find video input objects in memory
delete(objects) %delete a video input object from memory

vid=videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');

% Set parameters for video
% Acquire only one frame each time
set(vid,'FramesPerTrigger',1);
% Go on forever until stopped
set(vid,'TriggerRepeat',Inf);

% vid.FrameGrabInterval = 1;
% set(vid,'FramesPerTrigger',Inf);
start(vid);

%preview(vid);
ii=1;
while(vid.FramesAcquired <= 10000)
    %set(vid,'ReturnedColorSpace','rgb');
    
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
    %     diff_im = imsubtract(cdt(:,:,3),rgb2gray(cdt));
    %     diff_im = medfilt2(diff_im, [3 3]);
    %     diff_im = im2bw(diff_im, 0.12);
    %     diff_im = bwareaopen(diff_im, 20);
    %     binaria = bwlabel(diff_im, 8);
    
    objetos = regionprops(cdt,'Centroid', 'Area');
    imshow(cdt2)
    impixelinfo
    id = find([objetos.Area] > 1000 & [objetos.Area] < 100000 );
    hold on
    if isempty(objetos)
        perText=text(40,40, strcat('Pone el puto objeto mkon'))
        set(perText, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 26, 'Color', 'yellow');
    else
        
%         bb = objetos(id).BoundingBox;
        bc = objetos(id).Centroid;
%         rectangle('Position',bb,'EdgeColor','r','LineWidth',3);
        plot(bc(1),bc(2), '-m+');
        
        
    end
    hold off
    
    %cdt2=cdt;%original flip
    % [BW,maskedRGBImage] = createMask(cdt2);
    
    %Jefferson mascara
    %     r = cdt(:,:,1);
    %     g = cdt(:,:,2);
    %     b = cdt(:,:,3);
    %     justBlue = b - r/2 - g/2;
    %     bw = justBlue > 70;
    %     bw = bwareaopen(bw, 20);
    %     figure(4);imshow(bw);
    %     s  = regionprops(cdt, {'centroid','area','BoundingBox'});
    %     [~, id] = max([s.Area]);
    %     hold on
    %     deltaxr = 10;
    %     deltayr = 10;
    %     x = s(id).Centroid(1) - 5;
    %     y = s(id).Centroid(2) - 5;
    %     vr = [x, y, deltaxr, deltayr];
    %     a = [x, y];
    %     b = [x + deltaxr, y];
    %     c = [x + deltaxr, y + deltayr];
    %     d = [x, y + deltayr];
    %     r = [a; b; c; d];
    %     r1 = rectangle('Position',vr,'EdgeColor','r','LineWidth',2);
    %     hold off
    
end





