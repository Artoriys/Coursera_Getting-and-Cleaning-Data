# Codebook

## Variables
- activity

Activity identifier, string with 6 possible values:

- WALKING: subject was walking
- WALKING_UPSTAIRS: subject was walking upstairs
- WALKING_DOWNSTAIRS: subject was walking downstairs
- SITTING: subject was sitting
- STANDING: subject was standing
- LAYING: subject was laying

- subject

Subject identifier, integer, ranges from 1 to 30.


The measurements are classified in two domains:

- Time-domain signals (variables prefixed by timeDomain), resulting from the capture of accelerometer and gyroscope raw signals.

- Frequency-domain signals (variables prefixed by frequencyDomain), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.
