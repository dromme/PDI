clear all; close all; clc
% vid=videoinput('winvideo',1,'YUY2_640x480');
% set(vid,'ReturnedColorSpace','rgb');
% preview(vid);
% foto = getsnapshot(vid);
% foto2 =flip(foto,2);
% imwrite(foto2,'myfoto21.png');

% set(vid,'returnedcolorspace','rgb');
% set(vid,'FramesPerTrigger',Inf);
% vid.FrameGrabInterval = 1;
% start(vid);
% 5
% while(vid.FramesAcquired <= 10)
%     geta=getsnapshot(vid);
%     figure(1);imshow(geta);
%     geta2=flip(geta,2);
%     figure(2);imshow(geta2);
% end

% %Intento de mascara
% im=imread('myfoto1.png');
% I = im;
% imgray=rgb2gray(im);
% T=graythresh(imgray);
% T;
% imbw = im2bw(imgray,T);
% mask = imbw;
% im = double(im);
% mask = double(mask);
% im(:,:,1) = im(:,:,1).*mask;
% im(:,:,2) = im(:,:,2).*mask;
% im(:,:,3) = im(:,:,3).*mask;
% im = uint8(im);
% B = im(:,:,3);
% R = im(:,:,1);
% G = im(:,:,2);
% Z= B - (R - G);
% W = Z>50;
% imshow(W);
% mask = W;
% mask = double(mask);
% im = double(im);
% im(:,:,1) = im(:,:,1).*mask;
% im(:,:,2) = im(:,:,2).*mask;
% im(:,:,3) = im(:,:,3).*mask;
% im = uint8(im);
% imshow([I,im]);

cdt = imread('myfoto21.png');
cdt2 = flip(cdt,2);
% imgHSV = rgb2hsv(cdt2);
% imshow(imgHSV(:,:,2));colormap('hsv');colorbar;
% BW = imgHSV(:,:,2) < 0.50 | imgHSV(:,:,2) > .65;
% [BW,maskedRGBImage] = createMask(cdt2)
% imshow(BW);


%Jefferson mascara
cdt2= cdt;
r = cdt(:,:,1);
g = cdt(:,:,2);
b = cdt(:,:,3);
justBlue = b - r/2 - g/2;
bw = justBlue > 33;
cdt = bwareaopen(bw, 20);
figure(1);imshow(cdt2);

% 
% Encuentra centroide.
s  = regionprops(cdt, {'centroid','area'});
% if isempty(s)
%   error('No ball found!');
% else
   [~, id] = max([s.Area]);
%     hold on,plot(s(id).Centroid(1),s(id).Centroid(2),'ro','MarkerFaceColor','r') , hold off
%     %disp(['Center location is (',num2str(s(id).Centroid(1),4),', ',num2str(s(id).Centroid(2),4),')'])
%     
%     figure(3);imshow(cdt2);
%     hold on, plot(s(id).Centroid(1),s(id).Centroid(2),'ro','MarkerFaceColor','r'), hold off

    %----------------SHOW GAME BALL
    % Length of rectangle edges.
    deltaxr = 10;
    deltayr = 10;
    x = s(id).Centroid(1) - 5;
    y = s(id).Centroid(2) - 5;

    % Vector for rectangle object.
    vr = [x, y, deltaxr, deltayr];

    % Bird polyline.
    a = [x, y];
    b = [x + deltaxr, y];
    c = [x + deltaxr, y + deltayr];
    d = [x, y + deltayr];
    r = [a; b; c; d];

    % Draw objects.
    r1 = rectangle('Position',vr,'EdgeColor','r','LineWidth',2);
%  end




