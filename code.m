Question 1:
Question: Write down program for representing basic signals
 such as unit impulse, unit step, sine wave, cosine wave, square wave,
 ramp sequence, exponential sequence, damped sequence, and sinc wave.
a) Unit Impulse Signal
clc
clear all
close all
n=[-4:4];
z=[zeros(1,4),1,zeros(1,4)];
subplot(1,1,1);
stem(n,z);
axis tight
xlabel('n --->');
ylabel('Amplitude >');
title('Unit Impulse');
b) Unit Step Sequenceclc
clc
clear all
close all
n=input('Enter the N Value: ');
y=[ones(1,n)];
subplot(1,1,1);
stem(y);
axis tight
xlabel('n --- >');
ylabel('Amplitude --->');
title('Unit Step');
c) Sine Wave
clc
clear all
close all
n=0:0.1:4;
x=sin(2*pi*n);
figure,
subplot(1,1,1)
plot(n,x)
axis tight
xlabel('n --->');
ylabel('Amplitude >');
title('sine Wave');

d)Cosine Wave
clc
clear all
close all
f=4;
t=0:0.1:4;
x=cos(2*pi*f*t);
figure,
subplot(1,1,1)
plot(t,x)
axis tight
xlabel('frequency (Hz)');
ylabel('amplitude (v)');
title('cosine');
e) Square Wave
clc;
clear all;
close all;

n = 10;
y = ones(1, n);

stem(y, 'filled');
axis([0 n+1 -0.5 1.5]);
grid on;

xlabel('n --->');
ylabel('Amplitude --->');
title('Unit Step');
f) Ramp Sequence
clc
clear all
close all
t=0:0.1:1;
r=t;
subplot(1,1,1);
stem(r);
axis tight
xlabel('n-->');
ylabel('Amplitude >');
title('Ramp');
g) Exponential Sequence
clc
clear all
close all
t=0:0.01:1;
a=5;
z=exp(-a*t);
subplot(1,1,1);
stem(z);
axis tight
xlabel('n-->');
ylabel('Amplitude->');
title('Exponential');
h) Damped Sequence
clc
clear all
close all
a=6;
t=0:0.001:3;
x=a*sin(2*pi*a*t);
z=exp(-t);
q=x.*z;
subplot(1,1,1);
plot(t,q);
axis tight
xlabel('n >');
ylabel('Amplitude >');
title('Damped');
i) Sinc Wave
clc
clear all
close all
b=linspace(-10,10);
y=sinc(b);
subplot(1,1,1);
plot(b,y);
axis tight
xlabel('n >');
ylabel('Amplitude >');
title('sinc');
Question 3: Computing Circular Convolution
Question: Write down a program for computing Circular Convolution.
Inputs: x1(n) = [1,1,2,2] & x2(n) = [1,2,3,4]
clc;
clear all;
close all;

x = [1, 2, 3, 4];
h = [1, 2, 1, 2];

m = length(x);
n = length(h);
N = max(m, n);

x = [x, zeros(1, N - m)];
h = [h, zeros(1, N - n)];

z = zeros(1, N);
for n_idx = 1:N
    for i = 1:N
        j = mod(n_idx - i, N);
        if (j < 0)
            j = j + N;
        end
        z(n_idx) = z(n_idx) + x(i) * h(j + 1);
    end
end
subplot(3,1,1); stem(x, 'filled'); title('Signal 1 (x)');
subplot(3,1,2); stem(h, 'filled'); title('Signal 2 (h)');
subplot(3,1,3); stem(z, 'filled'); title('Circular Convolution Output (z)');
Question 5: Computing Decimation in Frequency FFT (DIFFT)
Question: Write down a program for computing Decimation in Frequency FFT.
Inputs: x(n) = 2^n and N = 8
clc;
clear all;
close all;

x = [1, 2, 3, 4, 4, 3, 2, 1];
L_len = length(x);

next_pow = ceil(log2(L_len));
n = 2^next_pow;

x11 = [x, zeros(1, n - L_len)];

y = zeros(1, n);
x1 = zeros(1, n/2);
x2 = zeros(1, n/2);

for j = 1:(n/2)
    x1(j) = x11(j);
end

for j = ((n/2)+1):n
    x2(j - (n/2)) = x11(j);
end

for k = 1:n
    for j = 1:(n/2)
        y(k) = y(k) + (x1(j) + exp(-1i * pi * (k - 1)) * x2(j)) * exp(-2 * pi * 1i * (j - 1) * (k - 1) / n);
    end
end

figure(1);

subplot(2,1,1);
stem(x, 'filled');
xlabel('Samples');
ylabel('Amplitude');
title('Input Sequence');
grid on;

subplot(2,1,2);
stem(abs(y), 'filled');
xlabel('Samples');
ylabel('Amplitude');
title('DIFFT Output - Magnitude');
grid on;
Question 7: Computing DFT of the following signal
Question: Write down a program for computing DFT of the following signal.
Inputs: fs = 1000, t = 0:1/fs:0.01, x = sin(2\pi*(4000/fs)t)
clc; clear all; close all;
fs = 1000; t = 0:1/fs:0.01;
x = sin(2*pi*400*t); % Input signal

n = 16; % 16-point DFT (Fixed, no input required)
l = length(x);
x1 = [x, zeros(1, max(0, n-l))]; % Error-free zero padding
x1 = x1(1:n);
y = zeros(1, n);

% Short DFT Loop
for k = 1:n
    for j = 1:n
        y(k) = y(k) + x1(j) * exp(-2*pi*1i*(k-1)*(j-1)/n);
    end
end

% Plotting
subplot(2,1,1); stem(x1, 'filled'); title('Input Sequence'); grid on;
subplot(2,1,2); stem(abs(y), 'filled'); title('DFT Output-Magnitude'); grid on;


