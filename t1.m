image = imread("res\1\1.jpg");

%LowPassFilter(image, 'Ideal');
LowPassFilter(image, 'Butterworth', 2)
%LowPassFilter(image, 'Gaussian');