function [filename, deblur_class,mu, lambda, thr, c, j, PSNR_Result,FSIM_Result,SSIM_Final,Time_s, Err_or]= Deblurring_H_PnP_Test(filename,IterNum,deblur_class, mu, lambda, thr, c, err_or)

        time0                     =                  clock;
 
        Orgname                   =                 [filename '.png'];
        
        X_RGB                     =                 imread(Orgname); 
        
        [www, hhh, kkk]           =                size(  X_RGB);
        
        
        X_RGB                     =                 imresize (X_RGB,[www-1, hhh-1]);
        
        if kkk ==3
         
        X_YUV                     =                 rgb2ycbcr(X_RGB);
        
        X                         =                 double(X_YUV(:,:,1)); 
        
        
        X_Inpaint_Re              =                zeros(size(X_YUV));
        
        X_Inpaint_Re(:,:,2)       =                X_YUV(:,:,2); 
        
        X_Inpaint_Re(:,:,3)       =                X_YUV(:,:,3); 
        
        else
            
            X                     =                double (X_RGB);
        end
        
              x_org                     =                  X;

        switch deblur_class
            
            case 1
                
                sigma            =                sqrt(2);
                
                v                =                ones(9); 
                
                v                =                v./sum(v(:));
                
            case 2
                
                sigma            =               sqrt(2);
                
                v                =               fspecial('gaussian', 25, 1.6);
        end
        
        % Create Blurring Operator
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [Xv, Xh]                 =              size(x_org);
        
        [ghy,ghx]                =              size(v);
        
        big_v                    =              zeros(Xv,Xh); 
        
        big_v(1:ghy,1:ghx)       =              v;
        
        big_v                    =              circshift(big_v,-round([(ghy-1)/2 (ghx-1)/2])); % pad PSF with zeros to whole image domain, and center it
        
        h                        =              big_v;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        y_blur                   =             imfilter(x_org, v, 'circular');
        
        
        % Fix random seed
        randn('seed',0);
        % Observed Blurred Image
        y                       =             y_blur + sigma*randn(Xv,Xh);
        
        Opts = [];
    
        Opts.org                =             x_org;
        
        
        
        if ~isfield(Opts,'max_iterations')
            Opts.IterNums = IterNum;
        end
        
        if ~isfield(Opts,'initial')
            Opts.initial = y;
        end
        
        if ~isfield(Opts,'block_size')
            Opts.patch = 7;
        end
        
        if ~isfield(Opts,'mu')
            Opts.mu = mu;
        end
        
         if ~isfield(Opts,'lambda')
            Opts.lambda = lambda;
         end
         
         if ~isfield(Opts,'thr')
            Opts.thr = thr;
         end     
         
         if ~isfield(Opts,'c')
            Opts.c = c;
         end      
         
  
         
         if ~isfield(Opts,'Region')
            Opts.Region = 25;
         end
        
        if ~isfield(Opts,'step')
            Opts.step = 4;
        end
        if ~isfield(Opts,'Similar_patch')
            Opts.Similar_patch = 60;
        end    
        
        if ~isfield(Opts,'sigma')
            Opts.sigma = sqrt(2);
        end
        
        if ~isfield(Opts,'e')
            Opts.e = 0.35;
        end
        
        
        fprintf('***************************************************************\n')
        fprintf('***************************************************************\n')
        fprintf('H-PnP Algorithm for Image Deblurring ...\n')
        
        [reconstructed_image, PSNR_Result,FSIM_Result,SSIM_Final,All_PSNR,j, Err_or]   =   H_PnP_Deblurring_Main (y, h, Opts, err_or);
        
        Time_s =(etime(clock,time0)); 
        
        if  kkk ==3
                   
        X_Inpaint_Re(:,:,1)              =                uint8(reconstructed_image);
        
        X_Inpainting_Re                  =                ycbcr2rgb(uint8(X_Inpaint_Re));
        
        else
            
            X_Inpainting_Re              =                reconstructed_image;
        end
        
        
        if  deblur_class==1
            
        Final_Name= strcat(filename,'_H_PnP_BSD_68_Uniform_','_PSNR_',num2str(PSNR_Result),'_FSIM_',num2str(FSIM_Result),'_SSIM_',num2str(SSIM_Final),'.png');
        
        imwrite(uint8(X_Inpainting_Re),strcat('./Uniform_Results/',Final_Name));
        
   
        
        else
            
        Final_Name= strcat(filename,'_H_PnP_BSD_68_Gaussian_','_PSNR_',num2str(PSNR_Result),'_FSIM_',num2str(FSIM_Result),'_SSIM_',num2str(SSIM_Final),'.png');
        
        imwrite(uint8(X_Inpainting_Re),strcat('./Gaussian_Results/',Final_Name));
        
  
        
        end
        
        
        
        
     
end
        


