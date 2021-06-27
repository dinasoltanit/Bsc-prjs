clear all force;
close all force;clc
%
% DSP BSC course
% Demo program for effect of zero-padding of DTFT on Freq. Resolution
% You can see that zero-padding DOES NOT increase freq. resolution
% while increasing window length DOES INCREASE FREQ. RESOLUTION.
% This is because window main lobe in freq. decreases for wider
% time windows. Then periodic convolution has lass of an effect on
% the results in Frq. domain.
% by Hamid Sheikhzadeh,June 2021
%
w0=4*pi/16;
w1=w0+pi/16;
WinType={'rectwin';'hamming'}
%---------------------
for k=1:length(WinType)
        for InpLen=[16, 64]
        for FftLen=[2*InpLen,   InpLen*10]
            n=0:1:InpLen-1;
            Inp=sin(w0*n)+ 2*sin(w1*n);
            %This line is interesting, notice the use of eval()
            eval(['Win=',cell2mat(WinType(k)),'(InpLen);']) 
            InpFft=fft(Inp(:).*Win(:),FftLen);
            Freq=(0:1:FftLen-1)*2*pi/FftLen;
            figure
            plot(Freq/pi,abs(InpFft),'.-');grid on
            title(['Window Len= ', num2str(InpLen), ', FFT Len=',num2str(FftLen)...
                ,' Window= ',cell2mat(WinType(k))]);
            xlabel('Normalized Freq./\pi');
        end
    end
end
