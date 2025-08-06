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
