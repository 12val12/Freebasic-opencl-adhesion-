' file: template.bas
 #include "windows.bi"
#include "cl.bi"
#ifndef NULL
#define NULL cptr(any ptr,0)
#endif
 screen 21,32
 

 
 dim shared  as double  frametime 
  dim shared as single j=5000:  window(-j,-j*.75)-(j,j*.75) 'window
  dim shared as Uinteger MY_event=0
  dim shared as single  Kmx,Kmy
  dim shared as Uinteger Ncntr=0
dim shared as ulong N_OBJ=8192    ' N_OBJ =    X*256

'Var for measuring strain

  dim shared as single Avg_distanse_start      
  dim shared as single Avg_distanse 
  dim shared as single strain
  dim shared as single step_hor_for_strain=124
  dim shared as single MAX_strain
  
'Var for timing  
dim shared as float GlobalTime

 dim as single dt_init=.0005    
 dim shared as single  x_reserv (N_OBJ )  :dim shared as  single y_reserv (N_OBJ)
dim shared  as long Index_global , Counter
dim shared  as long  x_mouse, y_mouse,  buttons_mouse
dim shared  as long  x_mouse_world, y_mouse_world 


' GLOBALS
' Input data is stored here.

dim shared as cl_float ptr  g_x_input
dim shared as cl_float ptr  g_y_input
dim shared as cl_float ptr  g_z_input

dim shared as cl_float ptr g_vx_input
dim shared as cl_float ptr g_vy_input
dim shared as cl_float ptr g_vz_input

dim shared as cl_float ptr g_ax_input
dim shared as cl_float ptr g_ay_input
dim shared as cl_float ptr g_az_input

dim shared as cl_float ptr g_CLRinput
dim shared as cl_float ptr g_MASSinput
dim shared as cl_float ptr g_MATERIALinput
' Output data is stored here.
dim shared as cl_float ptr    g_output


' Mult_ipler is stored in this variable
dim shared as cl_float       g_multiplier
dim shared as cl_uint        g_N_OBJ
dim shared as cl_float       PROBE
dim shared as cl_float       g_dt
' problem size (width) for 1D algorithm
dim shared as cl_uint      g_width
' problem size for 2D algorithm (width x height)
dim shared as cl_uint      g_height


' The memory buffer that is used
' as input/output for OpenCL kernel

dim shared as cl_mem             g_x_inputBuffer
dim shared as cl_mem             g_y_inputBuffer
dim shared as cl_mem             g_z_inputBuffer

dim shared as cl_mem            g_vx_inputBuffer
dim shared as cl_mem            g_vy_inputBuffer
dim shared as cl_mem            g_vz_inputBuffer

dim shared as cl_mem            g_ax_inputBuffer
dim shared as cl_mem            g_ay_inputBuffer
dim shared as cl_mem            g_az_inputBuffer

dim shared as cl_mem            g_CLRinputBuffer
dim shared as cl_mem            g_MASSinputBuffer
dim shared as cl_mem            g_MATERIALinputBuffer
dim shared as cl_mem               g_outputBuffer




dim shared as cl_context        g_context
dim shared as cl_device_id ptr  g_devices
dim shared as cl_command_queue  g_commandQueue
dim shared as cl_program        g_program



declare sub  REDRAW_SCREEN  ()
declare sub  key_proc( )
declare Sub interact_mouse( )
declare Function  CLR_Gradient (Byval highest As float, Byval CLR As float,Byval lowest As float) As uInteger
declare        Function Search_index (Byval XSearch As integer , Byval YSearch As integer  ) As Integer 
declare Function Distance ( Byval n As long ,Byval m As long ) As single 
  
' This program uses only one kernel
' and this serves as a handle to it
dim shared as cl_kernel         g_kernel
                     
' FUNCTION DECLARATIONS
' OpenCL related initialisations are done here.
' Context, Device list, Command Queue are set up.
' Calls are made to set up OpenCL memory buffers that this program uses
' and to load the programs into memory and get kernel handles.
declare sub initializeCL()

' This is called once the OpenCL context, memory etc. are set up,
' the program is loaded into memory and the kernel handles are ready.
' It sets the values for kernels' arguments and enqueues calls to the kernels
' on to the command queue and waits till the calls have finished execution.
'
' It also gets kernel start and end time if profiling is enabled.
declare sub runCLKernels()
' Releases OpenCL resources (Context, Memory etc.)
declare sub cleanupCL()
' Releases program's resources
declare sub cleanupHost()
' Prints no more than 256 elements of the given array.
' Prints full array if length is less than 256.
' Prints Array name followed by elements.
declare sub print1DArray(arrayName as string, _
                         arrayData as integer ptr, _
                         length    as uinteger)

declare sub print1DFloatArray(arrayName as string, _
                              arrayData as cl_float ptr, _
                              length    as uinteger)






' Host Initialization
' Allocate and initialize memory on the host
sub initializeHost
  print "initializeHost"
  g_width  = 32
  rem g_xinput  = NULL
  rem g_output = NULL
  g_multiplier = 2
  g_N_OBJ=N_OBJ

  ' Allocate and initialize memory used by host
  dim as cl_uint sizeInBytes =( N_OBJ* sizeof(cl_float) )
  
  ' ========  allocate  for INPUT
  
    
    'Pos
      g_x_input = callocate(sizeInBytes)
  if (g_x_input= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if
    
      g_y_input = callocate(sizeInBytes)
  if (g_y_input= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if  
    
      g_z_input = callocate(sizeInBytes)
  if (g_z_input= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if  
    
    'Vel
       g_vx_input = callocate(sizeInBytes)
    if (g_vx_input= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if
    
        g_vy_input = callocate(sizeInBytes)
    if (g_vy_input= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if  
    
        g_vz_input = callocate(sizeInBytes)
    if (g_vz_input= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if  
    
    ' Ac
         g_ax_input = callocate(sizeInBytes)
    if (g_ax_input= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if
    
        g_ay_input = callocate(sizeInBytes)
    if (g_ay_input= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if  
    
        g_az_input = callocate(sizeInBytes)
    if (g_az_input= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if    
    
    
    
    
        g_CLRinput = callocate(sizeInBytes)
    if (g_CLRinput= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if  
    
        g_MASSinput = callocate(sizeInBytes)
    if (g_MASSinput= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if  
 
            g_MATERIALinput = callocate(sizeInBytes)
    if (g_MASSinput= NULL) then
    print "Error: Failed to allocate input memory on host" :return: end if  
    ' ========  allocate  for OUTPUT
  
  g_output = callocate(sizeInBytes)
  if (g_output=NULL) then
     print "Error: Failed to allocate output memory on host":return:end if
     


' =========== end allocate 

  

' !! 
          
   rem particle up  to   N_OBJ-1 
   
end sub   'end initialisation Host

' OpenCL related initialization
' Create Context, Device list, Command Queue
' Create OpenCL memory buffer objects
'  CL code, compile, link CL source
' Build program and kernel objects
sub initializeCL                                             rem  dont touch
  print "initializeCL"                                       rem  dont touch
  dim as cl_int status = 0                                   rem  dont touch
  dim as size_t deviceListSize                               rem  dont touch
                                                             rem  dont touch
  dim as cl_uint numPlatforms                                rem  dont touch
  status = clGetPlatformIDs(0, NULL, @numPlatforms)          rem  dont touch
  if (status<>CL_SUCCESS) or (numPlatforms<1) then           rem  dont touch
    print "Error: Getting Platforms. (clGetPlatformsIDs)"    rem  dont touch
    return                                                   rem  dont touch
  end if                                                     rem  dont touch
                                                             rem  dont touch
  dim as cl_platform_id platform                             rem  dont touch
  status = clGetPlatformIDs(1, @platform, NULL)              rem  dont touch
  if (status<>CL_SUCCESS) then                               rem  dont touch
    print "Error: Getting Platform Ids.(clGetPlatformsIDs)"  rem  dont touch
    return                                                   rem  dont touch
  end if                                                     rem  dont touch
                                                             rem  dont touch
                                                             rem  dont touch
  dim as cl_context_properties cps(2)                        rem  dont touch
  cps(0) = CL_CONTEXT_PLATFORM                               rem  dont touch
  cps(1) = cast(cl_context_properties, platform)             rem  dont touch
  cps(2) = NULL                                              rem  dont touch
  ' Create an OpenCL context from platform ID                rem  dont touch
  g_context = clCreateContextFromType(@cps(0), _             rem  dont touch
                                      CL_DEVICE_TYPE_GPU, _  rem  dont touch
                                      NULL, _                rem  dont touch
                                      NULL, _                rem  dont touch
                                      @status)               rem  dont touch
  if (status<>CL_SUCCESS) then                               rem  dont touch
    print "Error: Creating Context. (clCreateContextFromType)"  rem  dont touch
    return                                                   rem  dont touch
  end if                                                     rem  dont touch
                                                             rem  dont touch
  ' First, get the size of device list data                  rem  dont touch
  status = clGetContextInfo(g_context, _                     rem  dont touch
                            CL_CONTEXT_DEVICES, _            rem  dont touch
                            0, _                             rem  dont touch
                            NULL, _                          rem  dont touch
                            @deviceListSize)                 rem  dont touch
  if(status <> CL_SUCCESS) then                              rem  dont touch
    print "Error: Getting Context Info (device list size, clGetContextInfo)"   rem  dont touch
    return                                                   rem  dont touch
  else                                                       rem  dont touch
    print "Info: deviceListSize = " & deviceListSize         rem  dont touch
  end if                                                     rem  dont touch
                                                             rem  dont touch
  ' Detect OpenCL devices                                    rem  dont touch
  g_devices = callocate(deviceListSize)                      rem  dont touch
  ' Now, get the device list data                            rem  dont touch
  status = clGetContextInfo(g_context, _                     rem  dont touch
                            CL_CONTEXT_DEVICES, _            rem  dont touch
                            deviceListSize, _                rem  dont touch
                            g_devices, _                     rem  dont touch
                            NULL)                            rem  dont touch
  if (status<>CL_SUCCESS) then                               rem  dont touch
    print "Error: Getting Context Info (device list, clGetContextInfo)"     rem  dont touch
    return                                                   rem  dont touch
  end if                                                     rem  dont touch
                                                             rem  dont touch
  ' Create an OpenCL command queue                           rem  dont touch
  g_commandQueue = clCreateCommandQueue(g_context, _         rem  dont touch
                                        g_devices[0], _      rem  dont touch
                                        0, _                 rem  dont touch
                                        @status)             rem  dont touch
  if (status<>CL_SUCCESS) then                               rem  dont touch 
    print "Creating Command Queue. (clCreateCommandQueue)"   rem  dont touch
    return                                                   rem  dont touch
  end if                                                     rem  dont touch
                                                             rem  dont touch
  ' Create OpenCL memory buffers
'  g_inputBuffer = clCreateBuffer(g_context, _                    ' Create OpenCL memory buffers
'                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
'                                 N_OBJ* sizeof(cl_float) , _
'                                 g_input, _
'                                 @status)
'  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (inputBuffer)"  :return:end if 
  'pos
    g_x_inputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_x_input, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (xinputBuffer)"  :return:end if
  
       g_y_inputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_y_input, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (yinputBuffer)"  :return:end if
  
        g_z_inputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_z_input, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (zinputBuffer)"  :return:end if
  
   'vel
         g_vx_inputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_vx_input, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (vxinputBuffer)"  :return:end if
  
         g_vy_inputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_vy_input, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (vyinputBuffer)"  :return:end if
  
         g_vz_inputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_vz_input, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (vzinputBuffer)"  :return:end if
  
  'acc
         g_ax_inputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_ax_input, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (vxinputBuffer)"  :return:end if
  
         g_ay_inputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_ay_input, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (vyinputBuffer)"  :return:end if
  
         g_az_inputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_az_input, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (vzinputBuffer)"  :return:end if

  'color
      g_CLRinputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_CLRinput, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (CLRinputBuffer)"  :return:end if

      g_MASSinputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_MASSinput, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (MASSinputBuffer)"  :return:end if

      g_MATERIALinputBuffer = clCreateBuffer(g_context, _                                      ' Create OpenCL memory buffers
                                 CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                  N_OBJ* sizeof(cl_float), _
                                 g_MATERIALinput, _
                                 @status)
  if (status<>CL_SUCCESS) then print "Error: clCreateBuffer (MASSinputBuffer)"  :return:end if

  g_outputBuffer = clCreateBuffer(g_context, _                                          ' Create OpenCL memory buffers
                                  CL_MEM_READ_WRITE or CL_MEM_USE_HOST_PTR, _
                                   N_OBJ* sizeof(cl_float), _
                                  g_output, _
                                  @status)
  if (status<>CL_SUCCESS) then  print "Error: clCreateBuffer (outputBuffer)":return:end if

           rem End create buff 
  

 
'   My_kernel.cl      in folder
  ' build CL program object    >    create CL kernel object     
dim as integer fnum  :fnum = freefile() 
var code_cl_kern = ""
if open ("My_kernel.cl", for input, as #fnum) <>0 then
      print "Error: Not Found(My_kernel.c) !" 
      beep:sleep:return  :
      end
endif
	code_cl_kern = input(lof(fnum), fnum)
close fnum

  dim as zString ptr pSource = strptr(code_cl_kern)                     rem  dont touch
  dim as size_t nChars = len(code_cl_kern)                              rem  dont touch
  g_program = clCreateProgramWithSource(g_context, _                    rem  dont touch 
                                        1, _                            rem  dont touch
                                        @pSource, _                     rem  dont touch
                                        @nChars, _                      rem  dont touch
                                        @status)                        rem  dont touch
  if (status<>CL_SUCCESS) then                                          rem  dont touch
    print "Error: (clCreateProgramWithSource) !"                        rem  dont touch
    beep:sleep:return  :  end if                                        rem  dont touch
                                                                        rem  dont touch
                                                                        rem  dont touch
  ' create a cl program executable                                      rem  dont touch
  ' for the devices specified (one device in this case)                 rem  dont touch
  status = clBuildProgram(g_program, 1, g_devices, NULL, NULL, NULL)    rem  dont touch
  if (status<>CL_SUCCESS) then                                          rem  dont touch
    print "Error: Building Program (clBuildProgram)"                    rem  dont touch 
       beep:sleep:return  :  end if                                     rem  dont touch
                                                                        rem  dont touch
                                                                        rem  dont touch
  ' get a kernel object handle for                                      rem  dont touch
  ' a kernel with the given name                                        rem  dont touch
  g_kernel = clCreateKernel(g_program, "FloatTestKernel", @status)      rem  dont touch
  if (status<>CL_SUCCESS) then                                          rem  dont touch
    print "Error: Creating Kernel from program. (clCreateKernel)"       rem  dont touch
    beep:sleep:return  :  end if                                        rem  dont touch
end sub                                                                 rem  dont touch
                                                                        rem  dont touch
                                                                        rem  dont touch

' Run OpenCL program
' Bind host variables to kernel arguments
' Run the CL kernel
  sub runCLKernels ()
        rem print "runCLKernels"
        dim as cl_int status
        dim as cl_event events(1)
        dim as size_t globalThreads(1)
        dim as size_t localThreads(0)
        globalThreads(0) = N_OBJ
        localThreads(0)  =255
           ' Set appropriate arguments to the kernel
           'Pos
           status = clSetKernelArg(g_kernel, _            ' ARG 0
                                   0, _
                                   sizeof(cl_mem), _
                                   @g_x_inputBuffer)
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (x_input)"   :  beep:sleep:return  :  end if   
           status = clSetKernelArg(g_kernel, _           ' ARG 1
                                   1, _
                                   sizeof(cl_mem), _
                                   @g_y_inputBuffer)
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (y_input)"   :    beep:sleep:return  :  end if   
               status = clSetKernelArg(g_kernel, _          ' ARG 2
                                   2, _
                                   sizeof(cl_mem), _
                                   @g_z_inputBuffer)
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (z_input)" :    beep:sleep:return  :  end if   
             
          'Vel   
           status = clSetKernelArg(g_kernel, _               ' ARG 3
                                   3, _
                                   sizeof(cl_mem), _
                                   @g_vx_inputBuffer)
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (vx_input)"   :  beep:sleep:return  :  end if   
           status = clSetKernelArg(g_kernel, _                ' ARG 4
                                   4, _
                                   sizeof(cl_mem), _
                                   @g_vy_inputBuffer)
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (vy_input)"   :    beep:sleep:return  :  end if   
               status = clSetKernelArg(g_kernel, _               ' ARG 5
                                   5, _
                                   sizeof(cl_mem), _
                                   @g_vz_inputBuffer)
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (vz_input)" :    beep:sleep:return  :  end if   
           'Acc  
                     status = clSetKernelArg(g_kernel, _               ' ARG 6
                                   6, _
                                   sizeof(cl_mem), _
                                   @g_ax_inputBuffer)
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (ax_input)"   :  beep:sleep:return  :  end if   
           status = clSetKernelArg(g_kernel, _                ' ARG 7
                                   7, _
                                   sizeof(cl_mem), _
                                   @g_ay_inputBuffer)
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (ay_input)"   :    beep:sleep:return  :  end if   
               status = clSetKernelArg(g_kernel, _               ' ARG 8
                                   8, _
                                   sizeof(cl_mem), _
                                   @g_az_inputBuffer)
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (az_input)" :    beep:sleep:return  :  end if      
              
             'end acc
                         
             
               status = clSetKernelArg(g_kernel, _                  ' ARG 9
                                   9, _
                                   sizeof(cl_mem), _
                                   @g_CLRinputBuffer)
             if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (CLRinput)" :    beep:sleep:return  :  end if   
                 status = clSetKernelArg(g_kernel, _           ' ARG 10
                                   10, _
                                   sizeof(cl_mem), _
                                   @g_MASSinputBuffer)
             if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (massinput)" :    beep:sleep:return  :  end if 
                              status = clSetKernelArg(g_kernel, _           ' ARG 11
                                   11, _
                                   sizeof(cl_mem), _
                                   @g_MATERIALinputBuffer)
             if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (materialinput)" :    beep:sleep:return  :  end if 
           status = clSetKernelArg(g_kernel, _                  '    ARG 12 
                                   12, _
                                   sizeof(cl_uint ), _
                                   @g_N_OBJ )
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (N_OBJ)":    beep:sleep:return  :  end if   
           status = clSetKernelArg(g_kernel, _             '    ARG 13 
                                   13, _
                                   sizeof(cl_float ), _
                                   @PROBE )
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (PROBE)":    beep:sleep:return  :  end if    
                       status = clSetKernelArg(g_kernel, _             '    ARG 14 
                                   14, _
                                   sizeof(cl_float ), _
                                   @g_dt )
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (dt)":    beep:sleep:return  :  end if        
           status = clSetKernelArg(g_kernel, _             ' ARG 15 
                                   15, _
                                   sizeof(cl_mem), _
                                   @g_outputBuffer )
           if (status<>CL_SUCCESS) then
             print "Error: Setting kernel argument. (goutput)":    beep:sleep:return  :  end if   

           ' Enqueue a kernel run call.
           
           status = clEnqueueNDRangeKernel(g_commandQueue, _
                                           g_kernel, _
                                           1, _
                                           NULL, _
                                           @globalThreads(0), _
                                           @localThreads(0), _
                                           0, _
                                           NULL, _
                                           @events(0))
           if (status<>CL_SUCCESS) then
             print "Error: Enqueueing kernel onto command queue. (clEnqueueNDRangeKernel)"
             return
           end if

           ' wait for the kernel call to finish execution
           status = clWaitForEvents(1, @events(0))
           if (status<>CL_SUCCESS) then
             print "Error: Waiting for kernel run to finish. (clWaitForEvents)"
             return
           end if

           status = clReleaseEvent(events(0))
           if (status<>CL_SUCCESS) then
             print "Error: clReleaseEvent. (events[0])"
             return
           end if

           ' Enqueue readBuffer
           rem                         'Position
           status = clEnqueueReadBuffer(g_commandQueue, _
                                        g_x_inputBuffer, _
                                        CL_TRUE, _
                                        0, _
                                        N_OBJ * sizeof(cl_float), _
                                        g_x_input, _
                                        0, _
                                        NULL, _
                                        @events(1) )
                                          
                                          
             status = clEnqueueReadBuffer(g_commandQueue, _
                                        g_y_inputBuffer, _
                                        CL_TRUE, _
                                        0, _
                                        N_OBJ * sizeof(cl_float), _
                                        g_y_input, _
                                        0, _
                                        NULL, _
                                        @events(1) )                             
                                        
                                        'Velocity
             status = clEnqueueReadBuffer(g_commandQueue, _
                                        g_vx_inputBuffer, _
                                        CL_TRUE, _
                                        0, _
                                        N_OBJ * sizeof(cl_float), _
                                        g_vx_input, _
                                        0, _
                                        NULL, _
                                        @events(1) )
                                           
                                           
             status = clEnqueueReadBuffer(g_commandQueue, _
                                        g_vy_inputBuffer, _
                                        CL_TRUE, _
                                        0, _
                                        N_OBJ * sizeof(cl_float), _
                                        g_vy_input, _
                                        0, _
                                        NULL, _
                                        @events(1) )   
                                           
                                   status = clEnqueueReadBuffer(g_commandQueue, _
                                        g_outputBuffer, _
                                        CL_TRUE, _
                                        0, _
                                        N_OBJ * sizeof(cl_float), _
                                        g_output, _
                                        0, _
                                        NULL, _
                                        @events(1) )       
                                                                                                    
               status = clEnqueueReadBuffer(g_commandQueue, _
                                        g_CLRinputBuffer, _
                                        CL_TRUE, _
                                        0, _
                                        N_OBJ * sizeof(cl_float), _
                                        g_CLRinput, _
                                        0, _
                                        NULL, _
                                        @events(1) )   
                                        
          
                                        

'                      IF MULTIKEY  ( &h4E ) and MULTIKEY  ( &h2A ) THEN rem  + in  numeric keyboard
'                        MY_event =  MY_event +1
'                    while   (  MULTIKEY  ( &h4E ) and MULTIKEY  ( &h2A ) )
 '                   wend
'                        end if
'                   if   MY_event=1 then
'                      for Ncntr=0 to 15
'                       '  g_x_input[0]=-2000
'                       '  g_y_input[0]=-400
'                         g_vx_input[Ncntr]=400
'                         g_vy_input[Ncntr]=20
'                         g_MASSinput[Ncntr]=400
'                      next Ncntr  
'                        MY_event =  MY_event +1                         
'                    end if                    

          For n as integer =0 to N_OBJ-1
         g_vx_input[n]  =   g_vx_input[n]*(1-.1*g_dt) 
         g_vy_input[n]  =   g_vy_input[n]*(1-.1*g_dt)        
          NEXT n
      

 
  const  as single  End_froze_time=25
                    
  if        GlobalTime >( End_froze_time-2*g_dt) and GlobalTime <End_froze_time  then
          For n as integer =0 to N_OBJ-1
          x_reserv(n)=  g_x_input[n]
          y_reserv(n)=  g_y_input[n]            
          NEXT n
   
          ' initial_distanse__meassure 
               Avg_distanse_start =0
           For n as integer =2108 to 2169
            Avg_distanse_start =Distance(n,n+step_hor_for_strain)
         next  
          Avg_distanse_start=Avg_distanse_start/(2169-2108)
          
           'end  initial_distanse__meassure  
  end if
   
   
  if        GlobalTime > End_froze_time  then
    
                For cn as ulong =0 to 61
            g_x_input[cn] =  x_reserv(cn)
         '   g_y_input[cn] =  y_reserv(cn)       
          NEXT cn    
           
          static  as single abs_dl =0
                    abs_dl=abs_dl+.4* g_dt 
             For cn as ulong =8060 to 8121
             g_x_input[cn] =  x_reserv(cn)+abs_dl   
         NEXT cn   
                  '  g_y_input[cn] =  y_reserv(cn)   
         ' _distanse__meassure
                      Avg_distanse =0
           For n as integer =2108 to 2169
            Avg_distanse =Distance(n,n+step_hor_for_strain)
         next  
          Avg_distanse=Avg_distanse/(2169-2108) 
              'end  _distanse__meassure    
              
        strain=(Avg_distanse-Avg_distanse_start)/Avg_distanse_start  
       if    (strain>  MAX_strain)  Then  MAX_strain= strain                
                     
  end if             
                    
                    
                    
                 rem                         'Position   
           status = clEnqueueWriteBuffer(g_commandQueue, _
                                        g_x_inputBuffer, _
                                        CL_TRUE, _
                                        0, _
                                        N_OBJ * sizeof(cl_float), _
                                        g_x_input, _
                                        0, _
                                        NULL, _
                                        @events(1) )
                                           
                                           
             status = clEnqueueWriteBuffer(g_commandQueue, _
                                        g_y_inputBuffer, _
                                        CL_TRUE, _
                                        0, _
                                        N_OBJ * sizeof(cl_float), _
                                        g_y_input, _
                                        0, _
                                        NULL, _
                                        @events(1) )                             
                                         
                                        'Velocity
             status = clEnqueueWriteBuffer(g_commandQueue, _
                                        g_vx_inputBuffer, _
                                        CL_TRUE, _
                                        0, _
                                        N_OBJ * sizeof(cl_float), _
                                        g_vx_input, _
                                        0, _
                                        NULL, _
                                        @events(1) )
                                           
                                           
             status = clEnqueueWriteBuffer(g_commandQueue, _
                                        g_vy_inputBuffer, _
                                        CL_TRUE, _
                                        0, _
                                        N_OBJ * sizeof(cl_float), _
                                        g_vy_input, _
                                        0, _
                                        NULL, _
                                        @events(1) )                              
                                        


           if (status<>CL_SUCCESS) then
             print "Error: clEnqueueReadBuffer failed. (clEnqueueReadBuffer)"
           end if

           ' Wait for the read buffer to finish execution
           status = clWaitForEvents(1, @events(1))
           if (status<>CL_SUCCESS) then
             print "Error: Waiting for read buffer call to finish. (clWaitForEvents)"    ' !!!!!!!!!!!!
             return
           end if

           status = clReleaseEvent(events(1))
           if (status<>CL_SUCCESS) then
             print "Error: clReleaseEvent. (events[1])"
             return
           end if
end sub


' Release OpenCL resources (Context, Memory etc.)
sub cleanupCL
  print "cleanupCL"
  dim as cl_int status
  status = clReleaseKernel(g_kernel)
  if (status<>CL_SUCCESS) then
    print "Error: In clReleaseKernel"
    return
  end if
  status = clReleaseProgram(g_program)
  if (status<>CL_SUCCESS) then
    print "Error: In clReleaseProgram"
    return
  end if

  status = clReleaseMemObject(g_outputBuffer)
  if (status<>CL_SUCCESS) then
    print "Error: In clReleaseMemObject (outputBuffer)"
    return
  end if
  status = clReleaseCommandQueue(g_commandQueue)
  if (status<>CL_SUCCESS) then
    print "Error: In clReleaseCommandQueue"
    return
  end if
  status = clReleaseContext(g_context)
  if (status<>CL_SUCCESS) then
    print "Error: In clReleaseContext"
    return
  end if
end sub

' Releases program's resources
sub cleanupHost ()
 print "cleanupHost"

  if (g_output<>NULL) then
    deallocate g_output
    g_output = NULL
  end if
  if (g_devices<>NULL) then
    deallocate g_devices
    g_devices = NULL
  end if
end sub



' ====================================MAIN============================================
' main
'
' Initialize Host application

initializeHost()   '( init array)

'dim  shared        As Const single Base_Size=39.37'(mikrometr )     work
dim  shared        As Const single Base_Size=38.82   '(mikrometr )     work
dim  shared       As Const single  mass=512e-12  '  mass=4e-5*4e-5*4e-5 *8000
dim   shared as single  VisualParticleSize 
                    VisualParticleSize =0.45*Base_Size
      dim as integer  ss=0
     dim as ulong  n=0
     dim  as single  xs,ys         ' single
     
     
                  '     rem test
                  '       for  xs=-1000  to  1000 step (Base_Size )*.866025
                  '     if  ss<>0 then ss=0 else ss=1
                  '     for  ys=-1000 to 1000 step Base_Size  
                            
                  '        g_y_input[n]=ys
                  '        g_x_input[n]=xs 
                  '        g_z_input[n]=0 
                  '        g_MASSinput[n]=400
                  '        g_MATERIALinput[n]=1
                  '                 IF  ss=1 THEN g_y_input[n]=ys+Base_Size/4
                  '                 If  ss=0 THEN g_y_input[n]=ys-Base_Size/4 
                  '       g_vy_input[n]=0
                  '       g_vx_input[n]=0
                  '       g_vz_input[n]=0
                  '      n=n+1
                  '       next  ys  :      next  xs  
                  '     '  print    N_OBJ     
                             
                  '     rem end  test
   for cntr as ulong  =0 to   N_OBJ-1
   g_MATERIALinput[cntr]=0
          g_y_input[cntr]=-20000
          g_x_input[cntr]=-20000+cntr*85 
          g_ay_input[cntr]=0
          g_ax_input[cntr]=0 
        next
                     
     
        n=0
       for  xs=-2200  to  2200 step (Base_Size )*.866025
     if  ss<>0 then ss=0 else ss=1
     for  ys=-1200 to 1200 step Base_Size  
         
        g_y_input[n]=ys
        g_x_input[n]=xs 
        g_z_input[n]=0 
        g_MASSinput[n]=400
        g_MATERIALinput[n]=1
                 IF  ss=1 THEN g_y_input[n]=ys+Base_Size/4
                 If  ss=0 THEN g_y_input[n]=ys-Base_Size/4 
       g_vy_input[n]=0
       g_vx_input[n]=0
       g_vz_input[n]=0
      n=n+1
       next  ys  :      next  xs  
        
    
        
'              for  xs=-150  to  150 step (Base_Size )*.866025
'     if  ss<>0 then ss=0 else ss=1
'     for  ys=3300 to 3600 step Base_Size            
'        g_y_input[n]=ys
'        g_x_input[n]=xs 
'        g_z_input[n]=0 
'        g_MASSinput[n]=600
'        g_MATERIALinput[n]=2
'                 IF  ss=1 THEN g_y_input[n]=ys+Base_Size/4
'                 If  ss=0 THEN g_y_input[n]=ys-Base_Size/4 
'       g_vy_input[n]=-1
'       g_vx_input[n]=0
'       g_vz_input[n]=0
'      n=n+1
'       next  ys  :      next  xs  
        
      print   n-1
      if  n-1 >  N_OBJ-1  then  print  "to many particles/increase  N_OBJ =(int)*localThreads(0)  "
       sleep 1000 
    
     For n as integer =0 to N_OBJ-1
       x_reserv(n)=  g_x_input[n] 
       y_reserv(n)=  g_y_input[n]          
     NEXT n

'g_MASSinput[2000]=0

     For n as integer =0 to N_OBJ-1
         IF  g_MASSinput[n]=0 THEN  g_MATERIALinput[n]=0
       if  g_x_input[n]>0+200*sin(g_y_input[n]/16)  then g_MATERIALinput[n]=2
         '           if  g_x_input[n]>0  then g_MATERIALinput[n]=2
     NEXT n


' Initialize OpenCL resources
initializeCL()

' print input array
rem print1DFloatArray("Input",g_x_input,g_width)
dim shared as integer frames,fps         :        dim as double t1=Timer()

 
 DO        
    

   
 g_dt=dt_init    '  g_output[0] ==Rmin from  kernel 

if  g_output[0]<37 then  g_dt=g_dt*.5
if  g_output[0]<36 then  g_dt=g_dt*.5
if  g_output[0]<35 then  g_dt=g_dt*.5
if  g_output[0]<34 then  g_dt=g_dt*.5
if  g_output[0]<33 then  g_dt=g_dt*.5
if  g_output[0]<32 then  g_dt=g_dt*.5
if  g_output[0]<31 then  g_dt=g_dt*.5
if  g_output[0]<30 then  g_dt=g_dt*.5
if  g_output[0]<29 then  g_dt=g_dt*.5
if  g_output[0]<28 then  g_dt=g_dt*.5
if  g_output[0]>38 then  g_dt=dt_init
  
frametime=timer 
' Run the CL program

runCLKernels()

 frametime=timer -    frametime
' Print output array                                                   

 GlobalTime =GlobalTime+g_dt
  frames+=1
     key_proc( ) 'keyboard events
  if frames mod 25=0 then
    dim as double t2=timer()
   fps=25/(t2-t1) : t1=t2
  end if 

    if frames mod 60=0 then
    REDRAW_SCREEN  ()
  end if 


LOOP WHILE NOT MULTIKEY(&h1)
Close
rem WHILE INKEY$ = "": WEND
PRINT "Press any key to exit..."


' Releases OpenCL resources
cleanupCL()
' Release host resources
cleanupHost()
sleep:end






rem ===================== MAIN SUB  =========================

Sub  REDRAW_SCREEN  ()
           cls
   screenlock
   GetMouse (x_mouse, y_mouse, , buttons_mouse)     '?????????  ???????? ????????? ????
      dim as integer  n=0
      

      for n=0 to N_OBJ-1

  if    g_MATERIALinput[n]>0  then  circle (g_x_input[n],g_y_input[n]),18 ,CLR_Gradient (40000, g_CLRinput[n] ,0), , , 
              
 if    g_MATERIALinput[n]=2   then  circle (g_x_input[n],g_y_input[n]),18 ,CLR_Gradient (40000, g_CLRinput[n] ,0), , ,, f 
             
               
'      label2:
     next n
     
  'viible  particle for strain    probe
        For n as integer =2108 to 2169
           circle (g_x_input[n],g_y_input[n]),15 ,CLR_Gradient (40000, g_CLRinput[n] ,0), , , 
           circle (g_x_input[n+step_hor_for_strain],g_y_input[n]),15 ,CLR_Gradient (40000, g_CLRinput[n] ,0), , , 
        next
  ' end viible  particle for strain    probe

     locate 1.1 
     print using   "####### N_OBJ";N_OBJ
         locate 2.1 
     print using   "######.### GlobalTime";GlobalTime
         locate 3.1 
     print using   "###.### fps";fps
              locate 4.1 

     print using   "## MY_event"; MY_event
                   locate 6.20 
     print using   "MAX_strain   #.###";MAX_strain
                       locate 7.20 
     print using   "strain   #.###";strain
  
                      locate 8.20 
     print using   "g_output[0]   #####.###";g_output[0] 
     print    g_output[1],   g_output[2] 

                   locate 48.1
     print using   "##.#### frametime mS ";frametime*1000
'    for n=0 to Nmass
'         if    (x_ERR_m(m)<>0 or y_ERR_m(m)<>0)  then
'          circle ( x_ERR_m(m),y_ERR_m(m)),10,15
'          circle ( x_ERR_m(n),y_ERR_m(n)),10,15
'            end if
'     next n
interact_mouse( )
key_proc( )

screenunlock


End Sub


Sub key_proc( )
             
             IF MULTIKEY(&h51)   THEN j = j*1.1 :cls:window(-j+Kmx,(-j+Kmy)*.75)-(j+Kmx,(j+Kmy)*.75): sleep 10  endif 
             IF MULTIKEY(&h49)   THEN j = j/1.1 :cls:window(-j+Kmx,(-j+Kmy)*.75)-(j+Kmx,(j+Kmy)*.75): sleep 10  endif 
         IF MULTIKEY(&h4B)  THEN
         Kmx=Kmx+50
         window(-j+Kmx,(-j+Kmy)*.75)-(j+Kmx,(j+Kmy)*.75): sleep 10  
         endif  
         IF MULTIKEY(&h4D)   THEN 
         Kmx=Kmx-50
         window(-j+Kmx,(-j+Kmy)*.75)-(j+Kmx,(j+Kmy)*.75): sleep 10 
         endif   
         IF MULTIKEY(&h50)  THEN
          Kmy=Kmy+50
         window(-j+Kmx,(-j+Kmy)*.75)-(j+Kmx,(j+Kmy)*.75): sleep 10  
         endif     
         IF MULTIKEY(&h48)   THEN 
          Kmy=Kmy-50
         window(-j+Kmx,(-j+Kmy)*.75)-(j+Kmx,(j+Kmy)*.75): sleep 10 
         endif        
         locate 55.0 
         print using  "##.#^^^^^ J ";j          
           IF MULTIKEY  ( &h1F ) and MULTIKEY  ( &h2A ) THEN rem  Pageup in  numeric keyboard
            rem  Save_Array ( )
            rem      Save_res_Array ()
              End If 
             IF MULTIKEY  (  &h0C) and MULTIKEY  ( &h2A ) THEN rem  Pageup in  numeric keyboard
          rem    Kcnt= Kcnt-1e-4
              End If  
             IF MULTIKEY  (  &h0D) and MULTIKEY  ( &h2A ) THEN rem  Pageup in  numeric keyboard
         rem  Kcnt= Kcnt+1e-4
          End If 



                                              '   SC_Z            &h2C
                                              '   SC_x            &h2d
         if     buttons_mouse=1  and MultiKey(&h2D)  then        
                Kmx= x_mouse_world
                Kmy= y_mouse_world
                j=j/1.25
                
           window(-j+Kmx,(-j)*.75+Kmy)-(j+Kmx,(j)*.75+Kmy): sleep 10 
         Do Until  (  buttons_mouse=1  or MultiKey(&h2D)  )
              sleep 1  
           GetMouse (x_mouse, y_mouse, , buttons_mouse) 
           loop
          endif
          
           if     buttons_mouse=2  and MultiKey(&h2D)  then        
                Kmx= x_mouse_world
                Kmy= y_mouse_world
                j=j*1.25
                
           window(-j+Kmx,(-j)*.75+Kmy)-(j+Kmx,(j)*.75+Kmy): sleep 10 
         Do Until  (  buttons_mouse=2  or MultiKey(&h2D)  )
              sleep 1  
           GetMouse (x_mouse, y_mouse, , buttons_mouse) 
           loop
          endif
           

End Sub

Function CLR_Gradient (Byval highest As single , Byval CLR As single ,Byval lowest As single ) As uInteger
 dim as  uInteger temp ,grad  
 dim as single  st1
                 st1 =(highest   - lowest    ) /1024
                 temp  = (CLR  - lowest)/st1    
                 if  temp <0 then temp= 0
                 if  temp >1023 then temp = 1023
            Select Case   temp 
            Case  0 to 255
              grad =RGB     (0,temp,255)
            Case  256 to 511 
             grad =  RGB    (0,255,511-temp) 
            Case  512 to 767 
              grad = RGB    (temp-511,255,0)  
            Case  768 to 1023
              grad = RGB    (255,1023-temp,0)  
          end select
            REturn grad  
End Function


Function Search_index (Byval XSearch As integer , Byval YSearch As integer  ) As Integer
  dim as  uInteger n
   dim as  Integer Index=-1
   for n=0 to N_OBJ-1
       if  abs(g_x_input[n]-XSearch)<21 AND  abs (g_y_input[n]-YSearch)  <21 Then
           Index=n  
        endif
     next
     
     return Index
  End Function     


Sub interact_mouse( )

 GetMouse (x_mouse, y_mouse, , buttons_mouse)
                      x_mouse_world=PMap(x_mouse,2)
                   locate 11.1 :  print using "#####.# x_mouse";x_mouse_world
                     y_mouse_world =PMap(y_mouse,3)
                  locate 12.1 :  print using  "#####.# y_mouse";y_mouse_world
'          locate 12.1  :    print using   "# buttons_mouse ";buttons_mouse
'                   
        if  buttons_mouse>0 then
               Index_global=Search_index (x_mouse_world, y_mouse_world  )
              locate 13.1 
              print using   "#####  index "; Index_global
              locate 14.1 
              print using   "#####.###  X() "; g_x_input[Index_global]
              locate 15.1 
              print using   "#####.###  Y() "; g_y_input[Index_global]
              locate 16.1 
              print using   "#####.###  VX() ";  g_vx_input[Index_global]
              locate 17.1 
              print using   "#####.###  VY() ";  g_vy_input[Index_global]
             if     Index_global >-1   then
             circle (g_x_input[Index_global],g_y_input[Index_global]), VisualParticleSize,RGB(255,255,255)  ,,,,f   
               end if
        end if


End Sub

Function Distance ( Byval n As long ,Byval m As long ) As single 
    dim as  single  Dist= sqr( (g_x_input[n]-g_x_input[m])^2  +   (g_y_input[n]-g_y_input[m])^2 )  
    return Dist
end function



