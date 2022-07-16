 screen 21
 dim shared as single j=200 'window
 dim shared as single  Kmx,Kmy
window(-j+0,-j*.75)-(j+0,j*.75)

dim shared as double x,dy ,a,df ,df2
dim as double Rglue ,Rgquadro
dim as double Reciproq_Rgquadro
dim as double R0
dim as double  Ri6
for x=0 to 900 step 10
 Line (x,00)-(x,60),11
 next x

for x=0 to 900 step 50
 Line (x,0)-(x,60),9
 next x

for x=10 to 210 step  .01    
                R0=.100 
                  Rgquadro=x*x
                  Rglue=sqr (Rgquadro)

              '     if ( Rglue< Rmin)  then Rmin =Rglue
                 '  RCPRglue=1/Rglue
                   Ri6 =(Rgquadro*Rgquadro)*(Rgquadro *0.00000000025)
                   df=(1/Ri6)-(1/(Ri6*Ri6))       rem  lennard jones  
                   df2=(.25/Ri6)-(.25/(Ri6*Ri6))       rem  lennard jones  inter_material
                  '   df=100000*(x-R0)/(R0*R0)
                  
                 
   
                  pset (x,0),7              
                pset (x,0-df*100),14
                pset (x,0-df2*100),13
             '   circle(x,0-df*100),2,14
             circle (0,0),100,12  
             Line (0,0)-(-40,0),4  
                
next x
sleep 15000