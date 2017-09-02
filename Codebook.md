---
output:
  pdf_document: default
  html_document: default
---
# :sparkling_heart: Codebook for Variables :sparkling_heart:
This is a codebook for the assignment 4 in the Getting and Cleaning Data course.
Enjoy! :pizza: :smile: :fireworks:
## Separate segments' explanation:
The following elements are combined to have a complete meaning. In each elem
* Signal types: 
	* Body: Body acceleration signals
	* Gravity: Gravit acceleration signals
* Devices:
	* Acc: Accelerometer raw signals
	* Gyro: gyroscope raw signals
* Dimensions:
	* X: X direction 
	* Y: Y direction
	* Z: Z direction
* Data types:
	* t: time domain signals
	* f: Fast Fourier Transform applied on signals
	* mean: mean of the data
	* std: standard deviation of the data
* Other:
	* Jerk: Jerk Signals
	* Mag: magnitude of these three-dimensional signals, calculted using the Euclidean norm 

The above elements are combined to reflect a complete meaning in the columns.
For example, 
tBodyAcc-X means a time domained Body signals in the X direction, measured by the Accelerometer.
