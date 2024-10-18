function toot(ton,toff,freq)


% toodur = 4; % sound duration in seconds
% freq = [150,160,170,180,190,200];
% freq = linspace(165,195,6);
% freq = linspace(150,250,6);

% ton = 0.4;
% toff = 0.7;

Fs  = 44100;  % Sampling Frequency (Hz): this is the native Fs of the spund driver

xon = linspace(0,ton,ton * Fs)';
xoff = linspace(0,toff,toff * Fs)';

t = linspace(0,length(freq)*(ton+toff),length(freq)*(ton+toff)*Fs)';

y = zeros(length([xon;xoff]),length(freq));

for i = 1:length(freq)
	
	% how long is one period?
	disp(freq(i));
	T = 1/freq(i);
	N = round(T * Fs);
	envelope = [linspace(0,1,5*N),ones(1,Fs*ton-6*N),linspace(1,0,N)]';
	
	y(:,i) = [cos(xon*2*pi*freq(i)).*envelope;zeros(size(xoff))];
end

y = y(:);
% y = y;
soundsc(y,Fs)

end