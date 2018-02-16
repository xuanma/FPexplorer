function Hd = bhfFilter
%BHFFILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.2 and the Signal Processing Toolbox 6.20.
% Generated on: 11-Nov-2015 20:00:12

% Elliptic Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 1000;  % Sampling Frequency

Fstop1 = 195;     % First Stopband Frequency
Fpass1 = 200;     % First Passband Frequency
Fpass2 = 400;     % Second Passband Frequency
Fstop2 = 405;     % Second Stopband Frequency
Astop1 = 60;      % First Stopband Attenuation (dB)
Apass  = 1;       % Passband Ripple (dB)
Astop2 = 60;      % Second Stopband Attenuation (dB)
match  = 'both';  % Band to match exactly

% Construct an FDESIGN object and call its ELLIP method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Hd = design(h, 'ellip', 'MatchExactly', match);

% [EOF]
