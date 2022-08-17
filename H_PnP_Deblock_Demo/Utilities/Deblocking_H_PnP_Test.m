function  [filename, QF, delta, mu,  rou, c, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diffff, Time_s]= Deblocking_H_PnP_Test(filename, QF, IterNum, delta, mu, rou, c,qfactor)

               fn               =     [filename, '.jpg'];

                I                =     imread(fn);
                
           %      I                   =    imresize (I, [256, 256]);   
                

               [hhh, wwww, kk]        =     size (I);
               
                I                   =    imresize (I, [hhh-1, wwww-1]);   
     
                colorI           =     I;

              if kk==3
    
                     I           =      rgb2gray (I);
          
                     y_yuv       =      rgb2ycbcr(colorI);                     
                     
                x_2_yuv(:,:,2)   =       y_yuv(:,:,2); % Copy U Componet
                  
                x_2_yuv(:,:,3)   =       y_yuv(:,:,3); % Copy V Componet                   
              end 
              
              
              
                  par.I     =     double( I );
       
                 [W, H]     =     size(par.I);
                 
                 randn('seed',0);
                 
                 JPEG_Quality       =    QF;
                 
                 JPEG_Name    = 'My_test.jpg';        
                  
           imwrite(uint8(par.I),JPEG_Name,'Quality',JPEG_Quality);
           
        par.nim          =    double(imread(JPEG_Name));
        
        JPEG_info = imfinfo(JPEG_Name);
        
        bpp = JPEG_info.FileSize*8/(W*H)
        
        JPEG_Name_Com = strcat(fn,'_Quality_',num2str(JPEG_Quality),'_JPEG_PSNR_',num2str(csnr( par.nim ,par.I,0,0)),'dB.tif');
        
        imwrite(uint8(par.nim ),strcat('JPEG_Results\',JPEG_Name_Com));      
        
        Inital_psnr          =    csnr( par.nim ,par.I,0,0);
        
      fprintf('JPEG, PSNR = %f\n', Inital_psnr );
                
        JPEG_header_info     =       jpeg_read(JPEG_Name);
        
        par.QTable           =       JPEG_header_info.quant_tables{1};
        
        par.blockSize        =       8;

        par.C_q              =       blkproc(par.nim , [8 8], 'dct2');
        
        meanQuant            =       mean(mean(par.QTable(1:3,1:3)));
        
        par.nSig             =       sqrt(0.69*meanQuant^1.3);        
        
        par.IterNum          =        IterNum;
        
        par.Qfactor          =        qfactor;
        
         par.delta           =        delta;
        
        par.mu           =        mu;
        
        par.rou              =        rou;
        
        par.c                =        c;
        
        par.patch            =        7;
        
        par.Region           =        25;
           
        par.Sim              =       60;
              
        par.step             =        4;        
        
        par.e                =        0.25;
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
                  
        disp('H-PnP Algorithm for Deblocking......\n');
        

        time0                       =              clock;
        
        [re_con, PSNR_Final,FSIM_Final,SSIM_Final, All_PSNR, diffff, jj]  =  H_PnP_Deblocking_Main(par.nim, par, JPEG_Quality);
        
        Time_s                         =                 (etime(clock,time0)); 
        
              if kk  ==3
              
               x_2_yuv(:,:,1)            =                          uint8(re_con);
               
            JPG_SR_Re                  =                          ycbcr2rgb(uint8(x_2_yuv));   
              end      
              
             
                                
        

if JPEG_Quality==1
    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
 


if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_1_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_1_Result/',Final_1));

end


elseif JPEG_Quality==5

    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_5_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_5_Result/',Final_1));

end



elseif JPEG_Quality==10

    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_10_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_10_Result/',Final_1));

end


elseif JPEG_Quality==15

    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_15_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_15_Result/',Final_1));

end



elseif JPEG_Quality==20

    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_20_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_20_Result/',Final_1));

end



elseif JPEG_Quality==30

    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_30_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_30_Result/',Final_1));

end


elseif JPEG_Quality==40
    
    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_40_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_40_Result/',Final_1));

end


elseif JPEG_Quality==50
    
    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_50_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_50_Result/',Final_1));

end


elseif JPEG_Quality==60
    
    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_60_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_60_Result/',Final_1));

end


elseif JPEG_Quality==70
    
    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_70_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_70_Result/',Final_1));

end



elseif JPEG_Quality==80


    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_80_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_80_Result/',Final_1));

end


else
    
    
Final_1= strcat(filename,'_H_PnP_BSD100_','JQ_',num2str(JPEG_Quality),'_qfactor_',num2str(qfactor),'_PSNR_',num2str(PSNR_Final),  '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');

if kk==3

imwrite(uint8(JPG_SR_Re),strcat('./JQ_90_Result/',Final_1));

else
imwrite(uint8(re_con),strcat('./JQ_90_Result/',Final_1));

end


end
        
        

end

