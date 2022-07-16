__kernel void FloatTestKernel (  __global  float    * x ,          //arg0                
                                 __global  float    * y ,          //arg1                 
                                 __global  float    * z ,          //arg2                  
                                 __global  float   * vx ,         //arg3                  
                                 __global  float   * vy ,         //arg4                
                                 __global  float   * vz ,         //arg5               
                                 __global  float   * ax ,         //arg6                  
                                 __global  float   * ay ,         //arg7                
                                 __global  float   * az ,         //arg8               
                                 __global  float   * CLR,        //arg9              
                                 __global  float * MASS,        //arg10               
                                 __global  float * MATERIAL,    //arg11                 
                                unsigned int    N_OBJ ,         //arg12              
                                 float PROBE    ,               //arg13              
                               float dt   ,                     //arg14              
                                __global  float * gout       )    //last arg          
                                                                                       
                                                                                       
   {                                                                                   
                 
         unsigned int n = get_global_id(0);                                            
          float  Ri6;    //                                                                           
         float df ;  float  Dist  ;                        
        float Rmin =777;                                                                                                                       
          x[n]=x[n]+ dt*( vx[n] + ax[n]*dt*.5 )  ;  //verlet                                 
          y[n]=y[n]+ dt*( vy[n] + ay[n]*dt*.5 )  ;  //verlet                 
             float x_n=x[n];   float y_n=y[n];                                                                    
        float  new_ay=0;      float  new_ax=0;                                                                                                                                                
           for (int m = 0; m <     N_OBJ  ; m++)                                     
             {                                                                         
                float     dx=x[m]-x_n;                                          
                  if   ( fabs(dx ) > 70)    continue;     //45%                            
                float     dy=y[m]-y_n ;                                                           
                   if   ( fabs(dy ) > 70)    continue;     //45%                            
                float Rgquadro=dx*dx+dy*dy ;  // CLR[0]=N_OBJ;                          
                if   (      Rgquadro >4900)    continue;    // (Pi/4)%                   
                if ( m == n) continue;     //ignore force to self  (100/N_OBJ %  )        
                  Dist = native_sqrt (Rgquadro)  ;          //     native_             
                if ( Dist< Rmin)                                                         
                {  Rmin= Dist;  gout[0]=Rmin; gout[1]= n;  gout[2]=m; }   ;         
                Ri6 =(Rgquadro*Rgquadro)*(Rgquadro *0.00000000025);                     
               if   ( MATERIAL[n ] ==MATERIAL[m ])                                                                          
                       { df=(1/Ri6)-(1/(Ri6*Ri6)) ;} //        
              else      { df=(.25/Ri6)-(.25/(Ri6*Ri6)) ;}                                                                
              df=df*MASS[m] ;                                                          
              new_ax=new_ax+df*dx ; new_ay=new_ay+df*dy;   // acc force from near m                            
                                    }                                                  
            vx[n]=vx[n]+ (new_ax+ax[n])*dt*.5;     //verlet                                          
            vy[n]=vy[n]+ (new_ay+ay[n])*dt*.5;      //verlet                                         
                 ax[n]=new_ax;            ay[n]= new_ay;                            
                 
       //      vx[n]=vx[n]+ax[n]*dt ; vy[n]=vy[n]+ay[n]*dt ;                                   
     //       vx[n]=vx[n]*(1-dt*.01)  ; vy[n]=vy[n]*(1-dt*.01) ;  //rem DIssipation  
     //        x[n] = x[n]+vx[n]*dt;   y[n] = y[n]+vy[n]*dt;                            
              CLR[n]=4*sqrt(ax[n]*ax[n]+ay[n]*ay[n]);   //ACC to color                                                                                 
                   }                                                                       