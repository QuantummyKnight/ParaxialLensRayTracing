clear;
x = linspace(-2,2,10);
y = x;
[X,Y] = meshgrid(x,y);

Z = ones(size(X))*-2;
alpha = zeros(10);
beta = alpha;
gamma = ones(10);
%x y z alpha beta gamma: parallel light rays' interactions and orientations
width = 11;
height = 11;
focallengthX = 3;
focallengthY = 5;
centerX = 0;
centerY = 0;
centerZ = 0;
lens1 = ParaxialLens(width,height,focallengthX,focallengthY,centerX,centerY,centerZ);
[intersectionX,intersectionY,intersectionZ,alpha1,beta1,gamma1,intersectionOn] = ...
    lens1.tracing(X,Y,Z,alpha,beta,gamma);
figure;
xs(1,:) = reshape(X,1,[]);
ys(1,:) = reshape(Y,1,[]);
zs(1,:) = reshape(Z,1,[]);

xs(2,:) = reshape(intersectionX,1,[]);
ys(2,:) = reshape(intersectionY,1,[]);
zs(2,:) = reshape(intersectionZ,1,[]);

% xs(3,:) = reshape(intersectionX+10*alpha1,1,[]);
% ys(3,:) = reshape(intersectionY+10*beta1,1,[]);
% zs(3,:) = reshape(intersectionZ+10*gamma1,1,[]);

xs(3,:) = reshape(intersectionX+8*alpha1./gamma1,1,[]);
ys(3,:) = reshape(intersectionY+8*beta1./gamma1,1,[]);
zs(3,:) = reshape(intersectionZ+8,1,[]);
plot3(zs,xs,ys,'r')
hold on
lens1X = linspace(centerX-width/2,centerX+width/2,100);
lens1Y = linspace(centerY-height/2,centerY+height/2,100);
[lens1X,lens1Y] = meshgrid(lens1X,lens1Y);
% lens1X = reshape(lens1X,1,[]);
% lens1Y = reshape(lens1Y,1,[]);
lens1Z = centerZ*ones(size(lens1X));
scatter3(lens1Z,lens1X,lens1Y,'green','.');
axis equal
title('optical tracing of lens1(paraxial lens)','green:paraxial lens   red:light rays','FontSize',15)

% pointsource = PointSource(0,0,0,15,60,11,11,'square');
% [alpha,beta,gamma] = pointsource.LightRay;