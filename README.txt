This demo applies the H-PnP to image restoration, including image deblurring, image CS and image deblocking.

When you use this demo, please first load software package "matconvnet".

Currently, this demo can be directly runned by using any CPU 
and this version is slow version, if you want to accelerate speed, please do the following operator:

In function "FFD_Net_Denoiser.m", 
please transform " res    = vl_ffdnet_matlab(net, input);"
to "  res    = vl_simplenn(net,input,[],[],'conserveMemory',true,'mode','test')".

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Then, you can directy run 

"H_PnP_Deblur_Demo.m" for image deblurring task.

"H_PnP_CS_Demo.m" for image CS task.

"H_PnP_Deblock_Demo.m" for image Deblocking task.