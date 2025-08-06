# ParaxialLensRayTracing

ParaxialLens.m is the classedef of paraxial lens just like the 
 "Paraxial XY"(sequential mode) and "Paraxial Lens"(nonsequential mode)
in the Zemax.It has the ray tracing function, the algorithm can be seen
in the "ParaxialLensAlgorithm.pdf".
ParaxialLensTest.m is an example for ParaxialLens.m and is compared with
Zemax for accuracy.
PointSource.m is a classdef for "Source Point" just like Zemax, it is called
in the CylindricalLensArrayTest.m.
CylindricalLensArrayTest.m gives another example for ParaxialLens.m, it
can be used to simulate the integral imaging.

'ParaxialLensTest.m' We can see
![ParaxialLensTestCompareWithZemax-Matlab](https://github.com/user-attachments/assets/4ca7fc7d-2092-4a15-b5ab-42139969e2a0)
from matlab
![ParaxialLensTestCompareWithZemax-ZEMAX](https://github.com/user-attachments/assets/e1e053e3-5776-4f94-a9a0-a3fcc5c26f39)
from zemax

'CylindricalLensArrayTest.m' We can see
![CylindricalLensArrayTestCompareWithZemax-MATLAB](https://github.com/user-attachments/assets/71026830-bdcb-471f-afcd-04abd9a669fa)
from matlab
![CylindricalLensArrayTestCompareWithZemax-ZEMAX](https://github.com/user-attachments/assets/bba2ae30-82f4-43c1-82a0-84325071e3cc)
from zemax
