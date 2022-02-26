image = imread("res\1\3.jpg");

HighPassFilter(image, 'Ideal');
HighPassFilter(image, 'Butterworth', 0, 2)
HighPassFilter(image, 'Gaussian');