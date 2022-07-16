/'******************************************************************************
 * Copyright (c) 2008-2009 The Khronos Group Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and/or associated documentation files (the
 * "Materials"), to deal in the Materials without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Materials, and to
 * permit persons to whom the Materials are furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Materials.
 *
 * THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
 *****************************************************************************'/

/' $Revision: 11985 $ on $Date: 2010-07-15 11:16:06 -0700 (Thu, 15 Jul 2010) $ '/


' NOTE: FreeBASIC isn't case sensitive I renamed this defines
' CL_CONTEXT_PROPERTIES in CL_CONTEXT_PROPERTIES_
' CL_FLOAT              in CL_FLOAT_
' CL_MEM_FLAG           in CL_MEM_FLAGS_
' CL_IMAGE_FORMAT       in CL_IMAGE_FORMAT_

#ifndef __CL_PLATFORM_BI
#define __CL_PLATFORM_BI

#define CL_API_ENTRY
#define CL_API_CALL

#define CL_EXTENSION_WEAK_LINK
#define CL_API_SUFFIX__VERSION_1_0
#define CL_EXT_SUFFIX__VERSION_1_0
#define CL_API_SUFFIX__VERSION_1_1
#define CL_EXT_SUFFIX__VERSION_1_1
#define CL_EXT_SUFFIX__VERSION_1_0_DEPRECATED


#include "crt/stdint.bi"
#include "crt/stdlib.bi"


' scalar types
type cl_char   as byte
type cl_uchar  as ubyte
type cl_short  as short
type cl_ushort as ushort
type cl_int    as long
type cl_uint   as ulong
type cl_long   as longint
type cl_ulong  as ulongint
type cl_half   as ushort
type cl_float  as single
type cl_double as double

#define CL_CHAR_BIT         8
#define CL_SCHAR_MAX        127
#define CL_SCHAR_MIN        (-127-1)
#define CL_CHAR_MAX         CL_SCHAR_MAX
#define CL_CHAR_MIN         CL_SCHAR_MIN
#define CL_UCHAR_MAX        255
#define CL_SHRT_MAX         32767
#define CL_SHRT_MIN         (-32767-1)
#define CL_USHRT_MAX        65535
#define CL_INT_MAX          2147483647
#define CL_INT_MIN          (-2147483647-1)
#define CL_UINT_MAX         &HffffffffU
#define CL_LONG_MAX         cast(cl_long, &H7FFFFFFFFFFFFFFFLL)
#define CL_LONG_MIN         cast(cl_long, -&H7FFFFFFFFFFFFFFFLL - 1LL)
#define CL_ULONG_MAX        cast(cl_ulong, &HFFFFFFFFFFFFFFFFULL)

#define CL_FLT_DIG          6
#define CL_FLT_MANT_DIG     24
#define CL_FLT_MAX_10_EXP   +38
#define CL_FLT_MAX_EXP      +128
#define CL_FLT_MIN_10_EXP   -37
#define CL_FLT_MIN_EXP      -125
#define CL_FLT_RADIX        2
#define CL_FLT_MAX          340282346638528859811704183484516925440.0f
#define CL_FLT_MIN          1.175494350822287507969e-38f
#define CL_FLT_EPSILON      0x1.0p-23f

#define CL_DBL_DIG          15
#define CL_DBL_MANT_DIG     53
#define CL_DBL_MAX_10_EXP   +308
#define CL_DBL_MAX_EXP      +1024
#define CL_DBL_MIN_10_EXP   -307
#define CL_DBL_MIN_EXP      -1021
#define CL_DBL_RADIX        2
#define CL_DBL_MAX          179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0
#define CL_DBL_MIN          2.225073858507201383090e-308
#define CL_DBL_EPSILON      2.220446049250313080847e-16

#define  CL_M_E             2.718281828459045090796
#define  CL_M_LOG2E         1.442695040888963387005
#define  CL_M_LOG10E        0.434294481903251816668
#define  CL_M_LN2           0.693147180559945286227
#define  CL_M_LN10          2.302585092994045901094
#define  CL_M_PI            3.141592653589793115998
#define  CL_M_PI_2          1.570796326794896557999
#define  CL_M_PI_4          0.785398163397448278999
#define  CL_M_1_PI          0.318309886183790691216
#define  CL_M_2_PI          0.636619772367581382433
#define  CL_M_2_SQRTPI      1.128379167095512558561
#define  CL_M_SQRT2         1.414213562373095145475
#define  CL_M_SQRT1_2       0.707106781186547572737

#define  CL_M_E_F           2.71828174591064f
#define  CL_M_LOG2E_F       1.44269502162933f
#define  CL_M_LOG10E_F      0.43429449200630f
#define  CL_M_LN2_F         0.69314718246460f
#define  CL_M_LN10_F        2.30258512496948f
#define  CL_M_PI_F          3.14159274101257f
#define  CL_M_PI_2_F        1.57079637050629f
#define  CL_M_PI_4_F        0.78539818525314f
#define  CL_M_1_PI_F        0.31830987334251f
#define  CL_M_2_PI_F        0.63661974668503f
#define  CL_M_2_SQRTPI_F    1.12837922573090f
#define  CL_M_SQRT2_F       1.41421353816986f
#define  CL_M_SQRT1_2_F     0.70710676908493f

#define CL_NAN              (CL_INFINITY - CL_INFINITY)
#define CL_HUGE_VALF        cast(cl_float, 1e50)
#define CL_HUGE_VAL         cast(cl_double, 1e500)
#define CL_MAXFLOAT         CL_FLT_MAX
#define CL_INFINITY         CL_HUGE_VALF


' Mirror types to GL or GLES types. 
type cl_GLuint as ulong
type cl_GLint  as long
type cl_GLenum as ulong

#endif  ' __CL_PLATFORM_BI

#ifndef __OPENCL_CL_BI__
#define __OPENCL_CL_BI__



#ifdef __FB_WIN32__
 extern "Windows-MS"
 #ifdef __FB_64BIT__
  #inclib "OpenCL64"
 #else
  #inclib "OpenCL" 
 #endif 
#else
 extern "C"
 #inclib "OpenCL" 
#endif

type cl_platform_id   as _cl_platform_id   ptr
type cl_device_id     as _cl_device_id     ptr
type cl_context       as _cl_context       ptr
type cl_command_queue as _cl_command_queue ptr
type cl_mem           as _cl_mem           ptr
type cl_program       as _cl_program       ptr
type cl_kernel        as _cl_kernel        ptr
type cl_event         as _cl_event         ptr
type cl_sampler       as _cl_sampler       ptr
                    
' WARNING!  cl_bool is not guaranteed to be the same size as the bool in kernels. 
type cl_bool                     as cl_uint
type cl_bitfield                 as cl_ulong
type cl_device_type              as cl_bitfield
type cl_platform_info            as cl_uint
type cl_device_info              as cl_uint
type cl_device_address_info      as cl_bitfield
type cl_device_fp_config         as cl_bitfield
type cl_device_mem_cache_type    as cl_uint
type cl_device_local_mem_type    as cl_uint
type cl_device_exec_capabilities as cl_bitfield
type cl_command_queue_properties as cl_bitfield

type cl_context_properties       as intptr_t
type cl_context_info             as cl_uint
type cl_command_queue_info       as cl_uint
type cl_channel_order            as cl_uint
type cl_channel_type             as cl_uint
type cl_mem_flags                as cl_bitfield
type cl_mem_object_type          as cl_uint
type cl_mem_info                 as cl_uint
type cl_image_info               as cl_uint
type cl_buffer_create_type       as cl_uint
type cl_addressing_mode          as cl_uint
type cl_filter_mode              as cl_uint
type cl_sampler_info             as cl_uint
type cl_map_flags                as cl_bitfield
type cl_program_info             as cl_uint
type cl_program_build_info       as cl_uint
type cl_build_status             as cl_int
type cl_kernel_info              as cl_uint
type cl_kernel_work_group_info   as cl_uint
type cl_event_info               as cl_uint
type cl_command_type             as cl_uint
type cl_profiling_info           as cl_uint

type cl_image_format
  as cl_channel_order image_channel_order
  as cl_channel_type  image_channel_data_type
end type

CL_API_SUFFIX__VERSION_1_1
type cl_buffer_region
  as size_t origin
  as size_t size
end type

' Error Codes
#define CL_SUCCESS                                    0
#define CL_DEVICE_NOT_FOUND                          -1
#define CL_DEVICE_NOT_AVAILABLE                      -2
#define CL_COMPILER_NOT_AVAILABLE                    -3
#define CL_MEM_OBJECT_ALLOCATION_FAILURE             -4
#define CL_OUT_OF_RESOURCES                          -5
#define CL_OUT_OF_HOST_MEMORY                        -6
#define CL_PROFILING_INFO_NOT_AVAILABLE              -7
#define CL_MEM_COPY_OVERLAP                          -8
#define CL_IMAGE_FORMAT_MISMATCH                     -9
#define CL_IMAGE_FORMAT_NOT_SUPPORTED                -10
#define CL_BUILD_PROGRAM_FAILURE                     -11
#define CL_MAP_FAILURE                               -12
CL_API_SUFFIX__VERSION_1_1
#define CL_MISALIGNED_SUB_BUFFER_OFFSET              -13
#define CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST -14

#define CL_INVALID_VALUE                            -30
#define CL_INVALID_DEVICE_TYPE                      -31
#define CL_INVALID_PLATFORM                         -32
#define CL_INVALID_DEVICE                           -33
#define CL_INVALID_CONTEXT                          -34
#define CL_INVALID_QUEUE_PROPERTIES                 -35
#define CL_INVALID_COMMAND_QUEUE                    -36
#define CL_INVALID_HOST_PTR                         -37
#define CL_INVALID_MEM_OBJECT                       -38
#define CL_INVALID_IMAGE_FORMAT_DESCRIPTOR          -39

#define CL_INVALID_IMAGE_SIZE                       -40
#define CL_INVALID_SAMPLER                          -41
#define CL_INVALID_BINARY                           -42
#define CL_INVALID_BUILD_OPTIONS                    -43
#define CL_INVALID_PROGRAM                          -44
#define CL_INVALID_PROGRAM_EXECUTABLE               -45
#define CL_INVALID_KERNEL_NAME                      -46
#define CL_INVALID_KERNEL_DEFINITION                -47
#define CL_INVALID_KERNEL                           -48
#define CL_INVALID_ARG_INDEX                        -49

#define CL_INVALID_ARG_VALUE                        -50
#define CL_INVALID_ARG_SIZE                         -51
#define CL_INVALID_KERNEL_ARGS                      -52
#define CL_INVALID_WORK_DIMENSION                   -53
#define CL_INVALID_WORK_GROUP_SIZE                  -54
#define CL_INVALID_WORK_ITEM_SIZE                   -55
#define CL_INVALID_GLOBAL_OFFSET                    -56
#define CL_INVALID_EVENT_WAIT_LIST                  -57
#define CL_INVALID_EVENT                            -58
#define CL_INVALID_OPERATION                        -59

#define CL_INVALID_GL_OBJECT                        -60
#define CL_INVALID_BUFFER_SIZE                      -61
#define CL_INVALID_MIP_LEVEL                        -62
CL_API_SUFFIX__VERSION_1_1
#define CL_INVALID_GLOBAL_WORK_SIZE                 -63
#define CL_INVALID_PROPERTY                         -64

' a helper if something goes wrong
function getCLErrorString(byval errcode as cl_int) as string
  #define DECL(x,n) case x : return str(x) & " = " & n
  select case errcode
  DECL(CL_SUCCESS                        ,"CL_SUCCESS")
  DECL(CL_DEVICE_NOT_FOUND               ,"CL_DEVICE_NOT_FOUND")
  DECL(CL_DEVICE_NOT_AVAILABLE           ,"CL_DEVICE_NOT_AVAILABLE")
  DECL(CL_COMPILER_NOT_AVAILABLE         ,"CL_COMPILER_NOT_AVAILABLE")
  DECL(CL_MEM_OBJECT_ALLOCATION_FAILURE  ,"CL_MEM_OBJECT_ALLOCATION_FAILURE")
  DECL(CL_OUT_OF_RESOURCES               ,"CL_OUT_OF_RESOURCES")
  DECL(CL_OUT_OF_HOST_MEMORY             ,"CL_OUT_OF_HOST_MEMORY")
  DECL(CL_PROFILING_INFO_NOT_AVAILABLE   ,"CL_PROFILING_INFO_NOT_AVAILABLE")
  DECL(CL_MEM_COPY_OVERLAP               ,"CL_MEM_COPY_OVERLAP")
  DECL(CL_IMAGE_FORMAT_MISMATCH          ,"CL_IMAGE_FORMAT_MISMATCH")
  DECL(CL_IMAGE_FORMAT_NOT_SUPPORTED     ,"CL_IMAGE_FORMAT_NOT_SUPPORTED")
  DECL(CL_BUILD_PROGRAM_FAILURE          ,"CL_BUILD_PROGRAM_FAILURE")
  DECL(CL_MAP_FAILURE                    ,"CL_MAP_FAILURE")
  DECL(CL_MISALIGNED_SUB_BUFFER_OFFSET   ,"CL_MISALIGNED_SUB_BUFFER_OFFSET")
  DECL(CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST,"CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST")

  DECL(CL_INVALID_VALUE                  ,"CL_INVALID_VALUE")
  DECL(CL_INVALID_DEVICE_TYPE            ,"CL_INVALID_DEVICE_TYPE")
  DECL(CL_INVALID_PLATFORM               ,"CL_INVALID_PLATFORM")
  DECL(CL_INVALID_DEVICE                 ,"CL_INVALID_DEVICE")
  DECL(CL_INVALID_CONTEXT                ,"CL_INVALID_CONTEXT")
  DECL(CL_INVALID_QUEUE_PROPERTIES       ,"CL_INVALID_QUEUE_PROPERTIES")
  DECL(CL_INVALID_COMMAND_QUEUE          ,"CL_INVALID_COMMAND_QUEUE")
  DECL(CL_INVALID_HOST_PTR               ,"CL_INVALID_HOST_PTR")
  DECL(CL_INVALID_MEM_OBJECT             ,"CL_INVALID_MEM_OBJECT")
  DECL(CL_INVALID_IMAGE_FORMAT_DESCRIPTOR,"CL_INVALID_IMAGE_FORMAT_DESCRIPTOR")

  DECL(CL_INVALID_IMAGE_SIZE             ,"CL_INVALID_IMAGE_SIZE")
  DECL(CL_INVALID_SAMPLER                ,"CL_INVALID_SAMPLER")
  DECL(CL_INVALID_BINARY                 ,"CL_INVALID_BINARY")
  DECL(CL_INVALID_BUILD_OPTIONS          ,"CL_INVALID_BUILD_OPTIONS")
  DECL(CL_INVALID_PROGRAM                ,"CL_INVALID_PROGRAM")
  DECL(CL_INVALID_PROGRAM_EXECUTABLE     ,"CL_INVALID_PROGRAM_EXECUTABLE")
  DECL(CL_INVALID_KERNEL_NAME            ,"CL_INVALID_KERNEL_NAME")
  DECL(CL_INVALID_KERNEL_DEFINITION      ,"CL_INVALID_KERNEL_DEFINITION")
  DECL(CL_INVALID_KERNEL                 ,"CL_INVALID_KERNEL")
  DECL(CL_INVALID_ARG_INDEX              ,"CL_INVALID_ARG_INDEX")

  DECL(CL_INVALID_ARG_VALUE              ,"CL_INVALID_ARG_VALUE")
  DECL(CL_INVALID_ARG_SIZE               ,"CL_INVALID_ARG_SIZE")
  DECL(CL_INVALID_KERNEL_ARGS            ,"CL_INVALID_KERNEL_ARGS")
  DECL(CL_INVALID_WORK_DIMENSION         ,"CL_INVALID_WORK_DIMENSION")
  DECL(CL_INVALID_WORK_GROUP_SIZE        ,"CL_INVALID_WORK_GROUP_SIZE")
  DECL(CL_INVALID_WORK_ITEM_SIZE         ,"CL_INVALID_WORK_ITEM_SIZE")
  DECL(CL_INVALID_GLOBAL_OFFSET          ,"CL_INVALID_GLOBAL_OFFSET")
  DECL(CL_INVALID_EVENT_WAIT_LIST        ,"CL_INVALID_EVENT_WAIT_LIST")
  DECL(CL_INVALID_EVENT                  ,"CL_INVALID_EVENT")
  DECL(CL_INVALID_OPERATION              ,"CL_INVALID_OPERATION")

  DECL(CL_INVALID_GL_OBJECT              ,"CL_INVALID_GL_OBJECT")
  DECL(CL_INVALID_BUFFER_SIZE            ,"CL_INVALID_BUFFER_SIZE")
  DECL(CL_INVALID_MIP_LEVEL              ,"CL_INVALID_MIP_LEVEL")
  DECL(CL_INVALID_GLOBAL_WORK_SIZE       ,"CL_INVALID_GLOBAL_WORK_SIZE")
  DECL(CL_INVALID_PROPERTY               ,"CL_INVALID_PROPERTY")
  case else 
  return str(errcode) & " UNKNOW ERROR !"
  end select
  #undef DECL
end function

' OpenCL Version
#define CL_VERSION_1_0                              1
#define CL_VERSION_1_1                              1

' cl_bool
#define CL_FALSE                                    0
#define CL_TRUE                                     1

' cl_platform_info
#define CL_PLATFORM_PROFILE                         &H0900
#define CL_PLATFORM_VERSION                         &H0901
#define CL_PLATFORM_NAME                            &H0902
#define CL_PLATFORM_VENDOR                          &H0903
#define CL_PLATFORM_EXTENSIONS                      &H0904

' cl_device_type - bitfield
#define CL_DEVICE_TYPE_DEFAULT                      1 SHL 0
#define CL_DEVICE_TYPE_CPU                          1 SHL 1
#define CL_DEVICE_TYPE_GPU                          1 SHL 2
#define CL_DEVICE_TYPE_ACCELERATOR                  1 SHL 3
#define CL_DEVICE_TYPE_ALL                          &HFFFFFFFF

' cl_device_info
#define CL_DEVICE_TYPE_                             &H1000
#define CL_DEVICE_VENDOR_ID                         &H1001
#define CL_DEVICE_MAX_COMPUTE_UNITS                 &H1002
#define CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS          &H1003
#define CL_DEVICE_MAX_WORK_GROUP_SIZE               &H1004
#define CL_DEVICE_MAX_WORK_ITEM_SIZES               &H1005
#define CL_DEVICE_PREFERRED_VECTOR_WIDTH_CHAR       &H1006
#define CL_DEVICE_PREFERRED_VECTOR_WIDTH_SHORT      &H1007
#define CL_DEVICE_PREFERRED_VECTOR_WIDTH_INT        &H1008
#define CL_DEVICE_PREFERRED_VECTOR_WIDTH_LONG       &H1009
#define CL_DEVICE_PREFERRED_VECTOR_WIDTH_FLOAT      &H100A
#define CL_DEVICE_PREFERRED_VECTOR_WIDTH_DOUBLE     &H100B
#define CL_DEVICE_MAX_CLOCK_FREQUENCY               &H100C
#define CL_DEVICE_ADDRESS_BITS                      &H100D
#define CL_DEVICE_MAX_READ_IMAGE_ARGS               &H100E
#define CL_DEVICE_MAX_WRITE_IMAGE_ARGS              &H100F

#define CL_DEVICE_MAX_MEM_ALLOC_SIZE                &H1010
#define CL_DEVICE_IMAGE2D_MAX_WIDTH                 &H1011
#define CL_DEVICE_IMAGE2D_MAX_HEIGHT                &H1012
#define CL_DEVICE_IMAGE3D_MAX_WIDTH                 &H1013
#define CL_DEVICE_IMAGE3D_MAX_HEIGHT                &H1014
#define CL_DEVICE_IMAGE3D_MAX_DEPTH                 &H1015
#define CL_DEVICE_IMAGE_SUPPORT                     &H1016
#define CL_DEVICE_MAX_PARAMETER_SIZE                &H1017
#define CL_DEVICE_MAX_SAMPLERS                      &H1018
#define CL_DEVICE_MEM_BASE_ADDR_ALIGN               &H1019
#define CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE          &H101A
#define CL_DEVICE_SINGLE_FP_CONFIG                  &H101B
#define CL_DEVICE_GLOBAL_MEM_CACHE_TYPE             &H101C
#define CL_DEVICE_GLOBAL_MEM_CACHELINE_SIZE         &H101D
#define CL_DEVICE_GLOBAL_MEM_CACHE_SIZE             &H101E
#define CL_DEVICE_GLOBAL_MEM_SIZE                   &H101F

#define CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE          &H1020
#define CL_DEVICE_MAX_CONSTANT_ARGS                 &H1021
#define CL_DEVICE_LOCAL_MEM_TYPE_                   &H1022
#define CL_DEVICE_LOCAL_MEM_SIZE                    &H1023
#define CL_DEVICE_ERROR_CORRECTION_SUPPORT          &H1024
#define CL_DEVICE_PROFILING_TIMER_RESOLUTION        &H1025
#define CL_DEVICE_ENDIAN_LITTLE                     &H1026
#define CL_DEVICE_AVAILABLE                         &H1027
#define CL_DEVICE_COMPILER_AVAILABLE                &H1028
#define CL_DEVICE_EXECUTION_CAPABILITIES            &H1029
#define CL_DEVICE_QUEUE_PROPERTIES                  &H102A
#define CL_DEVICE_NAME                              &H102B
#define CL_DEVICE_VENDOR                            &H102C
#define CL_DRIVER_VERSION                           &H102D
#define CL_DEVICE_PROFILE                           &H102E
#define CL_DEVICE_VERSION                           &H102F

#define CL_DEVICE_EXTENSIONS                        &H1030
#define CL_DEVICE_PLATFORM                          &H1031
' &H1032 reserved for CL_DEVICE_DOUBLE_FP_CONFIG
' &H1033 reserved for CL_DEVICE_HALF_FP_CONFIG
#define CL_DEVICE_PREFERRED_VECTOR_WIDTH_HALF       &H1034
#define CL_DEVICE_HOST_UNIFIED_MEMORY               &H1035
#define CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR          &H1036
#define CL_DEVICE_NATIVE_VECTOR_WIDTH_SHORT         &H1037
#define CL_DEVICE_NATIVE_VECTOR_WIDTH_INT           &H1038
#define CL_DEVICE_NATIVE_VECTOR_WIDTH_LONG          &H1039
#define CL_DEVICE_NATIVE_VECTOR_WIDTH_FLOAT         &H103A
#define CL_DEVICE_NATIVE_VECTOR_WIDTH_DOUBLE        &H103B
#define CL_DEVICE_NATIVE_VECTOR_WIDTH_HALF          &H103C
#define CL_DEVICE_OPENCL_C_VERSION                  &H103D

' cl_device_fp_config - bitfield
#define CL_FP_DENORM                                (1 SHL 0)
#define CL_FP_INF_NAN                               (1 SHL 1)
#define CL_FP_ROUND_TO_NEAREST                      (1 SHL 2)
#define CL_FP_ROUND_TO_ZERO                         (1 SHL 3)
#define CL_FP_ROUND_TO_INF                          (1 SHL 4)
CL_API_SUFFIX__VERSION_1_1
#define CL_FP_FMA                                   (1 SHL 5)
#define CL_FP_SOFT_FLOAT                            (1 SHL 6)

' cl_device_mem_cache_type
#define CL_NONE                                     &H0
#define CL_READ_ONLY_CACHE                          &H1
#define CL_READ_WRITE_CACHE                         &H2

' cl_device_local_mem_type
#define CL_LOCAL                                    &H1
#define CL_GLOBAL                                   &H2

' cl_device_exec_capabilities - bitfield
#define CL_EXEC_KERNEL                              (1 SHL 0)
#define CL_EXEC_NATIVE_KERNEL                       (1 SHL 1)

' cl_command_queue_properties - bitfield
#define CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE      (1 SHL 0)
#define CL_QUEUE_PROFILING_ENABLE                   (1 SHL 1)

' cl_context_info
#define CL_CONTEXT_REFERENCE_COUNT                  &H1080
#define CL_CONTEXT_DEVICES                          &H1081
#define CL_CONTEXT_PROPERTIES_                      &H1082
#define CL_CONTEXT_NUM_DEVICES                      &H1083

' cl_context_info and cl_context_properties
#define CL_CONTEXT_PLATFORM                         &H1084

' cl_command_queue_info
#define CL_QUEUE_CONTEXT                            &H1090
#define CL_QUEUE_DEVICE                             &H1091
#define CL_QUEUE_REFERENCE_COUNT                    &H1092
#define CL_QUEUE_PROPERTIES                         &H1093

' cl_mem_flags - bitfield
#define CL_MEM_READ_WRITE                           (1 SHL 0)
#define CL_MEM_WRITE_ONLY                           (1 SHL 1)
#define CL_MEM_READ_ONLY                            (1 SHL 2)
#define CL_MEM_USE_HOST_PTR                         (1 SHL 3)
#define CL_MEM_ALLOC_HOST_PTR                       (1 SHL 4)
#define CL_MEM_COPY_HOST_PTR                        (1 SHL 5)

' cl_channel_order
#define CL_R                                        &H10B0
#define CL_A                                        &H10B1
#define CL_RG                                       &H10B2
#define CL_RA                                       &H10B3
#define CL_RGB                                      &H10B4
#define CL_RGBA                                     &H10B5
#define CL_BGRA                                     &H10B6
#define CL_ARGB                                     &H10B7
#define CL_INTENSITY                                &H10B8
#define CL_LUMINANCE                                &H10B9
#define CL_Rx                                       &H10BA
CL_API_SUFFIX__VERSION_1_1
#define CL_RGx                                      &H10BB
#define CL_RGBx                                     &H10BC

' cl_channel_type
#define CL_SNORM_INT8                               &H10D0
#define CL_SNORM_INT16                              &H10D1
#define CL_UNORM_INT8                               &H10D2
#define CL_UNORM_INT16                              &H10D3
#define CL_UNORM_SHORT_565                          &H10D4
#define CL_UNORM_SHORT_555                          &H10D5
#define CL_UNORM_INT_101010                         &H10D6
#define CL_SIGNED_INT8                              &H10D7
#define CL_SIGNED_INT16                             &H10D8
#define CL_SIGNED_INT32                             &H10D9
#define CL_UNSIGNED_INT8                            &H10DA
#define CL_UNSIGNED_INT16                           &H10DB
#define CL_UNSIGNED_INT32                           &H10DC
#define CL_HALF_FLOAT                               &H10DD
#define CL_FLOAT_                                   &H10DE

' cl_mem_object_type
#define CL_MEM_OBJECT_BUFFER                        &H10F0
#define CL_MEM_OBJECT_IMAGE2D                       &H10F1
#define CL_MEM_OBJECT_IMAGE3D                       &H10F2

' cl_mem_info
#define CL_MEM_TYPE                                 &H1100
#define CL_MEM_FLAGS_                               &H1101
#define CL_MEM_SIZE                                 &H1102
#define CL_MEM_HOST_PTR                             &H1103
#define CL_MEM_MAP_COUNT                            &H1104
#define CL_MEM_REFERENCE_COUNT                      &H1105
#define CL_MEM_CONTEXT                              &H1106
#define CL_MEM_ASSOCIATED_MEMOBJECT                 &H1107
#define CL_MEM_OFFSET                               &H1108

' cl_image_info
#define CL_IMAGE_FORMAT_                            &H1110
#define CL_IMAGE_ELEMENT_SIZE                       &H1111
#define CL_IMAGE_ROW_PITCH                          &H1112
#define CL_IMAGE_SLICE_PITCH                        &H1113
#define CL_IMAGE_WIDTH                              &H1114
#define CL_IMAGE_HEIGHT                             &H1115
#define CL_IMAGE_DEPTH                              &H1116

' cl_addressing_mode
#define CL_ADDRESS_NONE                             &H1130
#define CL_ADDRESS_CLAMP_TO_EDGE                    &H1131
#define CL_ADDRESS_CLAMP                            &H1132
#define CL_ADDRESS_REPEAT                           &H1133
#define CL_ADDRESS_MIRRORED_REPEAT                  &H1134

' cl_filter_mode
#define CL_FILTER_NEAREST                           &H1140
#define CL_FILTER_LINEAR                            &H1141

' cl_sampler_info
#define CL_SAMPLER_REFERENCE_COUNT                  &H1150
#define CL_SAMPLER_CONTEXT                          &H1151
#define CL_SAMPLER_NORMALIZED_COORDS                &H1152
#define CL_SAMPLER_ADDRESSING_MODE                  &H1153
#define CL_SAMPLER_FILTER_MODE                      &H1154

' cl_map_flags - bitfield
#define CL_MAP_READ                                 (1 SHL 0)
#define CL_MAP_WRITE                                (1 SHL 1)

' cl_program_info
#define CL_PROGRAM_REFERENCE_COUNT                  &H1160
#define CL_PROGRAM_CONTEXT                          &H1161
#define CL_PROGRAM_NUM_DEVICES                      &H1162
#define CL_PROGRAM_DEVICES                          &H1163
#define CL_PROGRAM_SOURCE                           &H1164
#define CL_PROGRAM_BINARY_SIZES                     &H1165
#define CL_PROGRAM_BINARIES                         &H1166

' cl_program_build_info
#define CL_PROGRAM_BUILD_STATUS                     &H1181
#define CL_PROGRAM_BUILD_OPTIONS                    &H1182
#define CL_PROGRAM_BUILD_LOG                        &H1183

' cl_build_status
#define CL_BUILD_SUCCESS                            0
#define CL_BUILD_NONE                               -1
#define CL_BUILD_ERROR                              -2
#define CL_BUILD_IN_PROGRESS                        -3

' cl_kernel_info
#define CL_KERNEL_FUNCTION_NAME                     &H1190
#define CL_KERNEL_NUM_ARGS                          &H1191
#define CL_KERNEL_REFERENCE_COUNT                   &H1192
#define CL_KERNEL_CONTEXT                           &H1193
#define CL_KERNEL_PROGRAM                           &H1194

' cl_kernel_work_group_info
#define CL_KERNEL_WORK_GROUP_SIZE                   &H11B0
#define CL_KERNEL_COMPILE_WORK_GROUP_SIZE           &H11B1
#define CL_KERNEL_LOCAL_MEM_SIZE                    &H11B2

' cl_event_info
#define CL_EVENT_COMMAND_QUEUE                      &H11D0
#define CL_EVENT_COMMAND_TYPE                       &H11D1
#define CL_EVENT_REFERENCE_COUNT                    &H11D2
#define CL_EVENT_COMMAND_EXECUTION_STATUS           &H11D3
#define CL_EVENT_CONTEXT                            &H11D4

' cl_command_type
#define CL_COMMAND_NDRANGE_KERNEL                   &H11F0
#define CL_COMMAND_TASK                             &H11F1
#define CL_COMMAND_NATIVE_KERNEL                    &H11F2
#define CL_COMMAND_READ_BUFFER                      &H11F3
#define CL_COMMAND_WRITE_BUFFER                     &H11F4
#define CL_COMMAND_COPY_BUFFER                      &H11F5
#define CL_COMMAND_READ_IMAGE                       &H11F6
#define CL_COMMAND_WRITE_IMAGE                      &H11F7
#define CL_COMMAND_COPY_IMAGE                       &H11F8
#define CL_COMMAND_COPY_IMAGE_TO_BUFFER             &H11F9
#define CL_COMMAND_COPY_BUFFER_TO_IMAGE             &H11FA
#define CL_COMMAND_MAP_BUFFER                       &H11FB
#define CL_COMMAND_MAP_IMAGE                        &H11FC
#define CL_COMMAND_UNMAP_MEM_OBJECT                 &H11FD
#define CL_COMMAND_MARKER                           &H11FE
#define CL_COMMAND_ACQUIRE_GL_OBJECTS               &H11FF
#define CL_COMMAND_RELEASE_GL_OBJECTS               &H1200
#define CL_COMMAND_READ_BUFFER_RECT                 &H1201
#define CL_COMMAND_WRITE_BUFFER_RECT                &H1202
#define CL_COMMAND_COPY_BUFFER_RECT                 &H1203
#define CL_COMMAND_USER                             &H1204

' command execution status
#define CL_COMPLETE                                 &H0
#define CL_RUNNING                                  &H1
#define CL_SUBMITTED                                &H2
#define CL_QUEUED                                   &H3

' cl_buffer_create_type
#define CL_BUFFER_CREATE_TYPE_REGION                &H1220

' cl_profiling_info
#define CL_PROFILING_COMMAND_QUEUED                 &H1280
#define CL_PROFILING_COMMAND_SUBMIT                 &H1281
#define CL_PROFILING_COMMAND_START                  &H1282
#define CL_PROFILING_COMMAND_END                    &H1283

' ################
' # Platform API #
' ################
' The OpenCL platform layer which implements platform-specific features 
' that allow applications to query OpenCL devices, device configuration information
' and to create OpenCL contexts using one or more devices.
declare function _
clGetPlatformIDs (byval num_entries   as cl_uint, _
                  byval platforms     as cl_platform_id ptr, _
                  byval num_platforms as cl_uint ptr) as cl_int

declare function _ 
clGetPlatformInfo(byval platform        as cl_platform_id, _
                  byval pname           as cl_platform_info, _
                  byval pvalue_size     as size_t, _ 
                  byval pvalue          as any ptr, _
                  byval pvalue_size_ret as size_t ptr) as cl_int

' ###############
' # Device APIs #
' ###############
declare function _
clGetDeviceIDs(byval platform    as cl_platform_id, _
               byval device_type as cl_device_type, _
               byval num_entries as cl_uint, _
               byval devices     as cl_device_id ptr, _ 
               byval num_devices as cl_uint ptr) as cl_int

declare function _
clGetDeviceInfo(byval device               as cl_device_id, _
                byval param_name           as cl_device_info, _
                byval param_value_size     as size_t, _
                byval param_value          as any ptr, _
                byval param_value_size_ret as size_t ptr) as cl_int

' ################
' # Context APIs #
' ################
' An OpenCL context is created with one or more devices. 
' Contexts are used by the OpenCL runtime for managing objects such as 
' command-queues, memory, program and kernel objects and for executing 
' kernels on one or more devices specified in the context.
type context_notify_t as sub (byval errinfo      as const zstring ptr, _
                              byval private_info as const any ptr, _
                              byval cb           as size_t, _
                              byval user_data    as any ptr)
declare function _
clCreateContext(byval properties  as cl_context_properties ptr, _
                byval num_devices as cl_uint, _
                byval devices     as cl_device_id ptr, _
                byval pfn_notify  as context_notify_t, _
                byval user_data   as any ptr, _
                byval errcode_ret as cl_int ptr) as cl_context

declare function _
clCreateContextFromType(byval properties  as cl_context_properties ptr, _
                        byval device_type as cl_device_type, _
                        byval pfn_notify  as context_notify_t, _
                        byval user_data   as any ptr, _
                        byval errcode_ret as cl_int ptr) as cl_context

declare function _
clRetainContext(byval context as cl_context) as cl_int

declare function _
clReleaseContext(byval context as cl_context) as cl_int

declare function _
clGetContextInfo(byval context          as cl_context, _
                 byval param_name       as cl_context_info, _
                 byval param_value_size as size_t, _ 
                 byval param_value      as any ptr, _ 
                 byval param_value_size_ret as size_t ptr) as cl_int

' ######################
' # Command Queue APIs #
' ######################
declare function _
clCreateCommandQueue(byval context     as cl_context, _
                     byval device      as cl_device_id, _
                     byval properties  as cl_command_queue_properties, _
                     byval errcode_ret as cl_int ptr) as cl_command_queue

declare function _
clRetainCommandQueue(byval command_queue as cl_command_queue) as cl_int

declare function _
clReleaseCommandQueue(byval command_queue as cl_command_queue) as cl_int

declare function _
clGetCommandQueueInfo(byval command_queue    as cl_command_queue, _
                      byval param_name       as cl_command_queue_info, _
                      byval param_value_size as size_t, _
                      byval param_value      as any ptr, _
                      byval param_value_size_ret as size_t ptr) as cl_int

#ifdef CL_USE_DEPRECATED_OPENCL_1_0_APIS
' CL_USE_DEPRECATED_OPENCL_1_0_APIS is defined. 
' These APIs are unsupported and untested in OpenCL 1.1!
declare function _
clSetCommandQueueProperty(byval command_queue  as cl_command_queue, _
                          byval properties     as cl_command_queue_properties, _
                          byval enable         as cl_bool, _
                          byval old_properties as cl_command_queue_properties ptr) as cl_int
#endif

' ######################
' # Memory Object APIs #
' ######################
declare function _
clGetSupportedImageFormats(byval context    as cl_context, _
                           byval flags      as cl_mem_flags, _
                           byval image_type as cl_mem_object_type, _
                           byval entries    as cl_uint, _
                           byval formats    as cl_image_format ptr, _
                           byval nformats   as cl_uint ptr) as cl_int

declare function _
clCreateBuffer(byval context     as cl_context, _
               byval flags       as cl_mem_flags, _
               byval size        as size_t, _
               byval host_ptr    as any ptr, _
               byval errcode_ret as cl_int ptr) as cl_mem

declare function _
clCreateSubBuffer(byval buffer             as cl_mem, _
                  byval flags              as cl_mem_flags, _
                  byval buffer_create_type as cl_buffer_create_type, _
                  byval buffer_create_info as const any ptr, _
                  byval errcode_ret        as cl_int ptr) as cl_mem
CL_API_SUFFIX__VERSION_1_1

declare function _
clCreateImage2D(byval context         as cl_context, _
                byval flags           as cl_mem_flags, _
                byval image_format    as cl_image_format ptr, _
                byval image_width     as size_t, _
                byval image_height    as size_t, _
                byval image_row_pitch as size_t, _
                byval host_ptr        as any ptr, _
                byval errcode_ret     as cl_int ptr) as cl_mem

declare function _
clCreateImage3D(byval context           as cl_context, _
                byval flags             as cl_mem_flags, _
                byval image_format      as cl_image_format ptr, _
                byval image_width       as size_t, _
                byval image_height      as size_t, _
                byval image_depth       as size_t, _
                byval image_row_pitch   as size_t, _
                byval image_slice_pitch as size_t, _
                byval host_ptr          as any ptr, _
                byval errcode_ret       as cl_int ptr) as cl_mem

' This function increments the memobj reference count.
declare function _
clRetainMemObject(byval memobj as cl_mem) as cl_int

' This function decrements the memobj reference count.
' After the memobj reference count becomes zero and commands queued for execution 
' on a command-queue(s) that use memobj have finished, the memory object is deleted.
declare function _
clReleaseMemObject(byval memobj as cl_mem) as cl_int


declare function _
clGetMemObjectInfo(byval memobj         as cl_mem, _
                   byval param_name     as cl_mem_info, _
                   byval value_size     as size_t, _
                   byval value          as any ptr, _
                   byval value_size_ret as size_t ptr) as cl_int

declare function _
clGetImageInfo(byval image          as cl_mem, _
               byval param_name     as cl_image_info, _
               byval value_size     as size_t, _
               byval value          as any ptr, _
               byval value_size_ret as size_t ptr) as cl_int

type destructorcb_t as sub(memobj as cl_mem ,user_data as any ptr)
declare function _
clSetMemObjectDestructorCallback(byval memobj     as cl_mem, _
                                 byval pfn_notify as destructorcb_t, _
                                 byval user_data  as any ptr) as cl_int
CL_API_SUFFIX__VERSION_1_1

' ################
' # Sampler APIs #
' ################
' A sampler object describes how to sample an image when the image is read in the kernel.
' The built-in functions to read from an image in a kernel take a sampler as an argument.
' The sampler arguments to the image read function can be sampler objects created using OpenCL functions
' and passed as argument values to the kernel or can be samplers declared inside a kernel.
declare function _
clCreateSampler(byval context           as cl_context, _
                byval normalized_coords as cl_bool, _
                byval addressing_mode   as cl_addressing_mode, _
                byval filter_mode       as cl_filter_mode, _
                byval errcode_ret       as cl_int ptr) as cl_sampler

declare function _
clRetainSampler(byval sampler as cl_sampler) as cl_int

declare function _
clReleaseSampler(byval sampler as cl_sampler) as cl_int

declare function _
clGetSamplerInfo(byval sampler     as cl_sampler, _
                 byval pname       as cl_sampler_info, _
                 byval pvalue_size as size_t, _
                 byval pvalue      as any ptr, _
                 byval psize_ret   as size_t ptr) as cl_int

' #######################
' # Program Object APIs #
' #######################
declare function _
clCreateProgramWithSource(byval context     as cl_context, _
                          byval count       as cl_uint, _
                          byval strings     as zstring ptr ptr, _
                          byval lengths     as size_t ptr, _
                          byval errcode_ret as cl_int ptr) as cl_program

declare function _
clCreateProgramWithBinary(byval context       as cl_context, _
                          byval num_devices   as cl_uint, _
                          byval device_list   as cl_device_id ptr, _
                          byval lengths       as size_t ptr, _
                          byval binaries      as zstring ptr ptr, _ 
                          byval binary_status as cl_int ptr, _
                          byval errcode_ret   as cl_int ptr) as cl_program

declare function _
clRetainProgram(byval program as cl_program) as cl_int

declare function _
clReleaseProgram(byval program as cl_program) as cl_int

type program_notify_t as sub (byval program as cl_program, _
                              byval user_data as any ptr)

declare function _
clBuildProgram(byval program     as cl_program, _
               byval num_devices as cl_uint, _
               byval device_list as cl_device_id ptr, _
               byval options     as zstring ptr, _
               byval pfn_notify  as program_notify_t=0, _
               byval user_data   as any ptr) as cl_int

declare function _
clUnloadCompiler() as cl_int

declare function _
clGetProgramInfo(byval program         as cl_program, _
                 byval pname           as cl_program_info, _
                 byval pvalue_size     as size_t, _
                 byval pvalue          as any ptr, _
                 byval pvalue_size_ret as size_t ptr) as cl_int

declare function _
clGetProgramBuildInfo(byval program          as cl_program, _
                      byval device           as cl_device_id, _
                      byval param_name       as cl_program_build_info, _
                      byval param_value_size as size_t, _
                      byval param_value      as any ptr, _
                      byval param_value_size_ret as size_t ptr) as cl_int

' ######################
' # Kernel Object APIs #
' ######################
declare function _
clCreateKernel(byval program     as cl_program, _
               byval kernel_name as zstring ptr, _
               byval errcode_ret as cl_int ptr) as cl_kernel

declare function _
clCreateKernelsInProgram(byval program         as cl_program, _
                         byval num_kernels     as cl_uint, _
                         byval kernels         as cl_kernel ptr, _
                         byval num_kernels_ret as cl_uint ptr) as cl_int

declare function _
clRetainKernel(byval kernel as cl_kernel) as cl_int

declare function _
clReleaseKernel(byval kernel as cl_kernel) as cl_int

declare function _
clSetKernelArg(byval kernel    as cl_kernel, _
               byval arg_index as cl_uint, _
               byval arg_size  as size_t, _
               byval arg_value as any ptr) as cl_int

declare function _
clGetKernelInfo(byval kernel          as cl_kernel, _
                byval pname           as cl_kernel_info, _
                byval pvalue_size     as size_t, _
                byval pvalue          as any ptr, _
                byval pvalue_size_ret as size_t ptr) as cl_int

declare function _
clGetKernelWorkGroupInfo(byval kernel          as cl_kernel, _
                         byval device          as cl_device_id, _
                         byval pname           as cl_kernel_work_group_info, _
                         byval pvalue_size     as size_t, _
                         byval pvalue          as any ptr, _
                         byval pvalue_size_ret as size_t ptr) as cl_int

' #####################
' # Event Object APIs #
' #####################
declare function _
clWaitForEvents(byval num_events as cl_uint, _
                byval event_list as cl_event ptr) as cl_int

declare function _
clGetEventInfo(byval event           as cl_event, _
               byval pname           as cl_event_info, _
               byval pvalue_size     as size_t, _
               byval pvalue          as any ptr, _
               byval pvalue_size_ret as size_t ptr) as cl_int

declare function _
clCreateUserEvent(byval context     as cl_context, _
                  byval errcode_ret as cl_int) as cl_event 
CL_API_SUFFIX__VERSION_1_1

declare function _
clRetainEvent(byval event as cl_event ) as cl_int

declare function _
clReleaseEvent(byval event as cl_event) as cl_int

declare function _
clSetUserEventStatus(byval event            as cl_event, _
                     byval execution_status as cl_int) as cl_int
CL_API_SUFFIX__VERSION_1_1

type eventcb_t as sub (byval event as cl_event,byval event_command_exec_status as cl_int, byval userdata as any ptr)
declare function _
clSetEventCallback(byval event                      as cl_event , _
                   byval command_exec_callback_type as cl_int   , _ ' CL_COMPLETE 
                   byval pfn_notify                 as eventcb_t, _
                   byval user_data                  as any ptr) as cl_int
CL_API_SUFFIX__VERSION_1_1


' ##################
' # Profiling APIs #
' ##################
declare function _
clGetEventProfilingInfo(byval event           as cl_event, _
                        byval pname           as cl_profiling_info, _
                        byval pvalue_size     as size_t, _
                        byval pvalue          as any ptr, _
                        byval pvalue_size_ret as size_t ptr) as cl_int


' ##########################
' # Enqueued Commands APIs #
' ##########################
declare function _
clEnqueueReadBuffer(byval command_queue   as cl_command_queue, _
                    byval buffer          as cl_mem, _
                    byval blocking_read   as cl_bool, _
                    byval offset          as size_t, _
                    byval cb              as size_t, _
                    byval p               as any ptr, _
                    byval nevents_in_list as cl_uint, _
                    byval event_wait_list as cl_event ptr, _
                    byval event           as cl_event ptr) as cl_int

declare function _
clEnqueueWriteBuffer(byval command_queue   as cl_command_queue, _
                     byval buffer          as cl_mem, _
                     byval blocking_write  as cl_bool, _
                     byval offset          as size_t, _
                     byval cb              as size_t, _
                     byval p               as any ptr, _
                     byval nevents_in_list as cl_uint, _
                     byval event_wait_list as cl_event ptr, _
                     byval event           as cl_event ptr) as cl_int

declare function _
clEnqueueReadBufferRect(byval command_queue           as cl_command_queue, _
                        byval buffer                  as cl_mem, _
                        byval blocking_read           as cl_bool, _
                        byval buffer_origin           as const size_t ptr, _
                        byval host_origin             as const size_t ptr, _
                        byval region                  as const size_t ptr, _
                        byval buffer_row_pitch        as size_t, _
                        byval buffer_slice_pitch      as size_t, _
                        byval host_row_pitch          as size_t, _
                        byval host_slice_pitch        as size_t, _
                        byval p                       as any ptr, _
                        byval num_events_in_wait_list as cl_uint, _
                        byval event_wait_list         as const cl_event ptr, _
                        byval event                   as cl_event ptr)  as cl_int
CL_API_SUFFIX__VERSION_1_1

declare function _
clEnqueueWriteBufferRect(byval command_queue           as cl_command_queue, _
                         byval buffer                  as cl_mem, _
                         byval blocking_write          as cl_bool, _
                         byval buffer_origin           as const size_t ptr, _
                         byval host_origin             as const size_t ptr, _ 
                         byval region                  as const size_t ptr, _
                         byval buffer_row_pitch        as size_t, _
                         byval buffer_slice_pitch      as size_t, _
                         byval host_row_pitch          as size_t, _
                         byval host_slice_pitch        as size_t, _
                         byval p                       as const any ptr, _
                         byval num_events_in_wait_list as cl_uint, _
                         byval event_wait_list         as const cl_event ptr, _
                         byval event                   as cl_event ptr) as cl_int 
CL_API_SUFFIX__VERSION_1_1

declare function _
clEnqueueCopyBuffer(byval command_queue   as cl_command_queue, _
                    byval src_buffer      as cl_mem, _
                    byval dst_buffer      as cl_mem, _
                    byval src_offset      as size_t, _
                    byval dst_offset      as size_t, _
                    byval cb              as size_t, _
                    byval nevents_in_list as cl_uint, _
                    byval event_list      as cl_event ptr, _
                    byval event           as cl_event ptr) as cl_int

declare function _
clEnqueueCopyBufferRect(byval command_queue           as cl_command_queue, _
                        byval src_buffer              as cl_mem, _
                        byval dst_buffer              as cl_mem,  _
                        byval src_origin              as const size_t ptr, _
                        byval dst_origin              as const size_t ptr, _
                        byval region                  as const size_t ptr, _
                        byval src_row_pitch           as size_t, _
                        byval src_slice_pitch         as size_t, _
                        byval dst_row_pitch           as size_t, _
                        byval dst_slice_pitch         as size_t, _
                        byval num_events_in_wait_list as cl_uint, _
                        byval event_wait_list         as const cl_event ptr, _
                        byval event                   as cl_event ptr) as cl_int
CL_API_SUFFIX__VERSION_1_1

declare function _
clEnqueueReadImage(byval command_queue   as cl_command_queue, _
                   byval image           as cl_mem, _
                   byval blocking_read   as cl_bool, _
                   byval origin          as size_t ptr, _
                   byval region          as size_t ptr, _
                   byval row_pitch       as size_t, _
                   byval slice_pitch     as size_t, _
                   byval p               as  any ptr, _
                   byval nevents_in_list as cl_uint, _
                   byval event_list      as cl_event ptr, _
                   byval event           as cl_event ptr) as cl_int

declare function _
clEnqueueWriteImage(byval command_queue     as cl_command_queue, _
                    byval image             as cl_mem, _
                    byval blocking_write    as cl_bool, _
                    byval origin            as size_t ptr, _
                    byval region            as size_t ptr, _
                    byval input_row_pitch   as size_t, _
                    byval input_slice_pitch as size_t, _
                    byval p                 as any ptr, _
                    byval nevents_in_list   as cl_uint, _
                    byval event_wait_list   as cl_event ptr, _
                    byval event             as cl_event ptr) as cl_int

declare function _
clEnqueueCopyImage(byval command_queue   as cl_command_queue, _
                   byval src_image       as cl_mem, _
                   byval dst_image       as cl_mem, _
                   byval src_origin      as size_t ptr, _
                   byval dst_origin      as const size_t ptr, _
                   byval region          as size_t ptr, _
                   byval nevents_in_list as cl_uint, _
                   byval event_wait_list as cl_event ptr, _
                   byval event           as cl_event ptr) as cl_int

declare function _
clEnqueueCopyImageToBuffer(byval command_queue   as cl_command_queue, _
                           byval src_image       as cl_mem, _
                           byval dst_buffer      as cl_mem, _
                           byval src_origin      as size_t ptr, _
                           byval region          as size_t ptr, _
                           byval dst_offset      as size_t, _
                           byval nevents_in_list as cl_uint, _
                           byval event_wait_list as cl_event ptr, _
                           byval event           as cl_event ptr) as cl_int

declare function _
clEnqueueCopyBufferToImage(byval command_queue   as cl_command_queue, _
                           byval src_buffer      as cl_mem, _
                           byval dst_image       as cl_mem, _
                           byval src_offset      as size_t, _
                           byval dst_origin      as size_t ptr, _
                           byval region          as size_t ptr, _
                           byval nevents_in_list as cl_uint, _
                           byval event_wait_list as cl_event ptr, _
                           byval event           as cl_event ptr) as cl_int

declare function _
clEnqueueMapBuffer(byval command_queue   as cl_command_queue, _
                   byval buffer          as cl_mem, _
                   byval blocking_map    as cl_bool, _
                   byval map_flags       as cl_map_flags, _
                   byval offset          as size_t, _
                   byval cb              as size_t, _
                   byval nevents_in_list as cl_uint, _
                   byval event_wait_list as cl_event ptr, _
                   byval event           as cl_event ptr, _
                   byval errcode_ret     as cl_int ptr) as any ptr

declare function _
clEnqueueMapImage(byval command_queue     as cl_command_queue, _
                  byval image             as cl_mem, _
                  byval blocking_map      as cl_bool, _
                  byval map_flags         as cl_map_flags, _
                  byval origin            as size_t ptr, _
                  byval region            as size_t ptr, _
                  byval image_row_pitch   as size_t ptr, _
                  byval image_slice_pitch as size_t ptr, _
                  byval num_events_list   as cl_uint, _
                  byval event_wait_list   as cl_event ptr, _
                  byval event             as cl_event ptr, _
                  byval errcode_ret       as cl_int ptr) as any ptr

declare function _
clEnqueueUnmapMemObject(byval command_queue   as cl_command_queue, _
                        byval memobj          as cl_mem, _
                        byval mapped_ptr      as any ptr, _
                        byval nevents_in_list as cl_uint, _
                        byval event_list      as cl_event ptr, _
                        byval event           as cl_event ptr) as cl_int

declare function _
clEnqueueNDRangeKernel(byval command_queue      as cl_command_queue, _
                       byval kernel             as cl_kernel, _
                       byval work_dim           as cl_uint, _
                       byval global_work_offset as size_t ptr, _
                       byval global_work_size   as size_t ptr, _
                       byval local_work_size    as size_t ptr, _
                       byval nevents_in_list    as cl_uint, _
                       byval event_wait_list    as cl_event ptr, _
                       byval event              as cl_event ptr) as cl_int

declare function _
clEnqueueTask(byval command_queue   as cl_command_queue, _
              byval kernel          as cl_kernel, _
              byval nevents_in_list as cl_uint, _
              byval event_wait_list as cl_event ptr, _
              byval event           as cl_event ptr) as cl_int

type user_func_t as sub (byval args as any ptr)
declare function _
clEnqueueNativeKernel(byval command_queue   as cl_command_queue, _
                      byval user_func       as user_func_t, _ 
                      byval args            as any ptr, _
                      byval cb_args         as size_t, _
                      byval num_mem_objects as cl_uint, _
                      byval mem_list        as cl_mem ptr, _
                      byval args_mem_loc    as any ptr ptr, _
                      byval nevents_in_list as cl_uint, _
                      byval event_wait_list as cl_event ptr, _
                      byval event           as cl_event ptr) as cl_int

declare function _
clEnqueueMarker(byval command_queue as cl_command_queue, _
                byval event as cl_event ptr) as cl_int

declare function _
clEnqueueWaitForEvents(byval command_queue as cl_command_queue, _
                       byval num_events as cl_uint, _
                       byval event_list as const cl_event ptr) as cl_int

declare function _
clEnqueueBarrier(byval command_queue as cl_command_queue) as cl_int

' #########################
' # Flush and Finish APIs #
' #########################
declare function _
clFlush(byval command_queue as cl_command_queue) as cl_int

declare function _
clFinish(byval command_queue as cl_command_queue) as cl_int

' Extension function access
'
' Returns the extension function address for the given function name,
' or NULL if a valid function can not be found.
' The client must check to make sure the address is not NULL, 
' before using or calling the returned function address.
declare function clGetExtensionFunctionAddress(byval func_name as zstring ptr) as any ptr


end extern

#endif ' __OPENCL_CL_BI__


#ifndef __CL_EXT_BI__
#define __CL_EXT_BI__

#ifdef __FB_WIN32__
extern "Windows-MS"
#else
extern "C"
#endif



#define CL_DEVICE_DOUBLE_FP_CONFIG                  &H1032
#define CL_DEVICE_HALF_FP_CONFIG                    &H1033

' Memory object destruction
' Apple extension for use to manage externally allocated buffers used with cl_mem objects with CL_MEM_USE_HOST_PTR
' Registers a user callback function that will be called when the memory object is deleted and its resources 
' freed. Each call to clSetMemObjectCallbackFn registers the specified user callback function on a callback 
' stack associated with memobj. The registered user callback functions are called in the reverse order in 
' which they were registered. The user callback functions are called and then the memory object is deleted 
' and its resources freed. This provides a mechanism for the application (and libraries) using memobj to be 
' notified when the memory referenced by host_ptr, specified when the memory object is created and used as 
' the storage bits for the memory object, can be reused or freed.
' The application may not call CL api's with the cl_mem object passed to the pfn_notify.
' Please check for the "cl_APPLE_SetMemObjectDestructor" extension using clGetDeviceInfo(CL_DEVICE_EXTENSIONS) before using.
#define cl_APPLE_SetMemObjectDestructor 1

type destructorcb_t as sub(memobj as cl_mem ,user_data as any ptr)
declare function _
clSetMemObjectDestructorAPPLE(byval memobj     as cl_mem, _
                              byval pfn_notify as destructorcb_t, _
                              byval user_data  as any ptr) as cl_int
CL_EXT_SUFFIX__VERSION_1_0


' Context Logging Functions
' The next three convenience functions are intended to be used as the pfn_notify parameter to clCreateContext().
' Please check for the "cl_APPLE_ContextLoggingFunctions" extension using clGetDeviceInfo(CL_DEVICE_EXTENSIONS) before using.
' clLogMessagesToSystemLog fowards on all log messages to the Apple System Logger 
#define cl_APPLE_ContextLoggingFunctions 1
declare sub _
clLogMessagesToSystemLogAPPLE(byval errstr       as const zstring ptr, _
                              byval private_info as const any ptr, _
                              byval cb           as size_t, _
                              byval user_data    as any ptr)
CL_EXT_SUFFIX__VERSION_1_0

'clLogMessagesToStdout sends all log messages to the file descriptor stdout
declare sub _
clLogMessagesToStdoutAPPLE(byval errstr       as const zstring ptr, _
                           byval private_info as const any ptr, _
                           byval cb           as size_t, _
                           byval user_data    as any ptr)
CL_EXT_SUFFIX__VERSION_1_0

' clLogMessagesToStderr sends all log messages to the file descriptor stderr
declare sub _
clLogMessagesToStderrAPPLE(byval errstr       as const zstring ptr, _
                           byval private_info as const any ptr, _
                           byval cb           as size_t, _
                           byval user_data    as any ptr)
CL_EXT_SUFFIX__VERSION_1_0


' ######################## 
' # cl_khr_icd extension #
' ########################
#define cl_khr_icd 1

' cl_platform_info
#define CL_PLATFORM_ICD_SUFFIX_KHR                  &H0920

' Additional Error Codes
#define CL_PLATFORM_NOT_FOUND_KHR                   -1001

declare function _
clIcdGetPlatformIDsKHR(byval num_entries   as cl_uint, _
                       byval platforms     as cl_platform_id ptr, _
                       byval num_platforms as cl_uint ptr) as cl_int

type clIcdGetPlatformIDsKHR_fn as function (byval num_entries   as cl_uint, _
                                            byval platforms     as cl_platform_id, _
                                            byval num_platforms as cl_uint ptr) as cl_int

' ##########################################
' # cl_nv_device_attribute_query extension #
' ##########################################
' cl_nv_device_attribute_query extension - no extension #define since it has no functions
#define CL_DEVICE_COMPUTE_CAPABILITY_MAJOR_NV       &H4000
#define CL_DEVICE_COMPUTE_CAPABILITY_MINOR_NV       &H4001
#define CL_DEVICE_REGISTERS_PER_BLOCK_NV            &H4002
#define CL_DEVICE_WARP_SIZE_NV                      &H4003
#define CL_DEVICE_GPU_OVERLAP_NV                    &H4004
#define CL_DEVICE_KERNEL_EXEC_TIMEOUT_NV            &H4005
#define CL_DEVICE_INTEGRATED_MEMORY_NV              &H4006

' #################################
' # cl_amd_device_attribute_query #
' #################################
#define CL_DEVICE_PROFILING_TIMER_OFFSET_AMD        &H4036

' ###########################
' # cl_arm_printf extension #
' ###########################
#define CL_PRINTF_CALLBACK_ARM                      &H40B0
#define CL_PRINTF_BUFFERSIZE_ARM                    &H40B1

#ifdef CL_VERSION_1_1
' ###################################
' # cl_ext_device_fission extension #
' ###################################
#define cl_ext_device_fission 1
    
declare function _
clReleaseDeviceEXT(byval device as cl_device_id) as cl_int
CL_EXT_SUFFIX__VERSION_1_1
    
type clReleaseDeviceEXT_fn as function(byval device as cl_device_id) as cl_int
CL_EXT_SUFFIX__VERSION_1_1

declare function _
clRetainDeviceEXT(byval device as cl_device_id) as cl_int
CL_EXT_SUFFIX__VERSION_1_1 
    
type clRetainDeviceEXT_fn as function (byval device as cl_device_id) as cl_int
CL_EXT_SUFFIX__VERSION_1_1

type cl_device_partition_property_ext as cl_ulong
declare function _
clCreateSubDevicesEXT(byval in_device  as cl_device_id, _
                      byval properties  as const cl_device_partition_property_ext ptr, _
                      byval num_entries as cl_uint, _
                      byval out_devices as cl_device_id ptr, _
                      byval num_devices as cl_uint ptr)  as cl_int
CL_EXT_SUFFIX__VERSION_1_1

type clCreateSubDevicesEXT_fn as function(byval in_device   as cl_device_id, _
                                          byval properties  as const cl_device_partition_property_ext ptr, _
                                          byval num_entries as cl_uint, _
                                          byval out_devices as cl_device_id ptr, _
                                          byval num_devices as cl_uint ptr) as cl_int


'* cl_device_partition_property_ext
#define CL_DEVICE_PARTITION_EQUALLY_EXT             &H4050
#define CL_DEVICE_PARTITION_BY_COUNTS_EXT           &H4051
#define CL_DEVICE_PARTITION_BY_NAMES_EXT            &H4052
#define CL_DEVICE_PARTITION_BY_AFFINITY_DOMAIN_EXT  &H4053

' clDeviceGetInfo selectors
#define CL_DEVICE_PARENT_DEVICE_EXT                 &H4054
#define CL_DEVICE_PARTITION_TYPES_EXT               &H4055
#define CL_DEVICE_AFFINITY_DOMAINS_EXT              &H4056
#define CL_DEVICE_REFERENCE_COUNT_EXT               &H4057
#define CL_DEVICE_PARTITION_STYLE_EXT               &H4058

' error codes
#define CL_DEVICE_PARTITION_FAILED_EXT              -1057
#define CL_INVALID_PARTITION_COUNT_EXT              -1058
#define CL_INVALID_PARTITION_NAME_EXT               -1059

' CL_AFFINITY_DOMAINs
#define CL_AFFINITY_DOMAIN_L1_CACHE_EXT             &H1
#define CL_AFFINITY_DOMAIN_L2_CACHE_EXT             &H2
#define CL_AFFINITY_DOMAIN_L3_CACHE_EXT             &H3
#define CL_AFFINITY_DOMAIN_L4_CACHE_EXT             &H4
#define CL_AFFINITY_DOMAIN_NUMA_EXT                 &H10
#define CL_AFFINITY_DOMAIN_NEXT_FISSIONABLE_EXT     &H100

' cl_device_partition_property_ext list terminators
#define CL_PROPERTIES_LIST_END_EXT                  cast(cl_device_partition_property_ext,0)
#define CL_PARTITION_BY_COUNTS_LIST_END_EXT         cast(cl_device_partition_property_ext,0)
#define CL_PARTITION_BY_NAMES_LIST_END_EXT          cast(cl_device_partition_property_ext,0 - 1)

' ##################################
' # cl_qcom_ext_host_ptr extension #
' ##################################
#define CL_MEM_EXT_HOST_PTR_QCOM                    (1 SHL 29)

#define CL_DEVICE_EXT_MEM_PADDING_IN_BYTES_QCOM     &H40A0      
#define CL_DEVICE_PAGE_SIZE_QCOM                    &H40A1
#define CL_IMAGE_ROW_ALIGNMENT_QCOM                 &H40A2
#define CL_IMAGE_SLICE_ALIGNMENT_QCOM               &H40A3
#define CL_MEM_HOST_UNCACHED_QCOM                   &H40A4
#define CL_MEM_HOST_WRITEBACK_QCOM                  &H40A5
#define CL_MEM_HOST_WRITETHROUGH_QCOM               &H40A6
#define CL_MEM_HOST_WRITE_COMBINING_QCOM            &H40A7

type cl_image_pitch_info_qcom as cl_uint

declare function _
clGetDeviceImageInfoQCOM(byval device               as cl_device_id, _
                         byval image_width          as size_t, _
                         byval image_height         as size_t, _
                         byval image_format         as const cl_image_format ptr, _
                         byval param_name           as cl_image_pitch_info_qcom, _
                         byval param_value_size     as size_t, _
                         byval param_value          as any ptr, _
                         byval param_value_size_ret as size_t ptr) as cl_int

type cl_mem_ext_host_ptr
  as cl_uint  allocation_type          ' Legal values will be defined in layered extensions.
  as cl_uint  host_cache_policy        ' Host cache policy for this external memory allocation.
end type

' ##################################
' # cl_qcom_ion_host_ptr extension #
' ##################################
#define CL_MEM_ION_HOST_PTR_QCOM                    &H40A8
type cl_mem_ion_host_ptr
  as cl_mem_ext_host_ptr ext_host_ptr ' Must be CL_MEM_ION_HOST_PTR_QCOM for ION allocations.
  as cl_int              ion_filedesc ' ION file descriptor
  as any ptr             ion_hostptr  ' Host pointer to the ION allocated memory
end type

#endif ' CL_VERSION_1_1


end extern

#endif ' __CL_EXT_HBI__



#ifdef __gl_h_

#ifdef __FB_WIN32__
extern "Windows-MS"
#else
extern "C"
#endif

' NOTE:  Make sure that appropriate GL header file is included separately

type cl_gl_object_type   as cl_uint
type cl_gl_texture_info  as cl_uint
type cl_gl_platform_info as cl_uint
type cl_GLsync           as _GLsync ptr

' cl_gl_object_type
#define CL_GL_OBJECT_BUFFER                         &H2000
#define CL_GL_OBJECT_TEXTURE2D                      &H2001
#define CL_GL_OBJECT_TEXTURE3D                      &H2002
#define CL_GL_OBJECT_RENDERBUFFER                   &H2003

' cl_gl_texture_info
#define CL_GL_TEXTURE_TARGET                        &H2004
#define CL_GL_MIPMAP_LEVEL                          &H2005

declare function _
clCreateFromGLBuffer(byval context     as cl_context, _
                     byval flags       as cl_mem_flags, _
                     byval bufobj      as GLuint, _
                     byval errcode_ret as integer ptr) as cl_mem

declare function _
clCreateFromGLTexture2D(byval context     as cl_context, _
                        byval flags       as cl_mem_flags, _
                        byval target      as GLenum, _
                        byval miplevel    as GLint, _
                        byval texture     as GLuint, _
                        byval errcode_ret as cl_int ptr) as cl_mem

declare function _
clCreateFromGLTexture3D(byval context     as cl_context, _
                        byval flags       as cl_mem_flags, _
                        byval target      as GLenum, _
                        byval miplevel    as GLint, _
                        byval texture     as GLuint, _
                        byval errcode_ret as cl_int ptr)  as cl_mem

declare function _
clCreateFromGLRenderbuffer(byval context      as cl_context, _
                           byval flags        as cl_mem_flags, _
                           byval renderbuffer as GLuint, _
                           byval errcode_ret  as cl_int ptr)  as cl_mem

declare function _
clGetGLObjectInfo(byval memobj         as cl_mem, _
                  byval gl_object_type as cl_gl_object_type ptr, _
                  byval gl_object_name as GLuint ptr) as cl_int
                  
declare function _
clGetGLTextureInfo(byval memobj               as cl_mem, _
                   byval param_name           as cl_gl_texture_info, _
                   byval param_value_size     as size_t, _
                   byval param_value          as any ptr, _
                   byval param_value_size_ret as size_t ptr) as cl_int

declare function _
clEnqueueAcquireGLObjects(byval command_queue   as cl_command_queue, _
                          byval num_objects     as cl_uint, _
                          byval mem_objects     as cl_mem ptr, _
                          byval nevents_in_list as cl_uint, _
                          byval event_list      as cl_event ptr, _
                          byval event           as cl_event ptr) as cl_int

declare function _
clEnqueueReleaseGLObjects(byval command_queue   as cl_command_queue, _
                          byval num_objects     as cl_uint, _
                          byval mem_objects     as cl_mem ptr, _
                          byval nevents_in_list as cl_uint, _
                          byval event_list      as cl_event ptr, _
                          byval event           as cl_event ptr) as cl_int

'cl_khr_gl_sharing extension

#define cl_khr_gl_sharing 1
type cl_gl_context_info as cl_uint

' Additional Error Codes
#define CL_INVALID_GL_SHAREGROUP_REFERENCE_KHR  -1000

' cl_gl_context_info
#define CL_CURRENT_DEVICE_FOR_GL_CONTEXT_KHR    &H2006
#define CL_DEVICES_FOR_GL_CONTEXT_KHR           &H2007

' Additional cl_context_properties
#define CL_GL_CONTEXT_KHR                       &H2008
#define CL_EGL_DISPLAY_KHR                      &H2009
#define CL_GLX_DISPLAY_KHR                      &H200A
#define CL_WGL_HDC_KHR                          &H200B
#define CL_CGL_SHAREGROUP_KHR                   &H200C

declare function _
clGetGLContextInfoKHR(byval properties           as const cl_context_properties ptr, _
                      byval param_name           as cl_gl_context_info, _
                      byval param_value_size     as size_t, _
                      byval param_value          as any ptr, _
                      byval param_value_size_ret as size_t ptr) as cl_int

type clGetGLContextInfoKHR_fn as function(byval properties           as const cl_context_properties ptr, _
                                          byval param_name           as cl_gl_context_info, _
                                          byval param_value_size     as size_t, _
                                          byval param_value          as any ptr, _
                                          byval param_value_size_ret as size_t ptr) as cl_int

end extern

#endif  ' __gl_h_

#ifndef __OPENCL_CL_GL_EXT_BI__
#define __OPENCL_CL_GL_EXT_BI__

#ifdef __gl_h_

#ifdef __FB_WIN32__
extern "Windows-MS"
#else
extern "C"
#endif


#define CL_COMMAND_GL_FENCE_SYNC_OBJECT_KHR     0x200D

declare function _
clCreateEventFromGLsyncKHR(byval context     as cl_context , _
                           byval cl_GLsync   as cl_GLsync, _
                           byval errcode_ret as cl_int ptr) as cl_int
CL_EXT_SUFFIX__VERSION_1_1


end extern
#endif ' __gl_h_
#endif ' __OPENCL_CL_GL_EXT_BI__


