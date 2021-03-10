# plateTempDist
Determining Temperature Distribution on a Rectangular Plate, using Gauss-Jordan and Matrix Inversion Methods

# Aim
Temperature distribution on a square plate is to be numerically determined. Process is assumed to be steady-state. Plate is exposed to different amounts of heat; therefore, having different and constant temperatures at the edges. Equal subparts are obtained by dividing the plate into desired interval number. Calculation method for each particular element is taking the mean value of neighbor elements (4 connectivity). 

A set of linear equations is constructed to be used in numerical methods. Number of unknown values and equations depend on interval number. Notice that the set is far greater than the initial matrix, since the every single variable in the initial matrix is supposed to exist in a row in the set. For an illustration, if interval number is set to 10, initial matrix should be 10x10 square matrix. However, first-ending row vectors and first-ending column vectors do not keep any variable and all are set to edge temperatures. Variables are saved in a 8x8 square matrix which means that there are 64 unknowns to be determined. 64 unknows require 64 equations, which should eventually yield a 64x64 square matrix. Number of parameters and elapsed time can be considered as an exponential function. 

Number of parameters is ~4k if interval number is 10, ~100k if interval number is 20, ~600k if interval number is 30, ~2m if interval number is 40. Higher interval numbers require higher computational capabilities. 

# Methods
Once the system for linear equations and solutions is created, it is now possible to use numberical methods such as Gauss-Jordan Method and Matrix Inversion Method. 

Gauss-Jordan method requires augmented matrix of coefficient matrix and solutions vector. Taking the reduced row echelon form of this augmented matrix should yield the unknown values which are aimed to be determined. 

In matrix inversion method, coefficient matrix should be a square matrix and non-singular. If these conditions are met, unknown values can be calculates by the formula of X = inv(A)*B.

Process can be completed by faster and more efficient methods.

# Testing
Code is tested on MATLAB and Octave, using interval number of 50 and output visuals are provided below. After the 40 intervals, elapsed time is getting much greater than previous numbers. 

![Methods](https://user-images.githubusercontent.com/80001281/110222048-a753e780-7ee0-11eb-8d25-2dd452a7f3c5.png)

# Further Improvements
Shape of the plate should not be limited by being a square or rectangular. Condition for numerical solution in this case is that coefficient matrix is supposed to be a non-singular, square matrix. This condition can be satisfied for other polygon shapes of plate.

Thanks.
