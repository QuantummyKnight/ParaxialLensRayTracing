classdef PointSource
    properties
        x0
        y0
        z0
        angleX
        angleY
        lightnumX
        lightnumY
        field
        type
    end
    methods
        function self = PointSource(X0,Y0,Z0,AngleX,AngleY,LightNumberX,LightNumberY,Field,Type)
            self.x0 = X0;
            self.y0 = Y0;
            self.z0 = Z0;
            self.angleX = AngleX*pi/180;
            self.angleY = AngleY*pi/180;
            self.lightnumX = LightNumberX;
            self.lightnumY = LightNumberY;
            self.field = Field*pi/180;
            self.type = Type;
        end
        function [alpha,beta,gamma] = LightRay(self)
            if strcmpi(self.type,'cone')
                theta = linspace(0,2*pi,2*(self.lightnumX+self.lightnumY));
                deltaZ = 2;
                x = self.x0+deltaZ*tan(self.angleX)*cos(theta);
                y = self.y0+deltaZ*tan(self.angleY)*sin(theta)+tan(self.field)*deltaZ;
                distance = sqrt((x-self.x0).^2+(y-self.y0).^2+deltaZ^2);
                alpha = (x-self.x0)./distance;
                beta = (y-self.y0)./distance;
                gamma = deltaZ./distance.*ones(1,length(alpha));
            end
            if strcmpi(self.type,'ellipse')
                deltaZ = 2;
                % x = linspace(self.x0-tan(self.angleX)*deltaZ,self.x0+tan(self.angleX)*deltaZ,self.lightnumX);
                % y = linspace(self.y0-tan(self.angleY)*deltaZ,self.y0+tan(self.angleY)*deltaZ,self.lightnumY);
                % [X,Y] = meshgrid(x,y);
                X = self.x0-tan(self.angleX)*deltaZ+2*tan(self.angleX)*deltaZ*rand(self.lightnumX*self.lightnumY,1);
                Y = self.y0-tan(self.angleY)*deltaZ+2*tan(self.angleY)*deltaZ*rand(self.lightnumX*self.lightnumY,1);
                X = reshape(X,1,[]);
                Y = reshape(Y,1,[]);
                a = tan(self.angleX)*deltaZ;
                b = tan(self.angleY)*deltaZ;%semi axis 
                judge = vpa((X-self.x0).^2/a^2+(Y-self.y0).^2/b^2)>1;%out of ellipse
                X(judge) = [];
                Y(judge) = [];
                distance = sqrt((X-self.x0).^2+(Y+tan(self.field)*deltaZ-self.y0).^2+deltaZ^2);
                alpha = (X-self.x0)./distance;
                beta = (Y+tan(self.field)*deltaZ-self.y0)./distance;
                gamma = deltaZ./distance.*ones(1,length(alpha));
            end
            if strcmpi(self.type,'square')
                deltaZ = 2;
                x = linspace(self.x0-tan(self.angleX)*deltaZ,self.x0+tan(self.angleX)*deltaZ,self.lightnumX);
                y = linspace(self.y0-tan(self.angleY)*deltaZ,self.y0+tan(self.angleY)*deltaZ,self.lightnumY);
                [X,Y] = meshgrid(x,y);
                X = reshape(X,1,[]);
                Y = reshape(Y,1,[]);
                distance = sqrt((X-self.x0).^2+(Y+tan(self.field)*deltaZ-self.y0).^2+deltaZ^2);
                alpha = (X-self.x0)./distance;
                beta = (Y+tan(self.field)*deltaZ-self.y0)./distance;
                gamma = deltaZ./distance.*ones(1,length(alpha));
            end
            xs = [self.x0*ones(1,length(alpha));self.x0+alpha*3./gamma];
            ys = [self.y0*ones(1,length(alpha));self.y0+beta*3./gamma];
            zs = [self.z0*ones(1,length(alpha));self.z0+3*ones(1,length(alpha))];
            figure;
            plot3(zs,xs,ys,'r')
            axis equal
            title('Point Source')
        end
        
    end
end