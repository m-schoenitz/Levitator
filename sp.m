[file,path] = uigetfile('*.csv');

a = importfile([path,file]);
y = a.AR;

figure
plot(y);
title(file);

y = normalize(y);

nFrames = height(a);
% fps = nFrames/8.458; % frames per second
fps = 5413.217;

dur = nFrames/fps;

% y = resample(y,1000,round(fps));

ty = linspace(0,dur,length(y))';
ytable = timetable(seconds(ty),y);

figure
pspectrum(ytable,'FrequencyLimits',[50,500],'spectrogram');

figure
pspectrum(ytable,'FrequencyLimits',[50,500],'spectrogram','leakage',0.8);

figure
pspectrum(ytable,'FrequencyLimits',[50,500],'leakage',0.8,'frequencyresolution',1);

% [p,f,t] = pspectrum(ytable,'FrequencyLimits',[50,500],'spectrogram','leakage',0.8,'timeresolution',0.06);
% [p,f,t] = pspectrum(ytable,'FrequencyLimits',[50,500],'spectrogram','leakage',1,'overlappercent',0);
[p,f,t] = pspectrum(ytable,'FrequencyLimits',[50,500],'spectrogram','leakage',0.8);

figure
waterfall(f,seconds(t),sqrt(p'));
xlabel('Frequency (Hz)')
ylabel('Time (seconds)')
view([30 45])

% freq = linspace(165,195,6)';
freq = linspace(150,200,6)';
% freq = [190];

figure(999)
for i = 1: length(freq)
	
	[fi,j] = min(abs(f-freq(i)));
	plot(t,sqrt(p(j,:)),'.-')
		
	title(file);
	ylabel('spectral amplitude');
	xlabel('time')
% 	sum(freqfilt)
	
	hold on
	
end

legend(string(num2cell(freq)));
 
% mean(diff(seconds(t)))

