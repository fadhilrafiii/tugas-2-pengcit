image = imread("res\1\3.jpg");

%LowPassFilter(image, 'Ideal');
%LowPassFilter(image, 'Butterworth', 0, 2)
LowPassFilter(image, 'Gaussian');