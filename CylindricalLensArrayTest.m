clear;
source = PointSource(0,0,-2,45,45,20,20,0,'ellipse');
[alpha,beta,gamma] = source.LightRay;
lens1 = ParaxialLens(0.5,20,0.5,inf,0,0,0);
deltaZ = lens1.z0-source.z0;
x = deltaZ*alpha./gamma+source.x0;
y = source.y0*ones(1,length(x));
z = source.z0*ones(1,length(x));
lensnum = round(x/lens1.width);
x_tem = source.x0*ones(1,length(x))-lensnum*lens1.width;
[intersectionX,intersectionY,intersectionZ,alpha1,beta1,gamma1,intersectionOn] ...
    = lens1.tracing(x_tem,y,z,alpha,beta,gamma);
intersectionX = intersectionX+lensnum*lens1.width;
figure;
xs(1,:) = source.x0*ones(1,length(alpha));
ys(1,:) = source.y0*ones(1,length(alpha));
zs(1,:) = source.z0*ones(1,length(alpha));
xs(2,:) = intersectionX;
ys(2,:) = intersectionY;
zs(2,:) = intersectionZ;
xs(3,:) = intersectionX+1*alpha1./gamma1;
ys(3,:) = intersectionY+1*beta1./gamma1;
zs(3,:) = intersectionZ+1;
plot3(zs,xs,ys,'r')
axis equal
title('CylindricalLensArrayRayTracing')
