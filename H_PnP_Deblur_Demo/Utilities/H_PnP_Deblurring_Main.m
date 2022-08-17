function [reconstructed_image, PSN_Result,FSIM_Result, SSIM_Result, All_PSNR,Outloop, Err_or] = H_PnP_Deblurring_Main(y,A,Opts, err_or)

mu                                     =                                    Opts.mu;

lr_lambda                              =                                    Opts.lambda; 

x_org                                  =                                    Opts.org;

IterNums                               =                                    Opts.IterNums;

initial                                =                                    Opts.initial;

h                                      =                                     A;

H_FFT                                  =                                    fft2(h);

HC_FFT                                 =                                    conj(H_FFT);

A                                      =                                    @(x) real(ifft2(H_FFT.*fft2(x)));

AT                                     =                                    @(x) real(ifft2(HC_FFT.*fft2(x)));

ATy                                    =                                    AT(y);

x                                      =                                    initial;

z                                      =                                    initial;  

c                                      =                                    zeros(size(y));


All_PSNR                               =                                    zeros(1,IterNums);

muinv                                  =                                    1/mu;

filter_FFT                             =                                    HC_FFT./(abs(H_FFT).^2 + mu).*H_FFT;


 LR_FFDNet_Results                     =                                    cell (1,IterNums);   



fprintf('Initial PSNR = %f\n',csnr(x,x_org,0,0));


for Outloop = 1:IterNums
    
   
  L                                =                     LR_WNNM_Main  (x, Opts); 
  
  r                                =                     ATy + lr_lambda* L + mu*(z+c);     
  
  x                                =                     muinv*( r - real(ifft2(filter_FFT.*fft2(r))) );
  
 z                                 =                     FFD_Net_Denoiser (x - c, Opts.thr); %FFDNet 
    
 c                                 =                    c + (z - x);
    
 All_PSNR(Outloop)                 =                    csnr(x,x_org,0,0);
 
LR_FFDNet_Results{Outloop}         =                        x;

    fprintf('iter number = %d, PSNR = %f, SSIM = %f\n',Outloop,csnr(x,x_org,0,0),cal_ssim(x,x_org, 0,0));
    
        if Outloop>2
            
           Err_or      =  norm(abs (LR_FFDNet_Results{Outloop}) - abs( LR_FFDNet_Results{Outloop-1}),'fro')/norm(abs( LR_FFDNet_Results{Outloop-1}), 'fro');
            
        if (All_PSNR(Outloop)-All_PSNR(Outloop-1)<0) %Err_or<err_or
            break;
        end
       end

      
end

reconstructed_image = LR_FFDNet_Results{Outloop-1};

PSN_Result  = csnr(reconstructed_image,x_org,0,0);
FSIM_Result = FeatureSIM(reconstructed_image,x_org);
SSIM_Result = cal_ssim(reconstructed_image,x_org,0,0);

end

