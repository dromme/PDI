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
alto=75;
ancho1=270; ancho2=350; ancho3=160; ancho4=480; ancho5=80;

%Inicializar las posiciones de los bloques
x1=0;y1=0; x2=640-ancho1;y2=5; %Primera fila
x3=0;y3=125; x4=640-ancho3;y4=130; %Segunda fila, para ancho 2
x5=0;y5=250; x6=640-ancho1;y6=255; %Tercera fila, para ancho 3
x7=0;y7=365; x8=640-ancho5;y8=370; %Cuarta fila, para ancho 2

vel=1;

while(vid.FramesAcquired <= 10000)
    
    
    if(vid.FramesAcquired == 50)
        vel=10;
    end
    
    
    %Máscara para reconocer objeto azul
    cdt0 = getsnapshot(vid);%Capturamos la imagen de la cámara
    cdt = flip(cdt0,2);%Aplicamos la función flip, que nos permite rotar la imagen y así evitar el efecto de espejo
    %[fil,col,cap]=size(cdt);
    cdt2 = cdt;
    r = cdt(:,:,1);%Obtenemos la capa que contiene el color rojo de la imagen
    g = cdt(:,:,2);%Obtenemos la capa que contiene el color verde de la imagen
    b = cdt(:,:,3);%Obtenemos la capa que contiene el color azul de la imagen
    justBlue = g - b/2 - r/2;
    bw = justBlue > 33;
    cdt = bwareaopen(bw, 20);
    
    imshow(cdt2);%Mostramos la imagen
    % Bloques.
        p1 = [x1, y1, ancho1, alto];
        p2 = [x2, y2, ancho1, alto];
        
        p3 = [x3, y3, ancho2, alto];
        p4 = [x4, y4, ancho3, alto];
        
        p5 = [x5, y5, ancho1, alto];
        p6 = [x6, y6, ancho1, alto];
        
        p7 = [x7, y7, ancho4, alto];
        p8 = [x8, y8, ancho5, alto];
        
        %Dibujar bloques
        b1 = rectangle('Position',p1,'LineWidth',1,'FaceColor',[0.8 0.9 0],'EdgeColor',[0.8 0.9 0]);
        b2 = rectangle('Position',p2,'LineWidth',1,'FaceColor','g');
        
        if(vid.FramesAcquired > 15)
            
        b3 = rectangle('Position',p3,'LineWidth',1,'FaceColor','g');
        b4 = rectangle('Position',p4,'LineWidth',1,'FaceColor','g');
        b5 = rectangle('Position',p5,'LineWidth',1,'FaceColor','g');
        b6 = rectangle('Position',p6,'LineWidth',1,'FaceColor','g');
        b7 = rectangle('Position',p7,'LineWidth',1,'FaceColor','g');
        b8 = rectangle('Position',p8,'LineWidth',1,'FaceColor','g');
        end
    
    s  = regionprops(cdt, {'centroid','area'});%Obtenemos las propiedades 'centroide' y 'área' de cada objeto que este blanco en BW 
    if isempty(s)
        
    else
        
        [~, id] = max([s.Area]);  % Quiero que siga los objetos más de taltal y el
        hold on
        
        % Game Ball.
        x = s(id).Centroid(1) - 5;
        y = s(id).Centroid(2) - 5;
        p = [x, y, 13, 13];
        
        
        
        %Dibujar rectangulo
        r = rectangle('Position',p,'EdgeColor','b','LineWidth',2);
        %pause(4);

        %¿Chocan?
        area1 = bboxOverlapRatio(p,p1);
        area2 = bboxOverlapRatio(p,p2);
        area3 = bboxOverlapRatio(p,p3);
        area4 = bboxOverlapRatio(p,p4);
        area5 = bboxOverlapRatio(p,p5);
        area6 = bboxOverlapRatio(p,p6);
        area7 = bboxOverlapRatio(p,p7);
        area8 = bboxOverlapRatio(p,p8);
        
        %Para el juego si toca algún bloque
        if area1 > 0 ||  area2 > 0 || area3 > 0 || area4 > 0 || area5 > 0 || area6 > 0
            text(x,y,'GAME OVER','Color','r','FontSize', 40);
            break
        end
        
        %disp(['Center location is (',num2str(s(id).Centroid(1),4),', ',num2str(s(id).Centroid(2),4),')'])
    end
 
    hold off

    if y1>480
        y1=0;
        
    else
        y1=y1+vel;
    end
    %%%
    if y2>480
        y2=0;
      
    else
        y2=y2+vel;
    end
    %
    if y3>480
        y3=0;
        
    else
        y3=y3+vel;
    end
    %
    if y4>480
        y4=0;
    else
        y4=y4+vel;
    end
    %
    if y5>480
        y5=0;
        
    else
        y5=y5+vel;
    end
    
    if y6>480
        y6=0;
    else
        y6=y6+vel;
    end
    
    if y7>480
        y7=0;
    else
        y7=y7+vel;
    end
    
    if y8>480
        y8=0;
    else
        y8=y8+vel;
    end
    
end





