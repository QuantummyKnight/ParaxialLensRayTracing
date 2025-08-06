classdef ParaxialLens
    properties
        width
        height
        focallengthX
        focallengthY
        x0
        y0
        z0
        %x0,y0,z0: center coordinates of the lens
    end
    
    methods
        function self = ParaxialLens(Width,Height,Fx,Fy,X0,Y0,Z0)
            self.width = Width;
            self.height = Height;
            self.focallengthX = Fx;
            self.focallengthY = Fy;
            self.x0 = X0;
            self.y0 = Y0;
            self.z0 = Z0;
        end
        function [intersectionX,intersectionY,intersectionZ,alpha1,beta1,gamma1,intersectionOn] = tracing(self,x,y,z,alpha,beta,gamma)
            intersectionX = x+alpha./gamma.*(self.z0-z);
            intersectionY = y+beta./gamma.*(self.z0-z);
            intersectionZ = self.z0*ones(size(intersectionX));
            intersectionOn = (intersectionX<=(self.x0+self.width/2))&(intersectionX>=(self.x0-self.width/2))...
                &(intersectionY<=(self.y0+self.height/2))&(intersectionY>=(self.y0-self.height/2));
            toX = self.x0-x;
            toY = self.y0-y;
            toZ = self.z0-z;
            %calculate the image distance
            imageZx = 1./(1./self.focallengthX-1./toZ)+self.z0;
            imageXx = self.x0+toX./toZ.*(imageZx-self.z0);
            imageZy = 1./(1./self.focallengthY-1./toZ)+self.z0;
            imageYy = self.y0+toY./toZ.*(imageZy-self.z0);
            
            imageXy = (imageXx-intersectionX)./(imageZx-intersectionZ).*(imageZy-intersectionZ)+intersectionX;
            distance = sqrt((imageXy-intersectionX).^2+(imageYy-intersectionY).^2+(imageZy-intersectionZ).^2);
            alpha1 = (imageXy-intersectionX)./distance;
            beta1 = (imageYy-intersectionY)./distance;
            gamma1 = (imageZy-intersectionZ)./distance;
            alpha1(gamma1<0) = -alpha1(gamma1<0);%ensure forward-propagating
            beta1(gamma1<0) = -beta1(gamma1<0);
            gamma1 = abs(gamma1);
            
%             X = [1 0;-1/self.focallengthX 1]*[toX alpha];
%             Y = [1 0;-1/self.focallengthY 1]*[toY beta];
            %[x1;theta1] = [1 0;-1/f 1]*[x;theta] 
%             alpha1 = -toX/self.focallengthX+alpha;
%             beta1 = -toY/self.focallengthY+beta;
%             gamma1 = sqrt(1-alpha1.^2-beta1.^2);        
        end
        
    end
    
end
        