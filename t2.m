image = imread("res\1\1.jpg");

HighPassFilter(image, 'Ideal');
HighPassFilter(image, 'Butterworth', 2)
HighPassFilter(image, 'Gaussian');