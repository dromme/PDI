clear all; close all; clc
objects = imaqfind %find video input objects in memory
delete(objects) %delete a video input object from memory

vid=videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');


vid.FrameGrabInterval = 1;
set(vid,'FramesPerTrigger',Inf);
start(vid);

set(vid,'ReturnedColorSpace','rgb');
cdt = getsnapshot(vid);


         cdt2 = flip(cdt,2);
 imwrite(cdt2,'myfoto4.png');
%     [BW,maskedRGBImage] = createMask(cdt2);
% imwrite(BW,'myfoto2mk.png');

%imshow(BW);