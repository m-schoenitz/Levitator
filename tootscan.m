
dur = 8; % sound duration in seconds
freq = [100,500];

Fs  = 44100;  % Sampling Frequency (Hz): this is the native Fs of the spund driver

t = linspace(0,dur,dur*Fs)';

% y = zeros(Fs*(ton+toff),length(freq));


% how long is one period?
T = 1./freq;
N = round(T .* Fs);
envelope = [linspace(0,1,3*N(1)),ones(1,dur*Fs-3*N(1)-N(2)),linspace(1,0,N(2))]';

y = chirp(t,freq(1),dur,freq(2),'linear').*envelope;
y2 = chirp(t,freq(1),dur,freq(2),'logarithmic').*envelope;

soundsc(y,Fs)
