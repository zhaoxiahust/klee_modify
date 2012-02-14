; ModuleID = 'thread.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { void (i32)* }
%1 = type { %2, [20 x i32] }
%2 = type { i32, i32, i32, i64, i64 }
%struct.Elf64_auxv_t = type { i64, %union.anon }
%struct.FILE = type { i16, [2 x i8], i32, i8*, i8*, i8*, i8*, i8*, i8*, %struct.FILE*, [2 x i32], %struct.__mbstate_t }
%struct.__kernel_termios = type { i32, i32, i32, i32, i8, [19 x i8] }
%struct.__mbstate_t = type { i32, i32 }
%struct.__sigset_t = type { [16 x i64] }
%struct.anon = type { i32, i32 }
%struct.kernel_sigaction = type { void (i32)*, i64, void ()*, %struct.__sigset_t }
%struct.sigaction = type { %0, %struct.__sigset_t, i32, void ()* }
%struct.siginfo_t = type { i32, i32, i32, %1 }
%struct.sigset_t = type { [16 x i64] }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [3 x i64] }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%union.anon = type { i64 }
%union.sigval_t = type { i8* }

@.str = private constant [2 x i8] c"m\00", align 1
@.str1 = private constant [6 x i8] c"hello\00", align 1
@.str2 = private constant [4 x i8] c"not\00", align 1
@.str3 = private constant [3 x i8] c"mm\00", align 1
@.str4 = private constant [9 x i8] c"filename\00", align 1
@.str5 = private constant [5 x i8] c"flag\00", align 1
@.str6 = private constant [3 x i8] c"hi\00", align 1
@.str7 = private constant [3 x i8] c"re\00", align 1
@__libc_stack_end = global i8* null
@__uclibc_progname = hidden global i8* null
@__environ = global i8** null
@__pagesize = global i64 0
@.str8 = private constant [10 x i8] c"/dev/null\00", align 1
@been_there_done_that.2846 = internal global i32 0
@__app_fini = hidden global void ()* null
@__rtld_fini = hidden global void ()* null
@_stdio_streams = internal global [3 x %struct.FILE] [%struct.FILE { i16 544, [2 x i8] zeroinitializer, i32 0, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i
@stdin = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0)
@stdout = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1)
@stderr = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 2)
@__stdin = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0)
@__stdout = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1)
@_stdio_openlist = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0)
@been_there_done_that = internal global i32 0
@__exit_cleanup = hidden global void (i32)* null
@errno = global i32 0
@h_errno = global i32 0
@.str37 = private constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str138 = private constant [15 x i8] c"divide by zero\00", align 1
@.str239 = private constant [8 x i8] c"div.err\00", align 1

@__progname = alias i8** @__uclibc_progname
@environ = alias weak i8*** @__environ
@strcoll = alias i32 (i8*, i8*)* @strcmp
@putchar = alias i32 (i32)* @putchar_unlocked
@fputc_unlocked = alias i32 (i32, %struct.FILE*)* @__fputc_unlocked
@putc_unlocked = alias i32 (i32, %struct.FILE*)* @__fputc_unlocked
@fputc = alias i32 (i32, %struct.FILE*)* @__fputc_unlocked
@putc = alias i32 (i32, %struct.FILE*)* @__fputc_unlocked
@raise = alias weak i32 (i32)* @__raise
@sigaction = alias weak i32 (i32, %struct.sigaction*, %struct.sigaction*)* @__libc_sigaction
@fseeko = alias i32 (%struct.FILE*, i64, i32)* @fseek

define i8* @func(i8* %a) nounwind {
entry:
  %a_addr = alloca i8*, align 8
  %retval = alloca i8*
  %m = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %a, i8** %a_addr
  %0 = call i32 (...)* @klee_make_symbolic(i32* %m, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !685
  %1 = load i32* %m, align 4, !dbg !687
  %2 = icmp eq i32 %1, 0, !dbg !687
  br i1 %2, label %bb, label %bb1, !dbg !687

bb:                                               ; preds = %entry
  %3 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !688
  br label %return, !dbg !688

bb1:                                              ; preds = %entry
  %4 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !689
  br label %return, !dbg !689

return:                                           ; preds = %bb, %bb1
  %retval3 = load i8** %retval, !dbg !690
  ret i8* %retval3, !dbg !690
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @klee_make_symbolic(...)

declare i32 @printf(i8* noalias, ...) nounwind

define i32 @__user_main(i32 %argc, i8** %argv) nounwind {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %retval = alloca i32
  %m = alloca i32
  %flag = alloca i32
  %file = alloca i8*
  %thread = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  %0 = call i32 (...)* @klee_make_symbolic(i32* %m, i64 4, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) nounwind, !dbg !691
  %1 = load i8** %file, align 8, !dbg !693
  %2 = call i32 (...)* @klee_make_symbolic(i8* %1, i64 8, i8* getelementptr inbounds ([9 x i8]* @.str4, i64 0, i64 0)) nounwind, !dbg !693
  %3 = call i32 (...)* @klee_make_symbolic(i32* %flag, i64 4, i8* getelementptr inbounds ([5 x i8]* @.str5, i64 0, i64 0)) nounwind, !dbg !694
  %4 = load i32* %m, align 4, !dbg !695
  %5 = icmp eq i32 %4, 77, !dbg !695
  br i1 %5, label %bb, label %bb1, !dbg !695

bb:                                               ; preds = %entry
  %6 = call i32 @putchar_unlocked(i32 104) nounwind, !dbg !696
  br label %bb1, !dbg !696

bb1:                                              ; preds = %bb, %entry
  %7 = load i8** %file, align 8, !dbg !697
  %8 = call i32 @strcmp(i8* %7, i8* getelementptr inbounds ([3 x i8]* @.str6, i64 0, i64 0)) nounwind readonly, !dbg !697
  %9 = icmp eq i32 %8, 0, !dbg !697
  br i1 %9, label %bb2, label %bb3, !dbg !697

bb2:                                              ; preds = %bb1
  %10 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([3 x i8]* @.str7, i64 0, i64 0)) nounwind, !dbg !698
  br label %return, !dbg !698

bb3:                                              ; preds = %bb1
  %11 = call i32 @putchar_unlocked(i32 106) nounwind, !dbg !699
  br label %return, !dbg !699

return:                                           ; preds = %bb2, %bb3
  %retval5 = load i32* %retval, !dbg !700
  ret i32 %retval5, !dbg !700
}

define internal void @__check_one_fd(i32 %fd, i32 %mode) nounwind {
entry:
  %fd_addr = alloca i32, align 4
  %mode_addr = alloca i32, align 4
  %iftmp.0 = alloca i32
  %st = alloca %struct.stat
  %nullfd = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %fd, i32* %fd_addr
  store i32 %mode, i32* %mode_addr
  %0 = load i32* %fd_addr, align 4, !dbg !701
  %1 = call i32 (i32, i32, ...)* @fcntl(i32 %0, i32 1) nounwind, !dbg !701
  %2 = icmp ne i32 %1, -1, !dbg !701
  br i1 %2, label %bb2, label %bb, !dbg !701

bb:                                               ; preds = %entry
  %3 = call i32* @__errno_location() nounwind readnone, !dbg !701
  %4 = load i32* %3, align 4, !dbg !701
  %5 = icmp ne i32 %4, 9, !dbg !701
  br i1 %5, label %bb2, label %bb1, !dbg !701

bb1:                                              ; preds = %bb
  store i32 1, i32* %iftmp.0, align 4, !dbg !701
  br label %bb3, !dbg !701

bb2:                                              ; preds = %bb, %entry
  store i32 0, i32* %iftmp.0, align 4, !dbg !701
  br label %bb3, !dbg !701

bb3:                                              ; preds = %bb2, %bb1
  %6 = load i32* %iftmp.0, align 4, !dbg !701
  %7 = sext i32 %6 to i64, !dbg !701
  %8 = icmp ne i64 %7, 0, !dbg !701
  br i1 %8, label %bb4, label %return, !dbg !701

bb4:                                              ; preds = %bb3
  %9 = load i32* %mode_addr, align 4, !dbg !703
  %10 = call i32 (i8*, i32, ...)* @open(i8* getelementptr inbounds ([10 x i8]* @.str8, i64 0, i64 0), i32 %9) nounwind, !dbg !703
  store i32 %10, i32* %nullfd, align 4, !dbg !703
  %11 = load i32* %nullfd, align 4, !dbg !705
  %12 = load i32* %fd_addr, align 4, !dbg !705
  %13 = icmp ne i32 %11, %12, !dbg !705
  br i1 %13, label %bb8, label %bb5, !dbg !705

bb5:                                              ; preds = %bb4
  %14 = load i32* %fd_addr, align 4, !dbg !705
  %15 = call i32 @fstat(i32 %14, %struct.stat* %st) nounwind, !dbg !705
  %16 = icmp ne i32 %15, 0, !dbg !705
  br i1 %16, label %bb8, label %bb6, !dbg !705

bb6:                                              ; preds = %bb5
  %17 = getelementptr inbounds %struct.stat* %st, i32 0, i32 3, !dbg !705
  %18 = load i32* %17, align 8, !dbg !705
  %19 = and i32 %18, 61440, !dbg !705
  %20 = icmp ne i32 %19, 8192, !dbg !705
  br i1 %20, label %bb8, label %bb7, !dbg !705

bb7:                                              ; preds = %bb6
  %21 = getelementptr inbounds %struct.stat* %st, i32 0, i32 7, !dbg !705
  %22 = load i64* %21, align 8, !dbg !705
  %23 = call i64 @gnu_dev_makedev(i32 1, i32 3) nounwind, !dbg !705
  %24 = icmp ne i64 %22, %23, !dbg !705
  br i1 %24, label %bb8, label %return, !dbg !705

bb8:                                              ; preds = %bb7, %bb6, %bb5, %bb4
  call void @abort() noreturn nounwind, !dbg !706
  unreachable, !dbg !706

return:                                           ; preds = %bb3, %bb7
  ret void, !dbg !707
}

declare i32 @fcntl(i32, i32, ...)

declare i32 @open(i8*, i32, ...)

declare i32 @fstat(i32, %struct.stat*) nounwind

define internal i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind inlinehint {
entry:
  %__major_addr = alloca i32, align 4
  %__minor_addr = alloca i32, align 4
  %retval = alloca i64
  %0 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store i32 %__major, i32* %__major_addr
  store i32 %__minor, i32* %__minor_addr
  %1 = load i32* %__minor_addr, align 4, !dbg !708
  %2 = and i32 %1, 255, !dbg !708
  %3 = load i32* %__major_addr, align 4, !dbg !708
  %4 = and i32 %3, 4095, !dbg !708
  %5 = shl i32 %4, 8, !dbg !708
  %6 = or i32 %2, %5, !dbg !708
  %7 = zext i32 %6 to i64, !dbg !708
  %8 = load i32* %__minor_addr, align 4, !dbg !708
  %9 = zext i32 %8 to i64, !dbg !708
  %10 = and i64 %9, 4294967040, !dbg !708
  %11 = shl i64 %10, 12, !dbg !708
  %12 = or i64 %7, %11, !dbg !708
  %13 = load i32* %__major_addr, align 4, !dbg !708
  %14 = zext i32 %13 to i64, !dbg !708
  %15 = and i64 %14, 4294963200, !dbg !708
  %16 = shl i64 %15, 32, !dbg !708
  %17 = or i64 %12, %16, !dbg !708
  store i64 %17, i64* %0, align 8, !dbg !708
  %18 = load i64* %0, align 8, !dbg !708
  store i64 %18, i64* %retval, align 8, !dbg !708
  %retval1 = load i64* %retval, !dbg !708
  ret i64 %retval1, !dbg !708
}

define internal i32 @__check_suid() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %uid = alloca i32
  %euid = alloca i32
  %gid = alloca i32
  %egid = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %1 = call i32 @getuid() nounwind, !dbg !710
  store i32 %1, i32* %uid, align 4, !dbg !710
  %2 = call i32 @geteuid() nounwind, !dbg !712
  store i32 %2, i32* %euid, align 4, !dbg !712
  %3 = call i32 @getgid() nounwind, !dbg !713
  store i32 %3, i32* %gid, align 4, !dbg !713
  %4 = call i32 @getegid() nounwind, !dbg !714
  store i32 %4, i32* %egid, align 4, !dbg !714
  %5 = load i32* %uid, align 4, !dbg !715
  %6 = load i32* %euid, align 4, !dbg !715
  %7 = icmp eq i32 %5, %6, !dbg !715
  br i1 %7, label %bb, label %bb2, !dbg !715

bb:                                               ; preds = %entry
  %8 = load i32* %gid, align 4, !dbg !715
  %9 = load i32* %egid, align 4, !dbg !715
  %10 = icmp eq i32 %8, %9, !dbg !715
  br i1 %10, label %bb1, label %bb2, !dbg !715

bb1:                                              ; preds = %bb
  store i32 0, i32* %0, align 4, !dbg !716
  br label %bb3, !dbg !716

bb2:                                              ; preds = %bb, %entry
  store i32 1, i32* %0, align 4, !dbg !717
  br label %bb3, !dbg !717

bb3:                                              ; preds = %bb2, %bb1
  %11 = load i32* %0, align 4, !dbg !716
  store i32 %11, i32* %retval, align 4, !dbg !716
  %retval4 = load i32* %retval, !dbg !716
  ret i32 %retval4, !dbg !716
}

declare i32 @getuid() nounwind

declare i32 @geteuid() nounwind

declare i32 @getgid() nounwind

declare i32 @getegid() nounwind

define void @__uClibc_init() nounwind {
entry:
  %0 = load i32* @been_there_done_that.2846, align 4, !dbg !718
  %1 = icmp ne i32 %0, 0, !dbg !718
  br i1 %1, label %return, label %bb, !dbg !718

bb:                                               ; preds = %entry
  %2 = load i32* @been_there_done_that.2846, align 4, !dbg !720
  %3 = add nsw i32 %2, 1, !dbg !720
  store i32 %3, i32* @been_there_done_that.2846, align 4, !dbg !720
  store i64 4096, i64* @__pagesize, align 8, !dbg !721
  call void @_stdio_init() nounwind, !dbg !722
  ret void, !dbg !723

return:                                           ; preds = %entry
  ret void, !dbg !723
}

define void @__uClibc_fini() nounwind {
entry:
  %0 = load void ()** @__app_fini, align 8, !dbg !724
  %1 = icmp ne void ()* %0, null, !dbg !724
  br i1 %1, label %bb, label %bb1, !dbg !724

bb:                                               ; preds = %entry
  %2 = load void ()** @__app_fini, align 8, !dbg !726
  call void %2() nounwind, !dbg !726
  br label %bb1, !dbg !726

bb1:                                              ; preds = %bb, %entry
  %3 = load void ()** @__rtld_fini, align 8, !dbg !727
  %4 = icmp ne void ()* %3, null, !dbg !727
  br i1 %4, label %bb2, label %return, !dbg !727

bb2:                                              ; preds = %bb1
  %5 = load void ()** @__rtld_fini, align 8, !dbg !728
  call void %5() nounwind, !dbg !728
  ret void, !dbg !729

return:                                           ; preds = %bb1
  ret void, !dbg !729
}

define void @__uClibc_main(i32 (i32, i8**, i8**)* %main, i32 %argc, i8** %argv, void ()* %app_init, void ()* %app_fini, void ()* %rtld_fini, i8* %stack_end) noreturn nounwind {
entry:
  %main_addr = alloca i32 (i32, i8**, i8**)*, align 8
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %app_init_addr = alloca void ()*, align 8
  %app_fini_addr = alloca void ()*, align 8
  %rtld_fini_addr = alloca void ()*, align 8
  %stack_end_addr = alloca i8*, align 8
  %iftmp.10 = alloca i64
  %aux_dat = alloca i64*
  %auxvt = alloca [15 x %struct.Elf64_auxv_t]
  %auxv_entry = alloca %struct.Elf64_auxv_t*
  %"alloca point" = bitcast i32 0 to i32
  store i32 (i32, i8**, i8**)* %main, i32 (i32, i8**, i8**)** %main_addr
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  store void ()* %app_init, void ()** %app_init_addr
  store void ()* %app_fini, void ()** %app_fini_addr
  store void ()* %rtld_fini, void ()** %rtld_fini_addr
  store i8* %stack_end, i8** %stack_end_addr
  %0 = load i8** %stack_end_addr, align 8, !dbg !730
  store i8* %0, i8** @__libc_stack_end, align 8, !dbg !730
  %1 = load void ()** %rtld_fini_addr, align 8, !dbg !732
  store void ()* %1, void ()** @__rtld_fini, align 8, !dbg !732
  %2 = load i32* %argc_addr, align 4, !dbg !733
  %3 = add nsw i32 %2, 1, !dbg !733
  %4 = load i8*** %argv_addr, align 8, !dbg !733
  %5 = sext i32 %3 to i64, !dbg !733
  %6 = getelementptr inbounds i8** %4, i64 %5, !dbg !733
  store i8** %6, i8*** @__environ, align 8, !dbg !733
  %7 = load i8*** %argv_addr, align 8, !dbg !734
  %8 = load i8** %7, align 8, !dbg !734
  %9 = load i8*** @__environ, align 8, !dbg !734
  %10 = bitcast i8** %9 to i8*, !dbg !734
  %11 = icmp eq i8* %8, %10, !dbg !734
  br i1 %11, label %bb, label %bb1, !dbg !734

bb:                                               ; preds = %entry
  %12 = load i8*** %argv_addr, align 8, !dbg !735
  %13 = load i32* %argc_addr, align 4, !dbg !735
  %14 = sext i32 %13 to i64, !dbg !735
  %15 = getelementptr inbounds i8** %12, i64 %14, !dbg !735
  store i8** %15, i8*** @__environ, align 8, !dbg !735
  br label %bb1, !dbg !735

bb1:                                              ; preds = %bb, %entry
  %auxvt2 = bitcast [15 x %struct.Elf64_auxv_t]* %auxvt to %struct.Elf64_auxv_t*, !dbg !736
  %auxvt23 = bitcast %struct.Elf64_auxv_t* %auxvt2 to i8*, !dbg !736
  %16 = call i8* @memset(i8* %auxvt23, i32 0, i64 240) nounwind, !dbg !736
  %17 = load i8*** @__environ, align 8, !dbg !737
  %18 = bitcast i8** %17 to i64*, !dbg !737
  store i64* %18, i64** %aux_dat, align 8, !dbg !737
  br label %bb5, !dbg !737

bb5:                                              ; preds = %bb5, %bb1
  %19 = load i64** %aux_dat, align 8, !dbg !738
  %20 = load i64* %19, align 8, !dbg !738
  %21 = icmp ne i64 %20, 0, !dbg !738
  %22 = load i64** %aux_dat, align 8, !dbg !739
  %23 = getelementptr inbounds i64* %22, i64 1, !dbg !739
  store i64* %23, i64** %aux_dat, align 8, !dbg !739
  br i1 %21, label %bb5, label %bb10, !dbg !738

bb7:                                              ; preds = %bb10
  %24 = load i64** %aux_dat, align 8, !dbg !740
  %25 = bitcast i64* %24 to %struct.Elf64_auxv_t*, !dbg !740
  store %struct.Elf64_auxv_t* %25, %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !740
  %26 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !742
  %27 = getelementptr inbounds %struct.Elf64_auxv_t* %26, i32 0, i32 0, !dbg !742
  %28 = load i64* %27, align 8, !dbg !742
  %29 = icmp ule i64 %28, 14, !dbg !742
  br i1 %29, label %bb8, label %bb9, !dbg !742

bb8:                                              ; preds = %bb7
  %30 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !743
  %31 = getelementptr inbounds %struct.Elf64_auxv_t* %30, i32 0, i32 0, !dbg !743
  %32 = load i64* %31, align 8, !dbg !743
  %33 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 %32, !dbg !743
  %34 = bitcast %struct.Elf64_auxv_t* %33 to i8*, !dbg !743
  %35 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !743
  %36 = bitcast %struct.Elf64_auxv_t* %35 to i8*, !dbg !743
  %37 = call i8* @memcpy(i8* noalias %34, i8* noalias %36, i64 16) nounwind, !dbg !743
  br label %bb9, !dbg !743

bb9:                                              ; preds = %bb8, %bb7
  %38 = load i64** %aux_dat, align 8, !dbg !744
  %39 = getelementptr inbounds i64* %38, i64 2, !dbg !744
  store i64* %39, i64** %aux_dat, align 8, !dbg !744
  br label %bb10, !dbg !744

bb10:                                             ; preds = %bb5, %bb9
  %40 = load i64** %aux_dat, align 8, !dbg !745
  %41 = load i64* %40, align 8, !dbg !745
  %42 = icmp ne i64 %41, 0, !dbg !745
  br i1 %42, label %bb7, label %bb11, !dbg !745

bb11:                                             ; preds = %bb10
  call void @__uClibc_init() nounwind, !dbg !746
  %43 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 6, !dbg !747
  %44 = getelementptr inbounds %struct.Elf64_auxv_t* %43, i32 0, i32 1, !dbg !747
  %45 = getelementptr inbounds %union.anon* %44, i32 0, i32 0, !dbg !747
  %46 = load i64* %45, align 8, !dbg !747
  %47 = icmp ne i64 %46, 0, !dbg !747
  br i1 %47, label %bb12, label %bb13, !dbg !747

bb12:                                             ; preds = %bb11
  %48 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 6, !dbg !747
  %49 = getelementptr inbounds %struct.Elf64_auxv_t* %48, i32 0, i32 1, !dbg !747
  %50 = getelementptr inbounds %union.anon* %49, i32 0, i32 0, !dbg !747
  %51 = load i64* %50, align 8, !dbg !747
  store i64 %51, i64* %iftmp.10, align 8, !dbg !747
  br label %bb14, !dbg !747

bb13:                                             ; preds = %bb11
  store i64 4096, i64* %iftmp.10, align 8, !dbg !747
  br label %bb14, !dbg !747

bb14:                                             ; preds = %bb13, %bb12
  %52 = load i64* %iftmp.10, align 8, !dbg !747
  store i64 %52, i64* @__pagesize, align 8, !dbg !747
  %53 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !748
  %54 = getelementptr inbounds %struct.Elf64_auxv_t* %53, i32 0, i32 1, !dbg !748
  %55 = getelementptr inbounds %union.anon* %54, i32 0, i32 0, !dbg !748
  %56 = load i64* %55, align 8, !dbg !748
  %57 = icmp ne i64 %56, -1, !dbg !748
  br i1 %57, label %bb16, label %bb15, !dbg !748

bb15:                                             ; preds = %bb14
  %58 = call i32 @__check_suid() nounwind, !dbg !748
  %59 = icmp ne i32 %58, 0, !dbg !748
  br i1 %59, label %bb19, label %bb16, !dbg !748

bb16:                                             ; preds = %bb15, %bb14
  %60 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !748
  %61 = getelementptr inbounds %struct.Elf64_auxv_t* %60, i32 0, i32 1, !dbg !748
  %62 = getelementptr inbounds %union.anon* %61, i32 0, i32 0, !dbg !748
  %63 = load i64* %62, align 8, !dbg !748
  %64 = icmp eq i64 %63, -1, !dbg !748
  br i1 %64, label %bb20, label %bb17, !dbg !748

bb17:                                             ; preds = %bb16
  %65 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !748
  %66 = getelementptr inbounds %struct.Elf64_auxv_t* %65, i32 0, i32 1, !dbg !748
  %67 = getelementptr inbounds %union.anon* %66, i32 0, i32 0, !dbg !748
  %68 = load i64* %67, align 8, !dbg !748
  %69 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 12, !dbg !748
  %70 = getelementptr inbounds %struct.Elf64_auxv_t* %69, i32 0, i32 1, !dbg !748
  %71 = getelementptr inbounds %union.anon* %70, i32 0, i32 0, !dbg !748
  %72 = load i64* %71, align 8, !dbg !748
  %73 = icmp ne i64 %68, %72, !dbg !748
  br i1 %73, label %bb19, label %bb18, !dbg !748

bb18:                                             ; preds = %bb17
  %74 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 13, !dbg !748
  %75 = getelementptr inbounds %struct.Elf64_auxv_t* %74, i32 0, i32 1, !dbg !748
  %76 = getelementptr inbounds %union.anon* %75, i32 0, i32 0, !dbg !748
  %77 = load i64* %76, align 8, !dbg !748
  %78 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 14, !dbg !748
  %79 = getelementptr inbounds %struct.Elf64_auxv_t* %78, i32 0, i32 1, !dbg !748
  %80 = getelementptr inbounds %union.anon* %79, i32 0, i32 0, !dbg !748
  %81 = load i64* %80, align 8, !dbg !748
  %82 = icmp ne i64 %77, %81, !dbg !748
  br i1 %82, label %bb19, label %bb20, !dbg !748

bb19:                                             ; preds = %bb18, %bb17, %bb15
  call void @__check_one_fd(i32 0, i32 131072) nounwind, !dbg !749
  call void @__check_one_fd(i32 1, i32 131074) nounwind, !dbg !750
  call void @__check_one_fd(i32 2, i32 131074) nounwind, !dbg !751
  br label %bb20, !dbg !751

bb20:                                             ; preds = %bb19, %bb18, %bb16
  %83 = load i8*** %argv_addr, align 8, !dbg !752
  %84 = load i8** %83, align 8, !dbg !752
  store i8* %84, i8** @__uclibc_progname, align 8, !dbg !752
  %85 = load void ()** %app_fini_addr, align 8, !dbg !753
  store void ()* %85, void ()** @__app_fini, align 8, !dbg !753
  %86 = load void ()** %app_init_addr, align 8, !dbg !754
  %87 = icmp ne void ()* %86, null, !dbg !754
  br i1 %87, label %bb21, label %bb22, !dbg !754

bb21:                                             ; preds = %bb20
  %88 = load void ()** %app_init_addr, align 8, !dbg !755
  call void %88() nounwind, !dbg !755
  br label %bb22, !dbg !755

bb22:                                             ; preds = %bb21, %bb20
  %89 = icmp ne i8* bitcast (i32* ()* @__errno_location to i8*), null, !dbg !756
  br i1 %89, label %bb23, label %bb24, !dbg !756

bb23:                                             ; preds = %bb22
  %90 = call i32* @__errno_location() nounwind readnone, !dbg !757
  store i32 0, i32* %90, align 4, !dbg !757
  br label %bb24, !dbg !757

bb24:                                             ; preds = %bb23, %bb22
  %91 = icmp ne i8* bitcast (i32* ()* @__h_errno_location to i8*), null, !dbg !758
  br i1 %91, label %bb25, label %bb26, !dbg !758

bb25:                                             ; preds = %bb24
  %92 = call i32* @__h_errno_location() nounwind readnone, !dbg !759
  store i32 0, i32* %92, align 4, !dbg !759
  br label %bb26, !dbg !759

bb26:                                             ; preds = %bb25, %bb24
  %93 = load i8*** @__environ, align 8, !dbg !760
  %94 = load i32 (i32, i8**, i8**)** %main_addr, align 8, !dbg !760
  %95 = load i32* %argc_addr, align 4, !dbg !760
  %96 = load i8*** %argv_addr, align 8, !dbg !760
  %97 = call i32 %94(i32 %95, i8** %96, i8** %93) nounwind, !dbg !760
  call void @exit(i32 %97) noreturn nounwind, !dbg !760
  unreachable, !dbg !760
}

define i32 @strcmp(i8* %s1, i8* %s2) nounwind readonly {
entry:
  %s1_addr = alloca i8*, align 8
  %s2_addr = alloca i8*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %r = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %s1, i8** %s1_addr
  store i8* %s2, i8** %s2_addr
  br label %bb, !dbg !761

bb:                                               ; preds = %bb4, %entry
  %1 = load i8** %s1_addr, align 8, !dbg !762
  %2 = load i8* %1, align 1, !dbg !762
  %3 = zext i8 %2 to i32, !dbg !762
  %4 = load i8** %s2_addr, align 8, !dbg !762
  %5 = load i8* %4, align 1, !dbg !762
  %6 = zext i8 %5 to i32, !dbg !762
  %7 = sub nsw i32 %3, %6, !dbg !762
  store i32 %7, i32* %r, align 4, !dbg !762
  %8 = load i32* %r, align 4, !dbg !762
  %9 = icmp eq i32 %8, 0, !dbg !762
  %10 = zext i1 %9 to i8, !dbg !762
  %11 = load i8** %s2_addr, align 8, !dbg !762
  %12 = getelementptr inbounds i8* %11, i64 1, !dbg !762
  store i8* %12, i8** %s2_addr, align 8, !dbg !762
  %toBool = icmp ne i8 %10, 0, !dbg !762
  %toBoolnot = xor i1 %toBool, true, !dbg !762
  %toBoolnot1 = zext i1 %toBoolnot to i8, !dbg !762
  %toBool3 = icmp ne i8 %toBoolnot1, 0, !dbg !762
  br i1 %toBool3, label %bb6, label %bb4, !dbg !762

bb4:                                              ; preds = %bb
  %13 = load i8** %s1_addr, align 8, !dbg !762
  %14 = load i8* %13, align 1, !dbg !762
  %15 = icmp ne i8 %14, 0, !dbg !762
  %16 = zext i1 %15 to i8, !dbg !762
  %17 = load i8** %s1_addr, align 8, !dbg !762
  %18 = getelementptr inbounds i8* %17, i64 1, !dbg !762
  store i8* %18, i8** %s1_addr, align 8, !dbg !762
  %toBool5 = icmp ne i8 %16, 0, !dbg !762
  br i1 %toBool5, label %bb, label %bb6, !dbg !762

bb6:                                              ; preds = %bb4, %bb
  %19 = load i32* %r, align 4, !dbg !764
  store i32 %19, i32* %0, align 4, !dbg !764
  %20 = load i32* %0, align 4, !dbg !764
  store i32 %20, i32* %retval, align 4, !dbg !764
  %retval7 = load i32* %retval, !dbg !764
  ret i32 %retval7, !dbg !764
}

define i32 @putchar_unlocked(i32 %c) nounwind {
entry:
  %c_addr = alloca i32, align 4
  %retval = alloca i32
  %iftmp.0 = alloca i32
  %0 = alloca i32
  %stream = alloca %struct.FILE*
  %"alloca point" = bitcast i32 0 to i32
  store i32 %c, i32* %c_addr
  %1 = load %struct.FILE** @stdout, align 8, !dbg !765
  store %struct.FILE* %1, %struct.FILE** %stream, align 8, !dbg !765
  %2 = load %struct.FILE** %stream, align 8, !dbg !767
  %3 = getelementptr inbounds %struct.FILE* %2, i32 0, i32 5, !dbg !767
  %4 = load i8** %3, align 8, !dbg !767
  %5 = load %struct.FILE** %stream, align 8, !dbg !767
  %6 = getelementptr inbounds %struct.FILE* %5, i32 0, i32 8, !dbg !767
  %7 = load i8** %6, align 8, !dbg !767
  %8 = icmp ult i8* %4, %7, !dbg !767
  br i1 %8, label %bb, label %bb1, !dbg !767

bb:                                               ; preds = %entry
  %9 = load %struct.FILE** %stream, align 8, !dbg !767
  %10 = getelementptr inbounds %struct.FILE* %9, i32 0, i32 5, !dbg !767
  %11 = load i8** %10, align 8, !dbg !767
  %12 = load i32* %c_addr, align 4, !dbg !767
  %13 = trunc i32 %12 to i8, !dbg !767
  store i8 %13, i8* %11, align 1, !dbg !767
  %14 = load i8* %11, align 1, !dbg !767
  %15 = zext i8 %14 to i32, !dbg !767
  store i32 %15, i32* %iftmp.0, align 4, !dbg !767
  %16 = getelementptr inbounds i8* %11, i64 1, !dbg !767
  %17 = load %struct.FILE** %stream, align 8, !dbg !767
  %18 = getelementptr inbounds %struct.FILE* %17, i32 0, i32 5, !dbg !767
  store i8* %16, i8** %18, align 8, !dbg !767
  br label %bb2, !dbg !767

bb1:                                              ; preds = %entry
  %19 = load i32* %c_addr, align 4, !dbg !767
  %20 = load %struct.FILE** %stream, align 8, !dbg !767
  %21 = call i32 @__fputc_unlocked(i32 %19, %struct.FILE* %20) nounwind, !dbg !767
  store i32 %21, i32* %iftmp.0, align 4, !dbg !767
  br label %bb2, !dbg !767

bb2:                                              ; preds = %bb1, %bb
  %22 = load i32* %iftmp.0, align 4, !dbg !767
  store i32 %22, i32* %0, align 4, !dbg !767
  %23 = load i32* %0, align 4, !dbg !767
  store i32 %23, i32* %retval, align 4, !dbg !767
  %retval3 = load i32* %retval, !dbg !767
  ret i32 %retval3, !dbg !767
}

define weak i32* @__h_errno_location() nounwind readnone {
entry:
  %retval = alloca i32*
  %0 = alloca i32*
  %"alloca point" = bitcast i32 0 to i32
  store i32* @h_errno, i32** %0, align 8, !dbg !768
  %1 = load i32** %0, align 8, !dbg !768
  store i32* %1, i32** %retval, align 8, !dbg !768
  %retval1 = load i32** %retval, !dbg !768
  ret i32* %retval1, !dbg !768
}

define weak i32* @__errno_location() nounwind readnone {
entry:
  %retval = alloca i32*
  %0 = alloca i32*
  %"alloca point" = bitcast i32 0 to i32
  store i32* @errno, i32** %0, align 8, !dbg !770
  %1 = load i32** %0, align 8, !dbg !770
  store i32* %1, i32** %retval, align 8, !dbg !770
  %retval1 = load i32** %retval, !dbg !770
  ret i32* %retval1, !dbg !770
}

define i32 @__fputc_unlocked(i32 %c, %struct.FILE* %stream) nounwind {
entry:
  %c_addr = alloca i32, align 4
  %stream_addr = alloca %struct.FILE*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %uc = alloca i8
  %"alloca point" = bitcast i32 0 to i32
  store i32 %c, i32* %c_addr
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !772
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 5, !dbg !772
  %3 = load i8** %2, align 8, !dbg !772
  %4 = load %struct.FILE** %stream_addr, align 8, !dbg !772
  %5 = getelementptr inbounds %struct.FILE* %4, i32 0, i32 8, !dbg !772
  %6 = load i8** %5, align 8, !dbg !772
  %7 = icmp ult i8* %3, %6, !dbg !772
  %8 = load %struct.FILE** %stream_addr, align 8, !dbg !774
  br i1 %7, label %bb, label %bb1, !dbg !772

bb:                                               ; preds = %entry
  %9 = getelementptr inbounds %struct.FILE* %8, i32 0, i32 5, !dbg !774
  %10 = load i8** %9, align 8, !dbg !774
  %11 = load i32* %c_addr, align 4, !dbg !774
  %12 = trunc i32 %11 to i8, !dbg !774
  store i8 %12, i8* %10, align 1, !dbg !774
  %13 = getelementptr inbounds i8* %10, i64 1, !dbg !774
  %14 = load %struct.FILE** %stream_addr, align 8, !dbg !774
  %15 = getelementptr inbounds %struct.FILE* %14, i32 0, i32 5, !dbg !774
  store i8* %13, i8** %15, align 8, !dbg !774
  %16 = load i32* %c_addr, align 4, !dbg !775
  %17 = trunc i32 %16 to i8, !dbg !775
  %18 = zext i8 %17 to i32, !dbg !775
  store i32 %18, i32* %0, align 4, !dbg !775
  br label %bb15, !dbg !775

bb1:                                              ; preds = %entry
  %19 = getelementptr inbounds %struct.FILE* %8, i32 0, i32 0, !dbg !776
  %20 = load i16* %19, align 8, !dbg !776
  %21 = zext i16 %20 to i32, !dbg !776
  %22 = and i32 %21, 192, !dbg !776
  %23 = icmp eq i32 %22, 192, !dbg !776
  br i1 %23, label %bb3, label %bb2, !dbg !776

bb2:                                              ; preds = %bb1
  %24 = load %struct.FILE** %stream_addr, align 8, !dbg !776
  %25 = call i32 @__stdio_trans2w_o(%struct.FILE* noalias %24, i32 128) nounwind, !dbg !776
  %26 = icmp eq i32 %25, 0, !dbg !776
  br i1 %26, label %bb3, label %BAD, !dbg !776

bb3:                                              ; preds = %bb2, %bb1
  %27 = load %struct.FILE** %stream_addr, align 8, !dbg !777
  %28 = getelementptr inbounds %struct.FILE* %27, i32 0, i32 2, !dbg !777
  %29 = load i32* %28, align 4, !dbg !777
  %30 = icmp eq i32 %29, -2, !dbg !777
  br i1 %30, label %bb4, label %bb5, !dbg !777

bb4:                                              ; preds = %bb3
  %31 = load i32* %c_addr, align 4, !dbg !778
  %32 = trunc i32 %31 to i8, !dbg !778
  %33 = zext i8 %32 to i32, !dbg !778
  store i32 %33, i32* %0, align 4, !dbg !778
  br label %bb15, !dbg !778

bb5:                                              ; preds = %bb3
  %34 = load %struct.FILE** %stream_addr, align 8, !dbg !779
  %35 = getelementptr inbounds %struct.FILE* %34, i32 0, i32 4, !dbg !779
  %36 = load i8** %35, align 8, !dbg !779
  %37 = load %struct.FILE** %stream_addr, align 8, !dbg !779
  %38 = getelementptr inbounds %struct.FILE* %37, i32 0, i32 3, !dbg !779
  %39 = load i8** %38, align 8, !dbg !779
  %40 = icmp ne i8* %36, %39, !dbg !779
  br i1 %40, label %bb6, label %bb13, !dbg !779

bb6:                                              ; preds = %bb5
  %41 = load %struct.FILE** %stream_addr, align 8, !dbg !780
  %42 = getelementptr inbounds %struct.FILE* %41, i32 0, i32 4, !dbg !780
  %43 = load i8** %42, align 8, !dbg !780
  %44 = load %struct.FILE** %stream_addr, align 8, !dbg !780
  %45 = getelementptr inbounds %struct.FILE* %44, i32 0, i32 5, !dbg !780
  %46 = load i8** %45, align 8, !dbg !780
  %47 = icmp eq i8* %43, %46, !dbg !780
  br i1 %47, label %bb7, label %bb8, !dbg !780

bb7:                                              ; preds = %bb6
  %48 = load %struct.FILE** %stream_addr, align 8, !dbg !780
  %49 = call i64 @__stdio_wcommit(%struct.FILE* noalias %48) nounwind, !dbg !780
  %50 = icmp ne i64 %49, 0, !dbg !780
  br i1 %50, label %BAD, label %bb8, !dbg !780

bb8:                                              ; preds = %bb7, %bb6
  %51 = load %struct.FILE** %stream_addr, align 8, !dbg !781
  %52 = getelementptr inbounds %struct.FILE* %51, i32 0, i32 5, !dbg !781
  %53 = load i8** %52, align 8, !dbg !781
  %54 = load i32* %c_addr, align 4, !dbg !781
  %55 = trunc i32 %54 to i8, !dbg !781
  store i8 %55, i8* %53, align 1, !dbg !781
  %56 = getelementptr inbounds i8* %53, i64 1, !dbg !781
  %57 = load %struct.FILE** %stream_addr, align 8, !dbg !781
  %58 = getelementptr inbounds %struct.FILE* %57, i32 0, i32 5, !dbg !781
  store i8* %56, i8** %58, align 8, !dbg !781
  %59 = load %struct.FILE** %stream_addr, align 8, !dbg !782
  %60 = getelementptr inbounds %struct.FILE* %59, i32 0, i32 0, !dbg !782
  %61 = load i16* %60, align 8, !dbg !782
  %62 = zext i16 %61 to i32, !dbg !782
  %63 = and i32 %62, 256, !dbg !782
  %64 = icmp ne i32 %63, 0, !dbg !782
  br i1 %64, label %bb9, label %bb14, !dbg !782

bb9:                                              ; preds = %bb8
  %65 = load i32* %c_addr, align 4, !dbg !783
  %66 = trunc i32 %65 to i8, !dbg !783
  %67 = icmp eq i8 %66, 10, !dbg !783
  br i1 %67, label %bb10, label %bb14, !dbg !783

bb10:                                             ; preds = %bb9
  %68 = load %struct.FILE** %stream_addr, align 8, !dbg !783
  %69 = call i64 @__stdio_wcommit(%struct.FILE* noalias %68) nounwind, !dbg !783
  %70 = icmp ne i64 %69, 0, !dbg !783
  br i1 %70, label %bb11, label %bb14, !dbg !783

bb11:                                             ; preds = %bb10
  %71 = load %struct.FILE** %stream_addr, align 8, !dbg !784
  %72 = getelementptr inbounds %struct.FILE* %71, i32 0, i32 5, !dbg !784
  %73 = load i8** %72, align 8, !dbg !784
  %74 = getelementptr inbounds i8* %73, i64 -1, !dbg !784
  %75 = load %struct.FILE** %stream_addr, align 8, !dbg !784
  %76 = getelementptr inbounds %struct.FILE* %75, i32 0, i32 5, !dbg !784
  store i8* %74, i8** %76, align 8, !dbg !784
  br label %BAD, !dbg !784

bb13:                                             ; preds = %bb5
  %77 = load i32* %c_addr, align 4, !dbg !785
  %78 = trunc i32 %77 to i8, !dbg !785
  store i8 %78, i8* %uc, align 1, !dbg !785
  %79 = load %struct.FILE** %stream_addr, align 8, !dbg !787
  %80 = call i64 @__stdio_WRITE(%struct.FILE* %79, i8* %uc, i64 1) nounwind, !dbg !787
  %81 = icmp eq i64 %80, 0, !dbg !787
  br i1 %81, label %BAD, label %bb14, !dbg !787

bb14:                                             ; preds = %bb8, %bb9, %bb10, %bb13
  %82 = load i32* %c_addr, align 4, !dbg !788
  %83 = trunc i32 %82 to i8, !dbg !788
  %84 = zext i8 %83 to i32, !dbg !788
  store i32 %84, i32* %0, align 4, !dbg !788
  br label %bb15, !dbg !788

BAD:                                              ; preds = %bb13, %bb11, %bb7, %bb2
  store i32 -1, i32* %0, align 4, !dbg !789
  br label %bb15, !dbg !789

bb15:                                             ; preds = %BAD, %bb14, %bb4, %bb
  %85 = load i32* %0, align 4, !dbg !775
  store i32 %85, i32* %retval, align 4, !dbg !775
  %retval16 = load i32* %retval, !dbg !775
  ret i32 %retval16, !dbg !775
}

define hidden void @_stdio_term() nounwind {
entry:
  %ptr = alloca %struct.FILE*
  %"alloca point" = bitcast i32 0 to i32
  %0 = load %struct.FILE** @_stdio_openlist, align 8, !dbg !790
  store %struct.FILE* %0, %struct.FILE** %ptr, align 8, !dbg !790
  br label %bb3, !dbg !790

bb:                                               ; preds = %bb3
  %1 = load %struct.FILE** %ptr, align 8, !dbg !792
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 0, !dbg !792
  %3 = load i16* %2, align 8, !dbg !792
  %4 = zext i16 %3 to i32, !dbg !792
  %5 = and i32 %4, 64, !dbg !792
  %6 = icmp ne i32 %5, 0, !dbg !792
  br i1 %6, label %bb1, label %bb2, !dbg !792

bb1:                                              ; preds = %bb
  %7 = load %struct.FILE** %ptr, align 8, !dbg !793
  %8 = call i64 @__stdio_wcommit(%struct.FILE* noalias %7) nounwind, !dbg !793
  br label %bb2, !dbg !793

bb2:                                              ; preds = %bb1, %bb
  %9 = load %struct.FILE** %ptr, align 8, !dbg !790
  %10 = getelementptr inbounds %struct.FILE* %9, i32 0, i32 9, !dbg !790
  %11 = load %struct.FILE** %10, align 8, !dbg !790
  store %struct.FILE* %11, %struct.FILE** %ptr, align 8, !dbg !790
  br label %bb3, !dbg !790

bb3:                                              ; preds = %bb2, %entry
  %12 = load %struct.FILE** %ptr, align 8, !dbg !790
  %13 = icmp ne %struct.FILE* %12, null, !dbg !790
  br i1 %13, label %bb, label %return, !dbg !790

return:                                           ; preds = %bb3
  ret void, !dbg !794
}

define hidden void @_stdio_init() nounwind {
entry:
  %old_errno = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %0 = load i32* @errno, align 4, !dbg !795
  store i32 %0, i32* %old_errno, align 4, !dbg !795
  %1 = load i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0, i32 0), align 8, !dbg !797
  %2 = call i32 @isatty(i32 0) nounwind, !dbg !797
  %3 = sub nsw i32 1, %2, !dbg !797
  %4 = mul i32 %3, 256, !dbg !797
  %5 = trunc i32 %4 to i16, !dbg !797
  %6 = xor i16 %1, %5, !dbg !797
  store i16 %6, i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0, i32 0), align 8, !dbg !797
  %7 = load i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1, i32 0), align 8, !dbg !798
  %8 = call i32 @isatty(i32 1) nounwind, !dbg !798
  %9 = sub nsw i32 1, %8, !dbg !798
  %10 = mul i32 %9, 256, !dbg !798
  %11 = trunc i32 %10 to i16, !dbg !798
  %12 = xor i16 %7, %11, !dbg !798
  store i16 %12, i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1, i32 0), align 8, !dbg !798
  %13 = load i32* %old_errno, align 4, !dbg !799
  store i32 %13, i32* @errno, align 4, !dbg !799
  ret void, !dbg !800
}

declare void @abort() noreturn nounwind

declare i32 @sigprocmask(i32, %struct.__sigset_t* noalias, %struct.__sigset_t* noalias) nounwind

declare void @_exit(i32) noreturn

define void @exit(i32 %rv) noreturn nounwind {
entry:
  %rv_addr = alloca i32, align 4
  %"alloca point" = bitcast i32 0 to i32
  store i32 %rv, i32* %rv_addr
  %0 = load void (i32)** @__exit_cleanup, align 8, !dbg !801
  %1 = icmp ne void (i32)* %0, null, !dbg !801
  br i1 %1, label %bb, label %bb1, !dbg !801

bb:                                               ; preds = %entry
  %2 = load void (i32)** @__exit_cleanup, align 8, !dbg !803
  %3 = load i32* %rv_addr, align 4, !dbg !803
  call void %2(i32 %3) nounwind, !dbg !803
  br label %bb1, !dbg !803

bb1:                                              ; preds = %bb, %entry
  call void @__uClibc_fini() nounwind, !dbg !804
  call void @_stdio_term() nounwind, !dbg !805
  %4 = load i32* %rv_addr, align 4, !dbg !806
  call void @_exit(i32 %4) noreturn nounwind, !dbg !806
  unreachable, !dbg !806
}

define i8* @memcpy(i8* noalias %s1, i8* noalias %s2, i64 %n) nounwind {
entry:
  %s1_addr = alloca i8*, align 8
  %s2_addr = alloca i8*, align 8
  %n_addr = alloca i64, align 8
  %retval = alloca i8*
  %0 = alloca i8*
  %r1 = alloca i8*
  %r2 = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i8* %s1, i8** %s1_addr
  store i8* %s2, i8** %s2_addr
  store i64 %n, i64* %n_addr
  %1 = load i8** %s1_addr, align 8, !dbg !807
  store i8* %1, i8** %r1, align 8, !dbg !807
  %2 = load i8** %s2_addr, align 8, !dbg !809
  store i8* %2, i8** %r2, align 8, !dbg !809
  br label %bb1, !dbg !809

bb:                                               ; preds = %bb1
  %3 = load i8** %r2, align 8, !dbg !810
  %4 = load i8* %3, align 1, !dbg !810
  %5 = load i8** %r1, align 8, !dbg !810
  store i8 %4, i8* %5, align 1, !dbg !810
  %6 = load i8** %r1, align 8, !dbg !810
  %7 = getelementptr inbounds i8* %6, i64 1, !dbg !810
  store i8* %7, i8** %r1, align 8, !dbg !810
  %8 = load i8** %r2, align 8, !dbg !810
  %9 = getelementptr inbounds i8* %8, i64 1, !dbg !810
  store i8* %9, i8** %r2, align 8, !dbg !810
  %10 = load i64* %n_addr, align 8, !dbg !811
  %11 = sub i64 %10, 1, !dbg !811
  store i64 %11, i64* %n_addr, align 8, !dbg !811
  br label %bb1, !dbg !811

bb1:                                              ; preds = %bb, %entry
  %12 = load i64* %n_addr, align 8, !dbg !812
  %13 = icmp ne i64 %12, 0, !dbg !812
  br i1 %13, label %bb, label %bb2, !dbg !812

bb2:                                              ; preds = %bb1
  %14 = load i8** %s1_addr, align 8, !dbg !813
  store i8* %14, i8** %0, align 8, !dbg !813
  %15 = load i8** %0, align 8, !dbg !813
  store i8* %15, i8** %retval, align 8, !dbg !813
  %retval3 = load i8** %retval, !dbg !813
  ret i8* %retval3, !dbg !813
}

define i8* @memset(i8* %s, i32 %c, i64 %n) nounwind {
entry:
  %s_addr = alloca i8*, align 8
  %c_addr = alloca i32, align 4
  %n_addr = alloca i64, align 8
  %retval = alloca i8*
  %0 = alloca i8*
  %p = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i8* %s, i8** %s_addr
  store i32 %c, i32* %c_addr
  store i64 %n, i64* %n_addr
  %1 = load i8** %s_addr, align 8, !dbg !814
  store i8* %1, i8** %p, align 8, !dbg !814
  br label %bb1, !dbg !814

bb:                                               ; preds = %bb1
  %2 = load i32* %c_addr, align 4, !dbg !816
  %3 = trunc i32 %2 to i8, !dbg !816
  %4 = load i8** %p, align 8, !dbg !816
  store i8 %3, i8* %4, align 1, !dbg !816
  %5 = load i8** %p, align 8, !dbg !816
  %6 = getelementptr inbounds i8* %5, i64 1, !dbg !816
  store i8* %6, i8** %p, align 8, !dbg !816
  %7 = load i64* %n_addr, align 8, !dbg !817
  %8 = sub i64 %7, 1, !dbg !817
  store i64 %8, i64* %n_addr, align 8, !dbg !817
  br label %bb1, !dbg !817

bb1:                                              ; preds = %bb, %entry
  %9 = load i64* %n_addr, align 8, !dbg !818
  %10 = icmp ne i64 %9, 0, !dbg !818
  br i1 %10, label %bb, label %bb2, !dbg !818

bb2:                                              ; preds = %bb1
  %11 = load i8** %s_addr, align 8, !dbg !819
  store i8* %11, i8** %0, align 8, !dbg !819
  %12 = load i8** %0, align 8, !dbg !819
  store i8* %12, i8** %retval, align 8, !dbg !819
  %retval3 = load i8** %retval, !dbg !819
  ret i8* %retval3, !dbg !819
}

define i32 @__sigismember(%struct.__sigset_t* %__set, i32 %__sig) nounwind {
entry:
  %__set_addr = alloca %struct.__sigset_t*, align 8
  %__sig_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %__mask = alloca i64
  %__word = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.__sigset_t* %__set, %struct.__sigset_t** %__set_addr
  store i32 %__sig, i32* %__sig_addr
  %1 = load i32* %__sig_addr, align 4, !dbg !820
  %2 = sub nsw i32 %1, 1, !dbg !820
  %3 = and i32 %2, 63, !dbg !820
  %.cast = zext i32 %3 to i64, !dbg !820
  %4 = shl i64 1, %.cast, !dbg !820
  store i64 %4, i64* %__mask, align 8, !dbg !820
  %5 = load i32* %__sig_addr, align 4, !dbg !820
  %6 = sub nsw i32 %5, 1, !dbg !820
  %7 = sext i32 %6 to i64, !dbg !820
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %8 = udiv i64 %7, 64, !dbg !820
  store i64 %8, i64* %__word, align 8, !dbg !820
  %9 = load i64* %__word, align 8, !dbg !820
  %10 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !820
  %11 = getelementptr inbounds %struct.__sigset_t* %10, i32 0, i32 0, !dbg !820
  %12 = getelementptr inbounds [16 x i64]* %11, i64 0, i64 %9, !dbg !820
  %13 = load i64* %12, align 8, !dbg !820
  %14 = load i64* %__mask, align 8, !dbg !820
  %15 = and i64 %13, %14, !dbg !820
  %16 = icmp ne i64 %15, 0, !dbg !820
  %17 = zext i1 %16 to i32, !dbg !820
  store i32 %17, i32* %0, align 4, !dbg !820
  %18 = load i32* %0, align 4, !dbg !820
  store i32 %18, i32* %retval, align 4, !dbg !820
  %retval1 = load i32* %retval, !dbg !820
  ret i32 %retval1, !dbg !821
}

define i32 @__sigaddset(%struct.__sigset_t* %__set, i32 %__sig) nounwind {
entry:
  %__set_addr = alloca %struct.__sigset_t*, align 8
  %__sig_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %__mask = alloca i64
  %__word = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.__sigset_t* %__set, %struct.__sigset_t** %__set_addr
  store i32 %__sig, i32* %__sig_addr
  %1 = load i32* %__sig_addr, align 4, !dbg !823
  %2 = sub nsw i32 %1, 1, !dbg !823
  %3 = and i32 %2, 63, !dbg !823
  %.cast = zext i32 %3 to i64, !dbg !823
  %4 = shl i64 1, %.cast, !dbg !823
  store i64 %4, i64* %__mask, align 8, !dbg !823
  %5 = load i32* %__sig_addr, align 4, !dbg !823
  %6 = sub nsw i32 %5, 1, !dbg !823
  %7 = sext i32 %6 to i64, !dbg !823
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %8 = udiv i64 %7, 64, !dbg !823
  store i64 %8, i64* %__word, align 8, !dbg !823
  %9 = load i64* %__word, align 8, !dbg !823
  %10 = load i64* %__word, align 8, !dbg !823
  %11 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !823
  %12 = getelementptr inbounds %struct.__sigset_t* %11, i32 0, i32 0, !dbg !823
  %13 = getelementptr inbounds [16 x i64]* %12, i64 0, i64 %10, !dbg !823
  %14 = load i64* %13, align 8, !dbg !823
  %15 = load i64* %__mask, align 8, !dbg !823
  %16 = or i64 %14, %15, !dbg !823
  %17 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !823
  %18 = getelementptr inbounds %struct.__sigset_t* %17, i32 0, i32 0, !dbg !823
  %19 = getelementptr inbounds [16 x i64]* %18, i64 0, i64 %9, !dbg !823
  store i64 %16, i64* %19, align 8, !dbg !823
  store i32 0, i32* %0, align 4, !dbg !823
  %20 = load i32* %0, align 4, !dbg !823
  store i32 %20, i32* %retval, align 4, !dbg !823
  %retval1 = load i32* %retval, !dbg !823
  ret i32 %retval1, !dbg !824
}

define i32 @__sigdelset(%struct.__sigset_t* %__set, i32 %__sig) nounwind {
entry:
  %__set_addr = alloca %struct.__sigset_t*, align 8
  %__sig_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %__mask = alloca i64
  %__word = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.__sigset_t* %__set, %struct.__sigset_t** %__set_addr
  store i32 %__sig, i32* %__sig_addr
  %1 = load i32* %__sig_addr, align 4, !dbg !826
  %2 = sub nsw i32 %1, 1, !dbg !826
  %3 = and i32 %2, 63, !dbg !826
  %.cast = zext i32 %3 to i64, !dbg !826
  %4 = shl i64 1, %.cast, !dbg !826
  store i64 %4, i64* %__mask, align 8, !dbg !826
  %5 = load i32* %__sig_addr, align 4, !dbg !826
  %6 = sub nsw i32 %5, 1, !dbg !826
  %7 = sext i32 %6 to i64, !dbg !826
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %8 = udiv i64 %7, 64, !dbg !826
  store i64 %8, i64* %__word, align 8, !dbg !826
  %9 = load i64* %__word, align 8, !dbg !826
  %10 = load i64* %__word, align 8, !dbg !826
  %11 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !826
  %12 = getelementptr inbounds %struct.__sigset_t* %11, i32 0, i32 0, !dbg !826
  %13 = getelementptr inbounds [16 x i64]* %12, i64 0, i64 %10, !dbg !826
  %14 = load i64* %13, align 8, !dbg !826
  %15 = load i64* %__mask, align 8, !dbg !826
  %not = xor i64 %15, -1, !dbg !826
  %16 = and i64 %14, %not, !dbg !826
  %17 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !826
  %18 = getelementptr inbounds %struct.__sigset_t* %17, i32 0, i32 0, !dbg !826
  %19 = getelementptr inbounds [16 x i64]* %18, i64 0, i64 %9, !dbg !826
  store i64 %16, i64* %19, align 8, !dbg !826
  store i32 0, i32* %0, align 4, !dbg !826
  %20 = load i32* %0, align 4, !dbg !826
  store i32 %20, i32* %retval, align 4, !dbg !826
  %retval2 = load i32* %retval, !dbg !826
  ret i32 %retval2, !dbg !827
}

define hidden i64 @__stdio_WRITE(%struct.FILE* %stream, i8* %buf, i64 %bufsize) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %buf_addr = alloca i8*, align 8
  %bufsize_addr = alloca i64, align 8
  %retval = alloca i64
  %iftmp.0 = alloca i64
  %0 = alloca i64
  %todo = alloca i64
  %rv = alloca i64
  %stodo = alloca i64
  %s = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  store i8* %buf, i8** %buf_addr
  store i64 %bufsize, i64* %bufsize_addr
  %1 = load i64* %bufsize_addr, align 8, !dbg !829
  store i64 %1, i64* %todo, align 8, !dbg !829
  br label %bb, !dbg !829

bb:                                               ; preds = %bb6, %entry
  %2 = load i64* %todo, align 8, !dbg !831
  %3 = icmp eq i64 %2, 0, !dbg !831
  br i1 %3, label %bb1, label %bb2, !dbg !831

bb1:                                              ; preds = %bb
  %4 = load i64* %bufsize_addr, align 8, !dbg !832
  store i64 %4, i64* %0, align 8, !dbg !832
  br label %bb16, !dbg !832

bb2:                                              ; preds = %bb
  %5 = load i64* %todo, align 8, !dbg !833
  %6 = icmp sge i64 %5, 0, !dbg !833
  br i1 %6, label %bb3, label %bb4, !dbg !833

bb3:                                              ; preds = %bb2
  %7 = load i64* %todo, align 8, !dbg !833
  store i64 %7, i64* %iftmp.0, align 8, !dbg !833
  br label %bb5, !dbg !833

bb4:                                              ; preds = %bb2
  store i64 9223372036854775807, i64* %iftmp.0, align 8, !dbg !833
  br label %bb5, !dbg !833

bb5:                                              ; preds = %bb4, %bb3
  %8 = load i64* %iftmp.0, align 8, !dbg !833
  store i64 %8, i64* %stodo, align 8, !dbg !833
  %9 = load i64* %stodo, align 8, !dbg !834
  %10 = load %struct.FILE** %stream_addr, align 8, !dbg !834
  %11 = getelementptr inbounds %struct.FILE* %10, i32 0, i32 2, !dbg !834
  %12 = load i32* %11, align 4, !dbg !834
  %13 = load i8** %buf_addr, align 8, !dbg !834
  %14 = call i64 @write(i32 %12, i8* %13, i64 %9) nounwind, !dbg !834
  store i64 %14, i64* %rv, align 8, !dbg !834
  %15 = load i64* %rv, align 8, !dbg !834
  %16 = icmp sge i64 %15, 0, !dbg !834
  br i1 %16, label %bb6, label %bb7, !dbg !834

bb6:                                              ; preds = %bb5
  %17 = load i64* %rv, align 8, !dbg !835
  %18 = load i64* %todo, align 8, !dbg !835
  %19 = sub i64 %18, %17, !dbg !835
  store i64 %19, i64* %todo, align 8, !dbg !835
  %20 = load i8** %buf_addr, align 8, !dbg !836
  %21 = load i64* %rv, align 8, !dbg !836
  %22 = getelementptr inbounds i8* %20, i64 %21, !dbg !836
  store i8* %22, i8** %buf_addr, align 8, !dbg !836
  br label %bb, !dbg !836

bb7:                                              ; preds = %bb5
  %23 = load %struct.FILE** %stream_addr, align 8, !dbg !837
  %24 = getelementptr inbounds %struct.FILE* %23, i32 0, i32 0, !dbg !837
  %25 = load i16* %24, align 8, !dbg !837
  %26 = or i16 %25, 8, !dbg !837
  %27 = load %struct.FILE** %stream_addr, align 8, !dbg !837
  %28 = getelementptr inbounds %struct.FILE* %27, i32 0, i32 0, !dbg !837
  store i16 %26, i16* %28, align 8, !dbg !837
  %29 = load %struct.FILE** %stream_addr, align 8, !dbg !838
  %30 = getelementptr inbounds %struct.FILE* %29, i32 0, i32 4, !dbg !838
  %31 = load i8** %30, align 8, !dbg !838
  %32 = ptrtoint i8* %31 to i64, !dbg !838
  %33 = load %struct.FILE** %stream_addr, align 8, !dbg !838
  %34 = getelementptr inbounds %struct.FILE* %33, i32 0, i32 3, !dbg !838
  %35 = load i8** %34, align 8, !dbg !838
  %36 = ptrtoint i8* %35 to i64, !dbg !838
  %37 = sub nsw i64 %32, %36, !dbg !838
  store i64 %37, i64* %stodo, align 8, !dbg !838
  %38 = load i64* %stodo, align 8, !dbg !838
  %39 = icmp ne i64 %38, 0, !dbg !838
  br i1 %39, label %bb8, label %bb15, !dbg !838

bb8:                                              ; preds = %bb7
  %40 = load i64* %stodo, align 8, !dbg !839
  %41 = load i64* %todo, align 8, !dbg !839
  %42 = icmp ugt i64 %40, %41, !dbg !839
  br i1 %42, label %bb9, label %bb10, !dbg !839

bb9:                                              ; preds = %bb8
  %43 = load i64* %todo, align 8, !dbg !841
  store i64 %43, i64* %stodo, align 8, !dbg !841
  br label %bb10, !dbg !841

bb10:                                             ; preds = %bb9, %bb8
  %44 = load %struct.FILE** %stream_addr, align 8, !dbg !842
  %45 = getelementptr inbounds %struct.FILE* %44, i32 0, i32 3, !dbg !842
  %46 = load i8** %45, align 8, !dbg !842
  store i8* %46, i8** %s, align 8, !dbg !842
  br label %bb11, !dbg !842

bb11:                                             ; preds = %bb13, %bb10
  %47 = load i8** %buf_addr, align 8, !dbg !843
  %48 = load i8* %47, align 1, !dbg !843
  %49 = load i8** %s, align 8, !dbg !843
  store i8 %48, i8* %49, align 1, !dbg !843
  %50 = load i8** %s, align 8, !dbg !843
  %51 = load i8* %50, align 1, !dbg !843
  %52 = icmp eq i8 %51, 10, !dbg !843
  br i1 %52, label %bb12, label %bb13, !dbg !843

bb12:                                             ; preds = %bb11
  %53 = load %struct.FILE** %stream_addr, align 8, !dbg !843
  %54 = getelementptr inbounds %struct.FILE* %53, i32 0, i32 0, !dbg !843
  %55 = load i16* %54, align 8, !dbg !843
  %56 = zext i16 %55 to i32, !dbg !843
  %57 = and i32 %56, 256, !dbg !843
  %58 = icmp ne i32 %57, 0, !dbg !843
  br i1 %58, label %bb14, label %bb13, !dbg !843

bb13:                                             ; preds = %bb12, %bb11
  %59 = load i8** %s, align 8, !dbg !844
  %60 = getelementptr inbounds i8* %59, i64 1, !dbg !844
  store i8* %60, i8** %s, align 8, !dbg !844
  %61 = load i8** %buf_addr, align 8, !dbg !845
  %62 = getelementptr inbounds i8* %61, i64 1, !dbg !845
  store i8* %62, i8** %buf_addr, align 8, !dbg !845
  %63 = load i64* %stodo, align 8, !dbg !846
  %64 = sub nsw i64 %63, 1, !dbg !846
  store i64 %64, i64* %stodo, align 8, !dbg !846
  %65 = load i64* %stodo, align 8, !dbg !846
  %66 = icmp ne i64 %65, 0, !dbg !846
  br i1 %66, label %bb11, label %bb14, !dbg !846

bb14:                                             ; preds = %bb13, %bb12
  %67 = load %struct.FILE** %stream_addr, align 8, !dbg !847
  %68 = getelementptr inbounds %struct.FILE* %67, i32 0, i32 5, !dbg !847
  %69 = load i8** %s, align 8, !dbg !847
  store i8* %69, i8** %68, align 8, !dbg !847
  %70 = load i8** %s, align 8, !dbg !848
  %71 = ptrtoint i8* %70 to i64, !dbg !848
  %72 = load %struct.FILE** %stream_addr, align 8, !dbg !848
  %73 = getelementptr inbounds %struct.FILE* %72, i32 0, i32 3, !dbg !848
  %74 = load i8** %73, align 8, !dbg !848
  %75 = ptrtoint i8* %74 to i64, !dbg !848
  %76 = sub nsw i64 %71, %75, !dbg !848
  %77 = load i64* %todo, align 8, !dbg !848
  %78 = sub i64 %77, %76, !dbg !848
  store i64 %78, i64* %todo, align 8, !dbg !848
  br label %bb15, !dbg !848

bb15:                                             ; preds = %bb14, %bb7
  %79 = load i64* %bufsize_addr, align 8, !dbg !849
  %80 = load i64* %todo, align 8, !dbg !849
  %81 = sub i64 %79, %80, !dbg !849
  store i64 %81, i64* %0, align 8, !dbg !849
  br label %bb16, !dbg !849

bb16:                                             ; preds = %bb15, %bb1
  %82 = load i64* %0, align 8, !dbg !832
  store i64 %82, i64* %retval, align 8, !dbg !832
  %retval17 = load i64* %retval, !dbg !832
  ret i64 %retval17, !dbg !832
}

declare i64 @write(i32, i8*, i64)

define hidden i64 @__stdio_wcommit(%struct.FILE* noalias %stream) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %retval = alloca i64
  %0 = alloca i64
  %bufsize = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !850
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 5, !dbg !850
  %3 = load i8** %2, align 8, !dbg !850
  %4 = ptrtoint i8* %3 to i64, !dbg !850
  %5 = load %struct.FILE** %stream_addr, align 8, !dbg !850
  %6 = getelementptr inbounds %struct.FILE* %5, i32 0, i32 3, !dbg !850
  %7 = load i8** %6, align 8, !dbg !850
  %8 = ptrtoint i8* %7 to i64, !dbg !850
  %9 = sub nsw i64 %4, %8, !dbg !850
  store i64 %9, i64* %bufsize, align 8, !dbg !850
  %10 = load i64* %bufsize, align 8, !dbg !850
  %11 = icmp ne i64 %10, 0, !dbg !850
  br i1 %11, label %bb, label %bb1, !dbg !850

bb:                                               ; preds = %entry
  %12 = load %struct.FILE** %stream_addr, align 8, !dbg !852
  %13 = getelementptr inbounds %struct.FILE* %12, i32 0, i32 3, !dbg !852
  %14 = load i8** %13, align 8, !dbg !852
  %15 = load %struct.FILE** %stream_addr, align 8, !dbg !852
  %16 = getelementptr inbounds %struct.FILE* %15, i32 0, i32 5, !dbg !852
  store i8* %14, i8** %16, align 8, !dbg !852
  %17 = load %struct.FILE** %stream_addr, align 8, !dbg !853
  %18 = getelementptr inbounds %struct.FILE* %17, i32 0, i32 3, !dbg !853
  %19 = load i8** %18, align 8, !dbg !853
  %20 = load %struct.FILE** %stream_addr, align 8, !dbg !853
  %21 = load i64* %bufsize, align 8, !dbg !853
  %22 = call i64 @__stdio_WRITE(%struct.FILE* %20, i8* %19, i64 %21) nounwind, !dbg !853
  br label %bb1, !dbg !853

bb1:                                              ; preds = %bb, %entry
  %23 = load %struct.FILE** %stream_addr, align 8, !dbg !854
  %24 = getelementptr inbounds %struct.FILE* %23, i32 0, i32 5, !dbg !854
  %25 = load i8** %24, align 8, !dbg !854
  %26 = ptrtoint i8* %25 to i64, !dbg !854
  %27 = load %struct.FILE** %stream_addr, align 8, !dbg !854
  %28 = getelementptr inbounds %struct.FILE* %27, i32 0, i32 3, !dbg !854
  %29 = load i8** %28, align 8, !dbg !854
  %30 = ptrtoint i8* %29 to i64, !dbg !854
  %31 = sub nsw i64 %26, %30, !dbg !854
  store i64 %31, i64* %0, align 8, !dbg !854
  %32 = load i64* %0, align 8, !dbg !854
  store i64 %32, i64* %retval, align 8, !dbg !854
  %retval2 = load i64* %retval, !dbg !854
  ret i64 %retval2, !dbg !854
}

define hidden i32 @__stdio_trans2w_o(%struct.FILE* noalias %stream, i32 %oflag) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %oflag_addr = alloca i32, align 4
  %retval = alloca i32
  %iftmp.0 = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  store i32 %oflag, i32* %oflag_addr
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !855
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 0, !dbg !855
  %3 = load i16* %2, align 8, !dbg !855
  %4 = zext i16 %3 to i32, !dbg !855
  %5 = load i32* %oflag_addr, align 4, !dbg !855
  %6 = and i32 %4, %5, !dbg !855
  %7 = icmp eq i32 %6, 0, !dbg !855
  br i1 %7, label %bb, label %bb2, !dbg !855

bb:                                               ; preds = %entry
  %8 = load %struct.FILE** %stream_addr, align 8, !dbg !857
  %9 = getelementptr inbounds %struct.FILE* %8, i32 0, i32 0, !dbg !857
  %10 = load i16* %9, align 8, !dbg !857
  %11 = zext i16 %10 to i32, !dbg !857
  %12 = and i32 %11, 2176, !dbg !857
  %13 = icmp ne i32 %12, 0, !dbg !857
  br i1 %13, label %DO_EBADF, label %bb1, !dbg !857

bb1:                                              ; preds = %bb
  %14 = load %struct.FILE** %stream_addr, align 8, !dbg !858
  %15 = getelementptr inbounds %struct.FILE* %14, i32 0, i32 0, !dbg !858
  %16 = load i16* %15, align 8, !dbg !858
  %17 = load i32* %oflag_addr, align 4, !dbg !858
  %18 = trunc i32 %17 to i16, !dbg !858
  %19 = or i16 %16, %18, !dbg !858
  %20 = load %struct.FILE** %stream_addr, align 8, !dbg !858
  %21 = getelementptr inbounds %struct.FILE* %20, i32 0, i32 0, !dbg !858
  store i16 %19, i16* %21, align 8, !dbg !858
  br label %bb2, !dbg !858

bb2:                                              ; preds = %bb1, %entry
  %22 = load %struct.FILE** %stream_addr, align 8, !dbg !859
  %23 = getelementptr inbounds %struct.FILE* %22, i32 0, i32 0, !dbg !859
  %24 = load i16* %23, align 8, !dbg !859
  %25 = zext i16 %24 to i32, !dbg !859
  %26 = and i32 %25, 32, !dbg !859
  %27 = icmp ne i32 %26, 0, !dbg !859
  br i1 %27, label %DO_EBADF, label %bb3, !dbg !859

DO_EBADF:                                         ; preds = %bb2, %bb
  store i32 9, i32* @errno, align 4, !dbg !860
  br label %ERROR, !dbg !861

ERROR:                                            ; preds = %bb10, %DO_EBADF
  %28 = load %struct.FILE** %stream_addr, align 8, !dbg !862
  %29 = getelementptr inbounds %struct.FILE* %28, i32 0, i32 0, !dbg !862
  %30 = load i16* %29, align 8, !dbg !862
  %31 = or i16 %30, 8, !dbg !862
  %32 = load %struct.FILE** %stream_addr, align 8, !dbg !862
  %33 = getelementptr inbounds %struct.FILE* %32, i32 0, i32 0, !dbg !862
  store i16 %31, i16* %33, align 8, !dbg !862
  store i32 -1, i32* %0, align 4, !dbg !863
  br label %bb15, !dbg !863

bb3:                                              ; preds = %bb2
  %34 = load %struct.FILE** %stream_addr, align 8, !dbg !864
  %35 = getelementptr inbounds %struct.FILE* %34, i32 0, i32 0, !dbg !864
  %36 = load i16* %35, align 8, !dbg !864
  %37 = zext i16 %36 to i32, !dbg !864
  %38 = and i32 %37, 3, !dbg !864
  %39 = icmp ne i32 %38, 0, !dbg !864
  br i1 %39, label %bb4, label %bb12, !dbg !864

bb4:                                              ; preds = %bb3
  %40 = load %struct.FILE** %stream_addr, align 8, !dbg !865
  %41 = getelementptr inbounds %struct.FILE* %40, i32 0, i32 0, !dbg !865
  %42 = load i16* %41, align 8, !dbg !865
  %43 = zext i16 %42 to i32, !dbg !865
  %44 = and i32 %43, 4, !dbg !865
  %45 = icmp eq i32 %44, 0, !dbg !865
  br i1 %45, label %bb5, label %bb11, !dbg !865

bb5:                                              ; preds = %bb4
  %46 = load %struct.FILE** %stream_addr, align 8, !dbg !866
  %47 = getelementptr inbounds %struct.FILE* %46, i32 0, i32 6, !dbg !866
  %48 = load i8** %47, align 8, !dbg !866
  %49 = load %struct.FILE** %stream_addr, align 8, !dbg !866
  %50 = getelementptr inbounds %struct.FILE* %49, i32 0, i32 5, !dbg !866
  %51 = load i8** %50, align 8, !dbg !866
  %52 = icmp ne i8* %48, %51, !dbg !866
  br i1 %52, label %bb7, label %bb6, !dbg !866

bb6:                                              ; preds = %bb5
  %53 = load %struct.FILE** %stream_addr, align 8, !dbg !866
  %54 = getelementptr inbounds %struct.FILE* %53, i32 0, i32 0, !dbg !866
  %55 = load i16* %54, align 8, !dbg !866
  %56 = zext i16 %55 to i32, !dbg !866
  %57 = and i32 %56, 2, !dbg !866
  %58 = icmp ne i32 %57, 0, !dbg !866
  br i1 %58, label %bb7, label %bb11, !dbg !866

bb7:                                              ; preds = %bb6, %bb5
  %59 = load %struct.FILE** %stream_addr, align 8, !dbg !866
  %60 = getelementptr inbounds %struct.FILE* %59, i32 0, i32 0, !dbg !866
  %61 = load i16* %60, align 8, !dbg !866
  %62 = zext i16 %61 to i32, !dbg !866
  %63 = and i32 %62, 1024, !dbg !866
  %64 = icmp ne i32 %63, 0, !dbg !866
  br i1 %64, label %bb8, label %bb9, !dbg !866

bb8:                                              ; preds = %bb7
  store i32 2, i32* %iftmp.0, align 4, !dbg !866
  br label %bb10, !dbg !866

bb9:                                              ; preds = %bb7
  store i32 1, i32* %iftmp.0, align 4, !dbg !866
  br label %bb10, !dbg !866

bb10:                                             ; preds = %bb9, %bb8
  %65 = load %struct.FILE** %stream_addr, align 8, !dbg !866
  %66 = load i32* %iftmp.0, align 4, !dbg !866
  %67 = call i32 @fseek(%struct.FILE* %65, i64 0, i32 %66) nounwind, !dbg !866
  %68 = icmp ne i32 %67, 0, !dbg !866
  br i1 %68, label %ERROR, label %bb11, !dbg !866

bb11:                                             ; preds = %bb10, %bb6, %bb4
  %69 = load %struct.FILE** %stream_addr, align 8, !dbg !867
  %70 = getelementptr inbounds %struct.FILE* %69, i32 0, i32 0, !dbg !867
  %71 = load i16* %70, align 8, !dbg !867
  %72 = and i16 %71, -4, !dbg !867
  %73 = load %struct.FILE** %stream_addr, align 8, !dbg !867
  %74 = getelementptr inbounds %struct.FILE* %73, i32 0, i32 0, !dbg !867
  store i16 %72, i16* %74, align 8, !dbg !867
  %75 = load %struct.FILE** %stream_addr, align 8, !dbg !868
  %76 = getelementptr inbounds %struct.FILE* %75, i32 0, i32 3, !dbg !868
  %77 = load i8** %76, align 8, !dbg !868
  %78 = load %struct.FILE** %stream_addr, align 8, !dbg !868
  %79 = getelementptr inbounds %struct.FILE* %78, i32 0, i32 7, !dbg !868
  store i8* %77, i8** %79, align 8, !dbg !868
  %80 = load %struct.FILE** %stream_addr, align 8, !dbg !869
  %81 = getelementptr inbounds %struct.FILE* %80, i32 0, i32 3, !dbg !869
  %82 = load i8** %81, align 8, !dbg !869
  %83 = load %struct.FILE** %stream_addr, align 8, !dbg !869
  %84 = getelementptr inbounds %struct.FILE* %83, i32 0, i32 5, !dbg !869
  store i8* %82, i8** %84, align 8, !dbg !869
  %85 = load %struct.FILE** %stream_addr, align 8, !dbg !869
  %86 = getelementptr inbounds %struct.FILE* %85, i32 0, i32 5, !dbg !869
  %87 = load i8** %86, align 8, !dbg !869
  %88 = load %struct.FILE** %stream_addr, align 8, !dbg !869
  %89 = getelementptr inbounds %struct.FILE* %88, i32 0, i32 6, !dbg !869
  store i8* %87, i8** %89, align 8, !dbg !869
  br label %bb12, !dbg !869

bb12:                                             ; preds = %bb11, %bb3
  %90 = load %struct.FILE** %stream_addr, align 8, !dbg !870
  %91 = getelementptr inbounds %struct.FILE* %90, i32 0, i32 0, !dbg !870
  %92 = load i16* %91, align 8, !dbg !870
  %93 = or i16 %92, 64, !dbg !870
  %94 = load %struct.FILE** %stream_addr, align 8, !dbg !870
  %95 = getelementptr inbounds %struct.FILE* %94, i32 0, i32 0, !dbg !870
  store i16 %93, i16* %95, align 8, !dbg !870
  %96 = load %struct.FILE** %stream_addr, align 8, !dbg !871
  %97 = getelementptr inbounds %struct.FILE* %96, i32 0, i32 0, !dbg !871
  %98 = load i16* %97, align 8, !dbg !871
  %99 = zext i16 %98 to i32, !dbg !871
  %100 = and i32 %99, 2816, !dbg !871
  %101 = icmp eq i32 %100, 0, !dbg !871
  br i1 %101, label %bb13, label %bb14, !dbg !871

bb13:                                             ; preds = %bb12
  %102 = load %struct.FILE** %stream_addr, align 8, !dbg !872
  %103 = getelementptr inbounds %struct.FILE* %102, i32 0, i32 4, !dbg !872
  %104 = load i8** %103, align 8, !dbg !872
  %105 = load %struct.FILE** %stream_addr, align 8, !dbg !872
  %106 = getelementptr inbounds %struct.FILE* %105, i32 0, i32 8, !dbg !872
  store i8* %104, i8** %106, align 8, !dbg !872
  br label %bb14, !dbg !872

bb14:                                             ; preds = %bb13, %bb12
  store i32 0, i32* %0, align 4, !dbg !873
  br label %bb15, !dbg !873

bb15:                                             ; preds = %bb14, %ERROR
  %107 = load i32* %0, align 4, !dbg !863
  store i32 %107, i32* %retval, align 4, !dbg !863
  %retval16 = load i32* %retval, !dbg !863
  ret i32 %retval16, !dbg !863
}

define i32 @isatty(i32 %fd) nounwind {
entry:
  %fd_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %term = alloca %struct.termios
  %"alloca point" = bitcast i32 0 to i32
  store i32 %fd, i32* %fd_addr
  %1 = load i32* %fd_addr, align 4, !dbg !874
  %2 = call i32 @tcgetattr(i32 %1, %struct.termios* %term) nounwind, !dbg !874
  %3 = icmp eq i32 %2, 0, !dbg !874
  %4 = zext i1 %3 to i32, !dbg !874
  store i32 %4, i32* %0, align 4, !dbg !874
  %5 = load i32* %0, align 4, !dbg !874
  store i32 %5, i32* %retval, align 4, !dbg !874
  %retval1 = load i32* %retval, !dbg !874
  ret i32 %retval1, !dbg !874
}

define hidden i32 @__raise(i32 %signo) nounwind {
entry:
  %signo_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %signo, i32* %signo_addr
  %1 = call i32 @getpid() nounwind, !dbg !876
  %2 = load i32* %signo_addr, align 4, !dbg !876
  %3 = call i32 @kill(i32 %1, i32 %2) nounwind, !dbg !876
  store i32 %3, i32* %0, align 4, !dbg !876
  %4 = load i32* %0, align 4, !dbg !876
  store i32 %4, i32* %retval, align 4, !dbg !876
  %retval1 = load i32* %retval, !dbg !876
  ret i32 %retval1, !dbg !876
}

declare i32 @getpid() nounwind

declare i32 @kill(i32, i32) nounwind

define i32 @__libc_sigaction(i32 %sig, %struct.sigaction* %act, %struct.sigaction* %oact) nounwind {
entry:
  %sig_addr = alloca i32, align 4
  %act_addr = alloca %struct.sigaction*, align 8
  %oact_addr = alloca %struct.sigaction*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %iftmp.1 = alloca %struct.kernel_sigaction*
  %iftmp.0 = alloca %struct.kernel_sigaction*
  %result = alloca i32
  %kact = alloca %struct.kernel_sigaction
  %koact = alloca %struct.kernel_sigaction
  %"alloca point" = bitcast i32 0 to i32
  store i32 %sig, i32* %sig_addr
  store %struct.sigaction* %act, %struct.sigaction** %act_addr
  store %struct.sigaction* %oact, %struct.sigaction** %oact_addr
  %1 = load %struct.sigaction** %act_addr, align 8, !dbg !878
  %2 = icmp ne %struct.sigaction* %1, null, !dbg !878
  br i1 %2, label %bb, label %bb1, !dbg !878

bb:                                               ; preds = %entry
  %3 = load %struct.sigaction** %act_addr, align 8, !dbg !880
  %4 = getelementptr inbounds %struct.sigaction* %3, i32 0, i32 0, !dbg !880
  %5 = getelementptr inbounds %0* %4, i32 0, i32 0, !dbg !880
  %6 = load void (i32)** %5, align 8, !dbg !880
  %7 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 0, !dbg !880
  store void (i32)* %6, void (i32)** %7, align 8, !dbg !880
  %8 = load %struct.sigaction** %act_addr, align 8, !dbg !881
  %9 = getelementptr inbounds %struct.sigaction* %8, i32 0, i32 1, !dbg !881
  %10 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 3, !dbg !881
  %11 = bitcast %struct.__sigset_t* %10 to i8*, !dbg !881
  %12 = bitcast %struct.__sigset_t* %9 to i8*, !dbg !881
  %13 = call i8* @memcpy(i8* noalias %11, i8* noalias %12, i64 128) nounwind, !dbg !881
  %14 = load %struct.sigaction** %act_addr, align 8, !dbg !882
  %15 = getelementptr inbounds %struct.sigaction* %14, i32 0, i32 2, !dbg !882
  %16 = load i32* %15, align 8, !dbg !882
  %17 = sext i32 %16 to i64, !dbg !882
  %18 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 1, !dbg !882
  store i64 %17, i64* %18, align 8, !dbg !882
  %19 = load %struct.sigaction** %act_addr, align 8, !dbg !883
  %20 = getelementptr inbounds %struct.sigaction* %19, i32 0, i32 3, !dbg !883
  %21 = load void ()** %20, align 8, !dbg !883
  %22 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 2, !dbg !883
  store void ()* %21, void ()** %22, align 8, !dbg !883
  br label %bb1, !dbg !883

bb1:                                              ; preds = %bb, %entry
  %23 = load %struct.sigaction** %oact_addr, align 8, !dbg !884
  %24 = icmp ne %struct.sigaction* %23, null, !dbg !884
  br i1 %24, label %bb2, label %bb3, !dbg !884

bb2:                                              ; preds = %bb1
  store %struct.kernel_sigaction* %koact, %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !884
  br label %bb4, !dbg !884

bb3:                                              ; preds = %bb1
  store %struct.kernel_sigaction* null, %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !884
  br label %bb4, !dbg !884

bb4:                                              ; preds = %bb3, %bb2
  %25 = load %struct.sigaction** %act_addr, align 8, !dbg !884
  %26 = icmp ne %struct.sigaction* %25, null, !dbg !884
  br i1 %26, label %bb5, label %bb6, !dbg !884

bb5:                                              ; preds = %bb4
  store %struct.kernel_sigaction* %kact, %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !884
  br label %bb7, !dbg !884

bb6:                                              ; preds = %bb4
  store %struct.kernel_sigaction* null, %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !884
  br label %bb7, !dbg !884

bb7:                                              ; preds = %bb6, %bb5
  %27 = load i32* %sig_addr, align 4, !dbg !884
  %28 = load %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !884
  %29 = load %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !884
  %30 = call i32 @__syscall_rt_sigaction(i32 %27, %struct.kernel_sigaction* %28, %struct.kernel_sigaction* %29, i64 8) nounwind, !dbg !884
  store i32 %30, i32* %result, align 4, !dbg !884
  %31 = load %struct.sigaction** %oact_addr, align 8, !dbg !885
  %32 = icmp ne %struct.sigaction* %31, null, !dbg !885
  br i1 %32, label %bb8, label %bb10, !dbg !885

bb8:                                              ; preds = %bb7
  %33 = load i32* %result, align 4, !dbg !885
  %34 = icmp sge i32 %33, 0, !dbg !885
  br i1 %34, label %bb9, label %bb10, !dbg !885

bb9:                                              ; preds = %bb8
  %35 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 0, !dbg !886
  %36 = load void (i32)** %35, align 8, !dbg !886
  %37 = load %struct.sigaction** %oact_addr, align 8, !dbg !886
  %38 = getelementptr inbounds %struct.sigaction* %37, i32 0, i32 0, !dbg !886
  %39 = getelementptr inbounds %0* %38, i32 0, i32 0, !dbg !886
  store void (i32)* %36, void (i32)** %39, align 8, !dbg !886
  %40 = load %struct.sigaction** %oact_addr, align 8, !dbg !887
  %41 = getelementptr inbounds %struct.sigaction* %40, i32 0, i32 1, !dbg !887
  %42 = bitcast %struct.__sigset_t* %41 to i8*, !dbg !887
  %43 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 3, !dbg !887
  %44 = bitcast %struct.__sigset_t* %43 to i8*, !dbg !887
  %45 = call i8* @memcpy(i8* noalias %42, i8* noalias %44, i64 128) nounwind, !dbg !887
  %46 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 1, !dbg !888
  %47 = load i64* %46, align 8, !dbg !888
  %48 = trunc i64 %47 to i32, !dbg !888
  %49 = load %struct.sigaction** %oact_addr, align 8, !dbg !888
  %50 = getelementptr inbounds %struct.sigaction* %49, i32 0, i32 2, !dbg !888
  store i32 %48, i32* %50, align 8, !dbg !888
  %51 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 2, !dbg !889
  %52 = load void ()** %51, align 8, !dbg !889
  %53 = load %struct.sigaction** %oact_addr, align 8, !dbg !889
  %54 = getelementptr inbounds %struct.sigaction* %53, i32 0, i32 3, !dbg !889
  store void ()* %52, void ()** %54, align 8, !dbg !889
  br label %bb10, !dbg !889

bb10:                                             ; preds = %bb9, %bb8, %bb7
  %55 = load i32* %result, align 4, !dbg !890
  store i32 %55, i32* %0, align 4, !dbg !890
  %56 = load i32* %0, align 4, !dbg !890
  store i32 %56, i32* %retval, align 4, !dbg !890
  %retval11 = load i32* %retval, !dbg !890
  ret i32 %retval11, !dbg !890
}

declare hidden i32 @__syscall_rt_sigaction(i32, %struct.kernel_sigaction*, %struct.kernel_sigaction*, i64)

define i32 @fseek(%struct.FILE* %stream, i64 %offset, i32 %whence) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %offset_addr = alloca i64, align 8
  %whence_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  store i64 %offset, i64* %offset_addr
  store i32 %whence, i32* %whence_addr
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !891
  %2 = load i64* %offset_addr, align 8, !dbg !891
  %3 = load i32* %whence_addr, align 4, !dbg !891
  %4 = call i32 @fseeko64(%struct.FILE* %1, i64 %2, i32 %3) nounwind, !dbg !891
  store i32 %4, i32* %0, align 4, !dbg !891
  %5 = load i32* %0, align 4, !dbg !891
  store i32 %5, i32* %retval, align 4, !dbg !891
  %retval1 = load i32* %retval, !dbg !891
  ret i32 %retval1, !dbg !891
}

define i32 @tcgetattr(i32 %fd, %struct.termios* %termios_p) nounwind {
entry:
  %fd_addr = alloca i32, align 4
  %termios_p_addr = alloca %struct.termios*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %k_termios = alloca %struct.__kernel_termios
  %retval1 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %fd, i32* %fd_addr
  store %struct.termios* %termios_p, %struct.termios** %termios_p_addr
  %1 = load i32* %fd_addr, align 4, !dbg !893
  %2 = call i32 (i32, i64, ...)* @ioctl(i32 %1, i64 21505, %struct.__kernel_termios* %k_termios) nounwind, !dbg !893
  store i32 %2, i32* %retval1, align 4, !dbg !893
  %3 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 0, !dbg !895
  %4 = load i32* %3, align 4, !dbg !895
  %5 = load %struct.termios** %termios_p_addr, align 8, !dbg !895
  %6 = getelementptr inbounds %struct.termios* %5, i32 0, i32 0, !dbg !895
  store i32 %4, i32* %6, align 4, !dbg !895
  %7 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 1, !dbg !896
  %8 = load i32* %7, align 4, !dbg !896
  %9 = load %struct.termios** %termios_p_addr, align 8, !dbg !896
  %10 = getelementptr inbounds %struct.termios* %9, i32 0, i32 1, !dbg !896
  store i32 %8, i32* %10, align 4, !dbg !896
  %11 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 2, !dbg !897
  %12 = load i32* %11, align 4, !dbg !897
  %13 = load %struct.termios** %termios_p_addr, align 8, !dbg !897
  %14 = getelementptr inbounds %struct.termios* %13, i32 0, i32 2, !dbg !897
  store i32 %12, i32* %14, align 4, !dbg !897
  %15 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 3, !dbg !898
  %16 = load i32* %15, align 4, !dbg !898
  %17 = load %struct.termios** %termios_p_addr, align 8, !dbg !898
  %18 = getelementptr inbounds %struct.termios* %17, i32 0, i32 3, !dbg !898
  store i32 %16, i32* %18, align 4, !dbg !898
  %19 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 4, !dbg !899
  %20 = load i8* %19, align 4, !dbg !899
  %21 = load %struct.termios** %termios_p_addr, align 8, !dbg !899
  %22 = getelementptr inbounds %struct.termios* %21, i32 0, i32 4, !dbg !899
  store i8 %20, i8* %22, align 4, !dbg !899
  %23 = load %struct.termios** %termios_p_addr, align 8, !dbg !900
  %24 = getelementptr inbounds %struct.termios* %23, i32 0, i32 5, !dbg !900
  %25 = getelementptr inbounds [32 x i8]* %24, i64 0, i64 0, !dbg !900
  %26 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 5, !dbg !900
  %27 = getelementptr inbounds [19 x i8]* %26, i64 0, i64 0, !dbg !900
  %28 = call i8* @mempcpy(i8* noalias %25, i8* noalias %27, i64 19) nounwind, !dbg !900
  %29 = call i8* @memset(i8* %28, i32 0, i64 13) nounwind, !dbg !900
  %30 = load i32* %retval1, align 4, !dbg !901
  store i32 %30, i32* %0, align 4, !dbg !901
  %31 = load i32* %0, align 4, !dbg !901
  store i32 %31, i32* %retval, align 4, !dbg !901
  %retval2 = load i32* %retval, !dbg !901
  ret i32 %retval2, !dbg !901
}

declare i32 @ioctl(i32, i64, ...) nounwind

define i32 @fseeko64(%struct.FILE* %stream, i64 %offset, i32 %whence) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %offset_addr = alloca i64, align 8
  %whence_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %pos = alloca i64
  %retval1 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  store i64 %offset, i64* %offset_addr
  store i32 %whence, i32* %whence_addr
  %1 = load i64* %offset_addr, align 8, !dbg !902
  store i64 %1, i64* %pos, align 8, !dbg !902
  store i32 -1, i32* %retval1, align 4, !dbg !904
  %2 = load i32* %whence_addr, align 4, !dbg !905
  %3 = icmp ugt i32 %2, 2, !dbg !905
  br i1 %3, label %bb, label %bb2, !dbg !905

bb:                                               ; preds = %entry
  store i32 22, i32* @errno, align 4, !dbg !906
  br label %bb8, !dbg !906

bb2:                                              ; preds = %entry
  %4 = load %struct.FILE** %stream_addr, align 8, !dbg !907
  %5 = getelementptr inbounds %struct.FILE* %4, i32 0, i32 0, !dbg !907
  %6 = load i16* %5, align 8, !dbg !907
  %7 = zext i16 %6 to i32, !dbg !907
  %8 = and i32 %7, 64, !dbg !907
  %9 = icmp eq i32 %8, 0, !dbg !907
  br i1 %9, label %bb4, label %bb3, !dbg !907

bb3:                                              ; preds = %bb2
  %10 = load %struct.FILE** %stream_addr, align 8, !dbg !907
  %11 = call i64 @__stdio_wcommit(%struct.FILE* noalias %10) nounwind, !dbg !907
  %12 = icmp eq i64 %11, 0, !dbg !907
  br i1 %12, label %bb4, label %bb8, !dbg !907

bb4:                                              ; preds = %bb3, %bb2
  %13 = load i32* %whence_addr, align 4, !dbg !907
  %14 = icmp ne i32 %13, 1, !dbg !907
  br i1 %14, label %bb6, label %bb5, !dbg !907

bb5:                                              ; preds = %bb4
  %15 = load %struct.FILE** %stream_addr, align 8, !dbg !907
  %16 = call i32 @__stdio_adjust_position(%struct.FILE* noalias %15, i64* %pos) nounwind, !dbg !907
  %17 = icmp sge i32 %16, 0, !dbg !907
  br i1 %17, label %bb6, label %bb8, !dbg !907

bb6:                                              ; preds = %bb5, %bb4
  %18 = load %struct.FILE** %stream_addr, align 8, !dbg !907
  %19 = load i32* %whence_addr, align 4, !dbg !907
  %20 = call i32 @__stdio_seek(%struct.FILE* %18, i64* %pos, i32 %19) nounwind, !dbg !907
  %21 = icmp sge i32 %20, 0, !dbg !907
  br i1 %21, label %bb7, label %bb8, !dbg !907

bb7:                                              ; preds = %bb6
  %22 = load %struct.FILE** %stream_addr, align 8, !dbg !908
  %23 = getelementptr inbounds %struct.FILE* %22, i32 0, i32 0, !dbg !908
  %24 = load i16* %23, align 8, !dbg !908
  %25 = and i16 %24, -72, !dbg !908
  %26 = load %struct.FILE** %stream_addr, align 8, !dbg !908
  %27 = getelementptr inbounds %struct.FILE* %26, i32 0, i32 0, !dbg !908
  store i16 %25, i16* %27, align 8, !dbg !908
  %28 = load %struct.FILE** %stream_addr, align 8, !dbg !909
  %29 = getelementptr inbounds %struct.FILE* %28, i32 0, i32 3, !dbg !909
  %30 = load i8** %29, align 8, !dbg !909
  %31 = load %struct.FILE** %stream_addr, align 8, !dbg !909
  %32 = getelementptr inbounds %struct.FILE* %31, i32 0, i32 5, !dbg !909
  store i8* %30, i8** %32, align 8, !dbg !909
  %33 = load %struct.FILE** %stream_addr, align 8, !dbg !909
  %34 = getelementptr inbounds %struct.FILE* %33, i32 0, i32 5, !dbg !909
  %35 = load i8** %34, align 8, !dbg !909
  %36 = load %struct.FILE** %stream_addr, align 8, !dbg !909
  %37 = getelementptr inbounds %struct.FILE* %36, i32 0, i32 6, !dbg !909
  store i8* %35, i8** %37, align 8, !dbg !909
  %38 = load %struct.FILE** %stream_addr, align 8, !dbg !910
  %39 = getelementptr inbounds %struct.FILE* %38, i32 0, i32 3, !dbg !910
  %40 = load i8** %39, align 8, !dbg !910
  %41 = load %struct.FILE** %stream_addr, align 8, !dbg !910
  %42 = getelementptr inbounds %struct.FILE* %41, i32 0, i32 7, !dbg !910
  store i8* %40, i8** %42, align 8, !dbg !910
  %43 = load %struct.FILE** %stream_addr, align 8, !dbg !911
  %44 = getelementptr inbounds %struct.FILE* %43, i32 0, i32 3, !dbg !911
  %45 = load i8** %44, align 8, !dbg !911
  %46 = load %struct.FILE** %stream_addr, align 8, !dbg !911
  %47 = getelementptr inbounds %struct.FILE* %46, i32 0, i32 8, !dbg !911
  store i8* %45, i8** %47, align 8, !dbg !911
  %48 = load %struct.FILE** %stream_addr, align 8, !dbg !912
  %49 = getelementptr inbounds %struct.FILE* %48, i32 0, i32 11, !dbg !912
  %50 = getelementptr inbounds %struct.__mbstate_t* %49, i32 0, i32 0, !dbg !912
  store i32 0, i32* %50, align 8, !dbg !912
  %51 = load %struct.FILE** %stream_addr, align 8, !dbg !913
  %52 = getelementptr inbounds %struct.FILE* %51, i32 0, i32 1, !dbg !913
  %53 = getelementptr inbounds [2 x i8]* %52, i64 0, i64 0, !dbg !913
  store i8 0, i8* %53, align 1, !dbg !913
  store i32 0, i32* %retval1, align 4, !dbg !914
  br label %bb8, !dbg !914

bb8:                                              ; preds = %bb7, %bb6, %bb5, %bb3, %bb
  %54 = load i32* %retval1, align 4, !dbg !915
  store i32 %54, i32* %0, align 4, !dbg !915
  %55 = load i32* %0, align 4, !dbg !915
  store i32 %55, i32* %retval, align 4, !dbg !915
  %retval9 = load i32* %retval, !dbg !915
  ret i32 %retval9, !dbg !915
}

define i8* @mempcpy(i8* noalias %s1, i8* noalias %s2, i64 %n) nounwind {
entry:
  %s1_addr = alloca i8*, align 8
  %s2_addr = alloca i8*, align 8
  %n_addr = alloca i64, align 8
  %retval = alloca i8*
  %0 = alloca i8*
  %r1 = alloca i8*
  %r2 = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i8* %s1, i8** %s1_addr
  store i8* %s2, i8** %s2_addr
  store i64 %n, i64* %n_addr
  %1 = load i8** %s1_addr, align 8, !dbg !916
  store i8* %1, i8** %r1, align 8, !dbg !916
  %2 = load i8** %s2_addr, align 8, !dbg !918
  store i8* %2, i8** %r2, align 8, !dbg !918
  br label %bb1, !dbg !918

bb:                                               ; preds = %bb1
  %3 = load i8** %r2, align 8, !dbg !919
  %4 = load i8* %3, align 1, !dbg !919
  %5 = load i8** %r1, align 8, !dbg !919
  store i8 %4, i8* %5, align 1, !dbg !919
  %6 = load i8** %r1, align 8, !dbg !919
  %7 = getelementptr inbounds i8* %6, i64 1, !dbg !919
  store i8* %7, i8** %r1, align 8, !dbg !919
  %8 = load i8** %r2, align 8, !dbg !919
  %9 = getelementptr inbounds i8* %8, i64 1, !dbg !919
  store i8* %9, i8** %r2, align 8, !dbg !919
  %10 = load i64* %n_addr, align 8, !dbg !920
  %11 = sub i64 %10, 1, !dbg !920
  store i64 %11, i64* %n_addr, align 8, !dbg !920
  br label %bb1, !dbg !920

bb1:                                              ; preds = %bb, %entry
  %12 = load i64* %n_addr, align 8, !dbg !921
  %13 = icmp ne i64 %12, 0, !dbg !921
  br i1 %13, label %bb, label %bb2, !dbg !921

bb2:                                              ; preds = %bb1
  %14 = load i8** %r1, align 8, !dbg !922
  store i8* %14, i8** %0, align 8, !dbg !922
  %15 = load i8** %0, align 8, !dbg !922
  store i8* %15, i8** %retval, align 8, !dbg !922
  %retval3 = load i8** %retval, !dbg !922
  ret i8* %retval3, !dbg !922
}

define hidden i32 @__stdio_adjust_position(%struct.FILE* noalias %stream, i64* %pos) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %pos_addr = alloca i64*, align 8
  %retval = alloca i32
  %iftmp.0 = alloca i8*
  %0 = alloca i32
  %oldpos = alloca i64
  %corr = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  store i64* %pos, i64** %pos_addr
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !923
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 0, !dbg !923
  %3 = load i16* %2, align 8, !dbg !923
  %4 = zext i16 %3 to i32, !dbg !923
  %5 = and i32 %4, 3, !dbg !923
  store i32 %5, i32* %corr, align 4, !dbg !923
  %6 = load i32* %corr, align 4, !dbg !923
  %7 = icmp ne i32 %6, 0, !dbg !923
  br i1 %7, label %bb, label %bb1, !dbg !923

bb:                                               ; preds = %entry
  %8 = load i32* %corr, align 4, !dbg !925
  %9 = sub nsw i32 %8, 1, !dbg !925
  store i32 %9, i32* %corr, align 4, !dbg !925
  br label %bb1, !dbg !925

bb1:                                              ; preds = %bb, %entry
  %10 = load i32* %corr, align 4, !dbg !926
  %11 = icmp ne i32 %10, 0, !dbg !926
  br i1 %11, label %bb2, label %bb8, !dbg !926

bb2:                                              ; preds = %bb1
  %12 = load %struct.FILE** %stream_addr, align 8, !dbg !926
  %13 = getelementptr inbounds %struct.FILE* %12, i32 0, i32 0, !dbg !926
  %14 = load i16* %13, align 8, !dbg !926
  %15 = zext i16 %14 to i32, !dbg !926
  %16 = and i32 %15, 2048, !dbg !926
  %17 = icmp ne i32 %16, 0, !dbg !926
  br i1 %17, label %bb3, label %bb8, !dbg !926

bb3:                                              ; preds = %bb2
  %18 = load i32* %corr, align 4, !dbg !927
  %19 = icmp sgt i32 %18, 1, !dbg !927
  br i1 %19, label %bb5, label %bb4, !dbg !927

bb4:                                              ; preds = %bb3
  %20 = load %struct.FILE** %stream_addr, align 8, !dbg !927
  %21 = getelementptr inbounds %struct.FILE* %20, i32 0, i32 10, !dbg !927
  %22 = getelementptr inbounds [2 x i32]* %21, i64 0, i64 1, !dbg !927
  %23 = load i32* %22, align 4, !dbg !927
  %24 = icmp ne i32 %23, 0, !dbg !927
  br i1 %24, label %bb5, label %bb6, !dbg !927

bb5:                                              ; preds = %bb4, %bb3
  store i32 -1, i32* %0, align 4, !dbg !928
  br label %bb16, !dbg !928

bb6:                                              ; preds = %bb4
  %25 = load %struct.FILE** %stream_addr, align 8, !dbg !929
  %26 = getelementptr inbounds %struct.FILE* %25, i32 0, i32 1, !dbg !929
  %27 = getelementptr inbounds [2 x i8]* %26, i64 0, i64 1, !dbg !929
  %28 = load i8* %27, align 1, !dbg !929
  %29 = zext i8 %28 to i32, !dbg !929
  %30 = add nsw i32 %29, 1, !dbg !929
  %31 = load i32* %corr, align 4, !dbg !929
  %32 = sub nsw i32 %31, %30, !dbg !929
  store i32 %32, i32* %corr, align 4, !dbg !929
  %33 = load %struct.FILE** %stream_addr, align 8, !dbg !930
  %34 = getelementptr inbounds %struct.FILE* %33, i32 0, i32 11, !dbg !930
  %35 = getelementptr inbounds %struct.__mbstate_t* %34, i32 0, i32 0, !dbg !930
  %36 = load i32* %35, align 8, !dbg !930
  %37 = icmp sgt i32 %36, 0, !dbg !930
  br i1 %37, label %bb7, label %bb8, !dbg !930

bb7:                                              ; preds = %bb6
  %38 = load %struct.FILE** %stream_addr, align 8, !dbg !931
  %39 = getelementptr inbounds %struct.FILE* %38, i32 0, i32 1, !dbg !931
  %40 = getelementptr inbounds [2 x i8]* %39, i64 0, i64 0, !dbg !931
  %41 = load i8* %40, align 1, !dbg !931
  %42 = zext i8 %41 to i32, !dbg !931
  %43 = load i32* %corr, align 4, !dbg !931
  %44 = sub nsw i32 %43, %42, !dbg !931
  store i32 %44, i32* %corr, align 4, !dbg !931
  br label %bb8, !dbg !931

bb8:                                              ; preds = %bb7, %bb6, %bb2, %bb1
  %45 = load %struct.FILE** %stream_addr, align 8, !dbg !932
  %46 = getelementptr inbounds %struct.FILE* %45, i32 0, i32 0, !dbg !932
  %47 = load i16* %46, align 8, !dbg !932
  %48 = zext i16 %47 to i32, !dbg !932
  %49 = and i32 %48, 64, !dbg !932
  %50 = icmp ne i32 %49, 0, !dbg !932
  %51 = load %struct.FILE** %stream_addr, align 8, !dbg !932
  br i1 %50, label %bb9, label %bb10, !dbg !932

bb9:                                              ; preds = %bb8
  %52 = getelementptr inbounds %struct.FILE* %51, i32 0, i32 3, !dbg !932
  %53 = load i8** %52, align 8, !dbg !932
  store i8* %53, i8** %iftmp.0, align 8, !dbg !932
  br label %bb11, !dbg !932

bb10:                                             ; preds = %bb8
  %54 = getelementptr inbounds %struct.FILE* %51, i32 0, i32 6, !dbg !932
  %55 = load i8** %54, align 8, !dbg !932
  store i8* %55, i8** %iftmp.0, align 8, !dbg !932
  br label %bb11, !dbg !932

bb11:                                             ; preds = %bb10, %bb9
  %56 = load i8** %iftmp.0, align 8, !dbg !932
  %57 = ptrtoint i8* %56 to i64, !dbg !932
  %58 = trunc i64 %57 to i32, !dbg !932
  %59 = load %struct.FILE** %stream_addr, align 8, !dbg !932
  %60 = getelementptr inbounds %struct.FILE* %59, i32 0, i32 5, !dbg !932
  %61 = load i8** %60, align 8, !dbg !932
  %62 = ptrtoint i8* %61 to i64, !dbg !932
  %63 = trunc i64 %62 to i32, !dbg !932
  %64 = sub i32 %58, %63, !dbg !932
  %65 = load i32* %corr, align 4, !dbg !932
  %66 = add i32 %64, %65, !dbg !932
  store i32 %66, i32* %corr, align 4, !dbg !932
  %67 = load i64** %pos_addr, align 8, !dbg !933
  %68 = load i64* %67, align 8, !dbg !933
  store i64 %68, i64* %oldpos, align 8, !dbg !933
  %69 = load i64** %pos_addr, align 8, !dbg !934
  %70 = load i64* %69, align 8, !dbg !934
  %71 = load i32* %corr, align 4, !dbg !934
  %72 = sext i32 %71 to i64, !dbg !934
  %73 = sub nsw i64 %70, %72, !dbg !934
  %74 = load i64** %pos_addr, align 8, !dbg !934
  store i64 %73, i64* %74, align 8, !dbg !934
  %75 = load i64** %pos_addr, align 8, !dbg !934
  %76 = load i64* %75, align 8, !dbg !934
  %77 = load i64* %oldpos, align 8, !dbg !934
  %78 = icmp sgt i64 %76, %77, !dbg !934
  br i1 %78, label %bb12, label %bb13, !dbg !934

bb12:                                             ; preds = %bb11
  %79 = load i32* %corr, align 4, !dbg !935
  %80 = sub nsw i32 0, %79, !dbg !935
  store i32 %80, i32* %corr, align 4, !dbg !935
  br label %bb13, !dbg !935

bb13:                                             ; preds = %bb12, %bb11
  %81 = load i32* %corr, align 4, !dbg !936
  %82 = icmp slt i32 %81, 0, !dbg !936
  br i1 %82, label %bb14, label %bb15, !dbg !936

bb14:                                             ; preds = %bb13
  store i32 75, i32* @errno, align 4, !dbg !937
  br label %bb15, !dbg !937

bb15:                                             ; preds = %bb14, %bb13
  %83 = load i32* %corr, align 4, !dbg !938
  store i32 %83, i32* %0, align 4, !dbg !938
  br label %bb16, !dbg !938

bb16:                                             ; preds = %bb15, %bb5
  %84 = load i32* %0, align 4, !dbg !928
  store i32 %84, i32* %retval, align 4, !dbg !928
  %retval17 = load i32* %retval, !dbg !928
  ret i32 %retval17, !dbg !928
}

define hidden i32 @__stdio_seek(%struct.FILE* %stream, i64* %pos, i32 %whence) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %pos_addr = alloca i64*, align 8
  %whence_addr = alloca i32, align 4
  %retval = alloca i32
  %iftmp.0 = alloca i32
  %0 = alloca i32
  %res = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  store i64* %pos, i64** %pos_addr
  store i32 %whence, i32* %whence_addr
  %1 = load i64** %pos_addr, align 8, !dbg !939
  %2 = load i64* %1, align 8, !dbg !939
  %3 = load %struct.FILE** %stream_addr, align 8, !dbg !939
  %4 = getelementptr inbounds %struct.FILE* %3, i32 0, i32 2, !dbg !939
  %5 = load i32* %4, align 4, !dbg !939
  %6 = load i32* %whence_addr, align 4, !dbg !939
  %7 = call i64 @lseek64(i32 %5, i64 %2, i32 %6) nounwind, !dbg !939
  store i64 %7, i64* %res, align 8, !dbg !939
  %8 = load i64* %res, align 8, !dbg !941
  %9 = icmp sge i64 %8, 0, !dbg !941
  br i1 %9, label %bb, label %bb1, !dbg !941

bb:                                               ; preds = %entry
  %10 = load i64** %pos_addr, align 8, !dbg !941
  %11 = load i64* %res, align 8, !dbg !941
  store i64 %11, i64* %10, align 8, !dbg !941
  store i32 0, i32* %iftmp.0, align 4, !dbg !941
  br label %bb2, !dbg !941

bb1:                                              ; preds = %entry
  %12 = load i64* %res, align 8, !dbg !941
  %13 = trunc i64 %12 to i32, !dbg !941
  store i32 %13, i32* %iftmp.0, align 4, !dbg !941
  br label %bb2, !dbg !941

bb2:                                              ; preds = %bb1, %bb
  %14 = load i32* %iftmp.0, align 4, !dbg !941
  store i32 %14, i32* %0, align 4, !dbg !941
  %15 = load i32* %0, align 4, !dbg !941
  store i32 %15, i32* %retval, align 4, !dbg !941
  %retval3 = load i32* %retval, !dbg !941
  ret i32 %retval3, !dbg !941
}

declare i64 @lseek64(i32, i64, i32) nounwind

define i32 @main(i32, i8**) {
entry:
  call void @__uClibc_main(i32 (i32, i8**, i8**)* bitcast (i32 (i32, i8**)* @__user_main to i32 (i32, i8**, i8**)*), i32 %0, i8** %1, void ()* null, void ()* null, void ()* null, i8* null)
  unreachable
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @klee_div_zero_check(i64 %z) nounwind {
entry:
  %0 = icmp eq i64 %z, 0, !dbg !942
  br i1 %0, label %bb, label %return, !dbg !942

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str37, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str138, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str239, i64 0, i64 0)) noreturn nounwind, !
  unreachable, !dbg !944

return:                                           ; preds = %entry
  ret void, !dbg !945
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

!llvm.dbg.sp = !{!0, !6, !13, !19, !25, !28, !31, !32, !43, !52, !59, !66, !73, !114, !118, !119, !123, !130, !139, !149, !165, !166, !167, !209, !249, !287, !293, !299, !397, !436, !462, !504, !513, !554, !595, !604}
!llvm.dbg.gv = !{!610, !611, !614, !615, !619, !620, !621, !622, !658, !660, !661, !662, !663, !664, !665, !667, !669, !673}
!llvm.dbg.lv.memmove = !{!674, !675, !676, !677, !681}
!llvm.dbg.lv.klee_div_zero_check = !{!684}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"func", metadata !"func", metadata !"func", metadata !1, i32 6, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*)* @func} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"thread.c", metadata !"/home/kain/Documents/bishe/klee/examples/thread/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"thread.c", metadata !"/home/kain/Documents/bishe/klee/examples/thread/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5}
!5 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 524334, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 17, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, i8**)* @__user_main} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!13 = metadata !{i32 524334, i32 0, metadata !14, metadata !"__check_one_fd", metadata !"__check_one_fd", metadata !"", metadata !14, i32 137, metadata !16, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 false, void (i32, i32)* @__check_one_fd} ; [ D
!14 = metadata !{i32 524329, metadata !"__uClibc_main.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !15} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 524305, i32 0, i32 1, metadata !"__uClibc_main.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ D
!16 = metadata !{i32 524309, metadata !14, metadata !"", metadata !14, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null} ; [ DW_TAG_subroutine_type ]
!17 = metadata !{null, metadata !18, metadata !18}
!18 = metadata !{i32 524324, metadata !14, metadata !"int", metadata !14, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!19 = metadata !{i32 524334, i32 0, metadata !14, metadata !"gnu_dev_makedev", metadata !"gnu_dev_makedev", metadata !"", metadata !20, i32 55, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 false, i64 (i32, i32)* @gnu_dev_makedev} ; [ 
!20 = metadata !{i32 524329, metadata !"sysmacros.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/sys", metadata !15} ; [ DW_TAG_file_type ]
!21 = metadata !{i32 524309, metadata !14, metadata !"", metadata !14, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{metadata !23, metadata !24, metadata !24}
!23 = metadata !{i32 524324, metadata !14, metadata !"long long unsigned int", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!24 = metadata !{i32 524324, metadata !14, metadata !"unsigned int", metadata !14, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!25 = metadata !{i32 524334, i32 0, metadata !14, metadata !"__check_suid", metadata !"__check_suid", metadata !"", metadata !14, i32 156, metadata !26, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 ()* @__check_suid} ; [ DW_TAG_subprogra
!26 = metadata !{i32 524309, metadata !14, metadata !"", metadata !14, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null} ; [ DW_TAG_subroutine_type ]
!27 = metadata !{metadata !18}
!28 = metadata !{i32 524334, i32 0, metadata !14, metadata !"__uClibc_init", metadata !"__uClibc_init", metadata !"__uClibc_init", metadata !14, i32 188, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void ()* @__uClibc_init} ; 
!29 = metadata !{i32 524309, metadata !14, metadata !"", metadata !14, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{null}
!31 = metadata !{i32 524334, i32 0, metadata !14, metadata !"__uClibc_fini", metadata !"__uClibc_fini", metadata !"__uClibc_fini", metadata !14, i32 252, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void ()* @__uClibc_fini} ; 
!32 = metadata !{i32 524334, i32 0, metadata !14, metadata !"__uClibc_main", metadata !"__uClibc_main", metadata !"__uClibc_main", metadata !14, i32 281, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void (i32 (i32, i8**, i8**)
!33 = metadata !{i32 524309, metadata !14, metadata !"", metadata !14, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null} ; [ DW_TAG_subroutine_type ]
!34 = metadata !{null, metadata !35, metadata !18, metadata !38, metadata !41, metadata !41, metadata !41, metadata !42}
!35 = metadata !{i32 524303, metadata !14, metadata !"", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_pointer_type ]
!36 = metadata !{i32 524309, metadata !14, metadata !"", metadata !14, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, null} ; [ DW_TAG_subroutine_type ]
!37 = metadata !{metadata !18, metadata !18, metadata !38, metadata !38}
!38 = metadata !{i32 524303, metadata !14, metadata !"", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !39} ; [ DW_TAG_pointer_type ]
!39 = metadata !{i32 524303, metadata !14, metadata !"", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !40} ; [ DW_TAG_pointer_type ]
!40 = metadata !{i32 524324, metadata !14, metadata !"char", metadata !14, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!41 = metadata !{i32 524303, metadata !14, metadata !"", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ]
!42 = metadata !{i32 524303, metadata !14, metadata !"", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!43 = metadata !{i32 524334, i32 0, metadata !44, metadata !"strcmp", metadata !"strcmp", metadata !"strcmp", metadata !44, i32 21, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i8*, i8*)* @strcmp} ; [ DW_TAG_subprogram ]
!44 = metadata !{i32 524329, metadata !"strcmp.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !45} ; [ DW_TAG_file_type ]
!45 = metadata !{i32 524305, i32 0, i32 1, metadata !"strcmp.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!46 = metadata !{i32 524309, metadata !44, metadata !"", metadata !44, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null} ; [ DW_TAG_subroutine_type ]
!47 = metadata !{metadata !48, metadata !49, metadata !49}
!48 = metadata !{i32 524324, metadata !44, metadata !"int", metadata !44, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!49 = metadata !{i32 524303, metadata !44, metadata !"", metadata !44, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ]
!50 = metadata !{i32 524326, metadata !44, metadata !"", metadata !44, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !51} ; [ DW_TAG_const_type ]
!51 = metadata !{i32 524324, metadata !44, metadata !"char", metadata !44, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!52 = metadata !{i32 524334, i32 0, metadata !53, metadata !"putchar_unlocked", metadata !"putchar_unlocked", metadata !"putchar_unlocked", metadata !55, i32 17, metadata !56, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32)* @putchar
!53 = metadata !{i32 524329, metadata !"putchar_unlocked.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !54} ; [ DW_TAG_file_type ]
!54 = metadata !{i32 524305, i32 0, i32 1, metadata !"putchar_unlocked.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_
!55 = metadata !{i32 524329, metadata !"putchar.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !54} ; [ DW_TAG_file_type ]
!56 = metadata !{i32 524309, metadata !53, metadata !"", metadata !53, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !57, i32 0, null} ; [ DW_TAG_subroutine_type ]
!57 = metadata !{metadata !58, metadata !58}
!58 = metadata !{i32 524324, metadata !53, metadata !"int", metadata !53, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!59 = metadata !{i32 524334, i32 0, metadata !60, metadata !"__h_errno_location", metadata !"__h_errno_location", metadata !"__h_errno_location", metadata !60, i32 11, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32* ()* @__h
!60 = metadata !{i32 524329, metadata !"__h_errno_location.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !61} ; [ DW_TAG_file_type ]
!61 = metadata !{i32 524305, i32 0, i32 1, metadata !"__h_errno_location.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} 
!62 = metadata !{i32 524309, metadata !60, metadata !"", metadata !60, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, null} ; [ DW_TAG_subroutine_type ]
!63 = metadata !{metadata !64}
!64 = metadata !{i32 524303, metadata !60, metadata !"", metadata !60, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !65} ; [ DW_TAG_pointer_type ]
!65 = metadata !{i32 524324, metadata !60, metadata !"int", metadata !60, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!66 = metadata !{i32 524334, i32 0, metadata !67, metadata !"__errno_location", metadata !"__errno_location", metadata !"__errno_location", metadata !67, i32 12, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32* ()* @__errno_l
!67 = metadata !{i32 524329, metadata !"__errno_location.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !68} ; [ DW_TAG_file_type ]
!68 = metadata !{i32 524305, i32 0, i32 1, metadata !"__errno_location.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; 
!69 = metadata !{i32 524309, metadata !67, metadata !"", metadata !67, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, null} ; [ DW_TAG_subroutine_type ]
!70 = metadata !{metadata !71}
!71 = metadata !{i32 524303, metadata !67, metadata !"", metadata !67, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !72} ; [ DW_TAG_pointer_type ]
!72 = metadata !{i32 524324, metadata !67, metadata !"int", metadata !67, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!73 = metadata !{i32 524334, i32 0, metadata !74, metadata !"__fputc_unlocked", metadata !"__fputc_unlocked", metadata !"__fputc_unlocked", metadata !76, i32 20, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, %struct.F
!74 = metadata !{i32 524329, metadata !"fputc_unlocked.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !75} ; [ DW_TAG_file_type ]
!75 = metadata !{i32 524305, i32 0, i32 1, metadata !"fputc_unlocked.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_co
!76 = metadata !{i32 524329, metadata !"fputc.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !75} ; [ DW_TAG_file_type ]
!77 = metadata !{i32 524309, metadata !74, metadata !"", metadata !74, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !78, i32 0, null} ; [ DW_TAG_subroutine_type ]
!78 = metadata !{metadata !79, metadata !79, metadata !80}
!79 = metadata !{i32 524324, metadata !74, metadata !"int", metadata !74, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!80 = metadata !{i32 524303, metadata !74, metadata !"", metadata !74, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !81} ; [ DW_TAG_pointer_type ]
!81 = metadata !{i32 524310, metadata !82, metadata !"FILE", metadata !82, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ]
!82 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !75} ; [ DW_TAG_file_type ]
!83 = metadata !{i32 524307, metadata !74, metadata !"__STDIO_FILE_STRUCT", metadata !82, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !84, i32 0, null} ; [ DW_TAG_structure_type ]
!84 = metadata !{metadata !85, metadata !88, metadata !93, metadata !94, metadata !96, metadata !97, metadata !98, metadata !99, metadata !100, metadata !101, metadata !103, metadata !107}
!85 = metadata !{i32 524301, metadata !83, metadata !"__modeflags", metadata !86, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !87} ; [ DW_TAG_member ]
!86 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !75} ; [ DW_TAG_file_type ]
!87 = metadata !{i32 524324, metadata !74, metadata !"short unsigned int", metadata !74, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!88 = metadata !{i32 524301, metadata !83, metadata !"__ungot_width", metadata !86, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !89} ; [ DW_TAG_member ]
!89 = metadata !{i32 524289, metadata !74, metadata !"", metadata !74, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !90, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!90 = metadata !{i32 524324, metadata !74, metadata !"unsigned char", metadata !74, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!91 = metadata !{metadata !92}
!92 = metadata !{i32 524321, i64 0, i64 1}        ; [ DW_TAG_subrange_type ]
!93 = metadata !{i32 524301, metadata !83, metadata !"__filedes", metadata !86, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !79} ; [ DW_TAG_member ]
!94 = metadata !{i32 524301, metadata !83, metadata !"__bufstart", metadata !86, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !95} ; [ DW_TAG_member ]
!95 = metadata !{i32 524303, metadata !74, metadata !"", metadata !74, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !90} ; [ DW_TAG_pointer_type ]
!96 = metadata !{i32 524301, metadata !83, metadata !"__bufend", metadata !86, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !95} ; [ DW_TAG_member ]
!97 = metadata !{i32 524301, metadata !83, metadata !"__bufpos", metadata !86, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !95} ; [ DW_TAG_member ]
!98 = metadata !{i32 524301, metadata !83, metadata !"__bufread", metadata !86, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !95} ; [ DW_TAG_member ]
!99 = metadata !{i32 524301, metadata !83, metadata !"__bufgetc_u", metadata !86, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !95} ; [ DW_TAG_member ]
!100 = metadata !{i32 524301, metadata !83, metadata !"__bufputc_u", metadata !86, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !95} ; [ DW_TAG_member ]
!101 = metadata !{i32 524301, metadata !83, metadata !"__nextopen", metadata !86, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !102} ; [ DW_TAG_member ]
!102 = metadata !{i32 524303, metadata !74, metadata !"", metadata !74, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !83} ; [ DW_TAG_pointer_type ]
!103 = metadata !{i32 524301, metadata !83, metadata !"__ungot", metadata !86, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !104} ; [ DW_TAG_member ]
!104 = metadata !{i32 524289, metadata !74, metadata !"", metadata !74, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !105, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!105 = metadata !{i32 524310, metadata !106, metadata !"wchar_t", metadata !106, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ]
!106 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !75} ; [ DW_TAG_file_type ]
!107 = metadata !{i32 524301, metadata !83, metadata !"__state", metadata !86, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !108} ; [ DW_TAG_member ]
!108 = metadata !{i32 524310, metadata !109, metadata !"__mbstate_t", metadata !109, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !110} ; [ DW_TAG_typedef ]
!109 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !75} ; [ DW_TAG_file_type ]
!110 = metadata !{i32 524307, metadata !74, metadata !"", metadata !109, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !111, i32 0, null} ; [ DW_TAG_structure_type ]
!111 = metadata !{metadata !112, metadata !113}
!112 = metadata !{i32 524301, metadata !110, metadata !"__mask", metadata !109, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !105} ; [ DW_TAG_member ]
!113 = metadata !{i32 524301, metadata !110, metadata !"__wc", metadata !109, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !105} ; [ DW_TAG_member ]
!114 = metadata !{i32 524334, i32 0, metadata !115, metadata !"_stdio_term", metadata !"_stdio_term", metadata !"_stdio_term", metadata !115, i32 211, metadata !117, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void ()* @_stdio_term} ; [ DW
!115 = metadata !{i32 524329, metadata !"_stdio.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !116} ; [ DW_TAG_file_type ]
!116 = metadata !{i32 524305, i32 0, i32 1, metadata !"_stdio.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!117 = metadata !{i32 524309, metadata !115, metadata !"", metadata !115, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!118 = metadata !{i32 524334, i32 0, metadata !115, metadata !"_stdio_init", metadata !"_stdio_init", metadata !"_stdio_init", metadata !115, i32 278, metadata !117, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void ()* @_stdio_init} ; [ DW
!119 = metadata !{i32 524334, i32 0, metadata !120, metadata !"abort", metadata !"abort", metadata !"abort", metadata !120, i32 57, metadata !122, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void ()* @abort} ; [ DW_TAG_subprogram ]
!120 = metadata !{i32 524329, metadata !"abort.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdlib", metadata !121} ; [ DW_TAG_file_type ]
!121 = metadata !{i32 524305, i32 0, i32 1, metadata !"abort.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdlib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!122 = metadata !{i32 524309, metadata !120, metadata !"", metadata !120, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!123 = metadata !{i32 524334, i32 0, metadata !124, metadata !"exit", metadata !"exit", metadata !"exit", metadata !126, i32 319, metadata !127, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void (i32)* @exit} ; [ DW_TAG_subprogram ]
!124 = metadata !{i32 524329, metadata !"exit.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdlib", metadata !125} ; [ DW_TAG_file_type ]
!125 = metadata !{i32 524305, i32 0, i32 1, metadata !"exit.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdlib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_un
!126 = metadata !{i32 524329, metadata !"_atexit.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdlib", metadata !125} ; [ DW_TAG_file_type ]
!127 = metadata !{i32 524309, metadata !124, metadata !"", metadata !124, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !128, i32 0, null} ; [ DW_TAG_subroutine_type ]
!128 = metadata !{null, metadata !129}
!129 = metadata !{i32 524324, metadata !124, metadata !"int", metadata !124, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!130 = metadata !{i32 524334, i32 0, metadata !131, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !131, i32 19, metadata !133, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*, i8*, i64)* @memcpy} ; [ DW_TAG_subp
!131 = metadata !{i32 524329, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !132} ; [ DW_TAG_file_type ]
!132 = metadata !{i32 524305, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_
!133 = metadata !{i32 524309, metadata !131, metadata !"", metadata !131, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !134, i32 0, null} ; [ DW_TAG_subroutine_type ]
!134 = metadata !{metadata !135, metadata !135, metadata !135, metadata !136}
!135 = metadata !{i32 524303, metadata !131, metadata !"", metadata !131, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!136 = metadata !{i32 524310, metadata !137, metadata !"size_t", metadata !137, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !138} ; [ DW_TAG_typedef ]
!137 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !132} ; [ DW_TAG_file_type ]
!138 = metadata !{i32 524324, metadata !131, metadata !"long unsigned int", metadata !131, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!139 = metadata !{i32 524334, i32 0, metadata !140, metadata !"memset", metadata !"memset", metadata !"memset", metadata !140, i32 18, metadata !142, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*, i32, i64)* @memset} ; [ DW_TAG_subp
!140 = metadata !{i32 524329, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !141} ; [ DW_TAG_file_type ]
!141 = metadata !{i32 524305, i32 0, i32 1, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_
!142 = metadata !{i32 524309, metadata !140, metadata !"", metadata !140, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !143, i32 0, null} ; [ DW_TAG_subroutine_type ]
!143 = metadata !{metadata !144, metadata !144, metadata !145, metadata !146}
!144 = metadata !{i32 524303, metadata !140, metadata !"", metadata !140, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!145 = metadata !{i32 524324, metadata !140, metadata !"int", metadata !140, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!146 = metadata !{i32 524310, metadata !147, metadata !"size_t", metadata !147, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !148} ; [ DW_TAG_typedef ]
!147 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !141} ; [ DW_TAG_file_type ]
!148 = metadata !{i32 524324, metadata !140, metadata !"long unsigned int", metadata !140, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!149 = metadata !{i32 524334, i32 0, metadata !150, metadata !"__sigismember", metadata !"__sigismember", metadata !"__sigismember", metadata !152, i32 117, metadata !153, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.__sigset_t
!150 = metadata !{i32 524329, metadata !"sigsetops.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !151} ; [ DW_TAG_file_type ]
!151 = metadata !{i32 524305, i32 0, i32 1, metadata !"sigsetops.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compi
!152 = metadata !{i32 524329, metadata !"sigset.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !151} ; [ DW_TAG_file_type ]
!153 = metadata !{i32 524309, metadata !150, metadata !"", metadata !150, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !154, i32 0, null} ; [ DW_TAG_subroutine_type ]
!154 = metadata !{metadata !155, metadata !156, metadata !155}
!155 = metadata !{i32 524324, metadata !150, metadata !"int", metadata !150, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!156 = metadata !{i32 524303, metadata !150, metadata !"", metadata !150, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !157} ; [ DW_TAG_pointer_type ]
!157 = metadata !{i32 524310, metadata !152, metadata !"__sigset_t", metadata !152, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !158} ; [ DW_TAG_typedef ]
!158 = metadata !{i32 524307, metadata !150, metadata !"", metadata !152, i32 29, i64 1024, i64 64, i64 0, i32 0, null, metadata !159, i32 0, null} ; [ DW_TAG_structure_type ]
!159 = metadata !{metadata !160}
!160 = metadata !{i32 524301, metadata !158, metadata !"__val", metadata !152, i32 30, i64 1024, i64 64, i64 0, i32 0, metadata !161} ; [ DW_TAG_member ]
!161 = metadata !{i32 524289, metadata !150, metadata !"", metadata !150, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !162, metadata !163, i32 0, null} ; [ DW_TAG_array_type ]
!162 = metadata !{i32 524324, metadata !150, metadata !"long unsigned int", metadata !150, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!163 = metadata !{metadata !164}
!164 = metadata !{i32 524321, i64 0, i64 15}      ; [ DW_TAG_subrange_type ]
!165 = metadata !{i32 524334, i32 0, metadata !150, metadata !"__sigaddset", metadata !"__sigaddset", metadata !"__sigaddset", metadata !152, i32 118, metadata !153, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.__sigset_t*, i32
!166 = metadata !{i32 524334, i32 0, metadata !150, metadata !"__sigdelset", metadata !"__sigdelset", metadata !"__sigdelset", metadata !152, i32 119, metadata !153, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.__sigset_t*, i32
!167 = metadata !{i32 524334, i32 0, metadata !168, metadata !"__stdio_WRITE", metadata !"__stdio_WRITE", metadata !"__stdio_WRITE", metadata !168, i32 35, metadata !170, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i64 (%struct.FILE*, i8*,
!168 = metadata !{i32 524329, metadata !"_WRITE.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !169} ; [ DW_TAG_file_type ]
!169 = metadata !{i32 524305, i32 0, i32 1, metadata !"_WRITE.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!170 = metadata !{i32 524309, metadata !168, metadata !"", metadata !168, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !171, i32 0, null} ; [ DW_TAG_subroutine_type ]
!171 = metadata !{metadata !172, metadata !175, metadata !207, metadata !172}
!172 = metadata !{i32 524310, metadata !173, metadata !"size_t", metadata !173, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !174} ; [ DW_TAG_typedef ]
!173 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !169} ; [ DW_TAG_file_type ]
!174 = metadata !{i32 524324, metadata !168, metadata !"long unsigned int", metadata !168, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!175 = metadata !{i32 524303, metadata !168, metadata !"", metadata !168, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !176} ; [ DW_TAG_pointer_type ]
!176 = metadata !{i32 524310, metadata !177, metadata !"FILE", metadata !177, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !178} ; [ DW_TAG_typedef ]
!177 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !169} ; [ DW_TAG_file_type ]
!178 = metadata !{i32 524307, metadata !168, metadata !"__STDIO_FILE_STRUCT", metadata !177, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !179, i32 0, null} ; [ DW_TAG_structure_type ]
!179 = metadata !{metadata !180, metadata !183, metadata !186, metadata !188, metadata !190, metadata !191, metadata !192, metadata !193, metadata !194, metadata !195, metadata !197, metadata !200}
!180 = metadata !{i32 524301, metadata !178, metadata !"__modeflags", metadata !181, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !182} ; [ DW_TAG_member ]
!181 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !169} ; [ DW_TAG_file_type ]
!182 = metadata !{i32 524324, metadata !168, metadata !"short unsigned int", metadata !168, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!183 = metadata !{i32 524301, metadata !178, metadata !"__ungot_width", metadata !181, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !184} ; [ DW_TAG_member ]
!184 = metadata !{i32 524289, metadata !168, metadata !"", metadata !168, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !185, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!185 = metadata !{i32 524324, metadata !168, metadata !"unsigned char", metadata !168, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!186 = metadata !{i32 524301, metadata !178, metadata !"__filedes", metadata !181, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !187} ; [ DW_TAG_member ]
!187 = metadata !{i32 524324, metadata !168, metadata !"int", metadata !168, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!188 = metadata !{i32 524301, metadata !178, metadata !"__bufstart", metadata !181, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !189} ; [ DW_TAG_member ]
!189 = metadata !{i32 524303, metadata !168, metadata !"", metadata !168, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !185} ; [ DW_TAG_pointer_type ]
!190 = metadata !{i32 524301, metadata !178, metadata !"__bufend", metadata !181, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !189} ; [ DW_TAG_member ]
!191 = metadata !{i32 524301, metadata !178, metadata !"__bufpos", metadata !181, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !189} ; [ DW_TAG_member ]
!192 = metadata !{i32 524301, metadata !178, metadata !"__bufread", metadata !181, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !189} ; [ DW_TAG_member ]
!193 = metadata !{i32 524301, metadata !178, metadata !"__bufgetc_u", metadata !181, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !189} ; [ DW_TAG_member ]
!194 = metadata !{i32 524301, metadata !178, metadata !"__bufputc_u", metadata !181, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !189} ; [ DW_TAG_member ]
!195 = metadata !{i32 524301, metadata !178, metadata !"__nextopen", metadata !181, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !196} ; [ DW_TAG_member ]
!196 = metadata !{i32 524303, metadata !168, metadata !"", metadata !168, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !178} ; [ DW_TAG_pointer_type ]
!197 = metadata !{i32 524301, metadata !178, metadata !"__ungot", metadata !181, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !198} ; [ DW_TAG_member ]
!198 = metadata !{i32 524289, metadata !168, metadata !"", metadata !168, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !199, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!199 = metadata !{i32 524310, metadata !173, metadata !"wchar_t", metadata !173, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !187} ; [ DW_TAG_typedef ]
!200 = metadata !{i32 524301, metadata !178, metadata !"__state", metadata !181, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !201} ; [ DW_TAG_member ]
!201 = metadata !{i32 524310, metadata !202, metadata !"__mbstate_t", metadata !202, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !203} ; [ DW_TAG_typedef ]
!202 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !169} ; [ DW_TAG_file_type ]
!203 = metadata !{i32 524307, metadata !168, metadata !"", metadata !202, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !204, i32 0, null} ; [ DW_TAG_structure_type ]
!204 = metadata !{metadata !205, metadata !206}
!205 = metadata !{i32 524301, metadata !203, metadata !"__mask", metadata !202, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !199} ; [ DW_TAG_member ]
!206 = metadata !{i32 524301, metadata !203, metadata !"__wc", metadata !202, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !199} ; [ DW_TAG_member ]
!207 = metadata !{i32 524303, metadata !168, metadata !"", metadata !168, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !208} ; [ DW_TAG_pointer_type ]
!208 = metadata !{i32 524326, metadata !168, metadata !"", metadata !168, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !185} ; [ DW_TAG_const_type ]
!209 = metadata !{i32 524334, i32 0, metadata !210, metadata !"__stdio_wcommit", metadata !"__stdio_wcommit", metadata !"__stdio_wcommit", metadata !210, i32 18, metadata !212, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i64 (%struct.FILE*
!210 = metadata !{i32 524329, metadata !"_wcommit.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !211} ; [ DW_TAG_file_type ]
!211 = metadata !{i32 524305, i32 0, i32 1, metadata !"_wcommit.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile
!212 = metadata !{i32 524309, metadata !210, metadata !"", metadata !210, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !213, i32 0, null} ; [ DW_TAG_subroutine_type ]
!213 = metadata !{metadata !214, metadata !217}
!214 = metadata !{i32 524310, metadata !215, metadata !"size_t", metadata !215, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !216} ; [ DW_TAG_typedef ]
!215 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !211} ; [ DW_TAG_file_type ]
!216 = metadata !{i32 524324, metadata !210, metadata !"long unsigned int", metadata !210, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!217 = metadata !{i32 524303, metadata !210, metadata !"", metadata !210, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !218} ; [ DW_TAG_pointer_type ]
!218 = metadata !{i32 524310, metadata !219, metadata !"FILE", metadata !219, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !220} ; [ DW_TAG_typedef ]
!219 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !211} ; [ DW_TAG_file_type ]
!220 = metadata !{i32 524307, metadata !210, metadata !"__STDIO_FILE_STRUCT", metadata !219, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !221, i32 0, null} ; [ DW_TAG_structure_type ]
!221 = metadata !{metadata !222, metadata !225, metadata !228, metadata !230, metadata !232, metadata !233, metadata !234, metadata !235, metadata !236, metadata !237, metadata !239, metadata !242}
!222 = metadata !{i32 524301, metadata !220, metadata !"__modeflags", metadata !223, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !224} ; [ DW_TAG_member ]
!223 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !211} ; [ DW_TAG_file_type ]
!224 = metadata !{i32 524324, metadata !210, metadata !"short unsigned int", metadata !210, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!225 = metadata !{i32 524301, metadata !220, metadata !"__ungot_width", metadata !223, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !226} ; [ DW_TAG_member ]
!226 = metadata !{i32 524289, metadata !210, metadata !"", metadata !210, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !227, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!227 = metadata !{i32 524324, metadata !210, metadata !"unsigned char", metadata !210, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!228 = metadata !{i32 524301, metadata !220, metadata !"__filedes", metadata !223, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !229} ; [ DW_TAG_member ]
!229 = metadata !{i32 524324, metadata !210, metadata !"int", metadata !210, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!230 = metadata !{i32 524301, metadata !220, metadata !"__bufstart", metadata !223, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !231} ; [ DW_TAG_member ]
!231 = metadata !{i32 524303, metadata !210, metadata !"", metadata !210, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !227} ; [ DW_TAG_pointer_type ]
!232 = metadata !{i32 524301, metadata !220, metadata !"__bufend", metadata !223, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !231} ; [ DW_TAG_member ]
!233 = metadata !{i32 524301, metadata !220, metadata !"__bufpos", metadata !223, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !231} ; [ DW_TAG_member ]
!234 = metadata !{i32 524301, metadata !220, metadata !"__bufread", metadata !223, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !231} ; [ DW_TAG_member ]
!235 = metadata !{i32 524301, metadata !220, metadata !"__bufgetc_u", metadata !223, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !231} ; [ DW_TAG_member ]
!236 = metadata !{i32 524301, metadata !220, metadata !"__bufputc_u", metadata !223, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !231} ; [ DW_TAG_member ]
!237 = metadata !{i32 524301, metadata !220, metadata !"__nextopen", metadata !223, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !238} ; [ DW_TAG_member ]
!238 = metadata !{i32 524303, metadata !210, metadata !"", metadata !210, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !220} ; [ DW_TAG_pointer_type ]
!239 = metadata !{i32 524301, metadata !220, metadata !"__ungot", metadata !223, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !240} ; [ DW_TAG_member ]
!240 = metadata !{i32 524289, metadata !210, metadata !"", metadata !210, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !241, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!241 = metadata !{i32 524310, metadata !215, metadata !"wchar_t", metadata !215, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !229} ; [ DW_TAG_typedef ]
!242 = metadata !{i32 524301, metadata !220, metadata !"__state", metadata !223, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !243} ; [ DW_TAG_member ]
!243 = metadata !{i32 524310, metadata !244, metadata !"__mbstate_t", metadata !244, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !245} ; [ DW_TAG_typedef ]
!244 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !211} ; [ DW_TAG_file_type ]
!245 = metadata !{i32 524307, metadata !210, metadata !"", metadata !244, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !246, i32 0, null} ; [ DW_TAG_structure_type ]
!246 = metadata !{metadata !247, metadata !248}
!247 = metadata !{i32 524301, metadata !245, metadata !"__mask", metadata !244, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !241} ; [ DW_TAG_member ]
!248 = metadata !{i32 524301, metadata !245, metadata !"__wc", metadata !244, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !241} ; [ DW_TAG_member ]
!249 = metadata !{i32 524334, i32 0, metadata !250, metadata !"__stdio_trans2w_o", metadata !"__stdio_trans2w_o", metadata !"__stdio_trans2w_o", metadata !250, i32 30, metadata !252, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct
!250 = metadata !{i32 524329, metadata !"_trans2w.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !251} ; [ DW_TAG_file_type ]
!251 = metadata !{i32 524305, i32 0, i32 1, metadata !"_trans2w.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile
!252 = metadata !{i32 524309, metadata !250, metadata !"", metadata !250, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !253, i32 0, null} ; [ DW_TAG_subroutine_type ]
!253 = metadata !{metadata !254, metadata !255, metadata !254}
!254 = metadata !{i32 524324, metadata !250, metadata !"int", metadata !250, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!255 = metadata !{i32 524303, metadata !250, metadata !"", metadata !250, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !256} ; [ DW_TAG_pointer_type ]
!256 = metadata !{i32 524310, metadata !257, metadata !"FILE", metadata !257, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !258} ; [ DW_TAG_typedef ]
!257 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !251} ; [ DW_TAG_file_type ]
!258 = metadata !{i32 524307, metadata !250, metadata !"__STDIO_FILE_STRUCT", metadata !257, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !259, i32 0, null} ; [ DW_TAG_structure_type ]
!259 = metadata !{metadata !260, metadata !263, metadata !266, metadata !267, metadata !269, metadata !270, metadata !271, metadata !272, metadata !273, metadata !274, metadata !276, metadata !280}
!260 = metadata !{i32 524301, metadata !258, metadata !"__modeflags", metadata !261, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !262} ; [ DW_TAG_member ]
!261 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !251} ; [ DW_TAG_file_type ]
!262 = metadata !{i32 524324, metadata !250, metadata !"short unsigned int", metadata !250, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!263 = metadata !{i32 524301, metadata !258, metadata !"__ungot_width", metadata !261, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !264} ; [ DW_TAG_member ]
!264 = metadata !{i32 524289, metadata !250, metadata !"", metadata !250, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !265, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!265 = metadata !{i32 524324, metadata !250, metadata !"unsigned char", metadata !250, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!266 = metadata !{i32 524301, metadata !258, metadata !"__filedes", metadata !261, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !254} ; [ DW_TAG_member ]
!267 = metadata !{i32 524301, metadata !258, metadata !"__bufstart", metadata !261, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !268} ; [ DW_TAG_member ]
!268 = metadata !{i32 524303, metadata !250, metadata !"", metadata !250, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !265} ; [ DW_TAG_pointer_type ]
!269 = metadata !{i32 524301, metadata !258, metadata !"__bufend", metadata !261, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !268} ; [ DW_TAG_member ]
!270 = metadata !{i32 524301, metadata !258, metadata !"__bufpos", metadata !261, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !268} ; [ DW_TAG_member ]
!271 = metadata !{i32 524301, metadata !258, metadata !"__bufread", metadata !261, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !268} ; [ DW_TAG_member ]
!272 = metadata !{i32 524301, metadata !258, metadata !"__bufgetc_u", metadata !261, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !268} ; [ DW_TAG_member ]
!273 = metadata !{i32 524301, metadata !258, metadata !"__bufputc_u", metadata !261, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !268} ; [ DW_TAG_member ]
!274 = metadata !{i32 524301, metadata !258, metadata !"__nextopen", metadata !261, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !275} ; [ DW_TAG_member ]
!275 = metadata !{i32 524303, metadata !250, metadata !"", metadata !250, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !258} ; [ DW_TAG_pointer_type ]
!276 = metadata !{i32 524301, metadata !258, metadata !"__ungot", metadata !261, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !277} ; [ DW_TAG_member ]
!277 = metadata !{i32 524289, metadata !250, metadata !"", metadata !250, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !278, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!278 = metadata !{i32 524310, metadata !279, metadata !"wchar_t", metadata !279, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !254} ; [ DW_TAG_typedef ]
!279 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !251} ; [ DW_TAG_file_type ]
!280 = metadata !{i32 524301, metadata !258, metadata !"__state", metadata !261, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !281} ; [ DW_TAG_member ]
!281 = metadata !{i32 524310, metadata !282, metadata !"__mbstate_t", metadata !282, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !283} ; [ DW_TAG_typedef ]
!282 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !251} ; [ DW_TAG_file_type ]
!283 = metadata !{i32 524307, metadata !250, metadata !"", metadata !282, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !284, i32 0, null} ; [ DW_TAG_structure_type ]
!284 = metadata !{metadata !285, metadata !286}
!285 = metadata !{i32 524301, metadata !283, metadata !"__mask", metadata !282, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !278} ; [ DW_TAG_member ]
!286 = metadata !{i32 524301, metadata !283, metadata !"__wc", metadata !282, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !278} ; [ DW_TAG_member ]
!287 = metadata !{i32 524334, i32 0, metadata !288, metadata !"isatty", metadata !"isatty", metadata !"isatty", metadata !288, i32 27, metadata !290, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32)* @isatty} ; [ DW_TAG_subprogram ]
!288 = metadata !{i32 524329, metadata !"isatty.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/termios", metadata !289} ; [ DW_TAG_file_type ]
!289 = metadata !{i32 524305, i32 0, i32 1, metadata !"isatty.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/termios", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile
!290 = metadata !{i32 524309, metadata !288, metadata !"", metadata !288, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !291, i32 0, null} ; [ DW_TAG_subroutine_type ]
!291 = metadata !{metadata !292, metadata !292}
!292 = metadata !{i32 524324, metadata !288, metadata !"int", metadata !288, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!293 = metadata !{i32 524334, i32 0, metadata !294, metadata !"__raise", metadata !"__raise", metadata !"__raise", metadata !294, i32 16, metadata !296, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32)* @__raise} ; [ DW_TAG_subprogram
!294 = metadata !{i32 524329, metadata !"raise.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !295} ; [ DW_TAG_file_type ]
!295 = metadata !{i32 524305, i32 0, i32 1, metadata !"raise.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!296 = metadata !{i32 524309, metadata !294, metadata !"", metadata !294, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !297, i32 0, null} ; [ DW_TAG_subroutine_type ]
!297 = metadata !{metadata !298, metadata !298}
!298 = metadata !{i32 524324, metadata !294, metadata !"int", metadata !294, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!299 = metadata !{i32 524334, i32 0, metadata !300, metadata !"__libc_sigaction", metadata !"__libc_sigaction", metadata !"__libc_sigaction", metadata !300, i32 43, metadata !302, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, %stru
!300 = metadata !{i32 524329, metadata !"sigaction.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !301} ; [ DW_TAG_file_type ]
!301 = metadata !{i32 524305, i32 0, i32 1, metadata !"sigaction.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compi
!302 = metadata !{i32 524309, metadata !300, metadata !"", metadata !300, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !303, i32 0, null} ; [ DW_TAG_subroutine_type ]
!303 = metadata !{metadata !304, metadata !304, metadata !305, metadata !396}
!304 = metadata !{i32 524324, metadata !300, metadata !"int", metadata !300, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!305 = metadata !{i32 524303, metadata !300, metadata !"", metadata !300, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !306} ; [ DW_TAG_pointer_type ]
!306 = metadata !{i32 524326, metadata !300, metadata !"", metadata !300, i32 0, i64 1216, i64 64, i64 0, i32 0, metadata !307} ; [ DW_TAG_const_type ]
!307 = metadata !{i32 524307, metadata !300, metadata !"sigaction", metadata !308, i32 26, i64 1216, i64 64, i64 0, i32 0, null, metadata !309, i32 0, null} ; [ DW_TAG_structure_type ]
!308 = metadata !{i32 524329, metadata !"sigaction.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !301} ; [ DW_TAG_file_type ]
!309 = metadata !{metadata !310, metadata !384, metadata !392, metadata !393}
!310 = metadata !{i32 524301, metadata !307, metadata !"__sigaction_handler", metadata !308, i32 36, i64 64, i64 64, i64 0, i32 0, metadata !311} ; [ DW_TAG_member ]
!311 = metadata !{i32 524311, metadata !300, metadata !"", metadata !308, i32 30, i64 64, i64 64, i64 0, i32 0, null, metadata !312, i32 0, null} ; [ DW_TAG_union_type ]
!312 = metadata !{metadata !313, metadata !319}
!313 = metadata !{i32 524301, metadata !311, metadata !"sa_handler", metadata !308, i32 32, i64 64, i64 64, i64 0, i32 0, metadata !314} ; [ DW_TAG_member ]
!314 = metadata !{i32 524310, metadata !315, metadata !"__sighandler_t", metadata !315, i32 75, i64 0, i64 0, i64 0, i32 0, metadata !316} ; [ DW_TAG_typedef ]
!315 = metadata !{i32 524329, metadata !"signal.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !301} ; [ DW_TAG_file_type ]
!316 = metadata !{i32 524303, metadata !300, metadata !"", metadata !300, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !317} ; [ DW_TAG_pointer_type ]
!317 = metadata !{i32 524309, metadata !300, metadata !"", metadata !300, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !318, i32 0, null} ; [ DW_TAG_subroutine_type ]
!318 = metadata !{null, metadata !304}
!319 = metadata !{i32 524301, metadata !311, metadata !"sa_sigaction", metadata !308, i32 34, i64 64, i64 64, i64 0, i32 0, metadata !320} ; [ DW_TAG_member ]
!320 = metadata !{i32 524303, metadata !300, metadata !"", metadata !300, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !321} ; [ DW_TAG_pointer_type ]
!321 = metadata !{i32 524309, metadata !300, metadata !"", metadata !300, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !322, i32 0, null} ; [ DW_TAG_subroutine_type ]
!322 = metadata !{null, metadata !304, metadata !323, metadata !358}
!323 = metadata !{i32 524303, metadata !300, metadata !"", metadata !300, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !324} ; [ DW_TAG_pointer_type ]
!324 = metadata !{i32 524310, metadata !325, metadata !"siginfo_t", metadata !325, i32 108, i64 0, i64 0, i64 0, i32 0, metadata !326} ; [ DW_TAG_typedef ]
!325 = metadata !{i32 524329, metadata !"siginfo.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !301} ; [ DW_TAG_file_type ]
!326 = metadata !{i32 524307, metadata !300, metadata !"siginfo", metadata !325, i32 52, i64 1024, i64 64, i64 0, i32 0, null, metadata !327, i32 0, null} ; [ DW_TAG_structure_type ]
!327 = metadata !{metadata !328, metadata !329, metadata !330, metadata !331}
!328 = metadata !{i32 524301, metadata !326, metadata !"si_signo", metadata !325, i32 53, i64 32, i64 32, i64 0, i32 0, metadata !304} ; [ DW_TAG_member ]
!329 = metadata !{i32 524301, metadata !326, metadata !"si_errno", metadata !325, i32 54, i64 32, i64 32, i64 32, i32 0, metadata !304} ; [ DW_TAG_member ]
!330 = metadata !{i32 524301, metadata !326, metadata !"si_code", metadata !325, i32 56, i64 32, i64 32, i64 64, i32 0, metadata !304} ; [ DW_TAG_member ]
!331 = metadata !{i32 524301, metadata !326, metadata !"_sifields", metadata !325, i32 107, i64 896, i64 64, i64 128, i32 0, metadata !332} ; [ DW_TAG_member ]
!332 = metadata !{i32 524311, metadata !300, metadata !"", metadata !325, i32 59, i64 896, i64 64, i64 0, i32 0, null, metadata !333, i32 0, null} ; [ DW_TAG_union_type ]
!333 = metadata !{metadata !334, metadata !338, metadata !347, metadata !359, metadata !365, metadata !375, metadata !379}
!334 = metadata !{i32 524301, metadata !332, metadata !"_pad", metadata !325, i32 60, i64 896, i64 32, i64 0, i32 0, metadata !335} ; [ DW_TAG_member ]
!335 = metadata !{i32 524289, metadata !300, metadata !"", metadata !300, i32 0, i64 896, i64 32, i64 0, i32 0, metadata !304, metadata !336, i32 0, null} ; [ DW_TAG_array_type ]
!336 = metadata !{metadata !337}
!337 = metadata !{i32 524321, i64 0, i64 27}      ; [ DW_TAG_subrange_type ]
!338 = metadata !{i32 524301, metadata !332, metadata !"_kill", metadata !325, i32 67, i64 64, i64 32, i64 0, i32 0, metadata !339} ; [ DW_TAG_member ]
!339 = metadata !{i32 524307, metadata !300, metadata !"", metadata !325, i32 64, i64 64, i64 32, i64 0, i32 0, null, metadata !340, i32 0, null} ; [ DW_TAG_structure_type ]
!340 = metadata !{metadata !341, metadata !344}
!341 = metadata !{i32 524301, metadata !339, metadata !"si_pid", metadata !325, i32 65, i64 32, i64 32, i64 0, i32 0, metadata !342} ; [ DW_TAG_member ]
!342 = metadata !{i32 524310, metadata !343, metadata !"__pid_t", metadata !343, i32 147, i64 0, i64 0, i64 0, i32 0, metadata !304} ; [ DW_TAG_typedef ]
!343 = metadata !{i32 524329, metadata !"types.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !301} ; [ DW_TAG_file_type ]
!344 = metadata !{i32 524301, metadata !339, metadata !"si_uid", metadata !325, i32 66, i64 32, i64 32, i64 32, i32 0, metadata !345} ; [ DW_TAG_member ]
!345 = metadata !{i32 524310, metadata !343, metadata !"__uid_t", metadata !343, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !346} ; [ DW_TAG_typedef ]
!346 = metadata !{i32 524324, metadata !300, metadata !"unsigned int", metadata !300, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!347 = metadata !{i32 524301, metadata !332, metadata !"_timer", metadata !325, i32 75, i64 128, i64 64, i64 0, i32 0, metadata !348} ; [ DW_TAG_member ]
!348 = metadata !{i32 524307, metadata !300, metadata !"", metadata !325, i32 71, i64 128, i64 64, i64 0, i32 0, null, metadata !349, i32 0, null} ; [ DW_TAG_structure_type ]
!349 = metadata !{metadata !350, metadata !351, metadata !352}
!350 = metadata !{i32 524301, metadata !348, metadata !"si_tid", metadata !325, i32 72, i64 32, i64 32, i64 0, i32 0, metadata !304} ; [ DW_TAG_member ]
!351 = metadata !{i32 524301, metadata !348, metadata !"si_overrun", metadata !325, i32 73, i64 32, i64 32, i64 32, i32 0, metadata !304} ; [ DW_TAG_member ]
!352 = metadata !{i32 524301, metadata !348, metadata !"si_sigval", metadata !325, i32 74, i64 64, i64 64, i64 64, i32 0, metadata !353} ; [ DW_TAG_member ]
!353 = metadata !{i32 524310, metadata !325, metadata !"sigval_t", metadata !325, i32 37, i64 0, i64 0, i64 0, i32 0, metadata !354} ; [ DW_TAG_typedef ]
!354 = metadata !{i32 524311, metadata !300, metadata !"sigval", metadata !325, i32 34, i64 64, i64 64, i64 0, i32 0, null, metadata !355, i32 0, null} ; [ DW_TAG_union_type ]
!355 = metadata !{metadata !356, metadata !357}
!356 = metadata !{i32 524301, metadata !354, metadata !"sival_int", metadata !325, i32 35, i64 32, i64 32, i64 0, i32 0, metadata !304} ; [ DW_TAG_member ]
!357 = metadata !{i32 524301, metadata !354, metadata !"sival_ptr", metadata !325, i32 36, i64 64, i64 64, i64 0, i32 0, metadata !358} ; [ DW_TAG_member ]
!358 = metadata !{i32 524303, metadata !300, metadata !"", metadata !300, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!359 = metadata !{i32 524301, metadata !332, metadata !"_rt", metadata !325, i32 83, i64 128, i64 64, i64 0, i32 0, metadata !360} ; [ DW_TAG_member ]
!360 = metadata !{i32 524307, metadata !300, metadata !"", metadata !325, i32 79, i64 128, i64 64, i64 0, i32 0, null, metadata !361, i32 0, null} ; [ DW_TAG_structure_type ]
!361 = metadata !{metadata !362, metadata !363, metadata !364}
!362 = metadata !{i32 524301, metadata !360, metadata !"si_pid", metadata !325, i32 80, i64 32, i64 32, i64 0, i32 0, metadata !342} ; [ DW_TAG_member ]
!363 = metadata !{i32 524301, metadata !360, metadata !"si_uid", metadata !325, i32 81, i64 32, i64 32, i64 32, i32 0, metadata !345} ; [ DW_TAG_member ]
!364 = metadata !{i32 524301, metadata !360, metadata !"si_sigval", metadata !325, i32 82, i64 64, i64 64, i64 64, i32 0, metadata !353} ; [ DW_TAG_member ]
!365 = metadata !{i32 524301, metadata !332, metadata !"_sigchld", metadata !325, i32 93, i64 256, i64 64, i64 0, i32 0, metadata !366} ; [ DW_TAG_member ]
!366 = metadata !{i32 524307, metadata !300, metadata !"", metadata !325, i32 87, i64 256, i64 64, i64 0, i32 0, null, metadata !367, i32 0, null} ; [ DW_TAG_structure_type ]
!367 = metadata !{metadata !368, metadata !369, metadata !370, metadata !371, metadata !374}
!368 = metadata !{i32 524301, metadata !366, metadata !"si_pid", metadata !325, i32 88, i64 32, i64 32, i64 0, i32 0, metadata !342} ; [ DW_TAG_member ]
!369 = metadata !{i32 524301, metadata !366, metadata !"si_uid", metadata !325, i32 89, i64 32, i64 32, i64 32, i32 0, metadata !345} ; [ DW_TAG_member ]
!370 = metadata !{i32 524301, metadata !366, metadata !"si_status", metadata !325, i32 90, i64 32, i64 32, i64 64, i32 0, metadata !304} ; [ DW_TAG_member ]
!371 = metadata !{i32 524301, metadata !366, metadata !"si_utime", metadata !325, i32 91, i64 64, i64 64, i64 128, i32 0, metadata !372} ; [ DW_TAG_member ]
!372 = metadata !{i32 524310, metadata !343, metadata !"__clock_t", metadata !343, i32 149, i64 0, i64 0, i64 0, i32 0, metadata !373} ; [ DW_TAG_typedef ]
!373 = metadata !{i32 524324, metadata !300, metadata !"long int", metadata !300, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!374 = metadata !{i32 524301, metadata !366, metadata !"si_stime", metadata !325, i32 92, i64 64, i64 64, i64 192, i32 0, metadata !372} ; [ DW_TAG_member ]
!375 = metadata !{i32 524301, metadata !332, metadata !"_sigfault", metadata !325, i32 99, i64 64, i64 64, i64 0, i32 0, metadata !376} ; [ DW_TAG_member ]
!376 = metadata !{i32 524307, metadata !300, metadata !"", metadata !325, i32 97, i64 64, i64 64, i64 0, i32 0, null, metadata !377, i32 0, null} ; [ DW_TAG_structure_type ]
!377 = metadata !{metadata !378}
!378 = metadata !{i32 524301, metadata !376, metadata !"si_addr", metadata !325, i32 98, i64 64, i64 64, i64 0, i32 0, metadata !358} ; [ DW_TAG_member ]
!379 = metadata !{i32 524301, metadata !332, metadata !"_sigpoll", metadata !325, i32 106, i64 128, i64 64, i64 0, i32 0, metadata !380} ; [ DW_TAG_member ]
!380 = metadata !{i32 524307, metadata !300, metadata !"", metadata !325, i32 103, i64 128, i64 64, i64 0, i32 0, null, metadata !381, i32 0, null} ; [ DW_TAG_structure_type ]
!381 = metadata !{metadata !382, metadata !383}
!382 = metadata !{i32 524301, metadata !380, metadata !"si_band", metadata !325, i32 104, i64 64, i64 64, i64 0, i32 0, metadata !373} ; [ DW_TAG_member ]
!383 = metadata !{i32 524301, metadata !380, metadata !"si_fd", metadata !325, i32 105, i64 32, i64 32, i64 64, i32 0, metadata !304} ; [ DW_TAG_member ]
!384 = metadata !{i32 524301, metadata !307, metadata !"sa_mask", metadata !308, i32 44, i64 1024, i64 64, i64 64, i32 0, metadata !385} ; [ DW_TAG_member ]
!385 = metadata !{i32 524310, metadata !386, metadata !"__sigset_t", metadata !386, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !387} ; [ DW_TAG_typedef ]
!386 = metadata !{i32 524329, metadata !"sigset.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !301} ; [ DW_TAG_file_type ]
!387 = metadata !{i32 524307, metadata !300, metadata !"", metadata !386, i32 29, i64 1024, i64 64, i64 0, i32 0, null, metadata !388, i32 0, null} ; [ DW_TAG_structure_type ]
!388 = metadata !{metadata !389}
!389 = metadata !{i32 524301, metadata !387, metadata !"__val", metadata !386, i32 30, i64 1024, i64 64, i64 0, i32 0, metadata !390} ; [ DW_TAG_member ]
!390 = metadata !{i32 524289, metadata !300, metadata !"", metadata !300, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !391, metadata !163, i32 0, null} ; [ DW_TAG_array_type ]
!391 = metadata !{i32 524324, metadata !300, metadata !"long unsigned int", metadata !300, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!392 = metadata !{i32 524301, metadata !307, metadata !"sa_flags", metadata !308, i32 47, i64 32, i64 32, i64 1088, i32 0, metadata !304} ; [ DW_TAG_member ]
!393 = metadata !{i32 524301, metadata !307, metadata !"sa_restorer", metadata !308, i32 50, i64 64, i64 64, i64 1152, i32 0, metadata !394} ; [ DW_TAG_member ]
!394 = metadata !{i32 524303, metadata !300, metadata !"", metadata !300, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !395} ; [ DW_TAG_pointer_type ]
!395 = metadata !{i32 524309, metadata !300, metadata !"", metadata !300, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!396 = metadata !{i32 524303, metadata !300, metadata !"", metadata !300, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !307} ; [ DW_TAG_pointer_type ]
!397 = metadata !{i32 524334, i32 0, metadata !398, metadata !"fseek", metadata !"fseek", metadata !"fseek", metadata !398, i32 25, metadata !400, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.FILE*, i64, i32)* @fseek} ; [ DW_TA
!398 = metadata !{i32 524329, metadata !"fseeko.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !399} ; [ DW_TAG_file_type ]
!399 = metadata !{i32 524305, i32 0, i32 1, metadata !"fseeko.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!400 = metadata !{i32 524309, metadata !398, metadata !"", metadata !398, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !401, i32 0, null} ; [ DW_TAG_subroutine_type ]
!401 = metadata !{metadata !402, metadata !403, metadata !435, metadata !402}
!402 = metadata !{i32 524324, metadata !398, metadata !"int", metadata !398, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!403 = metadata !{i32 524303, metadata !398, metadata !"", metadata !398, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !404} ; [ DW_TAG_pointer_type ]
!404 = metadata !{i32 524310, metadata !405, metadata !"FILE", metadata !405, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !406} ; [ DW_TAG_typedef ]
!405 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !399} ; [ DW_TAG_file_type ]
!406 = metadata !{i32 524307, metadata !398, metadata !"__STDIO_FILE_STRUCT", metadata !405, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !407, i32 0, null} ; [ DW_TAG_structure_type ]
!407 = metadata !{metadata !408, metadata !411, metadata !414, metadata !415, metadata !417, metadata !418, metadata !419, metadata !420, metadata !421, metadata !422, metadata !424, metadata !428}
!408 = metadata !{i32 524301, metadata !406, metadata !"__modeflags", metadata !409, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !410} ; [ DW_TAG_member ]
!409 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !399} ; [ DW_TAG_file_type ]
!410 = metadata !{i32 524324, metadata !398, metadata !"short unsigned int", metadata !398, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!411 = metadata !{i32 524301, metadata !406, metadata !"__ungot_width", metadata !409, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !412} ; [ DW_TAG_member ]
!412 = metadata !{i32 524289, metadata !398, metadata !"", metadata !398, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !413, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!413 = metadata !{i32 524324, metadata !398, metadata !"unsigned char", metadata !398, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!414 = metadata !{i32 524301, metadata !406, metadata !"__filedes", metadata !409, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !402} ; [ DW_TAG_member ]
!415 = metadata !{i32 524301, metadata !406, metadata !"__bufstart", metadata !409, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !416} ; [ DW_TAG_member ]
!416 = metadata !{i32 524303, metadata !398, metadata !"", metadata !398, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !413} ; [ DW_TAG_pointer_type ]
!417 = metadata !{i32 524301, metadata !406, metadata !"__bufend", metadata !409, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !416} ; [ DW_TAG_member ]
!418 = metadata !{i32 524301, metadata !406, metadata !"__bufpos", metadata !409, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !416} ; [ DW_TAG_member ]
!419 = metadata !{i32 524301, metadata !406, metadata !"__bufread", metadata !409, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !416} ; [ DW_TAG_member ]
!420 = metadata !{i32 524301, metadata !406, metadata !"__bufgetc_u", metadata !409, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !416} ; [ DW_TAG_member ]
!421 = metadata !{i32 524301, metadata !406, metadata !"__bufputc_u", metadata !409, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !416} ; [ DW_TAG_member ]
!422 = metadata !{i32 524301, metadata !406, metadata !"__nextopen", metadata !409, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !423} ; [ DW_TAG_member ]
!423 = metadata !{i32 524303, metadata !398, metadata !"", metadata !398, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !406} ; [ DW_TAG_pointer_type ]
!424 = metadata !{i32 524301, metadata !406, metadata !"__ungot", metadata !409, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !425} ; [ DW_TAG_member ]
!425 = metadata !{i32 524289, metadata !398, metadata !"", metadata !398, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !426, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!426 = metadata !{i32 524310, metadata !427, metadata !"wchar_t", metadata !427, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !402} ; [ DW_TAG_typedef ]
!427 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !399} ; [ DW_TAG_file_type ]
!428 = metadata !{i32 524301, metadata !406, metadata !"__state", metadata !409, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !429} ; [ DW_TAG_member ]
!429 = metadata !{i32 524310, metadata !430, metadata !"__mbstate_t", metadata !430, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !431} ; [ DW_TAG_typedef ]
!430 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !399} ; [ DW_TAG_file_type ]
!431 = metadata !{i32 524307, metadata !398, metadata !"", metadata !430, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !432, i32 0, null} ; [ DW_TAG_structure_type ]
!432 = metadata !{metadata !433, metadata !434}
!433 = metadata !{i32 524301, metadata !431, metadata !"__mask", metadata !430, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !426} ; [ DW_TAG_member ]
!434 = metadata !{i32 524301, metadata !431, metadata !"__wc", metadata !430, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !426} ; [ DW_TAG_member ]
!435 = metadata !{i32 524324, metadata !398, metadata !"long int", metadata !398, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!436 = metadata !{i32 524334, i32 0, metadata !437, metadata !"tcgetattr", metadata !"tcgetattr", metadata !"tcgetattr", metadata !437, i32 39, metadata !439, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, %struct.termios*)* @tcgeta
!437 = metadata !{i32 524329, metadata !"tcgetattr.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/termios", metadata !438} ; [ DW_TAG_file_type ]
!438 = metadata !{i32 524305, i32 0, i32 1, metadata !"tcgetattr.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/termios", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_comp
!439 = metadata !{i32 524309, metadata !437, metadata !"", metadata !437, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !440, i32 0, null} ; [ DW_TAG_subroutine_type ]
!440 = metadata !{metadata !441, metadata !441, metadata !442}
!441 = metadata !{i32 524324, metadata !437, metadata !"int", metadata !437, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!442 = metadata !{i32 524303, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !443} ; [ DW_TAG_pointer_type ]
!443 = metadata !{i32 524307, metadata !437, metadata !"termios", metadata !444, i32 31, i64 480, i64 32, i64 0, i32 0, null, metadata !445, i32 0, null} ; [ DW_TAG_structure_type ]
!444 = metadata !{i32 524329, metadata !"termios.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !438} ; [ DW_TAG_file_type ]
!445 = metadata !{metadata !446, metadata !449, metadata !450, metadata !451, metadata !452, metadata !455, metadata !459, metadata !461}
!446 = metadata !{i32 524301, metadata !443, metadata !"c_iflag", metadata !444, i32 32, i64 32, i64 32, i64 0, i32 0, metadata !447} ; [ DW_TAG_member ]
!447 = metadata !{i32 524310, metadata !444, metadata !"tcflag_t", metadata !444, i32 27, i64 0, i64 0, i64 0, i32 0, metadata !448} ; [ DW_TAG_typedef ]
!448 = metadata !{i32 524324, metadata !437, metadata !"unsigned int", metadata !437, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!449 = metadata !{i32 524301, metadata !443, metadata !"c_oflag", metadata !444, i32 33, i64 32, i64 32, i64 32, i32 0, metadata !447} ; [ DW_TAG_member ]
!450 = metadata !{i32 524301, metadata !443, metadata !"c_cflag", metadata !444, i32 34, i64 32, i64 32, i64 64, i32 0, metadata !447} ; [ DW_TAG_member ]
!451 = metadata !{i32 524301, metadata !443, metadata !"c_lflag", metadata !444, i32 35, i64 32, i64 32, i64 96, i32 0, metadata !447} ; [ DW_TAG_member ]
!452 = metadata !{i32 524301, metadata !443, metadata !"c_line", metadata !444, i32 36, i64 8, i64 8, i64 128, i32 0, metadata !453} ; [ DW_TAG_member ]
!453 = metadata !{i32 524310, metadata !444, metadata !"cc_t", metadata !444, i32 25, i64 0, i64 0, i64 0, i32 0, metadata !454} ; [ DW_TAG_typedef ]
!454 = metadata !{i32 524324, metadata !437, metadata !"unsigned char", metadata !437, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!455 = metadata !{i32 524301, metadata !443, metadata !"c_cc", metadata !444, i32 37, i64 256, i64 8, i64 136, i32 0, metadata !456} ; [ DW_TAG_member ]
!456 = metadata !{i32 524289, metadata !437, metadata !"", metadata !437, i32 0, i64 256, i64 8, i64 0, i32 0, metadata !453, metadata !457, i32 0, null} ; [ DW_TAG_array_type ]
!457 = metadata !{metadata !458}
!458 = metadata !{i32 524321, i64 0, i64 31}      ; [ DW_TAG_subrange_type ]
!459 = metadata !{i32 524301, metadata !443, metadata !"c_ispeed", metadata !444, i32 38, i64 32, i64 32, i64 416, i32 0, metadata !460} ; [ DW_TAG_member ]
!460 = metadata !{i32 524310, metadata !444, metadata !"speed_t", metadata !444, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !448} ; [ DW_TAG_typedef ]
!461 = metadata !{i32 524301, metadata !443, metadata !"c_ospeed", metadata !444, i32 39, i64 32, i64 32, i64 448, i32 0, metadata !460} ; [ DW_TAG_member ]
!462 = metadata !{i32 524334, i32 0, metadata !463, metadata !"fseeko64", metadata !"fseeko64", metadata !"fseeko64", metadata !465, i32 25, metadata !466, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.FILE*, i64, i32)* @fseeko6
!463 = metadata !{i32 524329, metadata !"fseeko64.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !464} ; [ DW_TAG_file_type ]
!464 = metadata !{i32 524305, i32 0, i32 1, metadata !"fseeko64.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile
!465 = metadata !{i32 524329, metadata !"fseeko.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !464} ; [ DW_TAG_file_type ]
!466 = metadata !{i32 524309, metadata !463, metadata !"", metadata !463, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !467, i32 0, null} ; [ DW_TAG_subroutine_type ]
!467 = metadata !{metadata !468, metadata !469, metadata !501, metadata !468}
!468 = metadata !{i32 524324, metadata !463, metadata !"int", metadata !463, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!469 = metadata !{i32 524303, metadata !463, metadata !"", metadata !463, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !470} ; [ DW_TAG_pointer_type ]
!470 = metadata !{i32 524310, metadata !471, metadata !"FILE", metadata !471, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !472} ; [ DW_TAG_typedef ]
!471 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !464} ; [ DW_TAG_file_type ]
!472 = metadata !{i32 524307, metadata !463, metadata !"__STDIO_FILE_STRUCT", metadata !471, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !473, i32 0, null} ; [ DW_TAG_structure_type ]
!473 = metadata !{metadata !474, metadata !477, metadata !480, metadata !481, metadata !483, metadata !484, metadata !485, metadata !486, metadata !487, metadata !488, metadata !490, metadata !494}
!474 = metadata !{i32 524301, metadata !472, metadata !"__modeflags", metadata !475, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !476} ; [ DW_TAG_member ]
!475 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !464} ; [ DW_TAG_file_type ]
!476 = metadata !{i32 524324, metadata !463, metadata !"short unsigned int", metadata !463, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!477 = metadata !{i32 524301, metadata !472, metadata !"__ungot_width", metadata !475, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !478} ; [ DW_TAG_member ]
!478 = metadata !{i32 524289, metadata !463, metadata !"", metadata !463, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !479, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!479 = metadata !{i32 524324, metadata !463, metadata !"unsigned char", metadata !463, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!480 = metadata !{i32 524301, metadata !472, metadata !"__filedes", metadata !475, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !468} ; [ DW_TAG_member ]
!481 = metadata !{i32 524301, metadata !472, metadata !"__bufstart", metadata !475, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !482} ; [ DW_TAG_member ]
!482 = metadata !{i32 524303, metadata !463, metadata !"", metadata !463, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !479} ; [ DW_TAG_pointer_type ]
!483 = metadata !{i32 524301, metadata !472, metadata !"__bufend", metadata !475, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !482} ; [ DW_TAG_member ]
!484 = metadata !{i32 524301, metadata !472, metadata !"__bufpos", metadata !475, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !482} ; [ DW_TAG_member ]
!485 = metadata !{i32 524301, metadata !472, metadata !"__bufread", metadata !475, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !482} ; [ DW_TAG_member ]
!486 = metadata !{i32 524301, metadata !472, metadata !"__bufgetc_u", metadata !475, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !482} ; [ DW_TAG_member ]
!487 = metadata !{i32 524301, metadata !472, metadata !"__bufputc_u", metadata !475, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !482} ; [ DW_TAG_member ]
!488 = metadata !{i32 524301, metadata !472, metadata !"__nextopen", metadata !475, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !489} ; [ DW_TAG_member ]
!489 = metadata !{i32 524303, metadata !463, metadata !"", metadata !463, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !472} ; [ DW_TAG_pointer_type ]
!490 = metadata !{i32 524301, metadata !472, metadata !"__ungot", metadata !475, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !491} ; [ DW_TAG_member ]
!491 = metadata !{i32 524289, metadata !463, metadata !"", metadata !463, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !492, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!492 = metadata !{i32 524310, metadata !493, metadata !"wchar_t", metadata !493, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !468} ; [ DW_TAG_typedef ]
!493 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !464} ; [ DW_TAG_file_type ]
!494 = metadata !{i32 524301, metadata !472, metadata !"__state", metadata !475, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !495} ; [ DW_TAG_member ]
!495 = metadata !{i32 524310, metadata !496, metadata !"__mbstate_t", metadata !496, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !497} ; [ DW_TAG_typedef ]
!496 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !464} ; [ DW_TAG_file_type ]
!497 = metadata !{i32 524307, metadata !463, metadata !"", metadata !496, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !498, i32 0, null} ; [ DW_TAG_structure_type ]
!498 = metadata !{metadata !499, metadata !500}
!499 = metadata !{i32 524301, metadata !497, metadata !"__mask", metadata !496, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !492} ; [ DW_TAG_member ]
!500 = metadata !{i32 524301, metadata !497, metadata !"__wc", metadata !496, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !492} ; [ DW_TAG_member ]
!501 = metadata !{i32 524310, metadata !502, metadata !"__off64_t", metadata !502, i32 146, i64 0, i64 0, i64 0, i32 0, metadata !503} ; [ DW_TAG_typedef ]
!502 = metadata !{i32 524329, metadata !"types.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !464} ; [ DW_TAG_file_type ]
!503 = metadata !{i32 524324, metadata !463, metadata !"long int", metadata !463, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!504 = metadata !{i32 524334, i32 0, metadata !505, metadata !"mempcpy", metadata !"mempcpy", metadata !"mempcpy", metadata !505, i32 21, metadata !507, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*, i8*, i64)* @mempcpy} ; [ DW_TAG_
!505 = metadata !{i32 524329, metadata !"mempcpy.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !506} ; [ DW_TAG_file_type ]
!506 = metadata !{i32 524305, i32 0, i32 1, metadata !"mempcpy.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile
!507 = metadata !{i32 524309, metadata !505, metadata !"", metadata !505, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !508, i32 0, null} ; [ DW_TAG_subroutine_type ]
!508 = metadata !{metadata !509, metadata !509, metadata !509, metadata !510}
!509 = metadata !{i32 524303, metadata !505, metadata !"", metadata !505, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!510 = metadata !{i32 524310, metadata !511, metadata !"size_t", metadata !511, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !512} ; [ DW_TAG_typedef ]
!511 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !506} ; [ DW_TAG_file_type ]
!512 = metadata !{i32 524324, metadata !505, metadata !"long unsigned int", metadata !505, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!513 = metadata !{i32 524334, i32 0, metadata !514, metadata !"__stdio_adjust_position", metadata !"__stdio_adjust_position", metadata !"__stdio_adjust_position", metadata !514, i32 21, metadata !516, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 f
!514 = metadata !{i32 524329, metadata !"_adjust_pos.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !515} ; [ DW_TAG_file_type ]
!515 = metadata !{i32 524305, i32 0, i32 1, metadata !"_adjust_pos.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_comp
!516 = metadata !{i32 524309, metadata !514, metadata !"", metadata !514, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !517, i32 0, null} ; [ DW_TAG_subroutine_type ]
!517 = metadata !{metadata !518, metadata !519, metadata !551}
!518 = metadata !{i32 524324, metadata !514, metadata !"int", metadata !514, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!519 = metadata !{i32 524303, metadata !514, metadata !"", metadata !514, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !520} ; [ DW_TAG_pointer_type ]
!520 = metadata !{i32 524310, metadata !521, metadata !"FILE", metadata !521, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !522} ; [ DW_TAG_typedef ]
!521 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !515} ; [ DW_TAG_file_type ]
!522 = metadata !{i32 524307, metadata !514, metadata !"__STDIO_FILE_STRUCT", metadata !521, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !523, i32 0, null} ; [ DW_TAG_structure_type ]
!523 = metadata !{metadata !524, metadata !527, metadata !530, metadata !531, metadata !533, metadata !534, metadata !535, metadata !536, metadata !537, metadata !538, metadata !540, metadata !544}
!524 = metadata !{i32 524301, metadata !522, metadata !"__modeflags", metadata !525, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !526} ; [ DW_TAG_member ]
!525 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !515} ; [ DW_TAG_file_type ]
!526 = metadata !{i32 524324, metadata !514, metadata !"short unsigned int", metadata !514, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!527 = metadata !{i32 524301, metadata !522, metadata !"__ungot_width", metadata !525, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !528} ; [ DW_TAG_member ]
!528 = metadata !{i32 524289, metadata !514, metadata !"", metadata !514, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !529, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!529 = metadata !{i32 524324, metadata !514, metadata !"unsigned char", metadata !514, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!530 = metadata !{i32 524301, metadata !522, metadata !"__filedes", metadata !525, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !518} ; [ DW_TAG_member ]
!531 = metadata !{i32 524301, metadata !522, metadata !"__bufstart", metadata !525, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !532} ; [ DW_TAG_member ]
!532 = metadata !{i32 524303, metadata !514, metadata !"", metadata !514, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !529} ; [ DW_TAG_pointer_type ]
!533 = metadata !{i32 524301, metadata !522, metadata !"__bufend", metadata !525, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !532} ; [ DW_TAG_member ]
!534 = metadata !{i32 524301, metadata !522, metadata !"__bufpos", metadata !525, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !532} ; [ DW_TAG_member ]
!535 = metadata !{i32 524301, metadata !522, metadata !"__bufread", metadata !525, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !532} ; [ DW_TAG_member ]
!536 = metadata !{i32 524301, metadata !522, metadata !"__bufgetc_u", metadata !525, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !532} ; [ DW_TAG_member ]
!537 = metadata !{i32 524301, metadata !522, metadata !"__bufputc_u", metadata !525, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !532} ; [ DW_TAG_member ]
!538 = metadata !{i32 524301, metadata !522, metadata !"__nextopen", metadata !525, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !539} ; [ DW_TAG_member ]
!539 = metadata !{i32 524303, metadata !514, metadata !"", metadata !514, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !522} ; [ DW_TAG_pointer_type ]
!540 = metadata !{i32 524301, metadata !522, metadata !"__ungot", metadata !525, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !541} ; [ DW_TAG_member ]
!541 = metadata !{i32 524289, metadata !514, metadata !"", metadata !514, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !542, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!542 = metadata !{i32 524310, metadata !543, metadata !"wchar_t", metadata !543, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !518} ; [ DW_TAG_typedef ]
!543 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !515} ; [ DW_TAG_file_type ]
!544 = metadata !{i32 524301, metadata !522, metadata !"__state", metadata !525, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !545} ; [ DW_TAG_member ]
!545 = metadata !{i32 524310, metadata !546, metadata !"__mbstate_t", metadata !546, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !547} ; [ DW_TAG_typedef ]
!546 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !515} ; [ DW_TAG_file_type ]
!547 = metadata !{i32 524307, metadata !514, metadata !"", metadata !546, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !548, i32 0, null} ; [ DW_TAG_structure_type ]
!548 = metadata !{metadata !549, metadata !550}
!549 = metadata !{i32 524301, metadata !547, metadata !"__mask", metadata !546, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !542} ; [ DW_TAG_member ]
!550 = metadata !{i32 524301, metadata !547, metadata !"__wc", metadata !546, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !542} ; [ DW_TAG_member ]
!551 = metadata !{i32 524303, metadata !514, metadata !"", metadata !514, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !552} ; [ DW_TAG_pointer_type ]
!552 = metadata !{i32 524310, metadata !525, metadata !"__offmax_t", metadata !525, i32 194, i64 0, i64 0, i64 0, i32 0, metadata !553} ; [ DW_TAG_typedef ]
!553 = metadata !{i32 524324, metadata !514, metadata !"long int", metadata !514, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!554 = metadata !{i32 524334, i32 0, metadata !555, metadata !"__stdio_seek", metadata !"__stdio_seek", metadata !"__stdio_seek", metadata !555, i32 62, metadata !557, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.FILE*, i64*, i
!555 = metadata !{i32 524329, metadata !"_cs_funcs.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !556} ; [ DW_TAG_file_type ]
!556 = metadata !{i32 524305, i32 0, i32 1, metadata !"_cs_funcs.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compil
!557 = metadata !{i32 524309, metadata !555, metadata !"", metadata !555, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !558, i32 0, null} ; [ DW_TAG_subroutine_type ]
!558 = metadata !{metadata !559, metadata !560, metadata !592, metadata !559}
!559 = metadata !{i32 524324, metadata !555, metadata !"int", metadata !555, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!560 = metadata !{i32 524303, metadata !555, metadata !"", metadata !555, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !561} ; [ DW_TAG_pointer_type ]
!561 = metadata !{i32 524310, metadata !562, metadata !"FILE", metadata !562, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !563} ; [ DW_TAG_typedef ]
!562 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !556} ; [ DW_TAG_file_type ]
!563 = metadata !{i32 524307, metadata !555, metadata !"__STDIO_FILE_STRUCT", metadata !562, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !564, i32 0, null} ; [ DW_TAG_structure_type ]
!564 = metadata !{metadata !565, metadata !568, metadata !571, metadata !572, metadata !574, metadata !575, metadata !576, metadata !577, metadata !578, metadata !579, metadata !581, metadata !585}
!565 = metadata !{i32 524301, metadata !563, metadata !"__modeflags", metadata !566, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !567} ; [ DW_TAG_member ]
!566 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !556} ; [ DW_TAG_file_type ]
!567 = metadata !{i32 524324, metadata !555, metadata !"short unsigned int", metadata !555, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!568 = metadata !{i32 524301, metadata !563, metadata !"__ungot_width", metadata !566, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !569} ; [ DW_TAG_member ]
!569 = metadata !{i32 524289, metadata !555, metadata !"", metadata !555, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !570, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!570 = metadata !{i32 524324, metadata !555, metadata !"unsigned char", metadata !555, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!571 = metadata !{i32 524301, metadata !563, metadata !"__filedes", metadata !566, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !559} ; [ DW_TAG_member ]
!572 = metadata !{i32 524301, metadata !563, metadata !"__bufstart", metadata !566, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !573} ; [ DW_TAG_member ]
!573 = metadata !{i32 524303, metadata !555, metadata !"", metadata !555, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !570} ; [ DW_TAG_pointer_type ]
!574 = metadata !{i32 524301, metadata !563, metadata !"__bufend", metadata !566, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !573} ; [ DW_TAG_member ]
!575 = metadata !{i32 524301, metadata !563, metadata !"__bufpos", metadata !566, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !573} ; [ DW_TAG_member ]
!576 = metadata !{i32 524301, metadata !563, metadata !"__bufread", metadata !566, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !573} ; [ DW_TAG_member ]
!577 = metadata !{i32 524301, metadata !563, metadata !"__bufgetc_u", metadata !566, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !573} ; [ DW_TAG_member ]
!578 = metadata !{i32 524301, metadata !563, metadata !"__bufputc_u", metadata !566, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !573} ; [ DW_TAG_member ]
!579 = metadata !{i32 524301, metadata !563, metadata !"__nextopen", metadata !566, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !580} ; [ DW_TAG_member ]
!580 = metadata !{i32 524303, metadata !555, metadata !"", metadata !555, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !563} ; [ DW_TAG_pointer_type ]
!581 = metadata !{i32 524301, metadata !563, metadata !"__ungot", metadata !566, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !582} ; [ DW_TAG_member ]
!582 = metadata !{i32 524289, metadata !555, metadata !"", metadata !555, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !583, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!583 = metadata !{i32 524310, metadata !584, metadata !"wchar_t", metadata !584, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !559} ; [ DW_TAG_typedef ]
!584 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !556} ; [ DW_TAG_file_type ]
!585 = metadata !{i32 524301, metadata !563, metadata !"__state", metadata !566, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !586} ; [ DW_TAG_member ]
!586 = metadata !{i32 524310, metadata !587, metadata !"__mbstate_t", metadata !587, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !588} ; [ DW_TAG_typedef ]
!587 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !556} ; [ DW_TAG_file_type ]
!588 = metadata !{i32 524307, metadata !555, metadata !"", metadata !587, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !589, i32 0, null} ; [ DW_TAG_structure_type ]
!589 = metadata !{metadata !590, metadata !591}
!590 = metadata !{i32 524301, metadata !588, metadata !"__mask", metadata !587, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !583} ; [ DW_TAG_member ]
!591 = metadata !{i32 524301, metadata !588, metadata !"__wc", metadata !587, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !583} ; [ DW_TAG_member ]
!592 = metadata !{i32 524303, metadata !555, metadata !"", metadata !555, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !593} ; [ DW_TAG_pointer_type ]
!593 = metadata !{i32 524310, metadata !566, metadata !"__offmax_t", metadata !566, i32 194, i64 0, i64 0, i64 0, i32 0, metadata !594} ; [ DW_TAG_typedef ]
!594 = metadata !{i32 524324, metadata !555, metadata !"long int", metadata !555, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!595 = metadata !{i32 524334, i32 0, metadata !596, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !596, i32 12, metadata !598, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!596 = metadata !{i32 524329, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !597} ; [ DW_TAG_file_type ]
!597 = metadata !{i32 524305, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_
!598 = metadata !{i32 524309, metadata !596, metadata !"", metadata !596, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !599, i32 0, null} ; [ DW_TAG_subroutine_type ]
!599 = metadata !{metadata !600, metadata !600, metadata !600, metadata !601}
!600 = metadata !{i32 524303, metadata !596, metadata !"", metadata !596, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!601 = metadata !{i32 524310, metadata !602, metadata !"size_t", metadata !602, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !603} ; [ DW_TAG_typedef ]
!602 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !597} ; [ DW_TAG_file_type ]
!603 = metadata !{i32 524324, metadata !596, metadata !"long unsigned int", metadata !596, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!604 = metadata !{i32 524334, i32 0, metadata !605, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !605, i32 12, metadata !607, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, void (i
!605 = metadata !{i32 524329, metadata !"klee_div_zero_check.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !606} ; [ DW_TAG_file_type ]
!606 = metadata !{i32 524305, i32 0, i32 1, metadata !"klee_div_zero_check.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_
!607 = metadata !{i32 524309, metadata !605, metadata !"", metadata !605, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !608, i32 0, null} ; [ DW_TAG_subroutine_type ]
!608 = metadata !{null, metadata !609}
!609 = metadata !{i32 524324, metadata !605, metadata !"long long int", metadata !605, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!610 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__libc_stack_end", metadata !"__libc_stack_end", metadata !"", metadata !14, i32 52, metadata !42, i1 false, i1 true, i8** @__libc_stack_end} ; [ DW_TAG_variable ]
!611 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__uclibc_progname", metadata !"__uclibc_progname", metadata !"", metadata !14, i32 110, metadata !612, i1 false, i1 true, i8** @__uclibc_progname} ; [ DW_TAG_variable ]
!612 = metadata !{i32 524303, metadata !14, metadata !"", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !613} ; [ DW_TAG_pointer_type ]
!613 = metadata !{i32 524326, metadata !14, metadata !"", metadata !14, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !40} ; [ DW_TAG_const_type ]
!614 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__environ", metadata !"__environ", metadata !"", metadata !14, i32 125, metadata !38, i1 false, i1 true, i8*** @__environ} ; [ DW_TAG_variable ]
!615 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__pagesize", metadata !"__pagesize", metadata !"", metadata !14, i32 129, metadata !616, i1 false, i1 true, i64* @__pagesize} ; [ DW_TAG_variable ]
!616 = metadata !{i32 524310, metadata !617, metadata !"size_t", metadata !617, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !618} ; [ DW_TAG_typedef ]
!617 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !15} ; [ DW_TAG_file_type ]
!618 = metadata !{i32 524324, metadata !14, metadata !"long unsigned int", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!619 = metadata !{i32 524340, i32 0, metadata !28, metadata !"been_there_done_that", metadata !"been_there_done_that", metadata !"", metadata !14, i32 189, metadata !18, i1 true, i1 true, i32* @been_there_done_that.2846} ; [ DW_TAG_variable ]
!620 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__app_fini", metadata !"__app_fini", metadata !"", metadata !14, i32 244, metadata !41, i1 false, i1 true, void ()** @__app_fini} ; [ DW_TAG_variable ]
!621 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__rtld_fini", metadata !"__rtld_fini", metadata !"", metadata !14, i32 247, metadata !41, i1 false, i1 true, void ()** @__rtld_fini} ; [ DW_TAG_variable ]
!622 = metadata !{i32 524340, i32 0, metadata !115, metadata !"_stdio_streams", metadata !"_stdio_streams", metadata !"", metadata !115, i32 131, metadata !623, i1 true, i1 true, [3 x %struct.FILE]* @_stdio_streams} ; [ DW_TAG_variable ]
!623 = metadata !{i32 524289, metadata !115, metadata !"", metadata !115, i32 0, i64 1920, i64 64, i64 0, i32 0, metadata !624, metadata !656, i32 0, null} ; [ DW_TAG_array_type ]
!624 = metadata !{i32 524310, metadata !625, metadata !"FILE", metadata !625, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !626} ; [ DW_TAG_typedef ]
!625 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !116} ; [ DW_TAG_file_type ]
!626 = metadata !{i32 524307, metadata !115, metadata !"__STDIO_FILE_STRUCT", metadata !625, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !627, i32 0, null} ; [ DW_TAG_structure_type ]
!627 = metadata !{metadata !628, metadata !631, metadata !634, metadata !636, metadata !638, metadata !639, metadata !640, metadata !641, metadata !642, metadata !643, metadata !645, metadata !649}
!628 = metadata !{i32 524301, metadata !626, metadata !"__modeflags", metadata !629, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !630} ; [ DW_TAG_member ]
!629 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !116} ; [ DW_TAG_file_type ]
!630 = metadata !{i32 524324, metadata !115, metadata !"short unsigned int", metadata !115, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!631 = metadata !{i32 524301, metadata !626, metadata !"__ungot_width", metadata !629, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !632} ; [ DW_TAG_member ]
!632 = metadata !{i32 524289, metadata !115, metadata !"", metadata !115, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !633, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!633 = metadata !{i32 524324, metadata !115, metadata !"unsigned char", metadata !115, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!634 = metadata !{i32 524301, metadata !626, metadata !"__filedes", metadata !629, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !635} ; [ DW_TAG_member ]
!635 = metadata !{i32 524324, metadata !115, metadata !"int", metadata !115, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!636 = metadata !{i32 524301, metadata !626, metadata !"__bufstart", metadata !629, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !637} ; [ DW_TAG_member ]
!637 = metadata !{i32 524303, metadata !115, metadata !"", metadata !115, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !633} ; [ DW_TAG_pointer_type ]
!638 = metadata !{i32 524301, metadata !626, metadata !"__bufend", metadata !629, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !637} ; [ DW_TAG_member ]
!639 = metadata !{i32 524301, metadata !626, metadata !"__bufpos", metadata !629, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !637} ; [ DW_TAG_member ]
!640 = metadata !{i32 524301, metadata !626, metadata !"__bufread", metadata !629, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !637} ; [ DW_TAG_member ]
!641 = metadata !{i32 524301, metadata !626, metadata !"__bufgetc_u", metadata !629, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !637} ; [ DW_TAG_member ]
!642 = metadata !{i32 524301, metadata !626, metadata !"__bufputc_u", metadata !629, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !637} ; [ DW_TAG_member ]
!643 = metadata !{i32 524301, metadata !626, metadata !"__nextopen", metadata !629, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !644} ; [ DW_TAG_member ]
!644 = metadata !{i32 524303, metadata !115, metadata !"", metadata !115, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !626} ; [ DW_TAG_pointer_type ]
!645 = metadata !{i32 524301, metadata !626, metadata !"__ungot", metadata !629, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !646} ; [ DW_TAG_member ]
!646 = metadata !{i32 524289, metadata !115, metadata !"", metadata !115, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !647, metadata !91, i32 0, null} ; [ DW_TAG_array_type ]
!647 = metadata !{i32 524310, metadata !648, metadata !"wchar_t", metadata !648, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !635} ; [ DW_TAG_typedef ]
!648 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !116} ; [ DW_TAG_file_type ]
!649 = metadata !{i32 524301, metadata !626, metadata !"__state", metadata !629, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !650} ; [ DW_TAG_member ]
!650 = metadata !{i32 524310, metadata !651, metadata !"__mbstate_t", metadata !651, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !652} ; [ DW_TAG_typedef ]
!651 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !116} ; [ DW_TAG_file_type ]
!652 = metadata !{i32 524307, metadata !115, metadata !"", metadata !651, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !653, i32 0, null} ; [ DW_TAG_structure_type ]
!653 = metadata !{metadata !654, metadata !655}
!654 = metadata !{i32 524301, metadata !652, metadata !"__mask", metadata !651, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !647} ; [ DW_TAG_member ]
!655 = metadata !{i32 524301, metadata !652, metadata !"__wc", metadata !651, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !647} ; [ DW_TAG_member ]
!656 = metadata !{metadata !657}
!657 = metadata !{i32 524321, i64 0, i64 2}       ; [ DW_TAG_subrange_type ]
!658 = metadata !{i32 524340, i32 0, metadata !115, metadata !"stdin", metadata !"stdin", metadata !"", metadata !115, i32 154, metadata !659, i1 false, i1 true, %struct.FILE** @stdin} ; [ DW_TAG_variable ]
!659 = metadata !{i32 524303, metadata !115, metadata !"", metadata !115, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !624} ; [ DW_TAG_pointer_type ]
!660 = metadata !{i32 524340, i32 0, metadata !115, metadata !"stdout", metadata !"stdout", metadata !"", metadata !115, i32 155, metadata !659, i1 false, i1 true, %struct.FILE** @stdout} ; [ DW_TAG_variable ]
!661 = metadata !{i32 524340, i32 0, metadata !115, metadata !"stderr", metadata !"stderr", metadata !"", metadata !115, i32 156, metadata !659, i1 false, i1 true, %struct.FILE** @stderr} ; [ DW_TAG_variable ]
!662 = metadata !{i32 524340, i32 0, metadata !115, metadata !"__stdin", metadata !"__stdin", metadata !"", metadata !115, i32 159, metadata !659, i1 false, i1 true, %struct.FILE** @__stdin} ; [ DW_TAG_variable ]
!663 = metadata !{i32 524340, i32 0, metadata !115, metadata !"__stdout", metadata !"__stdout", metadata !"", metadata !115, i32 162, metadata !659, i1 false, i1 true, %struct.FILE** @__stdout} ; [ DW_TAG_variable ]
!664 = metadata !{i32 524340, i32 0, metadata !115, metadata !"_stdio_openlist", metadata !"_stdio_openlist", metadata !"", metadata !115, i32 180, metadata !644, i1 false, i1 true, %struct.FILE** @_stdio_openlist} ; [ DW_TAG_variable ]
!665 = metadata !{i32 524340, i32 0, metadata !120, metadata !"been_there_done_that", metadata !"been_there_done_that", metadata !"", metadata !120, i32 49, metadata !666, i1 true, i1 true, i32* @been_there_done_that} ; [ DW_TAG_variable ]
!666 = metadata !{i32 524324, metadata !120, metadata !"int", metadata !120, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!667 = metadata !{i32 524340, i32 0, metadata !126, metadata !"__exit_cleanup", metadata !"__exit_cleanup", metadata !"", metadata !126, i32 309, metadata !668, i1 false, i1 true, void (i32)** @__exit_cleanup} ; [ DW_TAG_variable ]
!668 = metadata !{i32 524303, metadata !124, metadata !"", metadata !124, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !127} ; [ DW_TAG_pointer_type ]
!669 = metadata !{i32 524340, i32 0, metadata !670, metadata !"errno", metadata !"errno", metadata !"", metadata !670, i32 7, metadata !672, i1 false, i1 true, i32* @errno} ; [ DW_TAG_variable ]
!670 = metadata !{i32 524329, metadata !"errno.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !671} ; [ DW_TAG_file_type ]
!671 = metadata !{i32 524305, i32 0, i32 1, metadata !"errno.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_c
!672 = metadata !{i32 524324, metadata !670, metadata !"int", metadata !670, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!673 = metadata !{i32 524340, i32 0, metadata !670, metadata !"h_errno", metadata !"h_errno", metadata !"", metadata !670, i32 8, metadata !672, i1 false, i1 true, i32* @h_errno} ; [ DW_TAG_variable ]
!674 = metadata !{i32 524545, metadata !595, metadata !"dst", metadata !596, i32 12, metadata !600} ; [ DW_TAG_arg_variable ]
!675 = metadata !{i32 524545, metadata !595, metadata !"src", metadata !596, i32 12, metadata !600} ; [ DW_TAG_arg_variable ]
!676 = metadata !{i32 524545, metadata !595, metadata !"count", metadata !596, i32 12, metadata !601} ; [ DW_TAG_arg_variable ]
!677 = metadata !{i32 524544, metadata !678, metadata !"a", metadata !596, i32 13, metadata !679} ; [ DW_TAG_auto_variable ]
!678 = metadata !{i32 524299, metadata !595, i32 12, i32 0, metadata !596, i32 0} ; [ DW_TAG_lexical_block ]
!679 = metadata !{i32 524303, metadata !596, metadata !"", metadata !596, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !680} ; [ DW_TAG_pointer_type ]
!680 = metadata !{i32 524324, metadata !596, metadata !"char", metadata !596, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!681 = metadata !{i32 524544, metadata !678, metadata !"b", metadata !596, i32 14, metadata !682} ; [ DW_TAG_auto_variable ]
!682 = metadata !{i32 524303, metadata !596, metadata !"", metadata !596, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !683} ; [ DW_TAG_pointer_type ]
!683 = metadata !{i32 524326, metadata !596, metadata !"", metadata !596, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !680} ; [ DW_TAG_const_type ]
!684 = metadata !{i32 524545, metadata !604, metadata !"z", metadata !605, i32 12, metadata !609} ; [ DW_TAG_arg_variable ]
!685 = metadata !{i32 8, i32 0, metadata !686, null}
!686 = metadata !{i32 524299, metadata !0, i32 6, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!687 = metadata !{i32 10, i32 0, metadata !686, null}
!688 = metadata !{i32 11, i32 0, metadata !686, null}
!689 = metadata !{i32 13, i32 0, metadata !686, null}
!690 = metadata !{i32 14, i32 0, metadata !686, null}
!691 = metadata !{i32 23, i32 0, metadata !692, null}
!692 = metadata !{i32 524299, metadata !6, i32 17, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!693 = metadata !{i32 24, i32 0, metadata !692, null}
!694 = metadata !{i32 25, i32 0, metadata !692, null}
!695 = metadata !{i32 27, i32 0, metadata !692, null}
!696 = metadata !{i32 37, i32 0, metadata !692, null}
!697 = metadata !{i32 40, i32 0, metadata !692, null}
!698 = metadata !{i32 42, i32 0, metadata !692, null}
!699 = metadata !{i32 46, i32 0, metadata !692, null}
!700 = metadata !{i32 51, i32 0, metadata !692, null}
!701 = metadata !{i32 139, i32 0, metadata !702, null}
!702 = metadata !{i32 524299, metadata !13, i32 137, i32 0, metadata !14, i32 0} ; [ DW_TAG_lexical_block ]
!703 = metadata !{i32 143, i32 0, metadata !704, null}
!704 = metadata !{i32 524299, metadata !702, i32 137, i32 0, metadata !14, i32 1} ; [ DW_TAG_lexical_block ]
!705 = metadata !{i32 147, i32 0, metadata !704, null}
!706 = metadata !{i32 150, i32 0, metadata !704, null}
!707 = metadata !{i32 153, i32 0, metadata !704, null}
!708 = metadata !{i32 56, i32 0, metadata !709, null}
!709 = metadata !{i32 524299, metadata !19, i32 55, i32 0, metadata !20, i32 2} ; [ DW_TAG_lexical_block ]
!710 = metadata !{i32 160, i32 0, metadata !711, null}
!711 = metadata !{i32 524299, metadata !25, i32 156, i32 0, metadata !14, i32 3} ; [ DW_TAG_lexical_block ]
!712 = metadata !{i32 161, i32 0, metadata !711, null}
!713 = metadata !{i32 162, i32 0, metadata !711, null}
!714 = metadata !{i32 163, i32 0, metadata !711, null}
!715 = metadata !{i32 165, i32 0, metadata !711, null}
!716 = metadata !{i32 166, i32 0, metadata !711, null}
!717 = metadata !{i32 168, i32 0, metadata !711, null}
!718 = metadata !{i32 191, i32 0, metadata !719, null}
!719 = metadata !{i32 524299, metadata !28, i32 188, i32 0, metadata !14, i32 4} ; [ DW_TAG_lexical_block ]
!720 = metadata !{i32 193, i32 0, metadata !719, null}
!721 = metadata !{i32 197, i32 0, metadata !719, null}
!722 = metadata !{i32 239, i32 0, metadata !719, null}
!723 = metadata !{i32 192, i32 0, metadata !719, null}
!724 = metadata !{i32 263, i32 0, metadata !725, null}
!725 = metadata !{i32 524299, metadata !31, i32 252, i32 0, metadata !14, i32 5} ; [ DW_TAG_lexical_block ]
!726 = metadata !{i32 264, i32 0, metadata !725, null}
!727 = metadata !{i32 266, i32 0, metadata !725, null}
!728 = metadata !{i32 267, i32 0, metadata !725, null}
!729 = metadata !{i32 268, i32 0, metadata !725, null}
!730 = metadata !{i32 288, i32 0, metadata !731, null}
!731 = metadata !{i32 524299, metadata !32, i32 281, i32 0, metadata !14, i32 6} ; [ DW_TAG_lexical_block ]
!732 = metadata !{i32 291, i32 0, metadata !731, null}
!733 = metadata !{i32 294, i32 0, metadata !731, null}
!734 = metadata !{i32 298, i32 0, metadata !731, null}
!735 = metadata !{i32 300, i32 0, metadata !731, null}
!736 = metadata !{i32 305, i32 0, metadata !731, null}
!737 = metadata !{i32 306, i32 0, metadata !731, null}
!738 = metadata !{i32 307, i32 0, metadata !731, null}
!739 = metadata !{i32 308, i32 0, metadata !731, null}
!740 = metadata !{i32 312, i32 0, metadata !741, null}
!741 = metadata !{i32 524299, metadata !731, i32 312, i32 0, metadata !14, i32 7} ; [ DW_TAG_lexical_block ]
!742 = metadata !{i32 313, i32 0, metadata !741, null}
!743 = metadata !{i32 314, i32 0, metadata !741, null}
!744 = metadata !{i32 316, i32 0, metadata !741, null}
!745 = metadata !{i32 311, i32 0, metadata !731, null}
!746 = metadata !{i32 323, i32 0, metadata !731, null}
!747 = metadata !{i32 327, i32 0, metadata !731, null}
!748 = metadata !{i32 331, i32 0, metadata !731, null}
!749 = metadata !{i32 336, i32 0, metadata !731, null}
!750 = metadata !{i32 337, i32 0, metadata !731, null}
!751 = metadata !{i32 338, i32 0, metadata !731, null}
!752 = metadata !{i32 350, i32 0, metadata !731, null}
!753 = metadata !{i32 355, i32 0, metadata !731, null}
!754 = metadata !{i32 371, i32 0, metadata !731, null}
!755 = metadata !{i32 372, i32 0, metadata !731, null}
!756 = metadata !{i32 392, i32 0, metadata !731, null}
!757 = metadata !{i32 393, i32 0, metadata !731, null}
!758 = metadata !{i32 396, i32 0, metadata !731, null}
!759 = metadata !{i32 397, i32 0, metadata !731, null}
!760 = metadata !{i32 402, i32 0, metadata !731, null}
!761 = metadata !{i32 21, i32 0, metadata !43, null}
!762 = metadata !{i32 34, i32 0, metadata !763, null}
!763 = metadata !{i32 524299, metadata !43, i32 21, i32 0, metadata !44, i32 0} ; [ DW_TAG_lexical_block ]
!764 = metadata !{i32 37, i32 0, metadata !763, null}
!765 = metadata !{i32 18, i32 0, metadata !766, null}
!766 = metadata !{i32 524299, metadata !52, i32 17, i32 0, metadata !55, i32 0} ; [ DW_TAG_lexical_block ]
!767 = metadata !{i32 20, i32 0, metadata !766, null}
!768 = metadata !{i32 12, i32 0, metadata !769, null}
!769 = metadata !{i32 524299, metadata !59, i32 11, i32 0, metadata !60, i32 0} ; [ DW_TAG_lexical_block ]
!770 = metadata !{i32 13, i32 0, metadata !771, null}
!771 = metadata !{i32 524299, metadata !66, i32 12, i32 0, metadata !67, i32 0} ; [ DW_TAG_lexical_block ]
!772 = metadata !{i32 24, i32 0, metadata !773, null}
!773 = metadata !{i32 524299, metadata !73, i32 20, i32 0, metadata !76, i32 0} ; [ DW_TAG_lexical_block ]
!774 = metadata !{i32 25, i32 0, metadata !773, null}
!775 = metadata !{i32 26, i32 0, metadata !773, null}
!776 = metadata !{i32 31, i32 0, metadata !773, null}
!777 = metadata !{i32 34, i32 0, metadata !773, null}
!778 = metadata !{i32 35, i32 0, metadata !773, null}
!779 = metadata !{i32 38, i32 0, metadata !773, null}
!780 = metadata !{i32 40, i32 0, metadata !773, null}
!781 = metadata !{i32 49, i32 0, metadata !773, null}
!782 = metadata !{i32 51, i32 0, metadata !773, null}
!783 = metadata !{i32 52, i32 0, metadata !773, null}
!784 = metadata !{i32 55, i32 0, metadata !773, null}
!785 = metadata !{i32 62, i32 0, metadata !786, null}
!786 = metadata !{i32 524299, metadata !773, i32 62, i32 0, metadata !76, i32 1} ; [ DW_TAG_lexical_block ]
!787 = metadata !{i32 63, i32 0, metadata !786, null}
!788 = metadata !{i32 67, i32 0, metadata !773, null}
!789 = metadata !{i32 71, i32 0, metadata !773, null}
!790 = metadata !{i32 258, i32 0, metadata !791, null}
!791 = metadata !{i32 524299, metadata !114, i32 211, i32 0, metadata !115, i32 0} ; [ DW_TAG_lexical_block ]
!792 = metadata !{i32 261, i32 0, metadata !791, null}
!793 = metadata !{i32 262, i32 0, metadata !791, null}
!794 = metadata !{i32 274, i32 0, metadata !791, null}
!795 = metadata !{i32 280, i32 0, metadata !796, null}
!796 = metadata !{i32 524299, metadata !118, i32 278, i32 0, metadata !115, i32 1} ; [ DW_TAG_lexical_block ]
!797 = metadata !{i32 282, i32 0, metadata !796, null}
!798 = metadata !{i32 283, i32 0, metadata !796, null}
!799 = metadata !{i32 284, i32 0, metadata !796, null}
!800 = metadata !{i32 291, i32 0, metadata !796, null}
!801 = metadata !{i32 322, i32 0, metadata !802, null}
!802 = metadata !{i32 524299, metadata !123, i32 319, i32 0, metadata !126, i32 0} ; [ DW_TAG_lexical_block ]
!803 = metadata !{i32 323, i32 0, metadata !802, null}
!804 = metadata !{i32 327, i32 0, metadata !802, null}
!805 = metadata !{i32 334, i32 0, metadata !802, null}
!806 = metadata !{i32 336, i32 0, metadata !802, null}
!807 = metadata !{i32 20, i32 0, metadata !808, null}
!808 = metadata !{i32 524299, metadata !130, i32 19, i32 0, metadata !131, i32 0} ; [ DW_TAG_lexical_block ]
!809 = metadata !{i32 21, i32 0, metadata !808, null}
!810 = metadata !{i32 29, i32 0, metadata !808, null}
!811 = metadata !{i32 30, i32 0, metadata !808, null}
!812 = metadata !{i32 28, i32 0, metadata !808, null}
!813 = metadata !{i32 34, i32 0, metadata !808, null}
!814 = metadata !{i32 19, i32 0, metadata !815, null}
!815 = metadata !{i32 524299, metadata !139, i32 18, i32 0, metadata !140, i32 0} ; [ DW_TAG_lexical_block ]
!816 = metadata !{i32 28, i32 0, metadata !815, null}
!817 = metadata !{i32 29, i32 0, metadata !815, null}
!818 = metadata !{i32 27, i32 0, metadata !815, null}
!819 = metadata !{i32 32, i32 0, metadata !815, null}
!820 = metadata !{i32 117, i32 0, metadata !149, null}
!821 = metadata !{i32 117, i32 0, metadata !822, null}
!822 = metadata !{i32 524299, metadata !149, i32 117, i32 0, metadata !152, i32 0} ; [ DW_TAG_lexical_block ]
!823 = metadata !{i32 118, i32 0, metadata !165, null}
!824 = metadata !{i32 118, i32 0, metadata !825, null}
!825 = metadata !{i32 524299, metadata !165, i32 118, i32 0, metadata !152, i32 1} ; [ DW_TAG_lexical_block ]
!826 = metadata !{i32 119, i32 0, metadata !166, null}
!827 = metadata !{i32 119, i32 0, metadata !828, null}
!828 = metadata !{i32 524299, metadata !166, i32 119, i32 0, metadata !152, i32 2} ; [ DW_TAG_lexical_block ]
!829 = metadata !{i32 44, i32 0, metadata !830, null}
!830 = metadata !{i32 524299, metadata !167, i32 35, i32 0, metadata !168, i32 0} ; [ DW_TAG_lexical_block ]
!831 = metadata !{i32 47, i32 0, metadata !830, null}
!832 = metadata !{i32 49, i32 0, metadata !830, null}
!833 = metadata !{i32 51, i32 0, metadata !830, null}
!834 = metadata !{i32 52, i32 0, metadata !830, null}
!835 = metadata !{i32 62, i32 0, metadata !830, null}
!836 = metadata !{i32 63, i32 0, metadata !830, null}
!837 = metadata !{i32 70, i32 0, metadata !830, null}
!838 = metadata !{i32 73, i32 0, metadata !830, null}
!839 = metadata !{i32 76, i32 0, metadata !840, null}
!840 = metadata !{i32 524299, metadata !830, i32 76, i32 0, metadata !168, i32 1} ; [ DW_TAG_lexical_block ]
!841 = metadata !{i32 77, i32 0, metadata !840, null}
!842 = metadata !{i32 80, i32 0, metadata !840, null}
!843 = metadata !{i32 83, i32 0, metadata !840, null}
!844 = metadata !{i32 88, i32 0, metadata !840, null}
!845 = metadata !{i32 89, i32 0, metadata !840, null}
!846 = metadata !{i32 90, i32 0, metadata !840, null}
!847 = metadata !{i32 92, i32 0, metadata !840, null}
!848 = metadata !{i32 94, i32 0, metadata !840, null}
!849 = metadata !{i32 99, i32 0, metadata !830, null}
!850 = metadata !{i32 23, i32 0, metadata !851, null}
!851 = metadata !{i32 524299, metadata !209, i32 18, i32 0, metadata !210, i32 0} ; [ DW_TAG_lexical_block ]
!852 = metadata !{i32 24, i32 0, metadata !851, null}
!853 = metadata !{i32 25, i32 0, metadata !851, null}
!854 = metadata !{i32 28, i32 0, metadata !851, null}
!855 = metadata !{i32 35, i32 0, metadata !856, null}
!856 = metadata !{i32 524299, metadata !249, i32 30, i32 0, metadata !250, i32 0} ; [ DW_TAG_lexical_block ]
!857 = metadata !{i32 36, i32 0, metadata !856, null}
!858 = metadata !{i32 40, i32 0, metadata !856, null}
!859 = metadata !{i32 44, i32 0, metadata !856, null}
!860 = metadata !{i32 48, i32 0, metadata !856, null}
!861 = metadata !{i32 50, i32 0, metadata !856, null}
!862 = metadata !{i32 52, i32 0, metadata !856, null}
!863 = metadata !{i32 54, i32 0, metadata !856, null}
!864 = metadata !{i32 57, i32 0, metadata !856, null}
!865 = metadata !{i32 58, i32 0, metadata !856, null}
!866 = metadata !{i32 67, i32 0, metadata !856, null}
!867 = metadata !{i32 82, i32 0, metadata !856, null}
!868 = metadata !{i32 83, i32 0, metadata !856, null}
!869 = metadata !{i32 85, i32 0, metadata !856, null}
!870 = metadata !{i32 88, i32 0, metadata !856, null}
!871 = metadata !{i32 89, i32 0, metadata !856, null}
!872 = metadata !{i32 90, i32 0, metadata !856, null}
!873 = metadata !{i32 94, i32 0, metadata !856, null}
!874 = metadata !{i32 30, i32 0, metadata !875, null}
!875 = metadata !{i32 524299, metadata !287, i32 27, i32 0, metadata !288, i32 0} ; [ DW_TAG_lexical_block ]
!876 = metadata !{i32 17, i32 0, metadata !877, null}
!877 = metadata !{i32 524299, metadata !293, i32 16, i32 0, metadata !294, i32 0} ; [ DW_TAG_lexical_block ]
!878 = metadata !{i32 47, i32 0, metadata !879, null}
!879 = metadata !{i32 524299, metadata !299, i32 43, i32 0, metadata !300, i32 0} ; [ DW_TAG_lexical_block ]
!880 = metadata !{i32 48, i32 0, metadata !879, null}
!881 = metadata !{i32 49, i32 0, metadata !879, null}
!882 = metadata !{i32 50, i32 0, metadata !879, null}
!883 = metadata !{i32 52, i32 0, metadata !879, null}
!884 = metadata !{i32 58, i32 0, metadata !879, null}
!885 = metadata !{i32 62, i32 0, metadata !879, null}
!886 = metadata !{i32 63, i32 0, metadata !879, null}
!887 = metadata !{i32 64, i32 0, metadata !879, null}
!888 = metadata !{i32 65, i32 0, metadata !879, null}
!889 = metadata !{i32 67, i32 0, metadata !879, null}
!890 = metadata !{i32 71, i32 0, metadata !879, null}
!891 = metadata !{i32 28, i32 0, metadata !892, null}
!892 = metadata !{i32 524299, metadata !397, i32 25, i32 0, metadata !398, i32 0} ; [ DW_TAG_lexical_block ]
!893 = metadata !{i32 43, i32 0, metadata !894, null}
!894 = metadata !{i32 524299, metadata !436, i32 39, i32 0, metadata !437, i32 0} ; [ DW_TAG_lexical_block ]
!895 = metadata !{i32 45, i32 0, metadata !894, null}
!896 = metadata !{i32 46, i32 0, metadata !894, null}
!897 = metadata !{i32 47, i32 0, metadata !894, null}
!898 = metadata !{i32 48, i32 0, metadata !894, null}
!899 = metadata !{i32 49, i32 0, metadata !894, null}
!900 = metadata !{i32 61, i32 0, metadata !894, null}
!901 = metadata !{i32 79, i32 0, metadata !894, null}
!902 = metadata !{i32 32, i32 0, metadata !903, null}
!903 = metadata !{i32 524299, metadata !462, i32 25, i32 0, metadata !465, i32 0} ; [ DW_TAG_lexical_block ]
!904 = metadata !{i32 33, i32 0, metadata !903, null}
!905 = metadata !{i32 36, i32 0, metadata !903, null}
!906 = metadata !{i32 37, i32 0, metadata !903, null}
!907 = metadata !{i32 43, i32 0, metadata !903, null}
!908 = metadata !{i32 51, i32 0, metadata !903, null}
!909 = metadata !{i32 55, i32 0, metadata !903, null}
!910 = metadata !{i32 56, i32 0, metadata !903, null}
!911 = metadata !{i32 57, i32 0, metadata !903, null}
!912 = metadata !{i32 62, i32 0, metadata !903, null}
!913 = metadata !{i32 65, i32 0, metadata !903, null}
!914 = metadata !{i32 68, i32 0, metadata !903, null}
!915 = metadata !{i32 76, i32 0, metadata !903, null}
!916 = metadata !{i32 22, i32 0, metadata !917, null}
!917 = metadata !{i32 524299, metadata !504, i32 21, i32 0, metadata !505, i32 0} ; [ DW_TAG_lexical_block ]
!918 = metadata !{i32 23, i32 0, metadata !917, null}
!919 = metadata !{i32 31, i32 0, metadata !917, null}
!920 = metadata !{i32 32, i32 0, metadata !917, null}
!921 = metadata !{i32 30, i32 0, metadata !917, null}
!922 = metadata !{i32 36, i32 0, metadata !917, null}
!923 = metadata !{i32 25, i32 0, metadata !924, null}
!924 = metadata !{i32 524299, metadata !513, i32 21, i32 0, metadata !514, i32 0} ; [ DW_TAG_lexical_block ]
!925 = metadata !{i32 26, i32 0, metadata !924, null}
!926 = metadata !{i32 30, i32 0, metadata !924, null}
!927 = metadata !{i32 34, i32 0, metadata !924, null}
!928 = metadata !{i32 35, i32 0, metadata !924, null}
!929 = metadata !{i32 37, i32 0, metadata !924, null}
!930 = metadata !{i32 38, i32 0, metadata !924, null}
!931 = metadata !{i32 39, i32 0, metadata !924, null}
!932 = metadata !{i32 45, i32 0, metadata !924, null}
!933 = metadata !{i32 50, i32 0, metadata !924, null}
!934 = metadata !{i32 59, i32 0, metadata !924, null}
!935 = metadata !{i32 60, i32 0, metadata !924, null}
!936 = metadata !{i32 63, i32 0, metadata !924, null}
!937 = metadata !{i32 64, i32 0, metadata !924, null}
!938 = metadata !{i32 67, i32 0, metadata !924, null}
!939 = metadata !{i32 66, i32 0, metadata !940, null}
!940 = metadata !{i32 524299, metadata !554, i32 62, i32 0, metadata !555, i32 0} ; [ DW_TAG_lexical_block ]
!941 = metadata !{i32 71, i32 0, metadata !940, null}
!942 = metadata !{i32 13, i32 0, metadata !943, null}
!943 = metadata !{i32 524299, metadata !604, i32 12, i32 0, metadata !605, i32 0} ; [ DW_TAG_lexical_block ]
!944 = metadata !{i32 14, i32 0, metadata !943, null}
!945 = metadata !{i32 15, i32 0, metadata !943, null}
