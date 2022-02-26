image = imread("res\1\1.jpg");

%LowPassFilter(image, 'ILPF');
LowPassFilter(image, 'BLPF', 2)
%LowPassFilter(image, 'GLPF');