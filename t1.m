image = imread("res\1\7.jpg");

LowPassFilter(image, 'Ideal', 100);
%LowPassFilter(image, 'Butterworth', 0, 2)
%LowPassFilter(image, 'Gaussian');