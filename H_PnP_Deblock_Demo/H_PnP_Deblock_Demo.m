clc
clear
m_10_1=0; 
m_10_2=0; 
m_10_3=0; 
m_20_1=0; 
m_20_2=0; 
m_20_3=0; 
m_30_1=0; 
m_30_2=0; 
m_30_3=0; 
m_40_1=0;
m_40_2=0; 
m_40_3=0; 
m_50_1=0;
m_50_2=0; 
m_50_3=0; 
m_75_1=0;
m_75_2=0; 
m_75_3=0; 
m_100_1=0;
m_100_2=0; 
m_100_3=0; 

All_data_Results_10_1 = cell(1,200);
All_data_Results_10_2 = cell(1,200);
All_data_Results_10_3 = cell(1,200);

All_data_Results_20_1 = cell(1,200);
All_data_Results_20_2 = cell(1,200);
All_data_Results_20_3 = cell(1,200);

All_data_Results_30_1 = cell(1,200);
All_data_Results_30_2 = cell(1,200);
All_data_Results_30_3 = cell(1,200);

All_data_Results_40_1 = cell(1,200);
All_data_Results_40_2 = cell(1,200);
All_data_Results_40_3 = cell(1,200);

All_data_Results_50_1 = cell(1,200);
All_data_Results_50_2 = cell(1,200);
All_data_Results_50_3 = cell(1,200);

All_data_Results_75_1 = cell(1,200);
All_data_Results_75_2 = cell(1,200);
All_data_Results_75_3 = cell(1,200);

All_data_Results_100_1 = cell(1,200);
All_data_Results_100_2 = cell(1,200);
All_data_Results_100_3 = cell(1,200);



for i = 1:5
ImageNum =i;

switch ImageNum
          case 1
                filename = '201';
            case 2
                filename = '202';
            case 3
                filename = '203';
            case 4
                filename = '204';    
            case 5
                filename = '205'; 
                
            case 6
                filename = '206';
            case 7
                filename = '207';
            case 8
                filename = '208';
            case 9
                filename = '209';    
            case 10
                filename = '210'; 
                
            case 11
                filename = '211';
            case 12
                filename = '212';
            case 13
                filename = '213';     
                
            case 14
                filename = '214';
            case 15
                filename = '215';
            case 16
                filename = '216';
            case 17
                filename = '217';    
            case 18
                filename = '218'; 
                
            case 19
                filename = '219';
            case 20
                filename = '220';
                
            case 21
                filename = '221';                     
            case 22
                filename = '222';
            case 23
                filename = '223';
            case 24
                filename = '224';
            case 25
                filename = '225';    
            case 26
                filename = '226';                
            case 27
                filename = '227';
            case 28
                filename = '228';
            case 29
                filename = '229';    
            case 30
                filename = '230';   
                
            case 31
                filename = '231';                     
            case 32
                filename = '232';
            case 33
                filename = '233';
            case 34
                filename = '234';
            case 35
                filename = '235';    
            case 36
                filename = '236';                
            case 37
                filename = '237';
            case 38
                filename = '238';
            case 39
                filename = '239';    
            case 40
                filename = '240';  
                
            case 41
                filename = '241';                     
            case 42
                filename = '242';
            case 43
                filename = '243';
            case 44
                filename = '244';
            case 45
                filename = '245';    
            case 46
                filename = '246';                
            case 47
                filename = '247';
            case 48
                filename = '248';
            case 49
                filename = '249';    
            case 50
                filename = '250';  
                          
            case 51
                filename = '251';                     
            case 52
                filename = '252';
            case 53
                filename = '253';
            case 54
                filename = '254';
            case 55
                filename = '255';    
            case 56
                filename = '256';                
            case 57
                filename = '257';
            case 58
                filename = '258';
            case 59
                filename = '259';    
            case 60
                filename = '260';   
                
            case 61
                filename = '261';                     
            case 62
                filename = '262';
            case 63
                filename = '263';
            case 64
                filename = '264';
            case 65
                filename = '265';    
            case 66
                filename = '266';                
            case 67
                filename = '267';
            case 68
                filename = '268';
            case 69
                filename = '269';    
            case 70
                filename = '270';        
                
            case 71
                filename = '271';                     
            case 72
                filename = '272';
            case 73
                filename = '273';
            case 74
                filename = '274';
            case 75
                filename = '275';    
            case 76
                filename = '276';                
            case 77
                filename = '277';
            case 78
                filename = '278';
            case 79
                filename = '279';    
            case 80
                filename = '280';                  
                  
                
             case 81
                filename = '281';                     
            case 82
                filename = '282';
            case 83
                filename = '283';
            case 84
                filename = '284';
            case 85
                filename = '285';    
            case 86
                filename = '286';                
            case 87
                filename = '287';
            case 88
                filename = '288';
            case 89
                filename = '289';    
            case 90
                filename = '290';       
                
            case 91
                filename = '291';                     
            case 92
                filename = '292';
            case 93
                filename = '293';
            case 94
                filename = '294';
            case 95
                filename = '295';    
            case 96
                filename = '296';                
            case 97
                filename = '297';
            case 98
                filename = '298';
            case 99
                filename = '299';    
            case 100
                filename = '300';   
            
end



for j  =  1:11
    

filename    
randn ('seed',0);

JPEG_Quality_Num        =       [1, 5, 10, 20, 30, 40, 50, 60, 70, 80,90]; 



 IterNum                =    200;

JPEG_Quality             =       JPEG_Quality_Num(j)

QF                       =       JPEG_Quality;


 
 
 if JPEG_Quality <=1
     
     
     qfactor = 0.3;
     
     
 elseif JPEG_Quality <=5    
     
      qfactor = 0.3 ;   
     
 elseif JPEG_Quality <=10   
     
      qfactor = 0.3  ;  
          
     
     
  elseif JPEG_Quality <=20    
      
      qfactor = 0.25   ; 
           
     
 elseif JPEG_Quality <=30
     
      qfactor = 0.25   ;
          
     
     
 else
     
     
        qfactor = 0.25       
     
 end
     
     


 if  JPEG_Quality<= 1
     
     

         
     delta  = 0.2;      mu  =   0.01;   rou  =  1.3; c = 0.5;
     
  [Ori, QF,   delta, mu,  rou, c, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_H_PnP_Test(filename, QF, IterNum, delta, mu,  rou, c, qfactor);
 
 
 m_10_1= m_10_1+1;
 
 s=strcat('A',num2str(m_10_1));
 
 All_data_Results_10_1{m_10_1}={Ori, QF,   qfactor,   delta, mu,  rou, c,  Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 
 xlswrite('H_PnP_Deblock_1_test_BSD_100.xls', All_data_Results_10_1{m_10_1},'sheet1',s);
 
 
 
 
 
 elseif  JPEG_Quality<=5
     

 
         
     delta  = 0.2;      mu  =   0.03;   rou  =  0.8; c= 1;
     
 [Ori, QF,   delta, mu,  rou, c, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_H_PnP_Test(filename, QF, IterNum, delta, mu,  rou, c, qfactor);
 
 m_20_1= m_20_1+1;
 
 s=strcat('A',num2str(m_20_1));
 
 All_data_Results_20_1{m_20_1}={Ori, QF,   qfactor,   delta, mu,  rou, c,  Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('H_PnP_Deblock_5_test_BSD_100.xls', All_data_Results_20_1{m_20_1},'sheet1',s);
 
 
 
 
 
  elseif  JPEG_Quality<=10
     

         
     delta  = 0.7;      mu  =   0.09;   rou  = 0.4; c= 0.9;
     
 [Ori, QF,   delta, mu,  rou, c, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_H_PnP_Test(filename, QF, IterNum, delta, mu,  rou, c, qfactor);
 
 m_30_1= m_30_1+1;
 
 s=strcat('A',num2str(m_30_1));
 
 All_data_Results_30_1{m_30_1}={Ori, QF,   qfactor,   delta, mu,  rou, c,  Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('H_PnP_Deblock_10_test_BSD_100.xls', All_data_Results_30_1{m_30_1},'sheet1',s);
 
 
  


   elseif  JPEG_Quality<=20
     

         
     delta  = 0.5;      mu  =   0.2;   rou  =  0.2; c= 1;
     
 [Ori, QF,   delta, mu,  rou, c, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_H_PnP_Test(filename, QF, IterNum, delta, mu,  rou, c, qfactor);
 
 m_40_1= m_40_1+1;
 
 s=strcat('A',num2str(m_40_1));
 
 All_data_Results_40_1{m_40_1}={Ori, QF,   qfactor,   delta, mu,  rou, c,  Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('H_PnP_Deblock_20_test_BSD_100.xls', All_data_Results_40_1{m_40_1},'sheet1',s);
 
 
  
 



 elseif  JPEG_Quality<=30
     

         
     delta  = 0.7;      mu  =   0.2;   rou  =  0.9; c= 1.1;
     
 [Ori, QF,   delta, mu,  rou, c, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_H_PnP_Test(filename, QF, IterNum, delta, mu,  rou, c, qfactor);
 
 m_50_1= m_50_1+1;
 
 s=strcat('A',num2str(m_50_1));
 
 All_data_Results_50_1{m_50_1}={Ori, QF,   qfactor,   delta, mu,  rou, c,  Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('H_PnP_Deblock_30_test_BSD_100.xls', All_data_Results_50_1{m_50_1},'sheet1',s);
 
 
  
 


 
 
 elseif  JPEG_Quality<=40
     
     

     delta  = 0.8;      mu  =   0.2;   rou  =  0.9; c= 0.9;
     
 [Ori, QF,   delta, mu,  rou, c, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_H_PnP_Test(filename, QF, IterNum, delta, mu,  rou, c, qfactor);
 
 m_75_1= m_75_1+1;
 
 s=strcat('A',num2str(m_75_1));
 
 All_data_Results_75_1{m_75_1}={Ori, QF,   qfactor,   delta, mu,  rou, c,  Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('H_PnP_Deblock_40_test_BSD_100.xls', All_data_Results_75_1{m_75_1},'sheet1',s);
 
 

 else
     
     
     
      delta  = 0.8;      mu  =   0.2;   rou  =  0.9; c= 0.9;
     
 [Ori, QF,   delta, mu,  rou, c, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_H_PnP_Test(filename, QF, IterNum, delta, mu,  rou, c, qfactor);
 
 m_100_3= m_100_3+1;
 
 s=strcat('A',num2str(m_100_3));
 
 All_data_Results_100_3{m_100_3}={Ori, QF,   qfactor,   delta, mu,  rou, c,  Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('H_PnP_Deblock_test_BSD_100.xls', All_data_Results_100_3{m_100_3},'sheet1',s);
  
     
     
 
 

 end
 

clearvars -except filename i m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end
clearvars -except filename m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end






         