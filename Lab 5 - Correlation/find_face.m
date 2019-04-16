clear;

%Морда
face = imread('face.jpg');
faceGray = rgb2gray(face);

figure(1);
imshow(faceGray);

%Картинка
img = imread('BigImage.jpg');
imgGray = rgb2gray(img);

figure(2);
imshow(img);

%Корреляционная функция
Corr = normxcorr2(faceGray,imgGray);
figure(3);
srf = surf(Corr);
set(srf, 'LineStyle', 'none');

%Поиск максимума корреляционной функции
[maxVal,maxIndex] = max(abs(Corr(:)));
[max_Y,max_X] = ind2sub(size(Corr),maxIndex);

%Рисуем прямоугольник вокруг максимума корр. функции
figure(2);
%hold on;
rectangle('Position',[(max_X-50) (max_Y-50) 75 75],'LineWidth',3,'EdgeColor','b');