function       [reconstructed_image,PSN_Result, FSIM_Result, SSIM_Result, All_PSNR, diff, j]  =  H_PnP_Deblocking_Main(Inoi, par, JPEG_Quality)


ori_im                 =                par.I;

n_im                   =                Inoi;

[h1, w1]               =                size(ori_im);

IterNum                =                par.IterNum;

x                      =                Inoi;

v                      =                par.nSig;

%cnt                    =                1;

All_PSNR               =                 zeros(1,IterNum);

LR_FFDNet_Results      =                 cell (1,IterNum);   

c                      =                zeros(size(x));

z                      =                Inoi;     
         



%w                      =                d_im;

%f                      =                d_im;


if JPEG_Quality <=1
    
    
    err_or = 0.0010;
    
elseif JPEG_Quality <=5
    
     err_or = 0.00016;  
     
elseif JPEG_Quality <=10
    
     err_or = 0.0005;    
     
elseif JPEG_Quality <=20
    
     err_or = 7.46E-05;  
     
elseif JPEG_Quality <=30
    
     err_or = 0.00013;       
               
elseif JPEG_Quality <=40
    
     err_or = 7.27E-05;      
     
else
    
     err_or = 7.27E-05; 
end







for j                  =                1 : IterNum %
    
    
    
    
    d_im               =                    x;
    
    
    
    dif                =                    d_im - n_im;
    
     vd                 =               v^2-(mean(mean(dif.^2)));
    
    if (j ==1)
        
    par.nSig           =               sqrt(abs(vd));
    
    else
        
    par.nSig           =               sqrt(abs(vd))*par.delta;
        
    end  
    
    
    
     L                =        LR_WNNM_Main(d_im, par);% Low rank
 
    x                 =        ((par.mu*par.nSig^2*n_im + v^2*L+ par.rou*par.mu*par.nSig^2*v^2*(z +c)))/...
                                (par.mu*par.nSig^2+ v^2+ par.rou*par.mu*par.nSig^2*v^2);       
                     
    x                 =        BDCT_project_onto_QCS(x, par.C_q, par.QTable, par.Qfactor, par.blockSize);                       
                                   
    z                 =        FFD_Net_Denoiser (x - c, par.nSig); %FFDNet 
       
    c                 =         c - (x-z);                    
                      
     All_PSNR(j)      =         csnr(x,ori_im,0,0); 
    
    LR_FFDNet_Results{j}      =     x;
    
    
    fprintf('iter number = %d, PSNR = %f, SSIM = %f\n',j,csnr(x,ori_im,0,0),cal_ssim(x,ori_im,0,0));
    
    
     if j>1
         
   diff      =  norm(abs(LR_FFDNet_Results{j}) - abs(LR_FFDNet_Results{j-1}),'fro')/norm(abs(LR_FFDNet_Results{j-1}), 'fro');    
   

        if  diff < err_or
            
            break;
            
        end
        
     end
     
     
     
    
end

reconstructed_image                      =                   LR_FFDNet_Results{j};

PSN_Result                               =                   csnr(reconstructed_image,ori_im,0,0);

FSIM_Result                              =                   FeatureSIM(reconstructed_image,ori_im);

SSIM_Result                              =                   cal_ssim(reconstructed_image,ori_im,0,0);

end

