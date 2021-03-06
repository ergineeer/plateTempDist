# plateTempDist
Determining Temperature Distribution on a Rectangular Plate, using Gauss-Jordan and Matrix Inversion Methods

# Aim
Temperature distribution on a square plate is to be numerically determined. Process is assumed to be steady-state. Plate is exposed to different amounts of heat; therefore, having different and constant temperatures at the edges. Equal subparts are obtained by dividing the plate into desired interval number. Calculation method for each particular element is taking the mean value of neighbor elements (4 connectivity). 

A set of linear equations is constructed to be used in numerical methods. Number of unknown values and equations depend on interval number. Notice that the set is far greater than the initial matrix, since the every single variable in the initial matrix is supposed to exist in a row in the set. For an illustration, if interval number is set to 10, initial matrix should be 10x10 square matrix. However, first-ending row vectors and first-ending column vectors do not keep any variable and all are set to edge temperatures. Variables are saved in a 8x8 square matrix which means that there are 64 unknowns to be determined. 64 unknows require 64 equations, which should eventually yield a 64x64 square matrix. Number of parameters and elapsed time can be considered as an exponential function. 

Number of parameters is ~4k if interval number is 10, ~100k if interval number is 20, ~600k if interval number is 30, ~2m if interval number is 40. Higher interval numbers require higher computational capabilities. 

# Methods
Once the system for linear equations is created, it is now possible to apply numberical methods such as Gauss-Jordan Method and Matrix Inversion Method. 
