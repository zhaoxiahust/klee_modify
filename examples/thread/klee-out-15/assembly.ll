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
@__libc_stack_end = global i8* null
@__uclibc_progname = hidden global i8* null
@__environ = global i8** null
@__pagesize = global i64 0
@.str4 = private constant [10 x i8] c"/dev/null\00", align 1
@been_there_done_that.2846 = internal global i32 0
@__app_fini = hidden global void ()* null
@__rtld_fini = hidden global void ()* null
@been_there_done_that = internal global i32 0
@_stdio_streams = internal global [3 x %struct.FILE] [%struct.FILE { i16 544, [2 x i8] zeroinitializer, i32 0, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i
@stdin = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0)
@stdout = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1)
@stderr = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 2)
@__stdin = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0)
@__stdout = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1)
@_stdio_openlist = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0)
@__exit_cleanup = hidden global void (i32)* null
@errno = global i32 0
@h_errno = global i32 0
@.str32 = private constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str133 = private constant [15 x i8] c"divide by zero\00", align 1
@.str234 = private constant [8 x i8] c"div.err\00", align 1

@__progname = alias i8** @__uclibc_progname
@environ = alias weak i8*** @__environ
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
  %0 = call i32 (...)* @klee_make_symbolic(i32* %m, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !676
  %1 = load i32* %m, align 4, !dbg !678
  %2 = icmp eq i32 %1, 0, !dbg !678
  br i1 %2, label %bb, label %bb1, !dbg !678

bb:                                               ; preds = %entry
  %3 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !679
  br label %return, !dbg !679

bb1:                                              ; preds = %entry
  %4 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !680
  br label %return, !dbg !680

return:                                           ; preds = %bb, %bb1
  %retval3 = load i8** %retval, !dbg !681
  ret i8* %retval3, !dbg !681
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
  %0 = call i32 (...)* @klee_make_symbolic(i32* %m, i64 4, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) nounwind, !dbg !682
  %1 = load i32* %m, align 4, !dbg !684
  %2 = icmp eq i32 %1, 77, !dbg !684
  br i1 %2, label %bb, label %bb1, !dbg !684

bb:                                               ; preds = %entry
  %3 = call i32 @putchar_unlocked(i32 104) nounwind, !dbg !685
  br label %bb1, !dbg !685

bb1:                                              ; preds = %bb, %entry
  %4 = load i64* %thread, align 8, !dbg !686
  %5 = call i32 @pthread_join(i64 %4, i8** null) nounwind, !dbg !686
  %retval2 = load i32* %retval, !dbg !687
  ret i32 %retval2, !dbg !687
}

declare i32 @pthread_join(i64, i8**)

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
  %0 = load i32* %fd_addr, align 4, !dbg !688
  %1 = call i32 (i32, i32, ...)* @fcntl(i32 %0, i32 1) nounwind, !dbg !688
  %2 = icmp ne i32 %1, -1, !dbg !688
  br i1 %2, label %bb2, label %bb, !dbg !688

bb:                                               ; preds = %entry
  %3 = call i32* @__errno_location() nounwind readnone, !dbg !688
  %4 = load i32* %3, align 4, !dbg !688
  %5 = icmp ne i32 %4, 9, !dbg !688
  br i1 %5, label %bb2, label %bb1, !dbg !688

bb1:                                              ; preds = %bb
  store i32 1, i32* %iftmp.0, align 4, !dbg !688
  br label %bb3, !dbg !688

bb2:                                              ; preds = %bb, %entry
  store i32 0, i32* %iftmp.0, align 4, !dbg !688
  br label %bb3, !dbg !688

bb3:                                              ; preds = %bb2, %bb1
  %6 = load i32* %iftmp.0, align 4, !dbg !688
  %7 = sext i32 %6 to i64, !dbg !688
  %8 = icmp ne i64 %7, 0, !dbg !688
  br i1 %8, label %bb4, label %return, !dbg !688

bb4:                                              ; preds = %bb3
  %9 = load i32* %mode_addr, align 4, !dbg !690
  %10 = call i32 (i8*, i32, ...)* @open(i8* getelementptr inbounds ([10 x i8]* @.str4, i64 0, i64 0), i32 %9) nounwind, !dbg !690
  store i32 %10, i32* %nullfd, align 4, !dbg !690
  %11 = load i32* %nullfd, align 4, !dbg !692
  %12 = load i32* %fd_addr, align 4, !dbg !692
  %13 = icmp ne i32 %11, %12, !dbg !692
  br i1 %13, label %bb8, label %bb5, !dbg !692

bb5:                                              ; preds = %bb4
  %14 = load i32* %fd_addr, align 4, !dbg !692
  %15 = call i32 @fstat(i32 %14, %struct.stat* %st) nounwind, !dbg !692
  %16 = icmp ne i32 %15, 0, !dbg !692
  br i1 %16, label %bb8, label %bb6, !dbg !692

bb6:                                              ; preds = %bb5
  %17 = getelementptr inbounds %struct.stat* %st, i32 0, i32 3, !dbg !692
  %18 = load i32* %17, align 8, !dbg !692
  %19 = and i32 %18, 61440, !dbg !692
  %20 = icmp ne i32 %19, 8192, !dbg !692
  br i1 %20, label %bb8, label %bb7, !dbg !692

bb7:                                              ; preds = %bb6
  %21 = getelementptr inbounds %struct.stat* %st, i32 0, i32 7, !dbg !692
  %22 = load i64* %21, align 8, !dbg !692
  %23 = call i64 @gnu_dev_makedev(i32 1, i32 3) nounwind, !dbg !692
  %24 = icmp ne i64 %22, %23, !dbg !692
  br i1 %24, label %bb8, label %return, !dbg !692

bb8:                                              ; preds = %bb7, %bb6, %bb5, %bb4
  call void @abort() noreturn nounwind, !dbg !693
  unreachable, !dbg !693

return:                                           ; preds = %bb3, %bb7
  ret void, !dbg !694
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
  %1 = load i32* %__minor_addr, align 4, !dbg !695
  %2 = and i32 %1, 255, !dbg !695
  %3 = load i32* %__major_addr, align 4, !dbg !695
  %4 = and i32 %3, 4095, !dbg !695
  %5 = shl i32 %4, 8, !dbg !695
  %6 = or i32 %2, %5, !dbg !695
  %7 = zext i32 %6 to i64, !dbg !695
  %8 = load i32* %__minor_addr, align 4, !dbg !695
  %9 = zext i32 %8 to i64, !dbg !695
  %10 = and i64 %9, 4294967040, !dbg !695
  %11 = shl i64 %10, 12, !dbg !695
  %12 = or i64 %7, %11, !dbg !695
  %13 = load i32* %__major_addr, align 4, !dbg !695
  %14 = zext i32 %13 to i64, !dbg !695
  %15 = and i64 %14, 4294963200, !dbg !695
  %16 = shl i64 %15, 32, !dbg !695
  %17 = or i64 %12, %16, !dbg !695
  store i64 %17, i64* %0, align 8, !dbg !695
  %18 = load i64* %0, align 8, !dbg !695
  store i64 %18, i64* %retval, align 8, !dbg !695
  %retval1 = load i64* %retval, !dbg !695
  ret i64 %retval1, !dbg !695
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
  %1 = call i32 @getuid() nounwind, !dbg !697
  store i32 %1, i32* %uid, align 4, !dbg !697
  %2 = call i32 @geteuid() nounwind, !dbg !699
  store i32 %2, i32* %euid, align 4, !dbg !699
  %3 = call i32 @getgid() nounwind, !dbg !700
  store i32 %3, i32* %gid, align 4, !dbg !700
  %4 = call i32 @getegid() nounwind, !dbg !701
  store i32 %4, i32* %egid, align 4, !dbg !701
  %5 = load i32* %uid, align 4, !dbg !702
  %6 = load i32* %euid, align 4, !dbg !702
  %7 = icmp eq i32 %5, %6, !dbg !702
  br i1 %7, label %bb, label %bb2, !dbg !702

bb:                                               ; preds = %entry
  %8 = load i32* %gid, align 4, !dbg !702
  %9 = load i32* %egid, align 4, !dbg !702
  %10 = icmp eq i32 %8, %9, !dbg !702
  br i1 %10, label %bb1, label %bb2, !dbg !702

bb1:                                              ; preds = %bb
  store i32 0, i32* %0, align 4, !dbg !703
  br label %bb3, !dbg !703

bb2:                                              ; preds = %bb, %entry
  store i32 1, i32* %0, align 4, !dbg !704
  br label %bb3, !dbg !704

bb3:                                              ; preds = %bb2, %bb1
  %11 = load i32* %0, align 4, !dbg !703
  store i32 %11, i32* %retval, align 4, !dbg !703
  %retval4 = load i32* %retval, !dbg !703
  ret i32 %retval4, !dbg !703
}

declare i32 @getuid() nounwind

declare i32 @geteuid() nounwind

declare i32 @getgid() nounwind

declare i32 @getegid() nounwind

define void @__uClibc_init() nounwind {
entry:
  %0 = load i32* @been_there_done_that.2846, align 4, !dbg !705
  %1 = icmp ne i32 %0, 0, !dbg !705
  br i1 %1, label %return, label %bb, !dbg !705

bb:                                               ; preds = %entry
  %2 = load i32* @been_there_done_that.2846, align 4, !dbg !707
  %3 = add nsw i32 %2, 1, !dbg !707
  store i32 %3, i32* @been_there_done_that.2846, align 4, !dbg !707
  store i64 4096, i64* @__pagesize, align 8, !dbg !708
  call void @_stdio_init() nounwind, !dbg !709
  ret void, !dbg !710

return:                                           ; preds = %entry
  ret void, !dbg !710
}

define void @__uClibc_fini() nounwind {
entry:
  %0 = load void ()** @__app_fini, align 8, !dbg !711
  %1 = icmp ne void ()* %0, null, !dbg !711
  br i1 %1, label %bb, label %bb1, !dbg !711

bb:                                               ; preds = %entry
  %2 = load void ()** @__app_fini, align 8, !dbg !713
  call void %2() nounwind, !dbg !713
  br label %bb1, !dbg !713

bb1:                                              ; preds = %bb, %entry
  %3 = load void ()** @__rtld_fini, align 8, !dbg !714
  %4 = icmp ne void ()* %3, null, !dbg !714
  br i1 %4, label %bb2, label %return, !dbg !714

bb2:                                              ; preds = %bb1
  %5 = load void ()** @__rtld_fini, align 8, !dbg !715
  call void %5() nounwind, !dbg !715
  ret void, !dbg !716

return:                                           ; preds = %bb1
  ret void, !dbg !716
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
  %0 = load i8** %stack_end_addr, align 8, !dbg !717
  store i8* %0, i8** @__libc_stack_end, align 8, !dbg !717
  %1 = load void ()** %rtld_fini_addr, align 8, !dbg !719
  store void ()* %1, void ()** @__rtld_fini, align 8, !dbg !719
  %2 = load i32* %argc_addr, align 4, !dbg !720
  %3 = add nsw i32 %2, 1, !dbg !720
  %4 = load i8*** %argv_addr, align 8, !dbg !720
  %5 = sext i32 %3 to i64, !dbg !720
  %6 = getelementptr inbounds i8** %4, i64 %5, !dbg !720
  store i8** %6, i8*** @__environ, align 8, !dbg !720
  %7 = load i8*** %argv_addr, align 8, !dbg !721
  %8 = load i8** %7, align 8, !dbg !721
  %9 = load i8*** @__environ, align 8, !dbg !721
  %10 = bitcast i8** %9 to i8*, !dbg !721
  %11 = icmp eq i8* %8, %10, !dbg !721
  br i1 %11, label %bb, label %bb1, !dbg !721

bb:                                               ; preds = %entry
  %12 = load i8*** %argv_addr, align 8, !dbg !722
  %13 = load i32* %argc_addr, align 4, !dbg !722
  %14 = sext i32 %13 to i64, !dbg !722
  %15 = getelementptr inbounds i8** %12, i64 %14, !dbg !722
  store i8** %15, i8*** @__environ, align 8, !dbg !722
  br label %bb1, !dbg !722

bb1:                                              ; preds = %bb, %entry
  %auxvt2 = bitcast [15 x %struct.Elf64_auxv_t]* %auxvt to %struct.Elf64_auxv_t*, !dbg !723
  %auxvt23 = bitcast %struct.Elf64_auxv_t* %auxvt2 to i8*, !dbg !723
  %16 = call i8* @memset(i8* %auxvt23, i32 0, i64 240) nounwind, !dbg !723
  %17 = load i8*** @__environ, align 8, !dbg !724
  %18 = bitcast i8** %17 to i64*, !dbg !724
  store i64* %18, i64** %aux_dat, align 8, !dbg !724
  br label %bb5, !dbg !724

bb5:                                              ; preds = %bb5, %bb1
  %19 = load i64** %aux_dat, align 8, !dbg !725
  %20 = load i64* %19, align 8, !dbg !725
  %21 = icmp ne i64 %20, 0, !dbg !725
  %22 = load i64** %aux_dat, align 8, !dbg !726
  %23 = getelementptr inbounds i64* %22, i64 1, !dbg !726
  store i64* %23, i64** %aux_dat, align 8, !dbg !726
  br i1 %21, label %bb5, label %bb10, !dbg !725

bb7:                                              ; preds = %bb10
  %24 = load i64** %aux_dat, align 8, !dbg !727
  %25 = bitcast i64* %24 to %struct.Elf64_auxv_t*, !dbg !727
  store %struct.Elf64_auxv_t* %25, %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !727
  %26 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !729
  %27 = getelementptr inbounds %struct.Elf64_auxv_t* %26, i32 0, i32 0, !dbg !729
  %28 = load i64* %27, align 8, !dbg !729
  %29 = icmp ule i64 %28, 14, !dbg !729
  br i1 %29, label %bb8, label %bb9, !dbg !729

bb8:                                              ; preds = %bb7
  %30 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !730
  %31 = getelementptr inbounds %struct.Elf64_auxv_t* %30, i32 0, i32 0, !dbg !730
  %32 = load i64* %31, align 8, !dbg !730
  %33 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 %32, !dbg !730
  %34 = bitcast %struct.Elf64_auxv_t* %33 to i8*, !dbg !730
  %35 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !730
  %36 = bitcast %struct.Elf64_auxv_t* %35 to i8*, !dbg !730
  %37 = call i8* @memcpy(i8* noalias %34, i8* noalias %36, i64 16) nounwind, !dbg !730
  br label %bb9, !dbg !730

bb9:                                              ; preds = %bb8, %bb7
  %38 = load i64** %aux_dat, align 8, !dbg !731
  %39 = getelementptr inbounds i64* %38, i64 2, !dbg !731
  store i64* %39, i64** %aux_dat, align 8, !dbg !731
  br label %bb10, !dbg !731

bb10:                                             ; preds = %bb5, %bb9
  %40 = load i64** %aux_dat, align 8, !dbg !732
  %41 = load i64* %40, align 8, !dbg !732
  %42 = icmp ne i64 %41, 0, !dbg !732
  br i1 %42, label %bb7, label %bb11, !dbg !732

bb11:                                             ; preds = %bb10
  call void @__uClibc_init() nounwind, !dbg !733
  %43 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 6, !dbg !734
  %44 = getelementptr inbounds %struct.Elf64_auxv_t* %43, i32 0, i32 1, !dbg !734
  %45 = getelementptr inbounds %union.anon* %44, i32 0, i32 0, !dbg !734
  %46 = load i64* %45, align 8, !dbg !734
  %47 = icmp ne i64 %46, 0, !dbg !734
  br i1 %47, label %bb12, label %bb13, !dbg !734

bb12:                                             ; preds = %bb11
  %48 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 6, !dbg !734
  %49 = getelementptr inbounds %struct.Elf64_auxv_t* %48, i32 0, i32 1, !dbg !734
  %50 = getelementptr inbounds %union.anon* %49, i32 0, i32 0, !dbg !734
  %51 = load i64* %50, align 8, !dbg !734
  store i64 %51, i64* %iftmp.10, align 8, !dbg !734
  br label %bb14, !dbg !734

bb13:                                             ; preds = %bb11
  store i64 4096, i64* %iftmp.10, align 8, !dbg !734
  br label %bb14, !dbg !734

bb14:                                             ; preds = %bb13, %bb12
  %52 = load i64* %iftmp.10, align 8, !dbg !734
  store i64 %52, i64* @__pagesize, align 8, !dbg !734
  %53 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !735
  %54 = getelementptr inbounds %struct.Elf64_auxv_t* %53, i32 0, i32 1, !dbg !735
  %55 = getelementptr inbounds %union.anon* %54, i32 0, i32 0, !dbg !735
  %56 = load i64* %55, align 8, !dbg !735
  %57 = icmp ne i64 %56, -1, !dbg !735
  br i1 %57, label %bb16, label %bb15, !dbg !735

bb15:                                             ; preds = %bb14
  %58 = call i32 @__check_suid() nounwind, !dbg !735
  %59 = icmp ne i32 %58, 0, !dbg !735
  br i1 %59, label %bb19, label %bb16, !dbg !735

bb16:                                             ; preds = %bb15, %bb14
  %60 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !735
  %61 = getelementptr inbounds %struct.Elf64_auxv_t* %60, i32 0, i32 1, !dbg !735
  %62 = getelementptr inbounds %union.anon* %61, i32 0, i32 0, !dbg !735
  %63 = load i64* %62, align 8, !dbg !735
  %64 = icmp eq i64 %63, -1, !dbg !735
  br i1 %64, label %bb20, label %bb17, !dbg !735

bb17:                                             ; preds = %bb16
  %65 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !735
  %66 = getelementptr inbounds %struct.Elf64_auxv_t* %65, i32 0, i32 1, !dbg !735
  %67 = getelementptr inbounds %union.anon* %66, i32 0, i32 0, !dbg !735
  %68 = load i64* %67, align 8, !dbg !735
  %69 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 12, !dbg !735
  %70 = getelementptr inbounds %struct.Elf64_auxv_t* %69, i32 0, i32 1, !dbg !735
  %71 = getelementptr inbounds %union.anon* %70, i32 0, i32 0, !dbg !735
  %72 = load i64* %71, align 8, !dbg !735
  %73 = icmp ne i64 %68, %72, !dbg !735
  br i1 %73, label %bb19, label %bb18, !dbg !735

bb18:                                             ; preds = %bb17
  %74 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 13, !dbg !735
  %75 = getelementptr inbounds %struct.Elf64_auxv_t* %74, i32 0, i32 1, !dbg !735
  %76 = getelementptr inbounds %union.anon* %75, i32 0, i32 0, !dbg !735
  %77 = load i64* %76, align 8, !dbg !735
  %78 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 14, !dbg !735
  %79 = getelementptr inbounds %struct.Elf64_auxv_t* %78, i32 0, i32 1, !dbg !735
  %80 = getelementptr inbounds %union.anon* %79, i32 0, i32 0, !dbg !735
  %81 = load i64* %80, align 8, !dbg !735
  %82 = icmp ne i64 %77, %81, !dbg !735
  br i1 %82, label %bb19, label %bb20, !dbg !735

bb19:                                             ; preds = %bb18, %bb17, %bb15
  call void @__check_one_fd(i32 0, i32 131072) nounwind, !dbg !736
  call void @__check_one_fd(i32 1, i32 131074) nounwind, !dbg !737
  call void @__check_one_fd(i32 2, i32 131074) nounwind, !dbg !738
  br label %bb20, !dbg !738

bb20:                                             ; preds = %bb19, %bb18, %bb16
  %83 = load i8*** %argv_addr, align 8, !dbg !739
  %84 = load i8** %83, align 8, !dbg !739
  store i8* %84, i8** @__uclibc_progname, align 8, !dbg !739
  %85 = load void ()** %app_fini_addr, align 8, !dbg !740
  store void ()* %85, void ()** @__app_fini, align 8, !dbg !740
  %86 = load void ()** %app_init_addr, align 8, !dbg !741
  %87 = icmp ne void ()* %86, null, !dbg !741
  br i1 %87, label %bb21, label %bb22, !dbg !741

bb21:                                             ; preds = %bb20
  %88 = load void ()** %app_init_addr, align 8, !dbg !742
  call void %88() nounwind, !dbg !742
  br label %bb22, !dbg !742

bb22:                                             ; preds = %bb21, %bb20
  %89 = icmp ne i8* bitcast (i32* ()* @__errno_location to i8*), null, !dbg !743
  br i1 %89, label %bb23, label %bb24, !dbg !743

bb23:                                             ; preds = %bb22
  %90 = call i32* @__errno_location() nounwind readnone, !dbg !744
  store i32 0, i32* %90, align 4, !dbg !744
  br label %bb24, !dbg !744

bb24:                                             ; preds = %bb23, %bb22
  %91 = icmp ne i8* bitcast (i32* ()* @__h_errno_location to i8*), null, !dbg !745
  br i1 %91, label %bb25, label %bb26, !dbg !745

bb25:                                             ; preds = %bb24
  %92 = call i32* @__h_errno_location() nounwind readnone, !dbg !746
  store i32 0, i32* %92, align 4, !dbg !746
  br label %bb26, !dbg !746

bb26:                                             ; preds = %bb25, %bb24
  %93 = load i8*** @__environ, align 8, !dbg !747
  %94 = load i32 (i32, i8**, i8**)** %main_addr, align 8, !dbg !747
  %95 = load i32* %argc_addr, align 4, !dbg !747
  %96 = load i8*** %argv_addr, align 8, !dbg !747
  %97 = call i32 %94(i32 %95, i8** %96, i8** %93) nounwind, !dbg !747
  call void @exit(i32 %97) noreturn nounwind, !dbg !747
  unreachable, !dbg !747
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
  %1 = load %struct.FILE** @stdout, align 8, !dbg !748
  store %struct.FILE* %1, %struct.FILE** %stream, align 8, !dbg !748
  %2 = load %struct.FILE** %stream, align 8, !dbg !750
  %3 = getelementptr inbounds %struct.FILE* %2, i32 0, i32 5, !dbg !750
  %4 = load i8** %3, align 8, !dbg !750
  %5 = load %struct.FILE** %stream, align 8, !dbg !750
  %6 = getelementptr inbounds %struct.FILE* %5, i32 0, i32 8, !dbg !750
  %7 = load i8** %6, align 8, !dbg !750
  %8 = icmp ult i8* %4, %7, !dbg !750
  br i1 %8, label %bb, label %bb1, !dbg !750

bb:                                               ; preds = %entry
  %9 = load %struct.FILE** %stream, align 8, !dbg !750
  %10 = getelementptr inbounds %struct.FILE* %9, i32 0, i32 5, !dbg !750
  %11 = load i8** %10, align 8, !dbg !750
  %12 = load i32* %c_addr, align 4, !dbg !750
  %13 = trunc i32 %12 to i8, !dbg !750
  store i8 %13, i8* %11, align 1, !dbg !750
  %14 = load i8* %11, align 1, !dbg !750
  %15 = zext i8 %14 to i32, !dbg !750
  store i32 %15, i32* %iftmp.0, align 4, !dbg !750
  %16 = getelementptr inbounds i8* %11, i64 1, !dbg !750
  %17 = load %struct.FILE** %stream, align 8, !dbg !750
  %18 = getelementptr inbounds %struct.FILE* %17, i32 0, i32 5, !dbg !750
  store i8* %16, i8** %18, align 8, !dbg !750
  br label %bb2, !dbg !750

bb1:                                              ; preds = %entry
  %19 = load i32* %c_addr, align 4, !dbg !750
  %20 = load %struct.FILE** %stream, align 8, !dbg !750
  %21 = call i32 @__fputc_unlocked(i32 %19, %struct.FILE* %20) nounwind, !dbg !750
  store i32 %21, i32* %iftmp.0, align 4, !dbg !750
  br label %bb2, !dbg !750

bb2:                                              ; preds = %bb1, %bb
  %22 = load i32* %iftmp.0, align 4, !dbg !750
  store i32 %22, i32* %0, align 4, !dbg !750
  %23 = load i32* %0, align 4, !dbg !750
  store i32 %23, i32* %retval, align 4, !dbg !750
  %retval3 = load i32* %retval, !dbg !750
  ret i32 %retval3, !dbg !750
}

declare void @abort() noreturn nounwind

declare i32 @sigprocmask(i32, %struct.__sigset_t* noalias, %struct.__sigset_t* noalias) nounwind

declare void @_exit(i32) noreturn

define weak i32* @__errno_location() nounwind readnone {
entry:
  %retval = alloca i32*
  %0 = alloca i32*
  %"alloca point" = bitcast i32 0 to i32
  store i32* @errno, i32** %0, align 8, !dbg !751
  %1 = load i32** %0, align 8, !dbg !751
  store i32* %1, i32** %retval, align 8, !dbg !751
  %retval1 = load i32** %retval, !dbg !751
  ret i32* %retval1, !dbg !751
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
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !753
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 5, !dbg !753
  %3 = load i8** %2, align 8, !dbg !753
  %4 = load %struct.FILE** %stream_addr, align 8, !dbg !753
  %5 = getelementptr inbounds %struct.FILE* %4, i32 0, i32 8, !dbg !753
  %6 = load i8** %5, align 8, !dbg !753
  %7 = icmp ult i8* %3, %6, !dbg !753
  %8 = load %struct.FILE** %stream_addr, align 8, !dbg !755
  br i1 %7, label %bb, label %bb1, !dbg !753

bb:                                               ; preds = %entry
  %9 = getelementptr inbounds %struct.FILE* %8, i32 0, i32 5, !dbg !755
  %10 = load i8** %9, align 8, !dbg !755
  %11 = load i32* %c_addr, align 4, !dbg !755
  %12 = trunc i32 %11 to i8, !dbg !755
  store i8 %12, i8* %10, align 1, !dbg !755
  %13 = getelementptr inbounds i8* %10, i64 1, !dbg !755
  %14 = load %struct.FILE** %stream_addr, align 8, !dbg !755
  %15 = getelementptr inbounds %struct.FILE* %14, i32 0, i32 5, !dbg !755
  store i8* %13, i8** %15, align 8, !dbg !755
  %16 = load i32* %c_addr, align 4, !dbg !756
  %17 = trunc i32 %16 to i8, !dbg !756
  %18 = zext i8 %17 to i32, !dbg !756
  store i32 %18, i32* %0, align 4, !dbg !756
  br label %bb15, !dbg !756

bb1:                                              ; preds = %entry
  %19 = getelementptr inbounds %struct.FILE* %8, i32 0, i32 0, !dbg !757
  %20 = load i16* %19, align 8, !dbg !757
  %21 = zext i16 %20 to i32, !dbg !757
  %22 = and i32 %21, 192, !dbg !757
  %23 = icmp eq i32 %22, 192, !dbg !757
  br i1 %23, label %bb3, label %bb2, !dbg !757

bb2:                                              ; preds = %bb1
  %24 = load %struct.FILE** %stream_addr, align 8, !dbg !757
  %25 = call i32 @__stdio_trans2w_o(%struct.FILE* noalias %24, i32 128) nounwind, !dbg !757
  %26 = icmp eq i32 %25, 0, !dbg !757
  br i1 %26, label %bb3, label %BAD, !dbg !757

bb3:                                              ; preds = %bb2, %bb1
  %27 = load %struct.FILE** %stream_addr, align 8, !dbg !758
  %28 = getelementptr inbounds %struct.FILE* %27, i32 0, i32 2, !dbg !758
  %29 = load i32* %28, align 4, !dbg !758
  %30 = icmp eq i32 %29, -2, !dbg !758
  br i1 %30, label %bb4, label %bb5, !dbg !758

bb4:                                              ; preds = %bb3
  %31 = load i32* %c_addr, align 4, !dbg !759
  %32 = trunc i32 %31 to i8, !dbg !759
  %33 = zext i8 %32 to i32, !dbg !759
  store i32 %33, i32* %0, align 4, !dbg !759
  br label %bb15, !dbg !759

bb5:                                              ; preds = %bb3
  %34 = load %struct.FILE** %stream_addr, align 8, !dbg !760
  %35 = getelementptr inbounds %struct.FILE* %34, i32 0, i32 4, !dbg !760
  %36 = load i8** %35, align 8, !dbg !760
  %37 = load %struct.FILE** %stream_addr, align 8, !dbg !760
  %38 = getelementptr inbounds %struct.FILE* %37, i32 0, i32 3, !dbg !760
  %39 = load i8** %38, align 8, !dbg !760
  %40 = icmp ne i8* %36, %39, !dbg !760
  br i1 %40, label %bb6, label %bb13, !dbg !760

bb6:                                              ; preds = %bb5
  %41 = load %struct.FILE** %stream_addr, align 8, !dbg !761
  %42 = getelementptr inbounds %struct.FILE* %41, i32 0, i32 4, !dbg !761
  %43 = load i8** %42, align 8, !dbg !761
  %44 = load %struct.FILE** %stream_addr, align 8, !dbg !761
  %45 = getelementptr inbounds %struct.FILE* %44, i32 0, i32 5, !dbg !761
  %46 = load i8** %45, align 8, !dbg !761
  %47 = icmp eq i8* %43, %46, !dbg !761
  br i1 %47, label %bb7, label %bb8, !dbg !761

bb7:                                              ; preds = %bb6
  %48 = load %struct.FILE** %stream_addr, align 8, !dbg !761
  %49 = call i64 @__stdio_wcommit(%struct.FILE* noalias %48) nounwind, !dbg !761
  %50 = icmp ne i64 %49, 0, !dbg !761
  br i1 %50, label %BAD, label %bb8, !dbg !761

bb8:                                              ; preds = %bb7, %bb6
  %51 = load %struct.FILE** %stream_addr, align 8, !dbg !762
  %52 = getelementptr inbounds %struct.FILE* %51, i32 0, i32 5, !dbg !762
  %53 = load i8** %52, align 8, !dbg !762
  %54 = load i32* %c_addr, align 4, !dbg !762
  %55 = trunc i32 %54 to i8, !dbg !762
  store i8 %55, i8* %53, align 1, !dbg !762
  %56 = getelementptr inbounds i8* %53, i64 1, !dbg !762
  %57 = load %struct.FILE** %stream_addr, align 8, !dbg !762
  %58 = getelementptr inbounds %struct.FILE* %57, i32 0, i32 5, !dbg !762
  store i8* %56, i8** %58, align 8, !dbg !762
  %59 = load %struct.FILE** %stream_addr, align 8, !dbg !763
  %60 = getelementptr inbounds %struct.FILE* %59, i32 0, i32 0, !dbg !763
  %61 = load i16* %60, align 8, !dbg !763
  %62 = zext i16 %61 to i32, !dbg !763
  %63 = and i32 %62, 256, !dbg !763
  %64 = icmp ne i32 %63, 0, !dbg !763
  br i1 %64, label %bb9, label %bb14, !dbg !763

bb9:                                              ; preds = %bb8
  %65 = load i32* %c_addr, align 4, !dbg !764
  %66 = trunc i32 %65 to i8, !dbg !764
  %67 = icmp eq i8 %66, 10, !dbg !764
  br i1 %67, label %bb10, label %bb14, !dbg !764

bb10:                                             ; preds = %bb9
  %68 = load %struct.FILE** %stream_addr, align 8, !dbg !764
  %69 = call i64 @__stdio_wcommit(%struct.FILE* noalias %68) nounwind, !dbg !764
  %70 = icmp ne i64 %69, 0, !dbg !764
  br i1 %70, label %bb11, label %bb14, !dbg !764

bb11:                                             ; preds = %bb10
  %71 = load %struct.FILE** %stream_addr, align 8, !dbg !765
  %72 = getelementptr inbounds %struct.FILE* %71, i32 0, i32 5, !dbg !765
  %73 = load i8** %72, align 8, !dbg !765
  %74 = getelementptr inbounds i8* %73, i64 -1, !dbg !765
  %75 = load %struct.FILE** %stream_addr, align 8, !dbg !765
  %76 = getelementptr inbounds %struct.FILE* %75, i32 0, i32 5, !dbg !765
  store i8* %74, i8** %76, align 8, !dbg !765
  br label %BAD, !dbg !765

bb13:                                             ; preds = %bb5
  %77 = load i32* %c_addr, align 4, !dbg !766
  %78 = trunc i32 %77 to i8, !dbg !766
  store i8 %78, i8* %uc, align 1, !dbg !766
  %79 = load %struct.FILE** %stream_addr, align 8, !dbg !768
  %80 = call i64 @__stdio_WRITE(%struct.FILE* %79, i8* %uc, i64 1) nounwind, !dbg !768
  %81 = icmp eq i64 %80, 0, !dbg !768
  br i1 %81, label %BAD, label %bb14, !dbg !768

bb14:                                             ; preds = %bb8, %bb9, %bb10, %bb13
  %82 = load i32* %c_addr, align 4, !dbg !769
  %83 = trunc i32 %82 to i8, !dbg !769
  %84 = zext i8 %83 to i32, !dbg !769
  store i32 %84, i32* %0, align 4, !dbg !769
  br label %bb15, !dbg !769

BAD:                                              ; preds = %bb13, %bb11, %bb7, %bb2
  store i32 -1, i32* %0, align 4, !dbg !770
  br label %bb15, !dbg !770

bb15:                                             ; preds = %BAD, %bb14, %bb4, %bb
  %85 = load i32* %0, align 4, !dbg !756
  store i32 %85, i32* %retval, align 4, !dbg !756
  %retval16 = load i32* %retval, !dbg !756
  ret i32 %retval16, !dbg !756
}

define weak i32* @__h_errno_location() nounwind readnone {
entry:
  %retval = alloca i32*
  %0 = alloca i32*
  %"alloca point" = bitcast i32 0 to i32
  store i32* @h_errno, i32** %0, align 8, !dbg !771
  %1 = load i32** %0, align 8, !dbg !771
  store i32* %1, i32** %retval, align 8, !dbg !771
  %retval1 = load i32** %retval, !dbg !771
  ret i32* %retval1, !dbg !771
}

define hidden void @_stdio_term() nounwind {
entry:
  %ptr = alloca %struct.FILE*
  %"alloca point" = bitcast i32 0 to i32
  %0 = load %struct.FILE** @_stdio_openlist, align 8, !dbg !773
  store %struct.FILE* %0, %struct.FILE** %ptr, align 8, !dbg !773
  br label %bb3, !dbg !773

bb:                                               ; preds = %bb3
  %1 = load %struct.FILE** %ptr, align 8, !dbg !775
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 0, !dbg !775
  %3 = load i16* %2, align 8, !dbg !775
  %4 = zext i16 %3 to i32, !dbg !775
  %5 = and i32 %4, 64, !dbg !775
  %6 = icmp ne i32 %5, 0, !dbg !775
  br i1 %6, label %bb1, label %bb2, !dbg !775

bb1:                                              ; preds = %bb
  %7 = load %struct.FILE** %ptr, align 8, !dbg !776
  %8 = call i64 @__stdio_wcommit(%struct.FILE* noalias %7) nounwind, !dbg !776
  br label %bb2, !dbg !776

bb2:                                              ; preds = %bb1, %bb
  %9 = load %struct.FILE** %ptr, align 8, !dbg !773
  %10 = getelementptr inbounds %struct.FILE* %9, i32 0, i32 9, !dbg !773
  %11 = load %struct.FILE** %10, align 8, !dbg !773
  store %struct.FILE* %11, %struct.FILE** %ptr, align 8, !dbg !773
  br label %bb3, !dbg !773

bb3:                                              ; preds = %bb2, %entry
  %12 = load %struct.FILE** %ptr, align 8, !dbg !773
  %13 = icmp ne %struct.FILE* %12, null, !dbg !773
  br i1 %13, label %bb, label %return, !dbg !773

return:                                           ; preds = %bb3
  ret void, !dbg !777
}

define hidden void @_stdio_init() nounwind {
entry:
  %old_errno = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %0 = load i32* @errno, align 4, !dbg !778
  store i32 %0, i32* %old_errno, align 4, !dbg !778
  %1 = load i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0, i32 0), align 8, !dbg !780
  %2 = call i32 @isatty(i32 0) nounwind, !dbg !780
  %3 = sub nsw i32 1, %2, !dbg !780
  %4 = mul i32 %3, 256, !dbg !780
  %5 = trunc i32 %4 to i16, !dbg !780
  %6 = xor i16 %1, %5, !dbg !780
  store i16 %6, i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0, i32 0), align 8, !dbg !780
  %7 = load i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1, i32 0), align 8, !dbg !781
  %8 = call i32 @isatty(i32 1) nounwind, !dbg !781
  %9 = sub nsw i32 1, %8, !dbg !781
  %10 = mul i32 %9, 256, !dbg !781
  %11 = trunc i32 %10 to i16, !dbg !781
  %12 = xor i16 %7, %11, !dbg !781
  store i16 %12, i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1, i32 0), align 8, !dbg !781
  %13 = load i32* %old_errno, align 4, !dbg !782
  store i32 %13, i32* @errno, align 4, !dbg !782
  ret void, !dbg !783
}

define void @exit(i32 %rv) noreturn nounwind {
entry:
  %rv_addr = alloca i32, align 4
  %"alloca point" = bitcast i32 0 to i32
  store i32 %rv, i32* %rv_addr
  %0 = load void (i32)** @__exit_cleanup, align 8, !dbg !784
  %1 = icmp ne void (i32)* %0, null, !dbg !784
  br i1 %1, label %bb, label %bb1, !dbg !784

bb:                                               ; preds = %entry
  %2 = load void (i32)** @__exit_cleanup, align 8, !dbg !786
  %3 = load i32* %rv_addr, align 4, !dbg !786
  call void %2(i32 %3) nounwind, !dbg !786
  br label %bb1, !dbg !786

bb1:                                              ; preds = %bb, %entry
  call void @__uClibc_fini() nounwind, !dbg !787
  call void @_stdio_term() nounwind, !dbg !788
  %4 = load i32* %rv_addr, align 4, !dbg !789
  call void @_exit(i32 %4) noreturn nounwind, !dbg !789
  unreachable, !dbg !789
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
  %1 = load i8** %s1_addr, align 8, !dbg !790
  store i8* %1, i8** %r1, align 8, !dbg !790
  %2 = load i8** %s2_addr, align 8, !dbg !792
  store i8* %2, i8** %r2, align 8, !dbg !792
  br label %bb1, !dbg !792

bb:                                               ; preds = %bb1
  %3 = load i8** %r2, align 8, !dbg !793
  %4 = load i8* %3, align 1, !dbg !793
  %5 = load i8** %r1, align 8, !dbg !793
  store i8 %4, i8* %5, align 1, !dbg !793
  %6 = load i8** %r1, align 8, !dbg !793
  %7 = getelementptr inbounds i8* %6, i64 1, !dbg !793
  store i8* %7, i8** %r1, align 8, !dbg !793
  %8 = load i8** %r2, align 8, !dbg !793
  %9 = getelementptr inbounds i8* %8, i64 1, !dbg !793
  store i8* %9, i8** %r2, align 8, !dbg !793
  %10 = load i64* %n_addr, align 8, !dbg !794
  %11 = sub i64 %10, 1, !dbg !794
  store i64 %11, i64* %n_addr, align 8, !dbg !794
  br label %bb1, !dbg !794

bb1:                                              ; preds = %bb, %entry
  %12 = load i64* %n_addr, align 8, !dbg !795
  %13 = icmp ne i64 %12, 0, !dbg !795
  br i1 %13, label %bb, label %bb2, !dbg !795

bb2:                                              ; preds = %bb1
  %14 = load i8** %s1_addr, align 8, !dbg !796
  store i8* %14, i8** %0, align 8, !dbg !796
  %15 = load i8** %0, align 8, !dbg !796
  store i8* %15, i8** %retval, align 8, !dbg !796
  %retval3 = load i8** %retval, !dbg !796
  ret i8* %retval3, !dbg !796
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
  %1 = load i8** %s_addr, align 8, !dbg !797
  store i8* %1, i8** %p, align 8, !dbg !797
  br label %bb1, !dbg !797

bb:                                               ; preds = %bb1
  %2 = load i32* %c_addr, align 4, !dbg !799
  %3 = trunc i32 %2 to i8, !dbg !799
  %4 = load i8** %p, align 8, !dbg !799
  store i8 %3, i8* %4, align 1, !dbg !799
  %5 = load i8** %p, align 8, !dbg !799
  %6 = getelementptr inbounds i8* %5, i64 1, !dbg !799
  store i8* %6, i8** %p, align 8, !dbg !799
  %7 = load i64* %n_addr, align 8, !dbg !800
  %8 = sub i64 %7, 1, !dbg !800
  store i64 %8, i64* %n_addr, align 8, !dbg !800
  br label %bb1, !dbg !800

bb1:                                              ; preds = %bb, %entry
  %9 = load i64* %n_addr, align 8, !dbg !801
  %10 = icmp ne i64 %9, 0, !dbg !801
  br i1 %10, label %bb, label %bb2, !dbg !801

bb2:                                              ; preds = %bb1
  %11 = load i8** %s_addr, align 8, !dbg !802
  store i8* %11, i8** %0, align 8, !dbg !802
  %12 = load i8** %0, align 8, !dbg !802
  store i8* %12, i8** %retval, align 8, !dbg !802
  %retval3 = load i8** %retval, !dbg !802
  ret i8* %retval3, !dbg !802
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
  %1 = load i32* %__sig_addr, align 4, !dbg !803
  %2 = sub nsw i32 %1, 1, !dbg !803
  %3 = and i32 %2, 63, !dbg !803
  %.cast = zext i32 %3 to i64, !dbg !803
  %4 = shl i64 1, %.cast, !dbg !803
  store i64 %4, i64* %__mask, align 8, !dbg !803
  %5 = load i32* %__sig_addr, align 4, !dbg !803
  %6 = sub nsw i32 %5, 1, !dbg !803
  %7 = sext i32 %6 to i64, !dbg !803
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %8 = udiv i64 %7, 64, !dbg !803
  store i64 %8, i64* %__word, align 8, !dbg !803
  %9 = load i64* %__word, align 8, !dbg !803
  %10 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !803
  %11 = getelementptr inbounds %struct.__sigset_t* %10, i32 0, i32 0, !dbg !803
  %12 = getelementptr inbounds [16 x i64]* %11, i64 0, i64 %9, !dbg !803
  %13 = load i64* %12, align 8, !dbg !803
  %14 = load i64* %__mask, align 8, !dbg !803
  %15 = and i64 %13, %14, !dbg !803
  %16 = icmp ne i64 %15, 0, !dbg !803
  %17 = zext i1 %16 to i32, !dbg !803
  store i32 %17, i32* %0, align 4, !dbg !803
  %18 = load i32* %0, align 4, !dbg !803
  store i32 %18, i32* %retval, align 4, !dbg !803
  %retval1 = load i32* %retval, !dbg !803
  ret i32 %retval1, !dbg !804
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
  %1 = load i32* %__sig_addr, align 4, !dbg !806
  %2 = sub nsw i32 %1, 1, !dbg !806
  %3 = and i32 %2, 63, !dbg !806
  %.cast = zext i32 %3 to i64, !dbg !806
  %4 = shl i64 1, %.cast, !dbg !806
  store i64 %4, i64* %__mask, align 8, !dbg !806
  %5 = load i32* %__sig_addr, align 4, !dbg !806
  %6 = sub nsw i32 %5, 1, !dbg !806
  %7 = sext i32 %6 to i64, !dbg !806
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %8 = udiv i64 %7, 64, !dbg !806
  store i64 %8, i64* %__word, align 8, !dbg !806
  %9 = load i64* %__word, align 8, !dbg !806
  %10 = load i64* %__word, align 8, !dbg !806
  %11 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !806
  %12 = getelementptr inbounds %struct.__sigset_t* %11, i32 0, i32 0, !dbg !806
  %13 = getelementptr inbounds [16 x i64]* %12, i64 0, i64 %10, !dbg !806
  %14 = load i64* %13, align 8, !dbg !806
  %15 = load i64* %__mask, align 8, !dbg !806
  %16 = or i64 %14, %15, !dbg !806
  %17 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !806
  %18 = getelementptr inbounds %struct.__sigset_t* %17, i32 0, i32 0, !dbg !806
  %19 = getelementptr inbounds [16 x i64]* %18, i64 0, i64 %9, !dbg !806
  store i64 %16, i64* %19, align 8, !dbg !806
  store i32 0, i32* %0, align 4, !dbg !806
  %20 = load i32* %0, align 4, !dbg !806
  store i32 %20, i32* %retval, align 4, !dbg !806
  %retval1 = load i32* %retval, !dbg !806
  ret i32 %retval1, !dbg !807
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
  %1 = load i32* %__sig_addr, align 4, !dbg !809
  %2 = sub nsw i32 %1, 1, !dbg !809
  %3 = and i32 %2, 63, !dbg !809
  %.cast = zext i32 %3 to i64, !dbg !809
  %4 = shl i64 1, %.cast, !dbg !809
  store i64 %4, i64* %__mask, align 8, !dbg !809
  %5 = load i32* %__sig_addr, align 4, !dbg !809
  %6 = sub nsw i32 %5, 1, !dbg !809
  %7 = sext i32 %6 to i64, !dbg !809
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %8 = udiv i64 %7, 64, !dbg !809
  store i64 %8, i64* %__word, align 8, !dbg !809
  %9 = load i64* %__word, align 8, !dbg !809
  %10 = load i64* %__word, align 8, !dbg !809
  %11 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !809
  %12 = getelementptr inbounds %struct.__sigset_t* %11, i32 0, i32 0, !dbg !809
  %13 = getelementptr inbounds [16 x i64]* %12, i64 0, i64 %10, !dbg !809
  %14 = load i64* %13, align 8, !dbg !809
  %15 = load i64* %__mask, align 8, !dbg !809
  %not = xor i64 %15, -1, !dbg !809
  %16 = and i64 %14, %not, !dbg !809
  %17 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !809
  %18 = getelementptr inbounds %struct.__sigset_t* %17, i32 0, i32 0, !dbg !809
  %19 = getelementptr inbounds [16 x i64]* %18, i64 0, i64 %9, !dbg !809
  store i64 %16, i64* %19, align 8, !dbg !809
  store i32 0, i32* %0, align 4, !dbg !809
  %20 = load i32* %0, align 4, !dbg !809
  store i32 %20, i32* %retval, align 4, !dbg !809
  %retval2 = load i32* %retval, !dbg !809
  ret i32 %retval2, !dbg !810
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
  %1 = load i64* %bufsize_addr, align 8, !dbg !812
  store i64 %1, i64* %todo, align 8, !dbg !812
  br label %bb, !dbg !812

bb:                                               ; preds = %bb6, %entry
  %2 = load i64* %todo, align 8, !dbg !814
  %3 = icmp eq i64 %2, 0, !dbg !814
  br i1 %3, label %bb1, label %bb2, !dbg !814

bb1:                                              ; preds = %bb
  %4 = load i64* %bufsize_addr, align 8, !dbg !815
  store i64 %4, i64* %0, align 8, !dbg !815
  br label %bb16, !dbg !815

bb2:                                              ; preds = %bb
  %5 = load i64* %todo, align 8, !dbg !816
  %6 = icmp sge i64 %5, 0, !dbg !816
  br i1 %6, label %bb3, label %bb4, !dbg !816

bb3:                                              ; preds = %bb2
  %7 = load i64* %todo, align 8, !dbg !816
  store i64 %7, i64* %iftmp.0, align 8, !dbg !816
  br label %bb5, !dbg !816

bb4:                                              ; preds = %bb2
  store i64 9223372036854775807, i64* %iftmp.0, align 8, !dbg !816
  br label %bb5, !dbg !816

bb5:                                              ; preds = %bb4, %bb3
  %8 = load i64* %iftmp.0, align 8, !dbg !816
  store i64 %8, i64* %stodo, align 8, !dbg !816
  %9 = load i64* %stodo, align 8, !dbg !817
  %10 = load %struct.FILE** %stream_addr, align 8, !dbg !817
  %11 = getelementptr inbounds %struct.FILE* %10, i32 0, i32 2, !dbg !817
  %12 = load i32* %11, align 4, !dbg !817
  %13 = load i8** %buf_addr, align 8, !dbg !817
  %14 = call i64 @write(i32 %12, i8* %13, i64 %9) nounwind, !dbg !817
  store i64 %14, i64* %rv, align 8, !dbg !817
  %15 = load i64* %rv, align 8, !dbg !817
  %16 = icmp sge i64 %15, 0, !dbg !817
  br i1 %16, label %bb6, label %bb7, !dbg !817

bb6:                                              ; preds = %bb5
  %17 = load i64* %rv, align 8, !dbg !818
  %18 = load i64* %todo, align 8, !dbg !818
  %19 = sub i64 %18, %17, !dbg !818
  store i64 %19, i64* %todo, align 8, !dbg !818
  %20 = load i8** %buf_addr, align 8, !dbg !819
  %21 = load i64* %rv, align 8, !dbg !819
  %22 = getelementptr inbounds i8* %20, i64 %21, !dbg !819
  store i8* %22, i8** %buf_addr, align 8, !dbg !819
  br label %bb, !dbg !819

bb7:                                              ; preds = %bb5
  %23 = load %struct.FILE** %stream_addr, align 8, !dbg !820
  %24 = getelementptr inbounds %struct.FILE* %23, i32 0, i32 0, !dbg !820
  %25 = load i16* %24, align 8, !dbg !820
  %26 = or i16 %25, 8, !dbg !820
  %27 = load %struct.FILE** %stream_addr, align 8, !dbg !820
  %28 = getelementptr inbounds %struct.FILE* %27, i32 0, i32 0, !dbg !820
  store i16 %26, i16* %28, align 8, !dbg !820
  %29 = load %struct.FILE** %stream_addr, align 8, !dbg !821
  %30 = getelementptr inbounds %struct.FILE* %29, i32 0, i32 4, !dbg !821
  %31 = load i8** %30, align 8, !dbg !821
  %32 = ptrtoint i8* %31 to i64, !dbg !821
  %33 = load %struct.FILE** %stream_addr, align 8, !dbg !821
  %34 = getelementptr inbounds %struct.FILE* %33, i32 0, i32 3, !dbg !821
  %35 = load i8** %34, align 8, !dbg !821
  %36 = ptrtoint i8* %35 to i64, !dbg !821
  %37 = sub nsw i64 %32, %36, !dbg !821
  store i64 %37, i64* %stodo, align 8, !dbg !821
  %38 = load i64* %stodo, align 8, !dbg !821
  %39 = icmp ne i64 %38, 0, !dbg !821
  br i1 %39, label %bb8, label %bb15, !dbg !821

bb8:                                              ; preds = %bb7
  %40 = load i64* %stodo, align 8, !dbg !822
  %41 = load i64* %todo, align 8, !dbg !822
  %42 = icmp ugt i64 %40, %41, !dbg !822
  br i1 %42, label %bb9, label %bb10, !dbg !822

bb9:                                              ; preds = %bb8
  %43 = load i64* %todo, align 8, !dbg !824
  store i64 %43, i64* %stodo, align 8, !dbg !824
  br label %bb10, !dbg !824

bb10:                                             ; preds = %bb9, %bb8
  %44 = load %struct.FILE** %stream_addr, align 8, !dbg !825
  %45 = getelementptr inbounds %struct.FILE* %44, i32 0, i32 3, !dbg !825
  %46 = load i8** %45, align 8, !dbg !825
  store i8* %46, i8** %s, align 8, !dbg !825
  br label %bb11, !dbg !825

bb11:                                             ; preds = %bb13, %bb10
  %47 = load i8** %buf_addr, align 8, !dbg !826
  %48 = load i8* %47, align 1, !dbg !826
  %49 = load i8** %s, align 8, !dbg !826
  store i8 %48, i8* %49, align 1, !dbg !826
  %50 = load i8** %s, align 8, !dbg !826
  %51 = load i8* %50, align 1, !dbg !826
  %52 = icmp eq i8 %51, 10, !dbg !826
  br i1 %52, label %bb12, label %bb13, !dbg !826

bb12:                                             ; preds = %bb11
  %53 = load %struct.FILE** %stream_addr, align 8, !dbg !826
  %54 = getelementptr inbounds %struct.FILE* %53, i32 0, i32 0, !dbg !826
  %55 = load i16* %54, align 8, !dbg !826
  %56 = zext i16 %55 to i32, !dbg !826
  %57 = and i32 %56, 256, !dbg !826
  %58 = icmp ne i32 %57, 0, !dbg !826
  br i1 %58, label %bb14, label %bb13, !dbg !826

bb13:                                             ; preds = %bb12, %bb11
  %59 = load i8** %s, align 8, !dbg !827
  %60 = getelementptr inbounds i8* %59, i64 1, !dbg !827
  store i8* %60, i8** %s, align 8, !dbg !827
  %61 = load i8** %buf_addr, align 8, !dbg !828
  %62 = getelementptr inbounds i8* %61, i64 1, !dbg !828
  store i8* %62, i8** %buf_addr, align 8, !dbg !828
  %63 = load i64* %stodo, align 8, !dbg !829
  %64 = sub nsw i64 %63, 1, !dbg !829
  store i64 %64, i64* %stodo, align 8, !dbg !829
  %65 = load i64* %stodo, align 8, !dbg !829
  %66 = icmp ne i64 %65, 0, !dbg !829
  br i1 %66, label %bb11, label %bb14, !dbg !829

bb14:                                             ; preds = %bb13, %bb12
  %67 = load %struct.FILE** %stream_addr, align 8, !dbg !830
  %68 = getelementptr inbounds %struct.FILE* %67, i32 0, i32 5, !dbg !830
  %69 = load i8** %s, align 8, !dbg !830
  store i8* %69, i8** %68, align 8, !dbg !830
  %70 = load i8** %s, align 8, !dbg !831
  %71 = ptrtoint i8* %70 to i64, !dbg !831
  %72 = load %struct.FILE** %stream_addr, align 8, !dbg !831
  %73 = getelementptr inbounds %struct.FILE* %72, i32 0, i32 3, !dbg !831
  %74 = load i8** %73, align 8, !dbg !831
  %75 = ptrtoint i8* %74 to i64, !dbg !831
  %76 = sub nsw i64 %71, %75, !dbg !831
  %77 = load i64* %todo, align 8, !dbg !831
  %78 = sub i64 %77, %76, !dbg !831
  store i64 %78, i64* %todo, align 8, !dbg !831
  br label %bb15, !dbg !831

bb15:                                             ; preds = %bb14, %bb7
  %79 = load i64* %bufsize_addr, align 8, !dbg !832
  %80 = load i64* %todo, align 8, !dbg !832
  %81 = sub i64 %79, %80, !dbg !832
  store i64 %81, i64* %0, align 8, !dbg !832
  br label %bb16, !dbg !832

bb16:                                             ; preds = %bb15, %bb1
  %82 = load i64* %0, align 8, !dbg !815
  store i64 %82, i64* %retval, align 8, !dbg !815
  %retval17 = load i64* %retval, !dbg !815
  ret i64 %retval17, !dbg !815
}

declare i64 @write(i32, i8*, i64)

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
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !833
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 0, !dbg !833
  %3 = load i16* %2, align 8, !dbg !833
  %4 = zext i16 %3 to i32, !dbg !833
  %5 = load i32* %oflag_addr, align 4, !dbg !833
  %6 = and i32 %4, %5, !dbg !833
  %7 = icmp eq i32 %6, 0, !dbg !833
  br i1 %7, label %bb, label %bb2, !dbg !833

bb:                                               ; preds = %entry
  %8 = load %struct.FILE** %stream_addr, align 8, !dbg !835
  %9 = getelementptr inbounds %struct.FILE* %8, i32 0, i32 0, !dbg !835
  %10 = load i16* %9, align 8, !dbg !835
  %11 = zext i16 %10 to i32, !dbg !835
  %12 = and i32 %11, 2176, !dbg !835
  %13 = icmp ne i32 %12, 0, !dbg !835
  br i1 %13, label %DO_EBADF, label %bb1, !dbg !835

bb1:                                              ; preds = %bb
  %14 = load %struct.FILE** %stream_addr, align 8, !dbg !836
  %15 = getelementptr inbounds %struct.FILE* %14, i32 0, i32 0, !dbg !836
  %16 = load i16* %15, align 8, !dbg !836
  %17 = load i32* %oflag_addr, align 4, !dbg !836
  %18 = trunc i32 %17 to i16, !dbg !836
  %19 = or i16 %16, %18, !dbg !836
  %20 = load %struct.FILE** %stream_addr, align 8, !dbg !836
  %21 = getelementptr inbounds %struct.FILE* %20, i32 0, i32 0, !dbg !836
  store i16 %19, i16* %21, align 8, !dbg !836
  br label %bb2, !dbg !836

bb2:                                              ; preds = %bb1, %entry
  %22 = load %struct.FILE** %stream_addr, align 8, !dbg !837
  %23 = getelementptr inbounds %struct.FILE* %22, i32 0, i32 0, !dbg !837
  %24 = load i16* %23, align 8, !dbg !837
  %25 = zext i16 %24 to i32, !dbg !837
  %26 = and i32 %25, 32, !dbg !837
  %27 = icmp ne i32 %26, 0, !dbg !837
  br i1 %27, label %DO_EBADF, label %bb3, !dbg !837

DO_EBADF:                                         ; preds = %bb2, %bb
  store i32 9, i32* @errno, align 4, !dbg !838
  br label %ERROR, !dbg !839

ERROR:                                            ; preds = %bb10, %DO_EBADF
  %28 = load %struct.FILE** %stream_addr, align 8, !dbg !840
  %29 = getelementptr inbounds %struct.FILE* %28, i32 0, i32 0, !dbg !840
  %30 = load i16* %29, align 8, !dbg !840
  %31 = or i16 %30, 8, !dbg !840
  %32 = load %struct.FILE** %stream_addr, align 8, !dbg !840
  %33 = getelementptr inbounds %struct.FILE* %32, i32 0, i32 0, !dbg !840
  store i16 %31, i16* %33, align 8, !dbg !840
  store i32 -1, i32* %0, align 4, !dbg !841
  br label %bb15, !dbg !841

bb3:                                              ; preds = %bb2
  %34 = load %struct.FILE** %stream_addr, align 8, !dbg !842
  %35 = getelementptr inbounds %struct.FILE* %34, i32 0, i32 0, !dbg !842
  %36 = load i16* %35, align 8, !dbg !842
  %37 = zext i16 %36 to i32, !dbg !842
  %38 = and i32 %37, 3, !dbg !842
  %39 = icmp ne i32 %38, 0, !dbg !842
  br i1 %39, label %bb4, label %bb12, !dbg !842

bb4:                                              ; preds = %bb3
  %40 = load %struct.FILE** %stream_addr, align 8, !dbg !843
  %41 = getelementptr inbounds %struct.FILE* %40, i32 0, i32 0, !dbg !843
  %42 = load i16* %41, align 8, !dbg !843
  %43 = zext i16 %42 to i32, !dbg !843
  %44 = and i32 %43, 4, !dbg !843
  %45 = icmp eq i32 %44, 0, !dbg !843
  br i1 %45, label %bb5, label %bb11, !dbg !843

bb5:                                              ; preds = %bb4
  %46 = load %struct.FILE** %stream_addr, align 8, !dbg !844
  %47 = getelementptr inbounds %struct.FILE* %46, i32 0, i32 6, !dbg !844
  %48 = load i8** %47, align 8, !dbg !844
  %49 = load %struct.FILE** %stream_addr, align 8, !dbg !844
  %50 = getelementptr inbounds %struct.FILE* %49, i32 0, i32 5, !dbg !844
  %51 = load i8** %50, align 8, !dbg !844
  %52 = icmp ne i8* %48, %51, !dbg !844
  br i1 %52, label %bb7, label %bb6, !dbg !844

bb6:                                              ; preds = %bb5
  %53 = load %struct.FILE** %stream_addr, align 8, !dbg !844
  %54 = getelementptr inbounds %struct.FILE* %53, i32 0, i32 0, !dbg !844
  %55 = load i16* %54, align 8, !dbg !844
  %56 = zext i16 %55 to i32, !dbg !844
  %57 = and i32 %56, 2, !dbg !844
  %58 = icmp ne i32 %57, 0, !dbg !844
  br i1 %58, label %bb7, label %bb11, !dbg !844

bb7:                                              ; preds = %bb6, %bb5
  %59 = load %struct.FILE** %stream_addr, align 8, !dbg !844
  %60 = getelementptr inbounds %struct.FILE* %59, i32 0, i32 0, !dbg !844
  %61 = load i16* %60, align 8, !dbg !844
  %62 = zext i16 %61 to i32, !dbg !844
  %63 = and i32 %62, 1024, !dbg !844
  %64 = icmp ne i32 %63, 0, !dbg !844
  br i1 %64, label %bb8, label %bb9, !dbg !844

bb8:                                              ; preds = %bb7
  store i32 2, i32* %iftmp.0, align 4, !dbg !844
  br label %bb10, !dbg !844

bb9:                                              ; preds = %bb7
  store i32 1, i32* %iftmp.0, align 4, !dbg !844
  br label %bb10, !dbg !844

bb10:                                             ; preds = %bb9, %bb8
  %65 = load %struct.FILE** %stream_addr, align 8, !dbg !844
  %66 = load i32* %iftmp.0, align 4, !dbg !844
  %67 = call i32 @fseek(%struct.FILE* %65, i64 0, i32 %66) nounwind, !dbg !844
  %68 = icmp ne i32 %67, 0, !dbg !844
  br i1 %68, label %ERROR, label %bb11, !dbg !844

bb11:                                             ; preds = %bb10, %bb6, %bb4
  %69 = load %struct.FILE** %stream_addr, align 8, !dbg !845
  %70 = getelementptr inbounds %struct.FILE* %69, i32 0, i32 0, !dbg !845
  %71 = load i16* %70, align 8, !dbg !845
  %72 = and i16 %71, -4, !dbg !845
  %73 = load %struct.FILE** %stream_addr, align 8, !dbg !845
  %74 = getelementptr inbounds %struct.FILE* %73, i32 0, i32 0, !dbg !845
  store i16 %72, i16* %74, align 8, !dbg !845
  %75 = load %struct.FILE** %stream_addr, align 8, !dbg !846
  %76 = getelementptr inbounds %struct.FILE* %75, i32 0, i32 3, !dbg !846
  %77 = load i8** %76, align 8, !dbg !846
  %78 = load %struct.FILE** %stream_addr, align 8, !dbg !846
  %79 = getelementptr inbounds %struct.FILE* %78, i32 0, i32 7, !dbg !846
  store i8* %77, i8** %79, align 8, !dbg !846
  %80 = load %struct.FILE** %stream_addr, align 8, !dbg !847
  %81 = getelementptr inbounds %struct.FILE* %80, i32 0, i32 3, !dbg !847
  %82 = load i8** %81, align 8, !dbg !847
  %83 = load %struct.FILE** %stream_addr, align 8, !dbg !847
  %84 = getelementptr inbounds %struct.FILE* %83, i32 0, i32 5, !dbg !847
  store i8* %82, i8** %84, align 8, !dbg !847
  %85 = load %struct.FILE** %stream_addr, align 8, !dbg !847
  %86 = getelementptr inbounds %struct.FILE* %85, i32 0, i32 5, !dbg !847
  %87 = load i8** %86, align 8, !dbg !847
  %88 = load %struct.FILE** %stream_addr, align 8, !dbg !847
  %89 = getelementptr inbounds %struct.FILE* %88, i32 0, i32 6, !dbg !847
  store i8* %87, i8** %89, align 8, !dbg !847
  br label %bb12, !dbg !847

bb12:                                             ; preds = %bb11, %bb3
  %90 = load %struct.FILE** %stream_addr, align 8, !dbg !848
  %91 = getelementptr inbounds %struct.FILE* %90, i32 0, i32 0, !dbg !848
  %92 = load i16* %91, align 8, !dbg !848
  %93 = or i16 %92, 64, !dbg !848
  %94 = load %struct.FILE** %stream_addr, align 8, !dbg !848
  %95 = getelementptr inbounds %struct.FILE* %94, i32 0, i32 0, !dbg !848
  store i16 %93, i16* %95, align 8, !dbg !848
  %96 = load %struct.FILE** %stream_addr, align 8, !dbg !849
  %97 = getelementptr inbounds %struct.FILE* %96, i32 0, i32 0, !dbg !849
  %98 = load i16* %97, align 8, !dbg !849
  %99 = zext i16 %98 to i32, !dbg !849
  %100 = and i32 %99, 2816, !dbg !849
  %101 = icmp eq i32 %100, 0, !dbg !849
  br i1 %101, label %bb13, label %bb14, !dbg !849

bb13:                                             ; preds = %bb12
  %102 = load %struct.FILE** %stream_addr, align 8, !dbg !850
  %103 = getelementptr inbounds %struct.FILE* %102, i32 0, i32 4, !dbg !850
  %104 = load i8** %103, align 8, !dbg !850
  %105 = load %struct.FILE** %stream_addr, align 8, !dbg !850
  %106 = getelementptr inbounds %struct.FILE* %105, i32 0, i32 8, !dbg !850
  store i8* %104, i8** %106, align 8, !dbg !850
  br label %bb14, !dbg !850

bb14:                                             ; preds = %bb13, %bb12
  store i32 0, i32* %0, align 4, !dbg !851
  br label %bb15, !dbg !851

bb15:                                             ; preds = %bb14, %ERROR
  %107 = load i32* %0, align 4, !dbg !841
  store i32 %107, i32* %retval, align 4, !dbg !841
  %retval16 = load i32* %retval, !dbg !841
  ret i32 %retval16, !dbg !841
}

define hidden i64 @__stdio_wcommit(%struct.FILE* noalias %stream) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %retval = alloca i64
  %0 = alloca i64
  %bufsize = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !852
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 5, !dbg !852
  %3 = load i8** %2, align 8, !dbg !852
  %4 = ptrtoint i8* %3 to i64, !dbg !852
  %5 = load %struct.FILE** %stream_addr, align 8, !dbg !852
  %6 = getelementptr inbounds %struct.FILE* %5, i32 0, i32 3, !dbg !852
  %7 = load i8** %6, align 8, !dbg !852
  %8 = ptrtoint i8* %7 to i64, !dbg !852
  %9 = sub nsw i64 %4, %8, !dbg !852
  store i64 %9, i64* %bufsize, align 8, !dbg !852
  %10 = load i64* %bufsize, align 8, !dbg !852
  %11 = icmp ne i64 %10, 0, !dbg !852
  br i1 %11, label %bb, label %bb1, !dbg !852

bb:                                               ; preds = %entry
  %12 = load %struct.FILE** %stream_addr, align 8, !dbg !854
  %13 = getelementptr inbounds %struct.FILE* %12, i32 0, i32 3, !dbg !854
  %14 = load i8** %13, align 8, !dbg !854
  %15 = load %struct.FILE** %stream_addr, align 8, !dbg !854
  %16 = getelementptr inbounds %struct.FILE* %15, i32 0, i32 5, !dbg !854
  store i8* %14, i8** %16, align 8, !dbg !854
  %17 = load %struct.FILE** %stream_addr, align 8, !dbg !855
  %18 = getelementptr inbounds %struct.FILE* %17, i32 0, i32 3, !dbg !855
  %19 = load i8** %18, align 8, !dbg !855
  %20 = load %struct.FILE** %stream_addr, align 8, !dbg !855
  %21 = load i64* %bufsize, align 8, !dbg !855
  %22 = call i64 @__stdio_WRITE(%struct.FILE* %20, i8* %19, i64 %21) nounwind, !dbg !855
  br label %bb1, !dbg !855

bb1:                                              ; preds = %bb, %entry
  %23 = load %struct.FILE** %stream_addr, align 8, !dbg !856
  %24 = getelementptr inbounds %struct.FILE* %23, i32 0, i32 5, !dbg !856
  %25 = load i8** %24, align 8, !dbg !856
  %26 = ptrtoint i8* %25 to i64, !dbg !856
  %27 = load %struct.FILE** %stream_addr, align 8, !dbg !856
  %28 = getelementptr inbounds %struct.FILE* %27, i32 0, i32 3, !dbg !856
  %29 = load i8** %28, align 8, !dbg !856
  %30 = ptrtoint i8* %29 to i64, !dbg !856
  %31 = sub nsw i64 %26, %30, !dbg !856
  store i64 %31, i64* %0, align 8, !dbg !856
  %32 = load i64* %0, align 8, !dbg !856
  store i64 %32, i64* %retval, align 8, !dbg !856
  %retval2 = load i64* %retval, !dbg !856
  ret i64 %retval2, !dbg !856
}

define i32 @isatty(i32 %fd) nounwind {
entry:
  %fd_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %term = alloca %struct.termios
  %"alloca point" = bitcast i32 0 to i32
  store i32 %fd, i32* %fd_addr
  %1 = load i32* %fd_addr, align 4, !dbg !857
  %2 = call i32 @tcgetattr(i32 %1, %struct.termios* %term) nounwind, !dbg !857
  %3 = icmp eq i32 %2, 0, !dbg !857
  %4 = zext i1 %3 to i32, !dbg !857
  store i32 %4, i32* %0, align 4, !dbg !857
  %5 = load i32* %0, align 4, !dbg !857
  store i32 %5, i32* %retval, align 4, !dbg !857
  %retval1 = load i32* %retval, !dbg !857
  ret i32 %retval1, !dbg !857
}

define hidden i32 @__raise(i32 %signo) nounwind {
entry:
  %signo_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %signo, i32* %signo_addr
  %1 = call i32 @getpid() nounwind, !dbg !859
  %2 = load i32* %signo_addr, align 4, !dbg !859
  %3 = call i32 @kill(i32 %1, i32 %2) nounwind, !dbg !859
  store i32 %3, i32* %0, align 4, !dbg !859
  %4 = load i32* %0, align 4, !dbg !859
  store i32 %4, i32* %retval, align 4, !dbg !859
  %retval1 = load i32* %retval, !dbg !859
  ret i32 %retval1, !dbg !859
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
  %1 = load %struct.sigaction** %act_addr, align 8, !dbg !861
  %2 = icmp ne %struct.sigaction* %1, null, !dbg !861
  br i1 %2, label %bb, label %bb1, !dbg !861

bb:                                               ; preds = %entry
  %3 = load %struct.sigaction** %act_addr, align 8, !dbg !863
  %4 = getelementptr inbounds %struct.sigaction* %3, i32 0, i32 0, !dbg !863
  %5 = getelementptr inbounds %0* %4, i32 0, i32 0, !dbg !863
  %6 = load void (i32)** %5, align 8, !dbg !863
  %7 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 0, !dbg !863
  store void (i32)* %6, void (i32)** %7, align 8, !dbg !863
  %8 = load %struct.sigaction** %act_addr, align 8, !dbg !864
  %9 = getelementptr inbounds %struct.sigaction* %8, i32 0, i32 1, !dbg !864
  %10 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 3, !dbg !864
  %11 = bitcast %struct.__sigset_t* %10 to i8*, !dbg !864
  %12 = bitcast %struct.__sigset_t* %9 to i8*, !dbg !864
  %13 = call i8* @memcpy(i8* noalias %11, i8* noalias %12, i64 128) nounwind, !dbg !864
  %14 = load %struct.sigaction** %act_addr, align 8, !dbg !865
  %15 = getelementptr inbounds %struct.sigaction* %14, i32 0, i32 2, !dbg !865
  %16 = load i32* %15, align 8, !dbg !865
  %17 = sext i32 %16 to i64, !dbg !865
  %18 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 1, !dbg !865
  store i64 %17, i64* %18, align 8, !dbg !865
  %19 = load %struct.sigaction** %act_addr, align 8, !dbg !866
  %20 = getelementptr inbounds %struct.sigaction* %19, i32 0, i32 3, !dbg !866
  %21 = load void ()** %20, align 8, !dbg !866
  %22 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 2, !dbg !866
  store void ()* %21, void ()** %22, align 8, !dbg !866
  br label %bb1, !dbg !866

bb1:                                              ; preds = %bb, %entry
  %23 = load %struct.sigaction** %oact_addr, align 8, !dbg !867
  %24 = icmp ne %struct.sigaction* %23, null, !dbg !867
  br i1 %24, label %bb2, label %bb3, !dbg !867

bb2:                                              ; preds = %bb1
  store %struct.kernel_sigaction* %koact, %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !867
  br label %bb4, !dbg !867

bb3:                                              ; preds = %bb1
  store %struct.kernel_sigaction* null, %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !867
  br label %bb4, !dbg !867

bb4:                                              ; preds = %bb3, %bb2
  %25 = load %struct.sigaction** %act_addr, align 8, !dbg !867
  %26 = icmp ne %struct.sigaction* %25, null, !dbg !867
  br i1 %26, label %bb5, label %bb6, !dbg !867

bb5:                                              ; preds = %bb4
  store %struct.kernel_sigaction* %kact, %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !867
  br label %bb7, !dbg !867

bb6:                                              ; preds = %bb4
  store %struct.kernel_sigaction* null, %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !867
  br label %bb7, !dbg !867

bb7:                                              ; preds = %bb6, %bb5
  %27 = load i32* %sig_addr, align 4, !dbg !867
  %28 = load %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !867
  %29 = load %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !867
  %30 = call i32 @__syscall_rt_sigaction(i32 %27, %struct.kernel_sigaction* %28, %struct.kernel_sigaction* %29, i64 8) nounwind, !dbg !867
  store i32 %30, i32* %result, align 4, !dbg !867
  %31 = load %struct.sigaction** %oact_addr, align 8, !dbg !868
  %32 = icmp ne %struct.sigaction* %31, null, !dbg !868
  br i1 %32, label %bb8, label %bb10, !dbg !868

bb8:                                              ; preds = %bb7
  %33 = load i32* %result, align 4, !dbg !868
  %34 = icmp sge i32 %33, 0, !dbg !868
  br i1 %34, label %bb9, label %bb10, !dbg !868

bb9:                                              ; preds = %bb8
  %35 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 0, !dbg !869
  %36 = load void (i32)** %35, align 8, !dbg !869
  %37 = load %struct.sigaction** %oact_addr, align 8, !dbg !869
  %38 = getelementptr inbounds %struct.sigaction* %37, i32 0, i32 0, !dbg !869
  %39 = getelementptr inbounds %0* %38, i32 0, i32 0, !dbg !869
  store void (i32)* %36, void (i32)** %39, align 8, !dbg !869
  %40 = load %struct.sigaction** %oact_addr, align 8, !dbg !870
  %41 = getelementptr inbounds %struct.sigaction* %40, i32 0, i32 1, !dbg !870
  %42 = bitcast %struct.__sigset_t* %41 to i8*, !dbg !870
  %43 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 3, !dbg !870
  %44 = bitcast %struct.__sigset_t* %43 to i8*, !dbg !870
  %45 = call i8* @memcpy(i8* noalias %42, i8* noalias %44, i64 128) nounwind, !dbg !870
  %46 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 1, !dbg !871
  %47 = load i64* %46, align 8, !dbg !871
  %48 = trunc i64 %47 to i32, !dbg !871
  %49 = load %struct.sigaction** %oact_addr, align 8, !dbg !871
  %50 = getelementptr inbounds %struct.sigaction* %49, i32 0, i32 2, !dbg !871
  store i32 %48, i32* %50, align 8, !dbg !871
  %51 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 2, !dbg !872
  %52 = load void ()** %51, align 8, !dbg !872
  %53 = load %struct.sigaction** %oact_addr, align 8, !dbg !872
  %54 = getelementptr inbounds %struct.sigaction* %53, i32 0, i32 3, !dbg !872
  store void ()* %52, void ()** %54, align 8, !dbg !872
  br label %bb10, !dbg !872

bb10:                                             ; preds = %bb9, %bb8, %bb7
  %55 = load i32* %result, align 4, !dbg !873
  store i32 %55, i32* %0, align 4, !dbg !873
  %56 = load i32* %0, align 4, !dbg !873
  store i32 %56, i32* %retval, align 4, !dbg !873
  %retval11 = load i32* %retval, !dbg !873
  ret i32 %retval11, !dbg !873
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
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !874
  %2 = load i64* %offset_addr, align 8, !dbg !874
  %3 = load i32* %whence_addr, align 4, !dbg !874
  %4 = call i32 @fseeko64(%struct.FILE* %1, i64 %2, i32 %3) nounwind, !dbg !874
  store i32 %4, i32* %0, align 4, !dbg !874
  %5 = load i32* %0, align 4, !dbg !874
  store i32 %5, i32* %retval, align 4, !dbg !874
  %retval1 = load i32* %retval, !dbg !874
  ret i32 %retval1, !dbg !874
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
  %1 = load i32* %fd_addr, align 4, !dbg !876
  %2 = call i32 (i32, i64, ...)* @ioctl(i32 %1, i64 21505, %struct.__kernel_termios* %k_termios) nounwind, !dbg !876
  store i32 %2, i32* %retval1, align 4, !dbg !876
  %3 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 0, !dbg !878
  %4 = load i32* %3, align 4, !dbg !878
  %5 = load %struct.termios** %termios_p_addr, align 8, !dbg !878
  %6 = getelementptr inbounds %struct.termios* %5, i32 0, i32 0, !dbg !878
  store i32 %4, i32* %6, align 4, !dbg !878
  %7 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 1, !dbg !879
  %8 = load i32* %7, align 4, !dbg !879
  %9 = load %struct.termios** %termios_p_addr, align 8, !dbg !879
  %10 = getelementptr inbounds %struct.termios* %9, i32 0, i32 1, !dbg !879
  store i32 %8, i32* %10, align 4, !dbg !879
  %11 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 2, !dbg !880
  %12 = load i32* %11, align 4, !dbg !880
  %13 = load %struct.termios** %termios_p_addr, align 8, !dbg !880
  %14 = getelementptr inbounds %struct.termios* %13, i32 0, i32 2, !dbg !880
  store i32 %12, i32* %14, align 4, !dbg !880
  %15 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 3, !dbg !881
  %16 = load i32* %15, align 4, !dbg !881
  %17 = load %struct.termios** %termios_p_addr, align 8, !dbg !881
  %18 = getelementptr inbounds %struct.termios* %17, i32 0, i32 3, !dbg !881
  store i32 %16, i32* %18, align 4, !dbg !881
  %19 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 4, !dbg !882
  %20 = load i8* %19, align 4, !dbg !882
  %21 = load %struct.termios** %termios_p_addr, align 8, !dbg !882
  %22 = getelementptr inbounds %struct.termios* %21, i32 0, i32 4, !dbg !882
  store i8 %20, i8* %22, align 4, !dbg !882
  %23 = load %struct.termios** %termios_p_addr, align 8, !dbg !883
  %24 = getelementptr inbounds %struct.termios* %23, i32 0, i32 5, !dbg !883
  %25 = getelementptr inbounds [32 x i8]* %24, i64 0, i64 0, !dbg !883
  %26 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 5, !dbg !883
  %27 = getelementptr inbounds [19 x i8]* %26, i64 0, i64 0, !dbg !883
  %28 = call i8* @mempcpy(i8* noalias %25, i8* noalias %27, i64 19) nounwind, !dbg !883
  %29 = call i8* @memset(i8* %28, i32 0, i64 13) nounwind, !dbg !883
  %30 = load i32* %retval1, align 4, !dbg !884
  store i32 %30, i32* %0, align 4, !dbg !884
  %31 = load i32* %0, align 4, !dbg !884
  store i32 %31, i32* %retval, align 4, !dbg !884
  %retval2 = load i32* %retval, !dbg !884
  ret i32 %retval2, !dbg !884
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
  %1 = load i64* %offset_addr, align 8, !dbg !885
  store i64 %1, i64* %pos, align 8, !dbg !885
  store i32 -1, i32* %retval1, align 4, !dbg !887
  %2 = load i32* %whence_addr, align 4, !dbg !888
  %3 = icmp ugt i32 %2, 2, !dbg !888
  br i1 %3, label %bb, label %bb2, !dbg !888

bb:                                               ; preds = %entry
  store i32 22, i32* @errno, align 4, !dbg !889
  br label %bb8, !dbg !889

bb2:                                              ; preds = %entry
  %4 = load %struct.FILE** %stream_addr, align 8, !dbg !890
  %5 = getelementptr inbounds %struct.FILE* %4, i32 0, i32 0, !dbg !890
  %6 = load i16* %5, align 8, !dbg !890
  %7 = zext i16 %6 to i32, !dbg !890
  %8 = and i32 %7, 64, !dbg !890
  %9 = icmp eq i32 %8, 0, !dbg !890
  br i1 %9, label %bb4, label %bb3, !dbg !890

bb3:                                              ; preds = %bb2
  %10 = load %struct.FILE** %stream_addr, align 8, !dbg !890
  %11 = call i64 @__stdio_wcommit(%struct.FILE* noalias %10) nounwind, !dbg !890
  %12 = icmp eq i64 %11, 0, !dbg !890
  br i1 %12, label %bb4, label %bb8, !dbg !890

bb4:                                              ; preds = %bb3, %bb2
  %13 = load i32* %whence_addr, align 4, !dbg !890
  %14 = icmp ne i32 %13, 1, !dbg !890
  br i1 %14, label %bb6, label %bb5, !dbg !890

bb5:                                              ; preds = %bb4
  %15 = load %struct.FILE** %stream_addr, align 8, !dbg !890
  %16 = call i32 @__stdio_adjust_position(%struct.FILE* noalias %15, i64* %pos) nounwind, !dbg !890
  %17 = icmp sge i32 %16, 0, !dbg !890
  br i1 %17, label %bb6, label %bb8, !dbg !890

bb6:                                              ; preds = %bb5, %bb4
  %18 = load %struct.FILE** %stream_addr, align 8, !dbg !890
  %19 = load i32* %whence_addr, align 4, !dbg !890
  %20 = call i32 @__stdio_seek(%struct.FILE* %18, i64* %pos, i32 %19) nounwind, !dbg !890
  %21 = icmp sge i32 %20, 0, !dbg !890
  br i1 %21, label %bb7, label %bb8, !dbg !890

bb7:                                              ; preds = %bb6
  %22 = load %struct.FILE** %stream_addr, align 8, !dbg !891
  %23 = getelementptr inbounds %struct.FILE* %22, i32 0, i32 0, !dbg !891
  %24 = load i16* %23, align 8, !dbg !891
  %25 = and i16 %24, -72, !dbg !891
  %26 = load %struct.FILE** %stream_addr, align 8, !dbg !891
  %27 = getelementptr inbounds %struct.FILE* %26, i32 0, i32 0, !dbg !891
  store i16 %25, i16* %27, align 8, !dbg !891
  %28 = load %struct.FILE** %stream_addr, align 8, !dbg !892
  %29 = getelementptr inbounds %struct.FILE* %28, i32 0, i32 3, !dbg !892
  %30 = load i8** %29, align 8, !dbg !892
  %31 = load %struct.FILE** %stream_addr, align 8, !dbg !892
  %32 = getelementptr inbounds %struct.FILE* %31, i32 0, i32 5, !dbg !892
  store i8* %30, i8** %32, align 8, !dbg !892
  %33 = load %struct.FILE** %stream_addr, align 8, !dbg !892
  %34 = getelementptr inbounds %struct.FILE* %33, i32 0, i32 5, !dbg !892
  %35 = load i8** %34, align 8, !dbg !892
  %36 = load %struct.FILE** %stream_addr, align 8, !dbg !892
  %37 = getelementptr inbounds %struct.FILE* %36, i32 0, i32 6, !dbg !892
  store i8* %35, i8** %37, align 8, !dbg !892
  %38 = load %struct.FILE** %stream_addr, align 8, !dbg !893
  %39 = getelementptr inbounds %struct.FILE* %38, i32 0, i32 3, !dbg !893
  %40 = load i8** %39, align 8, !dbg !893
  %41 = load %struct.FILE** %stream_addr, align 8, !dbg !893
  %42 = getelementptr inbounds %struct.FILE* %41, i32 0, i32 7, !dbg !893
  store i8* %40, i8** %42, align 8, !dbg !893
  %43 = load %struct.FILE** %stream_addr, align 8, !dbg !894
  %44 = getelementptr inbounds %struct.FILE* %43, i32 0, i32 3, !dbg !894
  %45 = load i8** %44, align 8, !dbg !894
  %46 = load %struct.FILE** %stream_addr, align 8, !dbg !894
  %47 = getelementptr inbounds %struct.FILE* %46, i32 0, i32 8, !dbg !894
  store i8* %45, i8** %47, align 8, !dbg !894
  %48 = load %struct.FILE** %stream_addr, align 8, !dbg !895
  %49 = getelementptr inbounds %struct.FILE* %48, i32 0, i32 11, !dbg !895
  %50 = getelementptr inbounds %struct.__mbstate_t* %49, i32 0, i32 0, !dbg !895
  store i32 0, i32* %50, align 8, !dbg !895
  %51 = load %struct.FILE** %stream_addr, align 8, !dbg !896
  %52 = getelementptr inbounds %struct.FILE* %51, i32 0, i32 1, !dbg !896
  %53 = getelementptr inbounds [2 x i8]* %52, i64 0, i64 0, !dbg !896
  store i8 0, i8* %53, align 1, !dbg !896
  store i32 0, i32* %retval1, align 4, !dbg !897
  br label %bb8, !dbg !897

bb8:                                              ; preds = %bb7, %bb6, %bb5, %bb3, %bb
  %54 = load i32* %retval1, align 4, !dbg !898
  store i32 %54, i32* %0, align 4, !dbg !898
  %55 = load i32* %0, align 4, !dbg !898
  store i32 %55, i32* %retval, align 4, !dbg !898
  %retval9 = load i32* %retval, !dbg !898
  ret i32 %retval9, !dbg !898
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
  %1 = load i8** %s1_addr, align 8, !dbg !899
  store i8* %1, i8** %r1, align 8, !dbg !899
  %2 = load i8** %s2_addr, align 8, !dbg !901
  store i8* %2, i8** %r2, align 8, !dbg !901
  br label %bb1, !dbg !901

bb:                                               ; preds = %bb1
  %3 = load i8** %r2, align 8, !dbg !902
  %4 = load i8* %3, align 1, !dbg !902
  %5 = load i8** %r1, align 8, !dbg !902
  store i8 %4, i8* %5, align 1, !dbg !902
  %6 = load i8** %r1, align 8, !dbg !902
  %7 = getelementptr inbounds i8* %6, i64 1, !dbg !902
  store i8* %7, i8** %r1, align 8, !dbg !902
  %8 = load i8** %r2, align 8, !dbg !902
  %9 = getelementptr inbounds i8* %8, i64 1, !dbg !902
  store i8* %9, i8** %r2, align 8, !dbg !902
  %10 = load i64* %n_addr, align 8, !dbg !903
  %11 = sub i64 %10, 1, !dbg !903
  store i64 %11, i64* %n_addr, align 8, !dbg !903
  br label %bb1, !dbg !903

bb1:                                              ; preds = %bb, %entry
  %12 = load i64* %n_addr, align 8, !dbg !904
  %13 = icmp ne i64 %12, 0, !dbg !904
  br i1 %13, label %bb, label %bb2, !dbg !904

bb2:                                              ; preds = %bb1
  %14 = load i8** %r1, align 8, !dbg !905
  store i8* %14, i8** %0, align 8, !dbg !905
  %15 = load i8** %0, align 8, !dbg !905
  store i8* %15, i8** %retval, align 8, !dbg !905
  %retval3 = load i8** %retval, !dbg !905
  ret i8* %retval3, !dbg !905
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
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !906
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 0, !dbg !906
  %3 = load i16* %2, align 8, !dbg !906
  %4 = zext i16 %3 to i32, !dbg !906
  %5 = and i32 %4, 3, !dbg !906
  store i32 %5, i32* %corr, align 4, !dbg !906
  %6 = load i32* %corr, align 4, !dbg !906
  %7 = icmp ne i32 %6, 0, !dbg !906
  br i1 %7, label %bb, label %bb1, !dbg !906

bb:                                               ; preds = %entry
  %8 = load i32* %corr, align 4, !dbg !908
  %9 = sub nsw i32 %8, 1, !dbg !908
  store i32 %9, i32* %corr, align 4, !dbg !908
  br label %bb1, !dbg !908

bb1:                                              ; preds = %bb, %entry
  %10 = load i32* %corr, align 4, !dbg !909
  %11 = icmp ne i32 %10, 0, !dbg !909
  br i1 %11, label %bb2, label %bb8, !dbg !909

bb2:                                              ; preds = %bb1
  %12 = load %struct.FILE** %stream_addr, align 8, !dbg !909
  %13 = getelementptr inbounds %struct.FILE* %12, i32 0, i32 0, !dbg !909
  %14 = load i16* %13, align 8, !dbg !909
  %15 = zext i16 %14 to i32, !dbg !909
  %16 = and i32 %15, 2048, !dbg !909
  %17 = icmp ne i32 %16, 0, !dbg !909
  br i1 %17, label %bb3, label %bb8, !dbg !909

bb3:                                              ; preds = %bb2
  %18 = load i32* %corr, align 4, !dbg !910
  %19 = icmp sgt i32 %18, 1, !dbg !910
  br i1 %19, label %bb5, label %bb4, !dbg !910

bb4:                                              ; preds = %bb3
  %20 = load %struct.FILE** %stream_addr, align 8, !dbg !910
  %21 = getelementptr inbounds %struct.FILE* %20, i32 0, i32 10, !dbg !910
  %22 = getelementptr inbounds [2 x i32]* %21, i64 0, i64 1, !dbg !910
  %23 = load i32* %22, align 4, !dbg !910
  %24 = icmp ne i32 %23, 0, !dbg !910
  br i1 %24, label %bb5, label %bb6, !dbg !910

bb5:                                              ; preds = %bb4, %bb3
  store i32 -1, i32* %0, align 4, !dbg !911
  br label %bb16, !dbg !911

bb6:                                              ; preds = %bb4
  %25 = load %struct.FILE** %stream_addr, align 8, !dbg !912
  %26 = getelementptr inbounds %struct.FILE* %25, i32 0, i32 1, !dbg !912
  %27 = getelementptr inbounds [2 x i8]* %26, i64 0, i64 1, !dbg !912
  %28 = load i8* %27, align 1, !dbg !912
  %29 = zext i8 %28 to i32, !dbg !912
  %30 = add nsw i32 %29, 1, !dbg !912
  %31 = load i32* %corr, align 4, !dbg !912
  %32 = sub nsw i32 %31, %30, !dbg !912
  store i32 %32, i32* %corr, align 4, !dbg !912
  %33 = load %struct.FILE** %stream_addr, align 8, !dbg !913
  %34 = getelementptr inbounds %struct.FILE* %33, i32 0, i32 11, !dbg !913
  %35 = getelementptr inbounds %struct.__mbstate_t* %34, i32 0, i32 0, !dbg !913
  %36 = load i32* %35, align 8, !dbg !913
  %37 = icmp sgt i32 %36, 0, !dbg !913
  br i1 %37, label %bb7, label %bb8, !dbg !913

bb7:                                              ; preds = %bb6
  %38 = load %struct.FILE** %stream_addr, align 8, !dbg !914
  %39 = getelementptr inbounds %struct.FILE* %38, i32 0, i32 1, !dbg !914
  %40 = getelementptr inbounds [2 x i8]* %39, i64 0, i64 0, !dbg !914
  %41 = load i8* %40, align 1, !dbg !914
  %42 = zext i8 %41 to i32, !dbg !914
  %43 = load i32* %corr, align 4, !dbg !914
  %44 = sub nsw i32 %43, %42, !dbg !914
  store i32 %44, i32* %corr, align 4, !dbg !914
  br label %bb8, !dbg !914

bb8:                                              ; preds = %bb7, %bb6, %bb2, %bb1
  %45 = load %struct.FILE** %stream_addr, align 8, !dbg !915
  %46 = getelementptr inbounds %struct.FILE* %45, i32 0, i32 0, !dbg !915
  %47 = load i16* %46, align 8, !dbg !915
  %48 = zext i16 %47 to i32, !dbg !915
  %49 = and i32 %48, 64, !dbg !915
  %50 = icmp ne i32 %49, 0, !dbg !915
  %51 = load %struct.FILE** %stream_addr, align 8, !dbg !915
  br i1 %50, label %bb9, label %bb10, !dbg !915

bb9:                                              ; preds = %bb8
  %52 = getelementptr inbounds %struct.FILE* %51, i32 0, i32 3, !dbg !915
  %53 = load i8** %52, align 8, !dbg !915
  store i8* %53, i8** %iftmp.0, align 8, !dbg !915
  br label %bb11, !dbg !915

bb10:                                             ; preds = %bb8
  %54 = getelementptr inbounds %struct.FILE* %51, i32 0, i32 6, !dbg !915
  %55 = load i8** %54, align 8, !dbg !915
  store i8* %55, i8** %iftmp.0, align 8, !dbg !915
  br label %bb11, !dbg !915

bb11:                                             ; preds = %bb10, %bb9
  %56 = load i8** %iftmp.0, align 8, !dbg !915
  %57 = ptrtoint i8* %56 to i64, !dbg !915
  %58 = trunc i64 %57 to i32, !dbg !915
  %59 = load %struct.FILE** %stream_addr, align 8, !dbg !915
  %60 = getelementptr inbounds %struct.FILE* %59, i32 0, i32 5, !dbg !915
  %61 = load i8** %60, align 8, !dbg !915
  %62 = ptrtoint i8* %61 to i64, !dbg !915
  %63 = trunc i64 %62 to i32, !dbg !915
  %64 = sub i32 %58, %63, !dbg !915
  %65 = load i32* %corr, align 4, !dbg !915
  %66 = add i32 %64, %65, !dbg !915
  store i32 %66, i32* %corr, align 4, !dbg !915
  %67 = load i64** %pos_addr, align 8, !dbg !916
  %68 = load i64* %67, align 8, !dbg !916
  store i64 %68, i64* %oldpos, align 8, !dbg !916
  %69 = load i64** %pos_addr, align 8, !dbg !917
  %70 = load i64* %69, align 8, !dbg !917
  %71 = load i32* %corr, align 4, !dbg !917
  %72 = sext i32 %71 to i64, !dbg !917
  %73 = sub nsw i64 %70, %72, !dbg !917
  %74 = load i64** %pos_addr, align 8, !dbg !917
  store i64 %73, i64* %74, align 8, !dbg !917
  %75 = load i64** %pos_addr, align 8, !dbg !917
  %76 = load i64* %75, align 8, !dbg !917
  %77 = load i64* %oldpos, align 8, !dbg !917
  %78 = icmp sgt i64 %76, %77, !dbg !917
  br i1 %78, label %bb12, label %bb13, !dbg !917

bb12:                                             ; preds = %bb11
  %79 = load i32* %corr, align 4, !dbg !918
  %80 = sub nsw i32 0, %79, !dbg !918
  store i32 %80, i32* %corr, align 4, !dbg !918
  br label %bb13, !dbg !918

bb13:                                             ; preds = %bb12, %bb11
  %81 = load i32* %corr, align 4, !dbg !919
  %82 = icmp slt i32 %81, 0, !dbg !919
  br i1 %82, label %bb14, label %bb15, !dbg !919

bb14:                                             ; preds = %bb13
  store i32 75, i32* @errno, align 4, !dbg !920
  br label %bb15, !dbg !920

bb15:                                             ; preds = %bb14, %bb13
  %83 = load i32* %corr, align 4, !dbg !921
  store i32 %83, i32* %0, align 4, !dbg !921
  br label %bb16, !dbg !921

bb16:                                             ; preds = %bb15, %bb5
  %84 = load i32* %0, align 4, !dbg !911
  store i32 %84, i32* %retval, align 4, !dbg !911
  %retval17 = load i32* %retval, !dbg !911
  ret i32 %retval17, !dbg !911
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
  %1 = load i64** %pos_addr, align 8, !dbg !922
  %2 = load i64* %1, align 8, !dbg !922
  %3 = load %struct.FILE** %stream_addr, align 8, !dbg !922
  %4 = getelementptr inbounds %struct.FILE* %3, i32 0, i32 2, !dbg !922
  %5 = load i32* %4, align 4, !dbg !922
  %6 = load i32* %whence_addr, align 4, !dbg !922
  %7 = call i64 @lseek64(i32 %5, i64 %2, i32 %6) nounwind, !dbg !922
  store i64 %7, i64* %res, align 8, !dbg !922
  %8 = load i64* %res, align 8, !dbg !924
  %9 = icmp sge i64 %8, 0, !dbg !924
  br i1 %9, label %bb, label %bb1, !dbg !924

bb:                                               ; preds = %entry
  %10 = load i64** %pos_addr, align 8, !dbg !924
  %11 = load i64* %res, align 8, !dbg !924
  store i64 %11, i64* %10, align 8, !dbg !924
  store i32 0, i32* %iftmp.0, align 4, !dbg !924
  br label %bb2, !dbg !924

bb1:                                              ; preds = %entry
  %12 = load i64* %res, align 8, !dbg !924
  %13 = trunc i64 %12 to i32, !dbg !924
  store i32 %13, i32* %iftmp.0, align 4, !dbg !924
  br label %bb2, !dbg !924

bb2:                                              ; preds = %bb1, %bb
  %14 = load i32* %iftmp.0, align 4, !dbg !924
  store i32 %14, i32* %0, align 4, !dbg !924
  %15 = load i32* %0, align 4, !dbg !924
  store i32 %15, i32* %retval, align 4, !dbg !924
  %retval3 = load i32* %retval, !dbg !924
  ret i32 %retval3, !dbg !924
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
  %0 = icmp eq i64 %z, 0, !dbg !925
  br i1 %0, label %bb, label %return, !dbg !925

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str32, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str133, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str234, i64 0, i64 0)) noreturn nounwind, !
  unreachable, !dbg !927

return:                                           ; preds = %entry
  ret void, !dbg !928
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

!llvm.dbg.sp = !{!0, !6, !13, !19, !25, !28, !31, !32, !43, !50, !54, !61, !102, !109, !113, !114, !121, !130, !140, !156, !157, !158, !200, !238, !278, !284, !290, !388, !427, !453, !495, !504, !545, !586, !595}
!llvm.dbg.gv = !{!601, !602, !605, !606, !610, !611, !612, !613, !615, !651, !653, !654, !655, !656, !657, !658, !660, !664}
!llvm.dbg.lv.memmove = !{!665, !666, !667, !668, !672}
!llvm.dbg.lv.klee_div_zero_check = !{!675}

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
!43 = metadata !{i32 524334, i32 0, metadata !44, metadata !"putchar_unlocked", metadata !"putchar_unlocked", metadata !"putchar_unlocked", metadata !46, i32 17, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32)* @putchar
!44 = metadata !{i32 524329, metadata !"putchar_unlocked.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !45} ; [ DW_TAG_file_type ]
!45 = metadata !{i32 524305, i32 0, i32 1, metadata !"putchar_unlocked.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_
!46 = metadata !{i32 524329, metadata !"putchar.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !45} ; [ DW_TAG_file_type ]
!47 = metadata !{i32 524309, metadata !44, metadata !"", metadata !44, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, null} ; [ DW_TAG_subroutine_type ]
!48 = metadata !{metadata !49, metadata !49}
!49 = metadata !{i32 524324, metadata !44, metadata !"int", metadata !44, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!50 = metadata !{i32 524334, i32 0, metadata !51, metadata !"abort", metadata !"abort", metadata !"abort", metadata !51, i32 57, metadata !53, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void ()* @abort} ; [ DW_TAG_subprogram ]
!51 = metadata !{i32 524329, metadata !"abort.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdlib", metadata !52} ; [ DW_TAG_file_type ]
!52 = metadata !{i32 524305, i32 0, i32 1, metadata !"abort.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdlib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_un
!53 = metadata !{i32 524309, metadata !51, metadata !"", metadata !51, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!54 = metadata !{i32 524334, i32 0, metadata !55, metadata !"__errno_location", metadata !"__errno_location", metadata !"__errno_location", metadata !55, i32 12, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32* ()* @__errno_l
!55 = metadata !{i32 524329, metadata !"__errno_location.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !56} ; [ DW_TAG_file_type ]
!56 = metadata !{i32 524305, i32 0, i32 1, metadata !"__errno_location.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; 
!57 = metadata !{i32 524309, metadata !55, metadata !"", metadata !55, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null} ; [ DW_TAG_subroutine_type ]
!58 = metadata !{metadata !59}
!59 = metadata !{i32 524303, metadata !55, metadata !"", metadata !55, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ]
!60 = metadata !{i32 524324, metadata !55, metadata !"int", metadata !55, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!61 = metadata !{i32 524334, i32 0, metadata !62, metadata !"__fputc_unlocked", metadata !"__fputc_unlocked", metadata !"__fputc_unlocked", metadata !64, i32 20, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, %struct.F
!62 = metadata !{i32 524329, metadata !"fputc_unlocked.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !63} ; [ DW_TAG_file_type ]
!63 = metadata !{i32 524305, i32 0, i32 1, metadata !"fputc_unlocked.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_co
!64 = metadata !{i32 524329, metadata !"fputc.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !63} ; [ DW_TAG_file_type ]
!65 = metadata !{i32 524309, metadata !62, metadata !"", metadata !62, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null} ; [ DW_TAG_subroutine_type ]
!66 = metadata !{metadata !67, metadata !67, metadata !68}
!67 = metadata !{i32 524324, metadata !62, metadata !"int", metadata !62, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!68 = metadata !{i32 524303, metadata !62, metadata !"", metadata !62, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ]
!69 = metadata !{i32 524310, metadata !70, metadata !"FILE", metadata !70, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ]
!70 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !63} ; [ DW_TAG_file_type ]
!71 = metadata !{i32 524307, metadata !62, metadata !"__STDIO_FILE_STRUCT", metadata !70, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !72, i32 0, null} ; [ DW_TAG_structure_type ]
!72 = metadata !{metadata !73, metadata !76, metadata !81, metadata !82, metadata !84, metadata !85, metadata !86, metadata !87, metadata !88, metadata !89, metadata !91, metadata !95}
!73 = metadata !{i32 524301, metadata !71, metadata !"__modeflags", metadata !74, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !75} ; [ DW_TAG_member ]
!74 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !63} ; [ DW_TAG_file_type ]
!75 = metadata !{i32 524324, metadata !62, metadata !"short unsigned int", metadata !62, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!76 = metadata !{i32 524301, metadata !71, metadata !"__ungot_width", metadata !74, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !77} ; [ DW_TAG_member ]
!77 = metadata !{i32 524289, metadata !62, metadata !"", metadata !62, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !78, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!78 = metadata !{i32 524324, metadata !62, metadata !"unsigned char", metadata !62, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!79 = metadata !{metadata !80}
!80 = metadata !{i32 524321, i64 0, i64 1}        ; [ DW_TAG_subrange_type ]
!81 = metadata !{i32 524301, metadata !71, metadata !"__filedes", metadata !74, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !67} ; [ DW_TAG_member ]
!82 = metadata !{i32 524301, metadata !71, metadata !"__bufstart", metadata !74, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !83} ; [ DW_TAG_member ]
!83 = metadata !{i32 524303, metadata !62, metadata !"", metadata !62, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_pointer_type ]
!84 = metadata !{i32 524301, metadata !71, metadata !"__bufend", metadata !74, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !83} ; [ DW_TAG_member ]
!85 = metadata !{i32 524301, metadata !71, metadata !"__bufpos", metadata !74, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !83} ; [ DW_TAG_member ]
!86 = metadata !{i32 524301, metadata !71, metadata !"__bufread", metadata !74, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !83} ; [ DW_TAG_member ]
!87 = metadata !{i32 524301, metadata !71, metadata !"__bufgetc_u", metadata !74, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !83} ; [ DW_TAG_member ]
!88 = metadata !{i32 524301, metadata !71, metadata !"__bufputc_u", metadata !74, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !83} ; [ DW_TAG_member ]
!89 = metadata !{i32 524301, metadata !71, metadata !"__nextopen", metadata !74, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !90} ; [ DW_TAG_member ]
!90 = metadata !{i32 524303, metadata !62, metadata !"", metadata !62, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !71} ; [ DW_TAG_pointer_type ]
!91 = metadata !{i32 524301, metadata !71, metadata !"__ungot", metadata !74, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !92} ; [ DW_TAG_member ]
!92 = metadata !{i32 524289, metadata !62, metadata !"", metadata !62, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !93, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!93 = metadata !{i32 524310, metadata !94, metadata !"wchar_t", metadata !94, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ]
!94 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !63} ; [ DW_TAG_file_type ]
!95 = metadata !{i32 524301, metadata !71, metadata !"__state", metadata !74, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !96} ; [ DW_TAG_member ]
!96 = metadata !{i32 524310, metadata !97, metadata !"__mbstate_t", metadata !97, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !98} ; [ DW_TAG_typedef ]
!97 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !63} ; [ DW_TAG_file_type ]
!98 = metadata !{i32 524307, metadata !62, metadata !"", metadata !97, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !99, i32 0, null} ; [ DW_TAG_structure_type ]
!99 = metadata !{metadata !100, metadata !101}
!100 = metadata !{i32 524301, metadata !98, metadata !"__mask", metadata !97, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !93} ; [ DW_TAG_member ]
!101 = metadata !{i32 524301, metadata !98, metadata !"__wc", metadata !97, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !93} ; [ DW_TAG_member ]
!102 = metadata !{i32 524334, i32 0, metadata !103, metadata !"__h_errno_location", metadata !"__h_errno_location", metadata !"__h_errno_location", metadata !103, i32 11, metadata !105, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32* ()* 
!103 = metadata !{i32 524329, metadata !"__h_errno_location.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !104} ; [ DW_TAG_file_type ]
!104 = metadata !{i32 524305, i32 0, i32 1, metadata !"__h_errno_location.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0}
!105 = metadata !{i32 524309, metadata !103, metadata !"", metadata !103, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !106, i32 0, null} ; [ DW_TAG_subroutine_type ]
!106 = metadata !{metadata !107}
!107 = metadata !{i32 524303, metadata !103, metadata !"", metadata !103, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !108} ; [ DW_TAG_pointer_type ]
!108 = metadata !{i32 524324, metadata !103, metadata !"int", metadata !103, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!109 = metadata !{i32 524334, i32 0, metadata !110, metadata !"_stdio_term", metadata !"_stdio_term", metadata !"_stdio_term", metadata !110, i32 211, metadata !112, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void ()* @_stdio_term} ; [ DW
!110 = metadata !{i32 524329, metadata !"_stdio.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !111} ; [ DW_TAG_file_type ]
!111 = metadata !{i32 524305, i32 0, i32 1, metadata !"_stdio.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!112 = metadata !{i32 524309, metadata !110, metadata !"", metadata !110, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!113 = metadata !{i32 524334, i32 0, metadata !110, metadata !"_stdio_init", metadata !"_stdio_init", metadata !"_stdio_init", metadata !110, i32 278, metadata !112, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void ()* @_stdio_init} ; [ DW
!114 = metadata !{i32 524334, i32 0, metadata !115, metadata !"exit", metadata !"exit", metadata !"exit", metadata !117, i32 319, metadata !118, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, void (i32)* @exit} ; [ DW_TAG_subprogram ]
!115 = metadata !{i32 524329, metadata !"exit.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdlib", metadata !116} ; [ DW_TAG_file_type ]
!116 = metadata !{i32 524305, i32 0, i32 1, metadata !"exit.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdlib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_un
!117 = metadata !{i32 524329, metadata !"_atexit.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdlib", metadata !116} ; [ DW_TAG_file_type ]
!118 = metadata !{i32 524309, metadata !115, metadata !"", metadata !115, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !119, i32 0, null} ; [ DW_TAG_subroutine_type ]
!119 = metadata !{null, metadata !120}
!120 = metadata !{i32 524324, metadata !115, metadata !"int", metadata !115, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!121 = metadata !{i32 524334, i32 0, metadata !122, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !122, i32 19, metadata !124, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*, i8*, i64)* @memcpy} ; [ DW_TAG_subp
!122 = metadata !{i32 524329, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !123} ; [ DW_TAG_file_type ]
!123 = metadata !{i32 524305, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_
!124 = metadata !{i32 524309, metadata !122, metadata !"", metadata !122, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !125, i32 0, null} ; [ DW_TAG_subroutine_type ]
!125 = metadata !{metadata !126, metadata !126, metadata !126, metadata !127}
!126 = metadata !{i32 524303, metadata !122, metadata !"", metadata !122, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!127 = metadata !{i32 524310, metadata !128, metadata !"size_t", metadata !128, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !129} ; [ DW_TAG_typedef ]
!128 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !123} ; [ DW_TAG_file_type ]
!129 = metadata !{i32 524324, metadata !122, metadata !"long unsigned int", metadata !122, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!130 = metadata !{i32 524334, i32 0, metadata !131, metadata !"memset", metadata !"memset", metadata !"memset", metadata !131, i32 18, metadata !133, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*, i32, i64)* @memset} ; [ DW_TAG_subp
!131 = metadata !{i32 524329, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !132} ; [ DW_TAG_file_type ]
!132 = metadata !{i32 524305, i32 0, i32 1, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_
!133 = metadata !{i32 524309, metadata !131, metadata !"", metadata !131, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !134, i32 0, null} ; [ DW_TAG_subroutine_type ]
!134 = metadata !{metadata !135, metadata !135, metadata !136, metadata !137}
!135 = metadata !{i32 524303, metadata !131, metadata !"", metadata !131, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!136 = metadata !{i32 524324, metadata !131, metadata !"int", metadata !131, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!137 = metadata !{i32 524310, metadata !138, metadata !"size_t", metadata !138, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !139} ; [ DW_TAG_typedef ]
!138 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !132} ; [ DW_TAG_file_type ]
!139 = metadata !{i32 524324, metadata !131, metadata !"long unsigned int", metadata !131, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!140 = metadata !{i32 524334, i32 0, metadata !141, metadata !"__sigismember", metadata !"__sigismember", metadata !"__sigismember", metadata !143, i32 117, metadata !144, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.__sigset_t
!141 = metadata !{i32 524329, metadata !"sigsetops.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !142} ; [ DW_TAG_file_type ]
!142 = metadata !{i32 524305, i32 0, i32 1, metadata !"sigsetops.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compi
!143 = metadata !{i32 524329, metadata !"sigset.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !142} ; [ DW_TAG_file_type ]
!144 = metadata !{i32 524309, metadata !141, metadata !"", metadata !141, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !145, i32 0, null} ; [ DW_TAG_subroutine_type ]
!145 = metadata !{metadata !146, metadata !147, metadata !146}
!146 = metadata !{i32 524324, metadata !141, metadata !"int", metadata !141, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!147 = metadata !{i32 524303, metadata !141, metadata !"", metadata !141, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !148} ; [ DW_TAG_pointer_type ]
!148 = metadata !{i32 524310, metadata !143, metadata !"__sigset_t", metadata !143, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !149} ; [ DW_TAG_typedef ]
!149 = metadata !{i32 524307, metadata !141, metadata !"", metadata !143, i32 29, i64 1024, i64 64, i64 0, i32 0, null, metadata !150, i32 0, null} ; [ DW_TAG_structure_type ]
!150 = metadata !{metadata !151}
!151 = metadata !{i32 524301, metadata !149, metadata !"__val", metadata !143, i32 30, i64 1024, i64 64, i64 0, i32 0, metadata !152} ; [ DW_TAG_member ]
!152 = metadata !{i32 524289, metadata !141, metadata !"", metadata !141, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !153, metadata !154, i32 0, null} ; [ DW_TAG_array_type ]
!153 = metadata !{i32 524324, metadata !141, metadata !"long unsigned int", metadata !141, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!154 = metadata !{metadata !155}
!155 = metadata !{i32 524321, i64 0, i64 15}      ; [ DW_TAG_subrange_type ]
!156 = metadata !{i32 524334, i32 0, metadata !141, metadata !"__sigaddset", metadata !"__sigaddset", metadata !"__sigaddset", metadata !143, i32 118, metadata !144, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.__sigset_t*, i32
!157 = metadata !{i32 524334, i32 0, metadata !141, metadata !"__sigdelset", metadata !"__sigdelset", metadata !"__sigdelset", metadata !143, i32 119, metadata !144, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.__sigset_t*, i32
!158 = metadata !{i32 524334, i32 0, metadata !159, metadata !"__stdio_WRITE", metadata !"__stdio_WRITE", metadata !"__stdio_WRITE", metadata !159, i32 35, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i64 (%struct.FILE*, i8*,
!159 = metadata !{i32 524329, metadata !"_WRITE.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !160} ; [ DW_TAG_file_type ]
!160 = metadata !{i32 524305, i32 0, i32 1, metadata !"_WRITE.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!161 = metadata !{i32 524309, metadata !159, metadata !"", metadata !159, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !162, i32 0, null} ; [ DW_TAG_subroutine_type ]
!162 = metadata !{metadata !163, metadata !166, metadata !198, metadata !163}
!163 = metadata !{i32 524310, metadata !164, metadata !"size_t", metadata !164, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !165} ; [ DW_TAG_typedef ]
!164 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !160} ; [ DW_TAG_file_type ]
!165 = metadata !{i32 524324, metadata !159, metadata !"long unsigned int", metadata !159, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!166 = metadata !{i32 524303, metadata !159, metadata !"", metadata !159, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !167} ; [ DW_TAG_pointer_type ]
!167 = metadata !{i32 524310, metadata !168, metadata !"FILE", metadata !168, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !169} ; [ DW_TAG_typedef ]
!168 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !160} ; [ DW_TAG_file_type ]
!169 = metadata !{i32 524307, metadata !159, metadata !"__STDIO_FILE_STRUCT", metadata !168, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !170, i32 0, null} ; [ DW_TAG_structure_type ]
!170 = metadata !{metadata !171, metadata !174, metadata !177, metadata !179, metadata !181, metadata !182, metadata !183, metadata !184, metadata !185, metadata !186, metadata !188, metadata !191}
!171 = metadata !{i32 524301, metadata !169, metadata !"__modeflags", metadata !172, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ]
!172 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !160} ; [ DW_TAG_file_type ]
!173 = metadata !{i32 524324, metadata !159, metadata !"short unsigned int", metadata !159, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!174 = metadata !{i32 524301, metadata !169, metadata !"__ungot_width", metadata !172, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !175} ; [ DW_TAG_member ]
!175 = metadata !{i32 524289, metadata !159, metadata !"", metadata !159, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !176, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!176 = metadata !{i32 524324, metadata !159, metadata !"unsigned char", metadata !159, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!177 = metadata !{i32 524301, metadata !169, metadata !"__filedes", metadata !172, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !178} ; [ DW_TAG_member ]
!178 = metadata !{i32 524324, metadata !159, metadata !"int", metadata !159, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!179 = metadata !{i32 524301, metadata !169, metadata !"__bufstart", metadata !172, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !180} ; [ DW_TAG_member ]
!180 = metadata !{i32 524303, metadata !159, metadata !"", metadata !159, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !176} ; [ DW_TAG_pointer_type ]
!181 = metadata !{i32 524301, metadata !169, metadata !"__bufend", metadata !172, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !180} ; [ DW_TAG_member ]
!182 = metadata !{i32 524301, metadata !169, metadata !"__bufpos", metadata !172, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !180} ; [ DW_TAG_member ]
!183 = metadata !{i32 524301, metadata !169, metadata !"__bufread", metadata !172, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !180} ; [ DW_TAG_member ]
!184 = metadata !{i32 524301, metadata !169, metadata !"__bufgetc_u", metadata !172, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !180} ; [ DW_TAG_member ]
!185 = metadata !{i32 524301, metadata !169, metadata !"__bufputc_u", metadata !172, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !180} ; [ DW_TAG_member ]
!186 = metadata !{i32 524301, metadata !169, metadata !"__nextopen", metadata !172, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !187} ; [ DW_TAG_member ]
!187 = metadata !{i32 524303, metadata !159, metadata !"", metadata !159, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !169} ; [ DW_TAG_pointer_type ]
!188 = metadata !{i32 524301, metadata !169, metadata !"__ungot", metadata !172, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !189} ; [ DW_TAG_member ]
!189 = metadata !{i32 524289, metadata !159, metadata !"", metadata !159, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !190, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!190 = metadata !{i32 524310, metadata !164, metadata !"wchar_t", metadata !164, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !178} ; [ DW_TAG_typedef ]
!191 = metadata !{i32 524301, metadata !169, metadata !"__state", metadata !172, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !192} ; [ DW_TAG_member ]
!192 = metadata !{i32 524310, metadata !193, metadata !"__mbstate_t", metadata !193, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !194} ; [ DW_TAG_typedef ]
!193 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !160} ; [ DW_TAG_file_type ]
!194 = metadata !{i32 524307, metadata !159, metadata !"", metadata !193, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !195, i32 0, null} ; [ DW_TAG_structure_type ]
!195 = metadata !{metadata !196, metadata !197}
!196 = metadata !{i32 524301, metadata !194, metadata !"__mask", metadata !193, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !190} ; [ DW_TAG_member ]
!197 = metadata !{i32 524301, metadata !194, metadata !"__wc", metadata !193, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !190} ; [ DW_TAG_member ]
!198 = metadata !{i32 524303, metadata !159, metadata !"", metadata !159, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !199} ; [ DW_TAG_pointer_type ]
!199 = metadata !{i32 524326, metadata !159, metadata !"", metadata !159, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !176} ; [ DW_TAG_const_type ]
!200 = metadata !{i32 524334, i32 0, metadata !201, metadata !"__stdio_trans2w_o", metadata !"__stdio_trans2w_o", metadata !"__stdio_trans2w_o", metadata !201, i32 30, metadata !203, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct
!201 = metadata !{i32 524329, metadata !"_trans2w.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !202} ; [ DW_TAG_file_type ]
!202 = metadata !{i32 524305, i32 0, i32 1, metadata !"_trans2w.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile
!203 = metadata !{i32 524309, metadata !201, metadata !"", metadata !201, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !204, i32 0, null} ; [ DW_TAG_subroutine_type ]
!204 = metadata !{metadata !205, metadata !206, metadata !205}
!205 = metadata !{i32 524324, metadata !201, metadata !"int", metadata !201, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!206 = metadata !{i32 524303, metadata !201, metadata !"", metadata !201, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !207} ; [ DW_TAG_pointer_type ]
!207 = metadata !{i32 524310, metadata !208, metadata !"FILE", metadata !208, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !209} ; [ DW_TAG_typedef ]
!208 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !202} ; [ DW_TAG_file_type ]
!209 = metadata !{i32 524307, metadata !201, metadata !"__STDIO_FILE_STRUCT", metadata !208, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !210, i32 0, null} ; [ DW_TAG_structure_type ]
!210 = metadata !{metadata !211, metadata !214, metadata !217, metadata !218, metadata !220, metadata !221, metadata !222, metadata !223, metadata !224, metadata !225, metadata !227, metadata !231}
!211 = metadata !{i32 524301, metadata !209, metadata !"__modeflags", metadata !212, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !213} ; [ DW_TAG_member ]
!212 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !202} ; [ DW_TAG_file_type ]
!213 = metadata !{i32 524324, metadata !201, metadata !"short unsigned int", metadata !201, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!214 = metadata !{i32 524301, metadata !209, metadata !"__ungot_width", metadata !212, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !215} ; [ DW_TAG_member ]
!215 = metadata !{i32 524289, metadata !201, metadata !"", metadata !201, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !216, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!216 = metadata !{i32 524324, metadata !201, metadata !"unsigned char", metadata !201, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!217 = metadata !{i32 524301, metadata !209, metadata !"__filedes", metadata !212, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !205} ; [ DW_TAG_member ]
!218 = metadata !{i32 524301, metadata !209, metadata !"__bufstart", metadata !212, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !219} ; [ DW_TAG_member ]
!219 = metadata !{i32 524303, metadata !201, metadata !"", metadata !201, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !216} ; [ DW_TAG_pointer_type ]
!220 = metadata !{i32 524301, metadata !209, metadata !"__bufend", metadata !212, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !219} ; [ DW_TAG_member ]
!221 = metadata !{i32 524301, metadata !209, metadata !"__bufpos", metadata !212, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !219} ; [ DW_TAG_member ]
!222 = metadata !{i32 524301, metadata !209, metadata !"__bufread", metadata !212, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !219} ; [ DW_TAG_member ]
!223 = metadata !{i32 524301, metadata !209, metadata !"__bufgetc_u", metadata !212, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !219} ; [ DW_TAG_member ]
!224 = metadata !{i32 524301, metadata !209, metadata !"__bufputc_u", metadata !212, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !219} ; [ DW_TAG_member ]
!225 = metadata !{i32 524301, metadata !209, metadata !"__nextopen", metadata !212, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !226} ; [ DW_TAG_member ]
!226 = metadata !{i32 524303, metadata !201, metadata !"", metadata !201, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !209} ; [ DW_TAG_pointer_type ]
!227 = metadata !{i32 524301, metadata !209, metadata !"__ungot", metadata !212, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !228} ; [ DW_TAG_member ]
!228 = metadata !{i32 524289, metadata !201, metadata !"", metadata !201, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !229, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!229 = metadata !{i32 524310, metadata !230, metadata !"wchar_t", metadata !230, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !205} ; [ DW_TAG_typedef ]
!230 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !202} ; [ DW_TAG_file_type ]
!231 = metadata !{i32 524301, metadata !209, metadata !"__state", metadata !212, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !232} ; [ DW_TAG_member ]
!232 = metadata !{i32 524310, metadata !233, metadata !"__mbstate_t", metadata !233, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !234} ; [ DW_TAG_typedef ]
!233 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !202} ; [ DW_TAG_file_type ]
!234 = metadata !{i32 524307, metadata !201, metadata !"", metadata !233, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !235, i32 0, null} ; [ DW_TAG_structure_type ]
!235 = metadata !{metadata !236, metadata !237}
!236 = metadata !{i32 524301, metadata !234, metadata !"__mask", metadata !233, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !229} ; [ DW_TAG_member ]
!237 = metadata !{i32 524301, metadata !234, metadata !"__wc", metadata !233, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !229} ; [ DW_TAG_member ]
!238 = metadata !{i32 524334, i32 0, metadata !239, metadata !"__stdio_wcommit", metadata !"__stdio_wcommit", metadata !"__stdio_wcommit", metadata !239, i32 18, metadata !241, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i64 (%struct.FILE*
!239 = metadata !{i32 524329, metadata !"_wcommit.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !240} ; [ DW_TAG_file_type ]
!240 = metadata !{i32 524305, i32 0, i32 1, metadata !"_wcommit.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile
!241 = metadata !{i32 524309, metadata !239, metadata !"", metadata !239, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !242, i32 0, null} ; [ DW_TAG_subroutine_type ]
!242 = metadata !{metadata !243, metadata !246}
!243 = metadata !{i32 524310, metadata !244, metadata !"size_t", metadata !244, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !245} ; [ DW_TAG_typedef ]
!244 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !240} ; [ DW_TAG_file_type ]
!245 = metadata !{i32 524324, metadata !239, metadata !"long unsigned int", metadata !239, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!246 = metadata !{i32 524303, metadata !239, metadata !"", metadata !239, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !247} ; [ DW_TAG_pointer_type ]
!247 = metadata !{i32 524310, metadata !248, metadata !"FILE", metadata !248, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !249} ; [ DW_TAG_typedef ]
!248 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !240} ; [ DW_TAG_file_type ]
!249 = metadata !{i32 524307, metadata !239, metadata !"__STDIO_FILE_STRUCT", metadata !248, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !250, i32 0, null} ; [ DW_TAG_structure_type ]
!250 = metadata !{metadata !251, metadata !254, metadata !257, metadata !259, metadata !261, metadata !262, metadata !263, metadata !264, metadata !265, metadata !266, metadata !268, metadata !271}
!251 = metadata !{i32 524301, metadata !249, metadata !"__modeflags", metadata !252, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !253} ; [ DW_TAG_member ]
!252 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !240} ; [ DW_TAG_file_type ]
!253 = metadata !{i32 524324, metadata !239, metadata !"short unsigned int", metadata !239, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!254 = metadata !{i32 524301, metadata !249, metadata !"__ungot_width", metadata !252, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !255} ; [ DW_TAG_member ]
!255 = metadata !{i32 524289, metadata !239, metadata !"", metadata !239, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !256, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!256 = metadata !{i32 524324, metadata !239, metadata !"unsigned char", metadata !239, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!257 = metadata !{i32 524301, metadata !249, metadata !"__filedes", metadata !252, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !258} ; [ DW_TAG_member ]
!258 = metadata !{i32 524324, metadata !239, metadata !"int", metadata !239, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!259 = metadata !{i32 524301, metadata !249, metadata !"__bufstart", metadata !252, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !260} ; [ DW_TAG_member ]
!260 = metadata !{i32 524303, metadata !239, metadata !"", metadata !239, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !256} ; [ DW_TAG_pointer_type ]
!261 = metadata !{i32 524301, metadata !249, metadata !"__bufend", metadata !252, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !260} ; [ DW_TAG_member ]
!262 = metadata !{i32 524301, metadata !249, metadata !"__bufpos", metadata !252, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !260} ; [ DW_TAG_member ]
!263 = metadata !{i32 524301, metadata !249, metadata !"__bufread", metadata !252, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !260} ; [ DW_TAG_member ]
!264 = metadata !{i32 524301, metadata !249, metadata !"__bufgetc_u", metadata !252, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !260} ; [ DW_TAG_member ]
!265 = metadata !{i32 524301, metadata !249, metadata !"__bufputc_u", metadata !252, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !260} ; [ DW_TAG_member ]
!266 = metadata !{i32 524301, metadata !249, metadata !"__nextopen", metadata !252, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !267} ; [ DW_TAG_member ]
!267 = metadata !{i32 524303, metadata !239, metadata !"", metadata !239, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !249} ; [ DW_TAG_pointer_type ]
!268 = metadata !{i32 524301, metadata !249, metadata !"__ungot", metadata !252, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !269} ; [ DW_TAG_member ]
!269 = metadata !{i32 524289, metadata !239, metadata !"", metadata !239, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !270, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!270 = metadata !{i32 524310, metadata !244, metadata !"wchar_t", metadata !244, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !258} ; [ DW_TAG_typedef ]
!271 = metadata !{i32 524301, metadata !249, metadata !"__state", metadata !252, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !272} ; [ DW_TAG_member ]
!272 = metadata !{i32 524310, metadata !273, metadata !"__mbstate_t", metadata !273, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !274} ; [ DW_TAG_typedef ]
!273 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !240} ; [ DW_TAG_file_type ]
!274 = metadata !{i32 524307, metadata !239, metadata !"", metadata !273, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !275, i32 0, null} ; [ DW_TAG_structure_type ]
!275 = metadata !{metadata !276, metadata !277}
!276 = metadata !{i32 524301, metadata !274, metadata !"__mask", metadata !273, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !270} ; [ DW_TAG_member ]
!277 = metadata !{i32 524301, metadata !274, metadata !"__wc", metadata !273, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !270} ; [ DW_TAG_member ]
!278 = metadata !{i32 524334, i32 0, metadata !279, metadata !"isatty", metadata !"isatty", metadata !"isatty", metadata !279, i32 27, metadata !281, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32)* @isatty} ; [ DW_TAG_subprogram ]
!279 = metadata !{i32 524329, metadata !"isatty.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/termios", metadata !280} ; [ DW_TAG_file_type ]
!280 = metadata !{i32 524305, i32 0, i32 1, metadata !"isatty.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/termios", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile
!281 = metadata !{i32 524309, metadata !279, metadata !"", metadata !279, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !282, i32 0, null} ; [ DW_TAG_subroutine_type ]
!282 = metadata !{metadata !283, metadata !283}
!283 = metadata !{i32 524324, metadata !279, metadata !"int", metadata !279, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!284 = metadata !{i32 524334, i32 0, metadata !285, metadata !"__raise", metadata !"__raise", metadata !"__raise", metadata !285, i32 16, metadata !287, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32)* @__raise} ; [ DW_TAG_subprogram
!285 = metadata !{i32 524329, metadata !"raise.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !286} ; [ DW_TAG_file_type ]
!286 = metadata !{i32 524305, i32 0, i32 1, metadata !"raise.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!287 = metadata !{i32 524309, metadata !285, metadata !"", metadata !285, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !288, i32 0, null} ; [ DW_TAG_subroutine_type ]
!288 = metadata !{metadata !289, metadata !289}
!289 = metadata !{i32 524324, metadata !285, metadata !"int", metadata !285, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!290 = metadata !{i32 524334, i32 0, metadata !291, metadata !"__libc_sigaction", metadata !"__libc_sigaction", metadata !"__libc_sigaction", metadata !291, i32 43, metadata !293, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, %stru
!291 = metadata !{i32 524329, metadata !"sigaction.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !292} ; [ DW_TAG_file_type ]
!292 = metadata !{i32 524305, i32 0, i32 1, metadata !"sigaction.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compi
!293 = metadata !{i32 524309, metadata !291, metadata !"", metadata !291, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !294, i32 0, null} ; [ DW_TAG_subroutine_type ]
!294 = metadata !{metadata !295, metadata !295, metadata !296, metadata !387}
!295 = metadata !{i32 524324, metadata !291, metadata !"int", metadata !291, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!296 = metadata !{i32 524303, metadata !291, metadata !"", metadata !291, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !297} ; [ DW_TAG_pointer_type ]
!297 = metadata !{i32 524326, metadata !291, metadata !"", metadata !291, i32 0, i64 1216, i64 64, i64 0, i32 0, metadata !298} ; [ DW_TAG_const_type ]
!298 = metadata !{i32 524307, metadata !291, metadata !"sigaction", metadata !299, i32 26, i64 1216, i64 64, i64 0, i32 0, null, metadata !300, i32 0, null} ; [ DW_TAG_structure_type ]
!299 = metadata !{i32 524329, metadata !"sigaction.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !292} ; [ DW_TAG_file_type ]
!300 = metadata !{metadata !301, metadata !375, metadata !383, metadata !384}
!301 = metadata !{i32 524301, metadata !298, metadata !"__sigaction_handler", metadata !299, i32 36, i64 64, i64 64, i64 0, i32 0, metadata !302} ; [ DW_TAG_member ]
!302 = metadata !{i32 524311, metadata !291, metadata !"", metadata !299, i32 30, i64 64, i64 64, i64 0, i32 0, null, metadata !303, i32 0, null} ; [ DW_TAG_union_type ]
!303 = metadata !{metadata !304, metadata !310}
!304 = metadata !{i32 524301, metadata !302, metadata !"sa_handler", metadata !299, i32 32, i64 64, i64 64, i64 0, i32 0, metadata !305} ; [ DW_TAG_member ]
!305 = metadata !{i32 524310, metadata !306, metadata !"__sighandler_t", metadata !306, i32 75, i64 0, i64 0, i64 0, i32 0, metadata !307} ; [ DW_TAG_typedef ]
!306 = metadata !{i32 524329, metadata !"signal.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !292} ; [ DW_TAG_file_type ]
!307 = metadata !{i32 524303, metadata !291, metadata !"", metadata !291, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !308} ; [ DW_TAG_pointer_type ]
!308 = metadata !{i32 524309, metadata !291, metadata !"", metadata !291, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !309, i32 0, null} ; [ DW_TAG_subroutine_type ]
!309 = metadata !{null, metadata !295}
!310 = metadata !{i32 524301, metadata !302, metadata !"sa_sigaction", metadata !299, i32 34, i64 64, i64 64, i64 0, i32 0, metadata !311} ; [ DW_TAG_member ]
!311 = metadata !{i32 524303, metadata !291, metadata !"", metadata !291, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !312} ; [ DW_TAG_pointer_type ]
!312 = metadata !{i32 524309, metadata !291, metadata !"", metadata !291, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !313, i32 0, null} ; [ DW_TAG_subroutine_type ]
!313 = metadata !{null, metadata !295, metadata !314, metadata !349}
!314 = metadata !{i32 524303, metadata !291, metadata !"", metadata !291, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !315} ; [ DW_TAG_pointer_type ]
!315 = metadata !{i32 524310, metadata !316, metadata !"siginfo_t", metadata !316, i32 108, i64 0, i64 0, i64 0, i32 0, metadata !317} ; [ DW_TAG_typedef ]
!316 = metadata !{i32 524329, metadata !"siginfo.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !292} ; [ DW_TAG_file_type ]
!317 = metadata !{i32 524307, metadata !291, metadata !"siginfo", metadata !316, i32 52, i64 1024, i64 64, i64 0, i32 0, null, metadata !318, i32 0, null} ; [ DW_TAG_structure_type ]
!318 = metadata !{metadata !319, metadata !320, metadata !321, metadata !322}
!319 = metadata !{i32 524301, metadata !317, metadata !"si_signo", metadata !316, i32 53, i64 32, i64 32, i64 0, i32 0, metadata !295} ; [ DW_TAG_member ]
!320 = metadata !{i32 524301, metadata !317, metadata !"si_errno", metadata !316, i32 54, i64 32, i64 32, i64 32, i32 0, metadata !295} ; [ DW_TAG_member ]
!321 = metadata !{i32 524301, metadata !317, metadata !"si_code", metadata !316, i32 56, i64 32, i64 32, i64 64, i32 0, metadata !295} ; [ DW_TAG_member ]
!322 = metadata !{i32 524301, metadata !317, metadata !"_sifields", metadata !316, i32 107, i64 896, i64 64, i64 128, i32 0, metadata !323} ; [ DW_TAG_member ]
!323 = metadata !{i32 524311, metadata !291, metadata !"", metadata !316, i32 59, i64 896, i64 64, i64 0, i32 0, null, metadata !324, i32 0, null} ; [ DW_TAG_union_type ]
!324 = metadata !{metadata !325, metadata !329, metadata !338, metadata !350, metadata !356, metadata !366, metadata !370}
!325 = metadata !{i32 524301, metadata !323, metadata !"_pad", metadata !316, i32 60, i64 896, i64 32, i64 0, i32 0, metadata !326} ; [ DW_TAG_member ]
!326 = metadata !{i32 524289, metadata !291, metadata !"", metadata !291, i32 0, i64 896, i64 32, i64 0, i32 0, metadata !295, metadata !327, i32 0, null} ; [ DW_TAG_array_type ]
!327 = metadata !{metadata !328}
!328 = metadata !{i32 524321, i64 0, i64 27}      ; [ DW_TAG_subrange_type ]
!329 = metadata !{i32 524301, metadata !323, metadata !"_kill", metadata !316, i32 67, i64 64, i64 32, i64 0, i32 0, metadata !330} ; [ DW_TAG_member ]
!330 = metadata !{i32 524307, metadata !291, metadata !"", metadata !316, i32 64, i64 64, i64 32, i64 0, i32 0, null, metadata !331, i32 0, null} ; [ DW_TAG_structure_type ]
!331 = metadata !{metadata !332, metadata !335}
!332 = metadata !{i32 524301, metadata !330, metadata !"si_pid", metadata !316, i32 65, i64 32, i64 32, i64 0, i32 0, metadata !333} ; [ DW_TAG_member ]
!333 = metadata !{i32 524310, metadata !334, metadata !"__pid_t", metadata !334, i32 147, i64 0, i64 0, i64 0, i32 0, metadata !295} ; [ DW_TAG_typedef ]
!334 = metadata !{i32 524329, metadata !"types.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !292} ; [ DW_TAG_file_type ]
!335 = metadata !{i32 524301, metadata !330, metadata !"si_uid", metadata !316, i32 66, i64 32, i64 32, i64 32, i32 0, metadata !336} ; [ DW_TAG_member ]
!336 = metadata !{i32 524310, metadata !334, metadata !"__uid_t", metadata !334, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !337} ; [ DW_TAG_typedef ]
!337 = metadata !{i32 524324, metadata !291, metadata !"unsigned int", metadata !291, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!338 = metadata !{i32 524301, metadata !323, metadata !"_timer", metadata !316, i32 75, i64 128, i64 64, i64 0, i32 0, metadata !339} ; [ DW_TAG_member ]
!339 = metadata !{i32 524307, metadata !291, metadata !"", metadata !316, i32 71, i64 128, i64 64, i64 0, i32 0, null, metadata !340, i32 0, null} ; [ DW_TAG_structure_type ]
!340 = metadata !{metadata !341, metadata !342, metadata !343}
!341 = metadata !{i32 524301, metadata !339, metadata !"si_tid", metadata !316, i32 72, i64 32, i64 32, i64 0, i32 0, metadata !295} ; [ DW_TAG_member ]
!342 = metadata !{i32 524301, metadata !339, metadata !"si_overrun", metadata !316, i32 73, i64 32, i64 32, i64 32, i32 0, metadata !295} ; [ DW_TAG_member ]
!343 = metadata !{i32 524301, metadata !339, metadata !"si_sigval", metadata !316, i32 74, i64 64, i64 64, i64 64, i32 0, metadata !344} ; [ DW_TAG_member ]
!344 = metadata !{i32 524310, metadata !316, metadata !"sigval_t", metadata !316, i32 37, i64 0, i64 0, i64 0, i32 0, metadata !345} ; [ DW_TAG_typedef ]
!345 = metadata !{i32 524311, metadata !291, metadata !"sigval", metadata !316, i32 34, i64 64, i64 64, i64 0, i32 0, null, metadata !346, i32 0, null} ; [ DW_TAG_union_type ]
!346 = metadata !{metadata !347, metadata !348}
!347 = metadata !{i32 524301, metadata !345, metadata !"sival_int", metadata !316, i32 35, i64 32, i64 32, i64 0, i32 0, metadata !295} ; [ DW_TAG_member ]
!348 = metadata !{i32 524301, metadata !345, metadata !"sival_ptr", metadata !316, i32 36, i64 64, i64 64, i64 0, i32 0, metadata !349} ; [ DW_TAG_member ]
!349 = metadata !{i32 524303, metadata !291, metadata !"", metadata !291, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!350 = metadata !{i32 524301, metadata !323, metadata !"_rt", metadata !316, i32 83, i64 128, i64 64, i64 0, i32 0, metadata !351} ; [ DW_TAG_member ]
!351 = metadata !{i32 524307, metadata !291, metadata !"", metadata !316, i32 79, i64 128, i64 64, i64 0, i32 0, null, metadata !352, i32 0, null} ; [ DW_TAG_structure_type ]
!352 = metadata !{metadata !353, metadata !354, metadata !355}
!353 = metadata !{i32 524301, metadata !351, metadata !"si_pid", metadata !316, i32 80, i64 32, i64 32, i64 0, i32 0, metadata !333} ; [ DW_TAG_member ]
!354 = metadata !{i32 524301, metadata !351, metadata !"si_uid", metadata !316, i32 81, i64 32, i64 32, i64 32, i32 0, metadata !336} ; [ DW_TAG_member ]
!355 = metadata !{i32 524301, metadata !351, metadata !"si_sigval", metadata !316, i32 82, i64 64, i64 64, i64 64, i32 0, metadata !344} ; [ DW_TAG_member ]
!356 = metadata !{i32 524301, metadata !323, metadata !"_sigchld", metadata !316, i32 93, i64 256, i64 64, i64 0, i32 0, metadata !357} ; [ DW_TAG_member ]
!357 = metadata !{i32 524307, metadata !291, metadata !"", metadata !316, i32 87, i64 256, i64 64, i64 0, i32 0, null, metadata !358, i32 0, null} ; [ DW_TAG_structure_type ]
!358 = metadata !{metadata !359, metadata !360, metadata !361, metadata !362, metadata !365}
!359 = metadata !{i32 524301, metadata !357, metadata !"si_pid", metadata !316, i32 88, i64 32, i64 32, i64 0, i32 0, metadata !333} ; [ DW_TAG_member ]
!360 = metadata !{i32 524301, metadata !357, metadata !"si_uid", metadata !316, i32 89, i64 32, i64 32, i64 32, i32 0, metadata !336} ; [ DW_TAG_member ]
!361 = metadata !{i32 524301, metadata !357, metadata !"si_status", metadata !316, i32 90, i64 32, i64 32, i64 64, i32 0, metadata !295} ; [ DW_TAG_member ]
!362 = metadata !{i32 524301, metadata !357, metadata !"si_utime", metadata !316, i32 91, i64 64, i64 64, i64 128, i32 0, metadata !363} ; [ DW_TAG_member ]
!363 = metadata !{i32 524310, metadata !334, metadata !"__clock_t", metadata !334, i32 149, i64 0, i64 0, i64 0, i32 0, metadata !364} ; [ DW_TAG_typedef ]
!364 = metadata !{i32 524324, metadata !291, metadata !"long int", metadata !291, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!365 = metadata !{i32 524301, metadata !357, metadata !"si_stime", metadata !316, i32 92, i64 64, i64 64, i64 192, i32 0, metadata !363} ; [ DW_TAG_member ]
!366 = metadata !{i32 524301, metadata !323, metadata !"_sigfault", metadata !316, i32 99, i64 64, i64 64, i64 0, i32 0, metadata !367} ; [ DW_TAG_member ]
!367 = metadata !{i32 524307, metadata !291, metadata !"", metadata !316, i32 97, i64 64, i64 64, i64 0, i32 0, null, metadata !368, i32 0, null} ; [ DW_TAG_structure_type ]
!368 = metadata !{metadata !369}
!369 = metadata !{i32 524301, metadata !367, metadata !"si_addr", metadata !316, i32 98, i64 64, i64 64, i64 0, i32 0, metadata !349} ; [ DW_TAG_member ]
!370 = metadata !{i32 524301, metadata !323, metadata !"_sigpoll", metadata !316, i32 106, i64 128, i64 64, i64 0, i32 0, metadata !371} ; [ DW_TAG_member ]
!371 = metadata !{i32 524307, metadata !291, metadata !"", metadata !316, i32 103, i64 128, i64 64, i64 0, i32 0, null, metadata !372, i32 0, null} ; [ DW_TAG_structure_type ]
!372 = metadata !{metadata !373, metadata !374}
!373 = metadata !{i32 524301, metadata !371, metadata !"si_band", metadata !316, i32 104, i64 64, i64 64, i64 0, i32 0, metadata !364} ; [ DW_TAG_member ]
!374 = metadata !{i32 524301, metadata !371, metadata !"si_fd", metadata !316, i32 105, i64 32, i64 32, i64 64, i32 0, metadata !295} ; [ DW_TAG_member ]
!375 = metadata !{i32 524301, metadata !298, metadata !"sa_mask", metadata !299, i32 44, i64 1024, i64 64, i64 64, i32 0, metadata !376} ; [ DW_TAG_member ]
!376 = metadata !{i32 524310, metadata !377, metadata !"__sigset_t", metadata !377, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !378} ; [ DW_TAG_typedef ]
!377 = metadata !{i32 524329, metadata !"sigset.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !292} ; [ DW_TAG_file_type ]
!378 = metadata !{i32 524307, metadata !291, metadata !"", metadata !377, i32 29, i64 1024, i64 64, i64 0, i32 0, null, metadata !379, i32 0, null} ; [ DW_TAG_structure_type ]
!379 = metadata !{metadata !380}
!380 = metadata !{i32 524301, metadata !378, metadata !"__val", metadata !377, i32 30, i64 1024, i64 64, i64 0, i32 0, metadata !381} ; [ DW_TAG_member ]
!381 = metadata !{i32 524289, metadata !291, metadata !"", metadata !291, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !382, metadata !154, i32 0, null} ; [ DW_TAG_array_type ]
!382 = metadata !{i32 524324, metadata !291, metadata !"long unsigned int", metadata !291, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!383 = metadata !{i32 524301, metadata !298, metadata !"sa_flags", metadata !299, i32 47, i64 32, i64 32, i64 1088, i32 0, metadata !295} ; [ DW_TAG_member ]
!384 = metadata !{i32 524301, metadata !298, metadata !"sa_restorer", metadata !299, i32 50, i64 64, i64 64, i64 1152, i32 0, metadata !385} ; [ DW_TAG_member ]
!385 = metadata !{i32 524303, metadata !291, metadata !"", metadata !291, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !386} ; [ DW_TAG_pointer_type ]
!386 = metadata !{i32 524309, metadata !291, metadata !"", metadata !291, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!387 = metadata !{i32 524303, metadata !291, metadata !"", metadata !291, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !298} ; [ DW_TAG_pointer_type ]
!388 = metadata !{i32 524334, i32 0, metadata !389, metadata !"fseek", metadata !"fseek", metadata !"fseek", metadata !389, i32 25, metadata !391, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.FILE*, i64, i32)* @fseek} ; [ DW_TA
!389 = metadata !{i32 524329, metadata !"fseeko.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !390} ; [ DW_TAG_file_type ]
!390 = metadata !{i32 524305, i32 0, i32 1, metadata !"fseeko.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!391 = metadata !{i32 524309, metadata !389, metadata !"", metadata !389, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !392, i32 0, null} ; [ DW_TAG_subroutine_type ]
!392 = metadata !{metadata !393, metadata !394, metadata !426, metadata !393}
!393 = metadata !{i32 524324, metadata !389, metadata !"int", metadata !389, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!394 = metadata !{i32 524303, metadata !389, metadata !"", metadata !389, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !395} ; [ DW_TAG_pointer_type ]
!395 = metadata !{i32 524310, metadata !396, metadata !"FILE", metadata !396, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !397} ; [ DW_TAG_typedef ]
!396 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !390} ; [ DW_TAG_file_type ]
!397 = metadata !{i32 524307, metadata !389, metadata !"__STDIO_FILE_STRUCT", metadata !396, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !398, i32 0, null} ; [ DW_TAG_structure_type ]
!398 = metadata !{metadata !399, metadata !402, metadata !405, metadata !406, metadata !408, metadata !409, metadata !410, metadata !411, metadata !412, metadata !413, metadata !415, metadata !419}
!399 = metadata !{i32 524301, metadata !397, metadata !"__modeflags", metadata !400, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !401} ; [ DW_TAG_member ]
!400 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !390} ; [ DW_TAG_file_type ]
!401 = metadata !{i32 524324, metadata !389, metadata !"short unsigned int", metadata !389, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!402 = metadata !{i32 524301, metadata !397, metadata !"__ungot_width", metadata !400, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !403} ; [ DW_TAG_member ]
!403 = metadata !{i32 524289, metadata !389, metadata !"", metadata !389, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !404, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!404 = metadata !{i32 524324, metadata !389, metadata !"unsigned char", metadata !389, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!405 = metadata !{i32 524301, metadata !397, metadata !"__filedes", metadata !400, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !393} ; [ DW_TAG_member ]
!406 = metadata !{i32 524301, metadata !397, metadata !"__bufstart", metadata !400, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !407} ; [ DW_TAG_member ]
!407 = metadata !{i32 524303, metadata !389, metadata !"", metadata !389, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !404} ; [ DW_TAG_pointer_type ]
!408 = metadata !{i32 524301, metadata !397, metadata !"__bufend", metadata !400, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !407} ; [ DW_TAG_member ]
!409 = metadata !{i32 524301, metadata !397, metadata !"__bufpos", metadata !400, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !407} ; [ DW_TAG_member ]
!410 = metadata !{i32 524301, metadata !397, metadata !"__bufread", metadata !400, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !407} ; [ DW_TAG_member ]
!411 = metadata !{i32 524301, metadata !397, metadata !"__bufgetc_u", metadata !400, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !407} ; [ DW_TAG_member ]
!412 = metadata !{i32 524301, metadata !397, metadata !"__bufputc_u", metadata !400, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !407} ; [ DW_TAG_member ]
!413 = metadata !{i32 524301, metadata !397, metadata !"__nextopen", metadata !400, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !414} ; [ DW_TAG_member ]
!414 = metadata !{i32 524303, metadata !389, metadata !"", metadata !389, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !397} ; [ DW_TAG_pointer_type ]
!415 = metadata !{i32 524301, metadata !397, metadata !"__ungot", metadata !400, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !416} ; [ DW_TAG_member ]
!416 = metadata !{i32 524289, metadata !389, metadata !"", metadata !389, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !417, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!417 = metadata !{i32 524310, metadata !418, metadata !"wchar_t", metadata !418, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !393} ; [ DW_TAG_typedef ]
!418 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !390} ; [ DW_TAG_file_type ]
!419 = metadata !{i32 524301, metadata !397, metadata !"__state", metadata !400, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !420} ; [ DW_TAG_member ]
!420 = metadata !{i32 524310, metadata !421, metadata !"__mbstate_t", metadata !421, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !422} ; [ DW_TAG_typedef ]
!421 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !390} ; [ DW_TAG_file_type ]
!422 = metadata !{i32 524307, metadata !389, metadata !"", metadata !421, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !423, i32 0, null} ; [ DW_TAG_structure_type ]
!423 = metadata !{metadata !424, metadata !425}
!424 = metadata !{i32 524301, metadata !422, metadata !"__mask", metadata !421, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !417} ; [ DW_TAG_member ]
!425 = metadata !{i32 524301, metadata !422, metadata !"__wc", metadata !421, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !417} ; [ DW_TAG_member ]
!426 = metadata !{i32 524324, metadata !389, metadata !"long int", metadata !389, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!427 = metadata !{i32 524334, i32 0, metadata !428, metadata !"tcgetattr", metadata !"tcgetattr", metadata !"tcgetattr", metadata !428, i32 39, metadata !430, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, %struct.termios*)* @tcgeta
!428 = metadata !{i32 524329, metadata !"tcgetattr.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/termios", metadata !429} ; [ DW_TAG_file_type ]
!429 = metadata !{i32 524305, i32 0, i32 1, metadata !"tcgetattr.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/termios", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_comp
!430 = metadata !{i32 524309, metadata !428, metadata !"", metadata !428, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !431, i32 0, null} ; [ DW_TAG_subroutine_type ]
!431 = metadata !{metadata !432, metadata !432, metadata !433}
!432 = metadata !{i32 524324, metadata !428, metadata !"int", metadata !428, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!433 = metadata !{i32 524303, metadata !428, metadata !"", metadata !428, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !434} ; [ DW_TAG_pointer_type ]
!434 = metadata !{i32 524307, metadata !428, metadata !"termios", metadata !435, i32 31, i64 480, i64 32, i64 0, i32 0, null, metadata !436, i32 0, null} ; [ DW_TAG_structure_type ]
!435 = metadata !{i32 524329, metadata !"termios.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !429} ; [ DW_TAG_file_type ]
!436 = metadata !{metadata !437, metadata !440, metadata !441, metadata !442, metadata !443, metadata !446, metadata !450, metadata !452}
!437 = metadata !{i32 524301, metadata !434, metadata !"c_iflag", metadata !435, i32 32, i64 32, i64 32, i64 0, i32 0, metadata !438} ; [ DW_TAG_member ]
!438 = metadata !{i32 524310, metadata !435, metadata !"tcflag_t", metadata !435, i32 27, i64 0, i64 0, i64 0, i32 0, metadata !439} ; [ DW_TAG_typedef ]
!439 = metadata !{i32 524324, metadata !428, metadata !"unsigned int", metadata !428, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!440 = metadata !{i32 524301, metadata !434, metadata !"c_oflag", metadata !435, i32 33, i64 32, i64 32, i64 32, i32 0, metadata !438} ; [ DW_TAG_member ]
!441 = metadata !{i32 524301, metadata !434, metadata !"c_cflag", metadata !435, i32 34, i64 32, i64 32, i64 64, i32 0, metadata !438} ; [ DW_TAG_member ]
!442 = metadata !{i32 524301, metadata !434, metadata !"c_lflag", metadata !435, i32 35, i64 32, i64 32, i64 96, i32 0, metadata !438} ; [ DW_TAG_member ]
!443 = metadata !{i32 524301, metadata !434, metadata !"c_line", metadata !435, i32 36, i64 8, i64 8, i64 128, i32 0, metadata !444} ; [ DW_TAG_member ]
!444 = metadata !{i32 524310, metadata !435, metadata !"cc_t", metadata !435, i32 25, i64 0, i64 0, i64 0, i32 0, metadata !445} ; [ DW_TAG_typedef ]
!445 = metadata !{i32 524324, metadata !428, metadata !"unsigned char", metadata !428, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!446 = metadata !{i32 524301, metadata !434, metadata !"c_cc", metadata !435, i32 37, i64 256, i64 8, i64 136, i32 0, metadata !447} ; [ DW_TAG_member ]
!447 = metadata !{i32 524289, metadata !428, metadata !"", metadata !428, i32 0, i64 256, i64 8, i64 0, i32 0, metadata !444, metadata !448, i32 0, null} ; [ DW_TAG_array_type ]
!448 = metadata !{metadata !449}
!449 = metadata !{i32 524321, i64 0, i64 31}      ; [ DW_TAG_subrange_type ]
!450 = metadata !{i32 524301, metadata !434, metadata !"c_ispeed", metadata !435, i32 38, i64 32, i64 32, i64 416, i32 0, metadata !451} ; [ DW_TAG_member ]
!451 = metadata !{i32 524310, metadata !435, metadata !"speed_t", metadata !435, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !439} ; [ DW_TAG_typedef ]
!452 = metadata !{i32 524301, metadata !434, metadata !"c_ospeed", metadata !435, i32 39, i64 32, i64 32, i64 448, i32 0, metadata !451} ; [ DW_TAG_member ]
!453 = metadata !{i32 524334, i32 0, metadata !454, metadata !"fseeko64", metadata !"fseeko64", metadata !"fseeko64", metadata !456, i32 25, metadata !457, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.FILE*, i64, i32)* @fseeko6
!454 = metadata !{i32 524329, metadata !"fseeko64.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !455} ; [ DW_TAG_file_type ]
!455 = metadata !{i32 524305, i32 0, i32 1, metadata !"fseeko64.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile
!456 = metadata !{i32 524329, metadata !"fseeko.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !455} ; [ DW_TAG_file_type ]
!457 = metadata !{i32 524309, metadata !454, metadata !"", metadata !454, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !458, i32 0, null} ; [ DW_TAG_subroutine_type ]
!458 = metadata !{metadata !459, metadata !460, metadata !492, metadata !459}
!459 = metadata !{i32 524324, metadata !454, metadata !"int", metadata !454, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!460 = metadata !{i32 524303, metadata !454, metadata !"", metadata !454, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !461} ; [ DW_TAG_pointer_type ]
!461 = metadata !{i32 524310, metadata !462, metadata !"FILE", metadata !462, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !463} ; [ DW_TAG_typedef ]
!462 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !455} ; [ DW_TAG_file_type ]
!463 = metadata !{i32 524307, metadata !454, metadata !"__STDIO_FILE_STRUCT", metadata !462, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !464, i32 0, null} ; [ DW_TAG_structure_type ]
!464 = metadata !{metadata !465, metadata !468, metadata !471, metadata !472, metadata !474, metadata !475, metadata !476, metadata !477, metadata !478, metadata !479, metadata !481, metadata !485}
!465 = metadata !{i32 524301, metadata !463, metadata !"__modeflags", metadata !466, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !467} ; [ DW_TAG_member ]
!466 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !455} ; [ DW_TAG_file_type ]
!467 = metadata !{i32 524324, metadata !454, metadata !"short unsigned int", metadata !454, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!468 = metadata !{i32 524301, metadata !463, metadata !"__ungot_width", metadata !466, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !469} ; [ DW_TAG_member ]
!469 = metadata !{i32 524289, metadata !454, metadata !"", metadata !454, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !470, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!470 = metadata !{i32 524324, metadata !454, metadata !"unsigned char", metadata !454, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!471 = metadata !{i32 524301, metadata !463, metadata !"__filedes", metadata !466, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !459} ; [ DW_TAG_member ]
!472 = metadata !{i32 524301, metadata !463, metadata !"__bufstart", metadata !466, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !473} ; [ DW_TAG_member ]
!473 = metadata !{i32 524303, metadata !454, metadata !"", metadata !454, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !470} ; [ DW_TAG_pointer_type ]
!474 = metadata !{i32 524301, metadata !463, metadata !"__bufend", metadata !466, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !473} ; [ DW_TAG_member ]
!475 = metadata !{i32 524301, metadata !463, metadata !"__bufpos", metadata !466, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !473} ; [ DW_TAG_member ]
!476 = metadata !{i32 524301, metadata !463, metadata !"__bufread", metadata !466, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !473} ; [ DW_TAG_member ]
!477 = metadata !{i32 524301, metadata !463, metadata !"__bufgetc_u", metadata !466, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !473} ; [ DW_TAG_member ]
!478 = metadata !{i32 524301, metadata !463, metadata !"__bufputc_u", metadata !466, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !473} ; [ DW_TAG_member ]
!479 = metadata !{i32 524301, metadata !463, metadata !"__nextopen", metadata !466, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !480} ; [ DW_TAG_member ]
!480 = metadata !{i32 524303, metadata !454, metadata !"", metadata !454, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !463} ; [ DW_TAG_pointer_type ]
!481 = metadata !{i32 524301, metadata !463, metadata !"__ungot", metadata !466, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !482} ; [ DW_TAG_member ]
!482 = metadata !{i32 524289, metadata !454, metadata !"", metadata !454, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !483, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!483 = metadata !{i32 524310, metadata !484, metadata !"wchar_t", metadata !484, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !459} ; [ DW_TAG_typedef ]
!484 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !455} ; [ DW_TAG_file_type ]
!485 = metadata !{i32 524301, metadata !463, metadata !"__state", metadata !466, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !486} ; [ DW_TAG_member ]
!486 = metadata !{i32 524310, metadata !487, metadata !"__mbstate_t", metadata !487, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !488} ; [ DW_TAG_typedef ]
!487 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !455} ; [ DW_TAG_file_type ]
!488 = metadata !{i32 524307, metadata !454, metadata !"", metadata !487, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !489, i32 0, null} ; [ DW_TAG_structure_type ]
!489 = metadata !{metadata !490, metadata !491}
!490 = metadata !{i32 524301, metadata !488, metadata !"__mask", metadata !487, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !483} ; [ DW_TAG_member ]
!491 = metadata !{i32 524301, metadata !488, metadata !"__wc", metadata !487, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !483} ; [ DW_TAG_member ]
!492 = metadata !{i32 524310, metadata !493, metadata !"__off64_t", metadata !493, i32 146, i64 0, i64 0, i64 0, i32 0, metadata !494} ; [ DW_TAG_typedef ]
!493 = metadata !{i32 524329, metadata !"types.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !455} ; [ DW_TAG_file_type ]
!494 = metadata !{i32 524324, metadata !454, metadata !"long int", metadata !454, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!495 = metadata !{i32 524334, i32 0, metadata !496, metadata !"mempcpy", metadata !"mempcpy", metadata !"mempcpy", metadata !496, i32 21, metadata !498, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*, i8*, i64)* @mempcpy} ; [ DW_TAG_
!496 = metadata !{i32 524329, metadata !"mempcpy.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !497} ; [ DW_TAG_file_type ]
!497 = metadata !{i32 524305, i32 0, i32 1, metadata !"mempcpy.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile
!498 = metadata !{i32 524309, metadata !496, metadata !"", metadata !496, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !499, i32 0, null} ; [ DW_TAG_subroutine_type ]
!499 = metadata !{metadata !500, metadata !500, metadata !500, metadata !501}
!500 = metadata !{i32 524303, metadata !496, metadata !"", metadata !496, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!501 = metadata !{i32 524310, metadata !502, metadata !"size_t", metadata !502, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !503} ; [ DW_TAG_typedef ]
!502 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !497} ; [ DW_TAG_file_type ]
!503 = metadata !{i32 524324, metadata !496, metadata !"long unsigned int", metadata !496, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!504 = metadata !{i32 524334, i32 0, metadata !505, metadata !"__stdio_adjust_position", metadata !"__stdio_adjust_position", metadata !"__stdio_adjust_position", metadata !505, i32 21, metadata !507, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 f
!505 = metadata !{i32 524329, metadata !"_adjust_pos.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !506} ; [ DW_TAG_file_type ]
!506 = metadata !{i32 524305, i32 0, i32 1, metadata !"_adjust_pos.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_comp
!507 = metadata !{i32 524309, metadata !505, metadata !"", metadata !505, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !508, i32 0, null} ; [ DW_TAG_subroutine_type ]
!508 = metadata !{metadata !509, metadata !510, metadata !542}
!509 = metadata !{i32 524324, metadata !505, metadata !"int", metadata !505, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!510 = metadata !{i32 524303, metadata !505, metadata !"", metadata !505, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !511} ; [ DW_TAG_pointer_type ]
!511 = metadata !{i32 524310, metadata !512, metadata !"FILE", metadata !512, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !513} ; [ DW_TAG_typedef ]
!512 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !506} ; [ DW_TAG_file_type ]
!513 = metadata !{i32 524307, metadata !505, metadata !"__STDIO_FILE_STRUCT", metadata !512, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !514, i32 0, null} ; [ DW_TAG_structure_type ]
!514 = metadata !{metadata !515, metadata !518, metadata !521, metadata !522, metadata !524, metadata !525, metadata !526, metadata !527, metadata !528, metadata !529, metadata !531, metadata !535}
!515 = metadata !{i32 524301, metadata !513, metadata !"__modeflags", metadata !516, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !517} ; [ DW_TAG_member ]
!516 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !506} ; [ DW_TAG_file_type ]
!517 = metadata !{i32 524324, metadata !505, metadata !"short unsigned int", metadata !505, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!518 = metadata !{i32 524301, metadata !513, metadata !"__ungot_width", metadata !516, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !519} ; [ DW_TAG_member ]
!519 = metadata !{i32 524289, metadata !505, metadata !"", metadata !505, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !520, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!520 = metadata !{i32 524324, metadata !505, metadata !"unsigned char", metadata !505, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!521 = metadata !{i32 524301, metadata !513, metadata !"__filedes", metadata !516, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !509} ; [ DW_TAG_member ]
!522 = metadata !{i32 524301, metadata !513, metadata !"__bufstart", metadata !516, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !523} ; [ DW_TAG_member ]
!523 = metadata !{i32 524303, metadata !505, metadata !"", metadata !505, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !520} ; [ DW_TAG_pointer_type ]
!524 = metadata !{i32 524301, metadata !513, metadata !"__bufend", metadata !516, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !523} ; [ DW_TAG_member ]
!525 = metadata !{i32 524301, metadata !513, metadata !"__bufpos", metadata !516, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !523} ; [ DW_TAG_member ]
!526 = metadata !{i32 524301, metadata !513, metadata !"__bufread", metadata !516, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !523} ; [ DW_TAG_member ]
!527 = metadata !{i32 524301, metadata !513, metadata !"__bufgetc_u", metadata !516, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !523} ; [ DW_TAG_member ]
!528 = metadata !{i32 524301, metadata !513, metadata !"__bufputc_u", metadata !516, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !523} ; [ DW_TAG_member ]
!529 = metadata !{i32 524301, metadata !513, metadata !"__nextopen", metadata !516, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !530} ; [ DW_TAG_member ]
!530 = metadata !{i32 524303, metadata !505, metadata !"", metadata !505, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !513} ; [ DW_TAG_pointer_type ]
!531 = metadata !{i32 524301, metadata !513, metadata !"__ungot", metadata !516, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !532} ; [ DW_TAG_member ]
!532 = metadata !{i32 524289, metadata !505, metadata !"", metadata !505, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !533, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!533 = metadata !{i32 524310, metadata !534, metadata !"wchar_t", metadata !534, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !509} ; [ DW_TAG_typedef ]
!534 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !506} ; [ DW_TAG_file_type ]
!535 = metadata !{i32 524301, metadata !513, metadata !"__state", metadata !516, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !536} ; [ DW_TAG_member ]
!536 = metadata !{i32 524310, metadata !537, metadata !"__mbstate_t", metadata !537, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !538} ; [ DW_TAG_typedef ]
!537 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !506} ; [ DW_TAG_file_type ]
!538 = metadata !{i32 524307, metadata !505, metadata !"", metadata !537, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !539, i32 0, null} ; [ DW_TAG_structure_type ]
!539 = metadata !{metadata !540, metadata !541}
!540 = metadata !{i32 524301, metadata !538, metadata !"__mask", metadata !537, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !533} ; [ DW_TAG_member ]
!541 = metadata !{i32 524301, metadata !538, metadata !"__wc", metadata !537, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !533} ; [ DW_TAG_member ]
!542 = metadata !{i32 524303, metadata !505, metadata !"", metadata !505, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !543} ; [ DW_TAG_pointer_type ]
!543 = metadata !{i32 524310, metadata !516, metadata !"__offmax_t", metadata !516, i32 194, i64 0, i64 0, i64 0, i32 0, metadata !544} ; [ DW_TAG_typedef ]
!544 = metadata !{i32 524324, metadata !505, metadata !"long int", metadata !505, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!545 = metadata !{i32 524334, i32 0, metadata !546, metadata !"__stdio_seek", metadata !"__stdio_seek", metadata !"__stdio_seek", metadata !546, i32 62, metadata !548, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (%struct.FILE*, i64*, i
!546 = metadata !{i32 524329, metadata !"_cs_funcs.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !547} ; [ DW_TAG_file_type ]
!547 = metadata !{i32 524305, i32 0, i32 1, metadata !"_cs_funcs.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compil
!548 = metadata !{i32 524309, metadata !546, metadata !"", metadata !546, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !549, i32 0, null} ; [ DW_TAG_subroutine_type ]
!549 = metadata !{metadata !550, metadata !551, metadata !583, metadata !550}
!550 = metadata !{i32 524324, metadata !546, metadata !"int", metadata !546, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!551 = metadata !{i32 524303, metadata !546, metadata !"", metadata !546, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !552} ; [ DW_TAG_pointer_type ]
!552 = metadata !{i32 524310, metadata !553, metadata !"FILE", metadata !553, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !554} ; [ DW_TAG_typedef ]
!553 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !547} ; [ DW_TAG_file_type ]
!554 = metadata !{i32 524307, metadata !546, metadata !"__STDIO_FILE_STRUCT", metadata !553, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !555, i32 0, null} ; [ DW_TAG_structure_type ]
!555 = metadata !{metadata !556, metadata !559, metadata !562, metadata !563, metadata !565, metadata !566, metadata !567, metadata !568, metadata !569, metadata !570, metadata !572, metadata !576}
!556 = metadata !{i32 524301, metadata !554, metadata !"__modeflags", metadata !557, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !558} ; [ DW_TAG_member ]
!557 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !547} ; [ DW_TAG_file_type ]
!558 = metadata !{i32 524324, metadata !546, metadata !"short unsigned int", metadata !546, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!559 = metadata !{i32 524301, metadata !554, metadata !"__ungot_width", metadata !557, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !560} ; [ DW_TAG_member ]
!560 = metadata !{i32 524289, metadata !546, metadata !"", metadata !546, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !561, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!561 = metadata !{i32 524324, metadata !546, metadata !"unsigned char", metadata !546, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!562 = metadata !{i32 524301, metadata !554, metadata !"__filedes", metadata !557, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !550} ; [ DW_TAG_member ]
!563 = metadata !{i32 524301, metadata !554, metadata !"__bufstart", metadata !557, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !564} ; [ DW_TAG_member ]
!564 = metadata !{i32 524303, metadata !546, metadata !"", metadata !546, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !561} ; [ DW_TAG_pointer_type ]
!565 = metadata !{i32 524301, metadata !554, metadata !"__bufend", metadata !557, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !564} ; [ DW_TAG_member ]
!566 = metadata !{i32 524301, metadata !554, metadata !"__bufpos", metadata !557, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !564} ; [ DW_TAG_member ]
!567 = metadata !{i32 524301, metadata !554, metadata !"__bufread", metadata !557, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !564} ; [ DW_TAG_member ]
!568 = metadata !{i32 524301, metadata !554, metadata !"__bufgetc_u", metadata !557, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !564} ; [ DW_TAG_member ]
!569 = metadata !{i32 524301, metadata !554, metadata !"__bufputc_u", metadata !557, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !564} ; [ DW_TAG_member ]
!570 = metadata !{i32 524301, metadata !554, metadata !"__nextopen", metadata !557, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !571} ; [ DW_TAG_member ]
!571 = metadata !{i32 524303, metadata !546, metadata !"", metadata !546, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !554} ; [ DW_TAG_pointer_type ]
!572 = metadata !{i32 524301, metadata !554, metadata !"__ungot", metadata !557, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !573} ; [ DW_TAG_member ]
!573 = metadata !{i32 524289, metadata !546, metadata !"", metadata !546, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !574, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!574 = metadata !{i32 524310, metadata !575, metadata !"wchar_t", metadata !575, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !550} ; [ DW_TAG_typedef ]
!575 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !547} ; [ DW_TAG_file_type ]
!576 = metadata !{i32 524301, metadata !554, metadata !"__state", metadata !557, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !577} ; [ DW_TAG_member ]
!577 = metadata !{i32 524310, metadata !578, metadata !"__mbstate_t", metadata !578, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !579} ; [ DW_TAG_typedef ]
!578 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !547} ; [ DW_TAG_file_type ]
!579 = metadata !{i32 524307, metadata !546, metadata !"", metadata !578, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !580, i32 0, null} ; [ DW_TAG_structure_type ]
!580 = metadata !{metadata !581, metadata !582}
!581 = metadata !{i32 524301, metadata !579, metadata !"__mask", metadata !578, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !574} ; [ DW_TAG_member ]
!582 = metadata !{i32 524301, metadata !579, metadata !"__wc", metadata !578, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !574} ; [ DW_TAG_member ]
!583 = metadata !{i32 524303, metadata !546, metadata !"", metadata !546, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !584} ; [ DW_TAG_pointer_type ]
!584 = metadata !{i32 524310, metadata !557, metadata !"__offmax_t", metadata !557, i32 194, i64 0, i64 0, i64 0, i32 0, metadata !585} ; [ DW_TAG_typedef ]
!585 = metadata !{i32 524324, metadata !546, metadata !"long int", metadata !546, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!586 = metadata !{i32 524334, i32 0, metadata !587, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !587, i32 12, metadata !589, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!587 = metadata !{i32 524329, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !588} ; [ DW_TAG_file_type ]
!588 = metadata !{i32 524305, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_
!589 = metadata !{i32 524309, metadata !587, metadata !"", metadata !587, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !590, i32 0, null} ; [ DW_TAG_subroutine_type ]
!590 = metadata !{metadata !591, metadata !591, metadata !591, metadata !592}
!591 = metadata !{i32 524303, metadata !587, metadata !"", metadata !587, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!592 = metadata !{i32 524310, metadata !593, metadata !"size_t", metadata !593, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !594} ; [ DW_TAG_typedef ]
!593 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !588} ; [ DW_TAG_file_type ]
!594 = metadata !{i32 524324, metadata !587, metadata !"long unsigned int", metadata !587, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!595 = metadata !{i32 524334, i32 0, metadata !596, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !596, i32 12, metadata !598, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, void (i
!596 = metadata !{i32 524329, metadata !"klee_div_zero_check.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !597} ; [ DW_TAG_file_type ]
!597 = metadata !{i32 524305, i32 0, i32 1, metadata !"klee_div_zero_check.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_
!598 = metadata !{i32 524309, metadata !596, metadata !"", metadata !596, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !599, i32 0, null} ; [ DW_TAG_subroutine_type ]
!599 = metadata !{null, metadata !600}
!600 = metadata !{i32 524324, metadata !596, metadata !"long long int", metadata !596, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!601 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__libc_stack_end", metadata !"__libc_stack_end", metadata !"", metadata !14, i32 52, metadata !42, i1 false, i1 true, i8** @__libc_stack_end} ; [ DW_TAG_variable ]
!602 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__uclibc_progname", metadata !"__uclibc_progname", metadata !"", metadata !14, i32 110, metadata !603, i1 false, i1 true, i8** @__uclibc_progname} ; [ DW_TAG_variable ]
!603 = metadata !{i32 524303, metadata !14, metadata !"", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !604} ; [ DW_TAG_pointer_type ]
!604 = metadata !{i32 524326, metadata !14, metadata !"", metadata !14, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !40} ; [ DW_TAG_const_type ]
!605 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__environ", metadata !"__environ", metadata !"", metadata !14, i32 125, metadata !38, i1 false, i1 true, i8*** @__environ} ; [ DW_TAG_variable ]
!606 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__pagesize", metadata !"__pagesize", metadata !"", metadata !14, i32 129, metadata !607, i1 false, i1 true, i64* @__pagesize} ; [ DW_TAG_variable ]
!607 = metadata !{i32 524310, metadata !608, metadata !"size_t", metadata !608, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !609} ; [ DW_TAG_typedef ]
!608 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !15} ; [ DW_TAG_file_type ]
!609 = metadata !{i32 524324, metadata !14, metadata !"long unsigned int", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!610 = metadata !{i32 524340, i32 0, metadata !28, metadata !"been_there_done_that", metadata !"been_there_done_that", metadata !"", metadata !14, i32 189, metadata !18, i1 true, i1 true, i32* @been_there_done_that.2846} ; [ DW_TAG_variable ]
!611 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__app_fini", metadata !"__app_fini", metadata !"", metadata !14, i32 244, metadata !41, i1 false, i1 true, void ()** @__app_fini} ; [ DW_TAG_variable ]
!612 = metadata !{i32 524340, i32 0, metadata !14, metadata !"__rtld_fini", metadata !"__rtld_fini", metadata !"", metadata !14, i32 247, metadata !41, i1 false, i1 true, void ()** @__rtld_fini} ; [ DW_TAG_variable ]
!613 = metadata !{i32 524340, i32 0, metadata !51, metadata !"been_there_done_that", metadata !"been_there_done_that", metadata !"", metadata !51, i32 49, metadata !614, i1 true, i1 true, i32* @been_there_done_that} ; [ DW_TAG_variable ]
!614 = metadata !{i32 524324, metadata !51, metadata !"int", metadata !51, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!615 = metadata !{i32 524340, i32 0, metadata !110, metadata !"_stdio_streams", metadata !"_stdio_streams", metadata !"", metadata !110, i32 131, metadata !616, i1 true, i1 true, [3 x %struct.FILE]* @_stdio_streams} ; [ DW_TAG_variable ]
!616 = metadata !{i32 524289, metadata !110, metadata !"", metadata !110, i32 0, i64 1920, i64 64, i64 0, i32 0, metadata !617, metadata !649, i32 0, null} ; [ DW_TAG_array_type ]
!617 = metadata !{i32 524310, metadata !618, metadata !"FILE", metadata !618, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !619} ; [ DW_TAG_typedef ]
!618 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !111} ; [ DW_TAG_file_type ]
!619 = metadata !{i32 524307, metadata !110, metadata !"__STDIO_FILE_STRUCT", metadata !618, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !620, i32 0, null} ; [ DW_TAG_structure_type ]
!620 = metadata !{metadata !621, metadata !624, metadata !627, metadata !629, metadata !631, metadata !632, metadata !633, metadata !634, metadata !635, metadata !636, metadata !638, metadata !642}
!621 = metadata !{i32 524301, metadata !619, metadata !"__modeflags", metadata !622, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !623} ; [ DW_TAG_member ]
!622 = metadata !{i32 524329, metadata !"uClibc_stdio.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include/bits", metadata !111} ; [ DW_TAG_file_type ]
!623 = metadata !{i32 524324, metadata !110, metadata !"short unsigned int", metadata !110, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!624 = metadata !{i32 524301, metadata !619, metadata !"__ungot_width", metadata !622, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !625} ; [ DW_TAG_member ]
!625 = metadata !{i32 524289, metadata !110, metadata !"", metadata !110, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !626, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!626 = metadata !{i32 524324, metadata !110, metadata !"unsigned char", metadata !110, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!627 = metadata !{i32 524301, metadata !619, metadata !"__filedes", metadata !622, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !628} ; [ DW_TAG_member ]
!628 = metadata !{i32 524324, metadata !110, metadata !"int", metadata !110, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!629 = metadata !{i32 524301, metadata !619, metadata !"__bufstart", metadata !622, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !630} ; [ DW_TAG_member ]
!630 = metadata !{i32 524303, metadata !110, metadata !"", metadata !110, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !626} ; [ DW_TAG_pointer_type ]
!631 = metadata !{i32 524301, metadata !619, metadata !"__bufend", metadata !622, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !630} ; [ DW_TAG_member ]
!632 = metadata !{i32 524301, metadata !619, metadata !"__bufpos", metadata !622, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !630} ; [ DW_TAG_member ]
!633 = metadata !{i32 524301, metadata !619, metadata !"__bufread", metadata !622, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !630} ; [ DW_TAG_member ]
!634 = metadata !{i32 524301, metadata !619, metadata !"__bufgetc_u", metadata !622, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !630} ; [ DW_TAG_member ]
!635 = metadata !{i32 524301, metadata !619, metadata !"__bufputc_u", metadata !622, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !630} ; [ DW_TAG_member ]
!636 = metadata !{i32 524301, metadata !619, metadata !"__nextopen", metadata !622, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !637} ; [ DW_TAG_member ]
!637 = metadata !{i32 524303, metadata !110, metadata !"", metadata !110, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !619} ; [ DW_TAG_pointer_type ]
!638 = metadata !{i32 524301, metadata !619, metadata !"__ungot", metadata !622, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !639} ; [ DW_TAG_member ]
!639 = metadata !{i32 524289, metadata !110, metadata !"", metadata !110, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !640, metadata !79, i32 0, null} ; [ DW_TAG_array_type ]
!640 = metadata !{i32 524310, metadata !641, metadata !"wchar_t", metadata !641, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !628} ; [ DW_TAG_typedef ]
!641 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !111} ; [ DW_TAG_file_type ]
!642 = metadata !{i32 524301, metadata !619, metadata !"__state", metadata !622, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !643} ; [ DW_TAG_member ]
!643 = metadata !{i32 524310, metadata !644, metadata !"__mbstate_t", metadata !644, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !645} ; [ DW_TAG_typedef ]
!644 = metadata !{i32 524329, metadata !"wchar.h", metadata !"/home/kain/Documents/bishe/klee-uclibc/./include", metadata !111} ; [ DW_TAG_file_type ]
!645 = metadata !{i32 524307, metadata !110, metadata !"", metadata !644, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !646, i32 0, null} ; [ DW_TAG_structure_type ]
!646 = metadata !{metadata !647, metadata !648}
!647 = metadata !{i32 524301, metadata !645, metadata !"__mask", metadata !644, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !640} ; [ DW_TAG_member ]
!648 = metadata !{i32 524301, metadata !645, metadata !"__wc", metadata !644, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !640} ; [ DW_TAG_member ]
!649 = metadata !{metadata !650}
!650 = metadata !{i32 524321, i64 0, i64 2}       ; [ DW_TAG_subrange_type ]
!651 = metadata !{i32 524340, i32 0, metadata !110, metadata !"stdin", metadata !"stdin", metadata !"", metadata !110, i32 154, metadata !652, i1 false, i1 true, %struct.FILE** @stdin} ; [ DW_TAG_variable ]
!652 = metadata !{i32 524303, metadata !110, metadata !"", metadata !110, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !617} ; [ DW_TAG_pointer_type ]
!653 = metadata !{i32 524340, i32 0, metadata !110, metadata !"stdout", metadata !"stdout", metadata !"", metadata !110, i32 155, metadata !652, i1 false, i1 true, %struct.FILE** @stdout} ; [ DW_TAG_variable ]
!654 = metadata !{i32 524340, i32 0, metadata !110, metadata !"stderr", metadata !"stderr", metadata !"", metadata !110, i32 156, metadata !652, i1 false, i1 true, %struct.FILE** @stderr} ; [ DW_TAG_variable ]
!655 = metadata !{i32 524340, i32 0, metadata !110, metadata !"__stdin", metadata !"__stdin", metadata !"", metadata !110, i32 159, metadata !652, i1 false, i1 true, %struct.FILE** @__stdin} ; [ DW_TAG_variable ]
!656 = metadata !{i32 524340, i32 0, metadata !110, metadata !"__stdout", metadata !"__stdout", metadata !"", metadata !110, i32 162, metadata !652, i1 false, i1 true, %struct.FILE** @__stdout} ; [ DW_TAG_variable ]
!657 = metadata !{i32 524340, i32 0, metadata !110, metadata !"_stdio_openlist", metadata !"_stdio_openlist", metadata !"", metadata !110, i32 180, metadata !637, i1 false, i1 true, %struct.FILE** @_stdio_openlist} ; [ DW_TAG_variable ]
!658 = metadata !{i32 524340, i32 0, metadata !117, metadata !"__exit_cleanup", metadata !"__exit_cleanup", metadata !"", metadata !117, i32 309, metadata !659, i1 false, i1 true, void (i32)** @__exit_cleanup} ; [ DW_TAG_variable ]
!659 = metadata !{i32 524303, metadata !115, metadata !"", metadata !115, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !118} ; [ DW_TAG_pointer_type ]
!660 = metadata !{i32 524340, i32 0, metadata !661, metadata !"errno", metadata !"errno", metadata !"", metadata !661, i32 7, metadata !663, i1 false, i1 true, i32* @errno} ; [ DW_TAG_variable ]
!661 = metadata !{i32 524329, metadata !"errno.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !662} ; [ DW_TAG_file_type ]
!662 = metadata !{i32 524305, i32 0, i32 1, metadata !"errno.c", metadata !"/home/kain/Documents/bishe/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_c
!663 = metadata !{i32 524324, metadata !661, metadata !"int", metadata !661, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!664 = metadata !{i32 524340, i32 0, metadata !661, metadata !"h_errno", metadata !"h_errno", metadata !"", metadata !661, i32 8, metadata !663, i1 false, i1 true, i32* @h_errno} ; [ DW_TAG_variable ]
!665 = metadata !{i32 524545, metadata !586, metadata !"dst", metadata !587, i32 12, metadata !591} ; [ DW_TAG_arg_variable ]
!666 = metadata !{i32 524545, metadata !586, metadata !"src", metadata !587, i32 12, metadata !591} ; [ DW_TAG_arg_variable ]
!667 = metadata !{i32 524545, metadata !586, metadata !"count", metadata !587, i32 12, metadata !592} ; [ DW_TAG_arg_variable ]
!668 = metadata !{i32 524544, metadata !669, metadata !"a", metadata !587, i32 13, metadata !670} ; [ DW_TAG_auto_variable ]
!669 = metadata !{i32 524299, metadata !586, i32 12, i32 0, metadata !587, i32 0} ; [ DW_TAG_lexical_block ]
!670 = metadata !{i32 524303, metadata !587, metadata !"", metadata !587, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !671} ; [ DW_TAG_pointer_type ]
!671 = metadata !{i32 524324, metadata !587, metadata !"char", metadata !587, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!672 = metadata !{i32 524544, metadata !669, metadata !"b", metadata !587, i32 14, metadata !673} ; [ DW_TAG_auto_variable ]
!673 = metadata !{i32 524303, metadata !587, metadata !"", metadata !587, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !674} ; [ DW_TAG_pointer_type ]
!674 = metadata !{i32 524326, metadata !587, metadata !"", metadata !587, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !671} ; [ DW_TAG_const_type ]
!675 = metadata !{i32 524545, metadata !595, metadata !"z", metadata !596, i32 12, metadata !600} ; [ DW_TAG_arg_variable ]
!676 = metadata !{i32 8, i32 0, metadata !677, null}
!677 = metadata !{i32 524299, metadata !0, i32 6, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!678 = metadata !{i32 10, i32 0, metadata !677, null}
!679 = metadata !{i32 11, i32 0, metadata !677, null}
!680 = metadata !{i32 13, i32 0, metadata !677, null}
!681 = metadata !{i32 14, i32 0, metadata !677, null}
!682 = metadata !{i32 23, i32 0, metadata !683, null}
!683 = metadata !{i32 524299, metadata !6, i32 17, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!684 = metadata !{i32 27, i32 0, metadata !683, null}
!685 = metadata !{i32 37, i32 0, metadata !683, null}
!686 = metadata !{i32 51, i32 0, metadata !683, null}
!687 = metadata !{i32 52, i32 0, metadata !683, null}
!688 = metadata !{i32 139, i32 0, metadata !689, null}
!689 = metadata !{i32 524299, metadata !13, i32 137, i32 0, metadata !14, i32 0} ; [ DW_TAG_lexical_block ]
!690 = metadata !{i32 143, i32 0, metadata !691, null}
!691 = metadata !{i32 524299, metadata !689, i32 137, i32 0, metadata !14, i32 1} ; [ DW_TAG_lexical_block ]
!692 = metadata !{i32 147, i32 0, metadata !691, null}
!693 = metadata !{i32 150, i32 0, metadata !691, null}
!694 = metadata !{i32 153, i32 0, metadata !691, null}
!695 = metadata !{i32 56, i32 0, metadata !696, null}
!696 = metadata !{i32 524299, metadata !19, i32 55, i32 0, metadata !20, i32 2} ; [ DW_TAG_lexical_block ]
!697 = metadata !{i32 160, i32 0, metadata !698, null}
!698 = metadata !{i32 524299, metadata !25, i32 156, i32 0, metadata !14, i32 3} ; [ DW_TAG_lexical_block ]
!699 = metadata !{i32 161, i32 0, metadata !698, null}
!700 = metadata !{i32 162, i32 0, metadata !698, null}
!701 = metadata !{i32 163, i32 0, metadata !698, null}
!702 = metadata !{i32 165, i32 0, metadata !698, null}
!703 = metadata !{i32 166, i32 0, metadata !698, null}
!704 = metadata !{i32 168, i32 0, metadata !698, null}
!705 = metadata !{i32 191, i32 0, metadata !706, null}
!706 = metadata !{i32 524299, metadata !28, i32 188, i32 0, metadata !14, i32 4} ; [ DW_TAG_lexical_block ]
!707 = metadata !{i32 193, i32 0, metadata !706, null}
!708 = metadata !{i32 197, i32 0, metadata !706, null}
!709 = metadata !{i32 239, i32 0, metadata !706, null}
!710 = metadata !{i32 192, i32 0, metadata !706, null}
!711 = metadata !{i32 263, i32 0, metadata !712, null}
!712 = metadata !{i32 524299, metadata !31, i32 252, i32 0, metadata !14, i32 5} ; [ DW_TAG_lexical_block ]
!713 = metadata !{i32 264, i32 0, metadata !712, null}
!714 = metadata !{i32 266, i32 0, metadata !712, null}
!715 = metadata !{i32 267, i32 0, metadata !712, null}
!716 = metadata !{i32 268, i32 0, metadata !712, null}
!717 = metadata !{i32 288, i32 0, metadata !718, null}
!718 = metadata !{i32 524299, metadata !32, i32 281, i32 0, metadata !14, i32 6} ; [ DW_TAG_lexical_block ]
!719 = metadata !{i32 291, i32 0, metadata !718, null}
!720 = metadata !{i32 294, i32 0, metadata !718, null}
!721 = metadata !{i32 298, i32 0, metadata !718, null}
!722 = metadata !{i32 300, i32 0, metadata !718, null}
!723 = metadata !{i32 305, i32 0, metadata !718, null}
!724 = metadata !{i32 306, i32 0, metadata !718, null}
!725 = metadata !{i32 307, i32 0, metadata !718, null}
!726 = metadata !{i32 308, i32 0, metadata !718, null}
!727 = metadata !{i32 312, i32 0, metadata !728, null}
!728 = metadata !{i32 524299, metadata !718, i32 312, i32 0, metadata !14, i32 7} ; [ DW_TAG_lexical_block ]
!729 = metadata !{i32 313, i32 0, metadata !728, null}
!730 = metadata !{i32 314, i32 0, metadata !728, null}
!731 = metadata !{i32 316, i32 0, metadata !728, null}
!732 = metadata !{i32 311, i32 0, metadata !718, null}
!733 = metadata !{i32 323, i32 0, metadata !718, null}
!734 = metadata !{i32 327, i32 0, metadata !718, null}
!735 = metadata !{i32 331, i32 0, metadata !718, null}
!736 = metadata !{i32 336, i32 0, metadata !718, null}
!737 = metadata !{i32 337, i32 0, metadata !718, null}
!738 = metadata !{i32 338, i32 0, metadata !718, null}
!739 = metadata !{i32 350, i32 0, metadata !718, null}
!740 = metadata !{i32 355, i32 0, metadata !718, null}
!741 = metadata !{i32 371, i32 0, metadata !718, null}
!742 = metadata !{i32 372, i32 0, metadata !718, null}
!743 = metadata !{i32 392, i32 0, metadata !718, null}
!744 = metadata !{i32 393, i32 0, metadata !718, null}
!745 = metadata !{i32 396, i32 0, metadata !718, null}
!746 = metadata !{i32 397, i32 0, metadata !718, null}
!747 = metadata !{i32 402, i32 0, metadata !718, null}
!748 = metadata !{i32 18, i32 0, metadata !749, null}
!749 = metadata !{i32 524299, metadata !43, i32 17, i32 0, metadata !46, i32 0} ; [ DW_TAG_lexical_block ]
!750 = metadata !{i32 20, i32 0, metadata !749, null}
!751 = metadata !{i32 13, i32 0, metadata !752, null}
!752 = metadata !{i32 524299, metadata !54, i32 12, i32 0, metadata !55, i32 0} ; [ DW_TAG_lexical_block ]
!753 = metadata !{i32 24, i32 0, metadata !754, null}
!754 = metadata !{i32 524299, metadata !61, i32 20, i32 0, metadata !64, i32 0} ; [ DW_TAG_lexical_block ]
!755 = metadata !{i32 25, i32 0, metadata !754, null}
!756 = metadata !{i32 26, i32 0, metadata !754, null}
!757 = metadata !{i32 31, i32 0, metadata !754, null}
!758 = metadata !{i32 34, i32 0, metadata !754, null}
!759 = metadata !{i32 35, i32 0, metadata !754, null}
!760 = metadata !{i32 38, i32 0, metadata !754, null}
!761 = metadata !{i32 40, i32 0, metadata !754, null}
!762 = metadata !{i32 49, i32 0, metadata !754, null}
!763 = metadata !{i32 51, i32 0, metadata !754, null}
!764 = metadata !{i32 52, i32 0, metadata !754, null}
!765 = metadata !{i32 55, i32 0, metadata !754, null}
!766 = metadata !{i32 62, i32 0, metadata !767, null}
!767 = metadata !{i32 524299, metadata !754, i32 62, i32 0, metadata !64, i32 1} ; [ DW_TAG_lexical_block ]
!768 = metadata !{i32 63, i32 0, metadata !767, null}
!769 = metadata !{i32 67, i32 0, metadata !754, null}
!770 = metadata !{i32 71, i32 0, metadata !754, null}
!771 = metadata !{i32 12, i32 0, metadata !772, null}
!772 = metadata !{i32 524299, metadata !102, i32 11, i32 0, metadata !103, i32 0} ; [ DW_TAG_lexical_block ]
!773 = metadata !{i32 258, i32 0, metadata !774, null}
!774 = metadata !{i32 524299, metadata !109, i32 211, i32 0, metadata !110, i32 0} ; [ DW_TAG_lexical_block ]
!775 = metadata !{i32 261, i32 0, metadata !774, null}
!776 = metadata !{i32 262, i32 0, metadata !774, null}
!777 = metadata !{i32 274, i32 0, metadata !774, null}
!778 = metadata !{i32 280, i32 0, metadata !779, null}
!779 = metadata !{i32 524299, metadata !113, i32 278, i32 0, metadata !110, i32 1} ; [ DW_TAG_lexical_block ]
!780 = metadata !{i32 282, i32 0, metadata !779, null}
!781 = metadata !{i32 283, i32 0, metadata !779, null}
!782 = metadata !{i32 284, i32 0, metadata !779, null}
!783 = metadata !{i32 291, i32 0, metadata !779, null}
!784 = metadata !{i32 322, i32 0, metadata !785, null}
!785 = metadata !{i32 524299, metadata !114, i32 319, i32 0, metadata !117, i32 0} ; [ DW_TAG_lexical_block ]
!786 = metadata !{i32 323, i32 0, metadata !785, null}
!787 = metadata !{i32 327, i32 0, metadata !785, null}
!788 = metadata !{i32 334, i32 0, metadata !785, null}
!789 = metadata !{i32 336, i32 0, metadata !785, null}
!790 = metadata !{i32 20, i32 0, metadata !791, null}
!791 = metadata !{i32 524299, metadata !121, i32 19, i32 0, metadata !122, i32 0} ; [ DW_TAG_lexical_block ]
!792 = metadata !{i32 21, i32 0, metadata !791, null}
!793 = metadata !{i32 29, i32 0, metadata !791, null}
!794 = metadata !{i32 30, i32 0, metadata !791, null}
!795 = metadata !{i32 28, i32 0, metadata !791, null}
!796 = metadata !{i32 34, i32 0, metadata !791, null}
!797 = metadata !{i32 19, i32 0, metadata !798, null}
!798 = metadata !{i32 524299, metadata !130, i32 18, i32 0, metadata !131, i32 0} ; [ DW_TAG_lexical_block ]
!799 = metadata !{i32 28, i32 0, metadata !798, null}
!800 = metadata !{i32 29, i32 0, metadata !798, null}
!801 = metadata !{i32 27, i32 0, metadata !798, null}
!802 = metadata !{i32 32, i32 0, metadata !798, null}
!803 = metadata !{i32 117, i32 0, metadata !140, null}
!804 = metadata !{i32 117, i32 0, metadata !805, null}
!805 = metadata !{i32 524299, metadata !140, i32 117, i32 0, metadata !143, i32 0} ; [ DW_TAG_lexical_block ]
!806 = metadata !{i32 118, i32 0, metadata !156, null}
!807 = metadata !{i32 118, i32 0, metadata !808, null}
!808 = metadata !{i32 524299, metadata !156, i32 118, i32 0, metadata !143, i32 1} ; [ DW_TAG_lexical_block ]
!809 = metadata !{i32 119, i32 0, metadata !157, null}
!810 = metadata !{i32 119, i32 0, metadata !811, null}
!811 = metadata !{i32 524299, metadata !157, i32 119, i32 0, metadata !143, i32 2} ; [ DW_TAG_lexical_block ]
!812 = metadata !{i32 44, i32 0, metadata !813, null}
!813 = metadata !{i32 524299, metadata !158, i32 35, i32 0, metadata !159, i32 0} ; [ DW_TAG_lexical_block ]
!814 = metadata !{i32 47, i32 0, metadata !813, null}
!815 = metadata !{i32 49, i32 0, metadata !813, null}
!816 = metadata !{i32 51, i32 0, metadata !813, null}
!817 = metadata !{i32 52, i32 0, metadata !813, null}
!818 = metadata !{i32 62, i32 0, metadata !813, null}
!819 = metadata !{i32 63, i32 0, metadata !813, null}
!820 = metadata !{i32 70, i32 0, metadata !813, null}
!821 = metadata !{i32 73, i32 0, metadata !813, null}
!822 = metadata !{i32 76, i32 0, metadata !823, null}
!823 = metadata !{i32 524299, metadata !813, i32 76, i32 0, metadata !159, i32 1} ; [ DW_TAG_lexical_block ]
!824 = metadata !{i32 77, i32 0, metadata !823, null}
!825 = metadata !{i32 80, i32 0, metadata !823, null}
!826 = metadata !{i32 83, i32 0, metadata !823, null}
!827 = metadata !{i32 88, i32 0, metadata !823, null}
!828 = metadata !{i32 89, i32 0, metadata !823, null}
!829 = metadata !{i32 90, i32 0, metadata !823, null}
!830 = metadata !{i32 92, i32 0, metadata !823, null}
!831 = metadata !{i32 94, i32 0, metadata !823, null}
!832 = metadata !{i32 99, i32 0, metadata !813, null}
!833 = metadata !{i32 35, i32 0, metadata !834, null}
!834 = metadata !{i32 524299, metadata !200, i32 30, i32 0, metadata !201, i32 0} ; [ DW_TAG_lexical_block ]
!835 = metadata !{i32 36, i32 0, metadata !834, null}
!836 = metadata !{i32 40, i32 0, metadata !834, null}
!837 = metadata !{i32 44, i32 0, metadata !834, null}
!838 = metadata !{i32 48, i32 0, metadata !834, null}
!839 = metadata !{i32 50, i32 0, metadata !834, null}
!840 = metadata !{i32 52, i32 0, metadata !834, null}
!841 = metadata !{i32 54, i32 0, metadata !834, null}
!842 = metadata !{i32 57, i32 0, metadata !834, null}
!843 = metadata !{i32 58, i32 0, metadata !834, null}
!844 = metadata !{i32 67, i32 0, metadata !834, null}
!845 = metadata !{i32 82, i32 0, metadata !834, null}
!846 = metadata !{i32 83, i32 0, metadata !834, null}
!847 = metadata !{i32 85, i32 0, metadata !834, null}
!848 = metadata !{i32 88, i32 0, metadata !834, null}
!849 = metadata !{i32 89, i32 0, metadata !834, null}
!850 = metadata !{i32 90, i32 0, metadata !834, null}
!851 = metadata !{i32 94, i32 0, metadata !834, null}
!852 = metadata !{i32 23, i32 0, metadata !853, null}
!853 = metadata !{i32 524299, metadata !238, i32 18, i32 0, metadata !239, i32 0} ; [ DW_TAG_lexical_block ]
!854 = metadata !{i32 24, i32 0, metadata !853, null}
!855 = metadata !{i32 25, i32 0, metadata !853, null}
!856 = metadata !{i32 28, i32 0, metadata !853, null}
!857 = metadata !{i32 30, i32 0, metadata !858, null}
!858 = metadata !{i32 524299, metadata !278, i32 27, i32 0, metadata !279, i32 0} ; [ DW_TAG_lexical_block ]
!859 = metadata !{i32 17, i32 0, metadata !860, null}
!860 = metadata !{i32 524299, metadata !284, i32 16, i32 0, metadata !285, i32 0} ; [ DW_TAG_lexical_block ]
!861 = metadata !{i32 47, i32 0, metadata !862, null}
!862 = metadata !{i32 524299, metadata !290, i32 43, i32 0, metadata !291, i32 0} ; [ DW_TAG_lexical_block ]
!863 = metadata !{i32 48, i32 0, metadata !862, null}
!864 = metadata !{i32 49, i32 0, metadata !862, null}
!865 = metadata !{i32 50, i32 0, metadata !862, null}
!866 = metadata !{i32 52, i32 0, metadata !862, null}
!867 = metadata !{i32 58, i32 0, metadata !862, null}
!868 = metadata !{i32 62, i32 0, metadata !862, null}
!869 = metadata !{i32 63, i32 0, metadata !862, null}
!870 = metadata !{i32 64, i32 0, metadata !862, null}
!871 = metadata !{i32 65, i32 0, metadata !862, null}
!872 = metadata !{i32 67, i32 0, metadata !862, null}
!873 = metadata !{i32 71, i32 0, metadata !862, null}
!874 = metadata !{i32 28, i32 0, metadata !875, null}
!875 = metadata !{i32 524299, metadata !388, i32 25, i32 0, metadata !389, i32 0} ; [ DW_TAG_lexical_block ]
!876 = metadata !{i32 43, i32 0, metadata !877, null}
!877 = metadata !{i32 524299, metadata !427, i32 39, i32 0, metadata !428, i32 0} ; [ DW_TAG_lexical_block ]
!878 = metadata !{i32 45, i32 0, metadata !877, null}
!879 = metadata !{i32 46, i32 0, metadata !877, null}
!880 = metadata !{i32 47, i32 0, metadata !877, null}
!881 = metadata !{i32 48, i32 0, metadata !877, null}
!882 = metadata !{i32 49, i32 0, metadata !877, null}
!883 = metadata !{i32 61, i32 0, metadata !877, null}
!884 = metadata !{i32 79, i32 0, metadata !877, null}
!885 = metadata !{i32 32, i32 0, metadata !886, null}
!886 = metadata !{i32 524299, metadata !453, i32 25, i32 0, metadata !456, i32 0} ; [ DW_TAG_lexical_block ]
!887 = metadata !{i32 33, i32 0, metadata !886, null}
!888 = metadata !{i32 36, i32 0, metadata !886, null}
!889 = metadata !{i32 37, i32 0, metadata !886, null}
!890 = metadata !{i32 43, i32 0, metadata !886, null}
!891 = metadata !{i32 51, i32 0, metadata !886, null}
!892 = metadata !{i32 55, i32 0, metadata !886, null}
!893 = metadata !{i32 56, i32 0, metadata !886, null}
!894 = metadata !{i32 57, i32 0, metadata !886, null}
!895 = metadata !{i32 62, i32 0, metadata !886, null}
!896 = metadata !{i32 65, i32 0, metadata !886, null}
!897 = metadata !{i32 68, i32 0, metadata !886, null}
!898 = metadata !{i32 76, i32 0, metadata !886, null}
!899 = metadata !{i32 22, i32 0, metadata !900, null}
!900 = metadata !{i32 524299, metadata !495, i32 21, i32 0, metadata !496, i32 0} ; [ DW_TAG_lexical_block ]
!901 = metadata !{i32 23, i32 0, metadata !900, null}
!902 = metadata !{i32 31, i32 0, metadata !900, null}
!903 = metadata !{i32 32, i32 0, metadata !900, null}
!904 = metadata !{i32 30, i32 0, metadata !900, null}
!905 = metadata !{i32 36, i32 0, metadata !900, null}
!906 = metadata !{i32 25, i32 0, metadata !907, null}
!907 = metadata !{i32 524299, metadata !504, i32 21, i32 0, metadata !505, i32 0} ; [ DW_TAG_lexical_block ]
!908 = metadata !{i32 26, i32 0, metadata !907, null}
!909 = metadata !{i32 30, i32 0, metadata !907, null}
!910 = metadata !{i32 34, i32 0, metadata !907, null}
!911 = metadata !{i32 35, i32 0, metadata !907, null}
!912 = metadata !{i32 37, i32 0, metadata !907, null}
!913 = metadata !{i32 38, i32 0, metadata !907, null}
!914 = metadata !{i32 39, i32 0, metadata !907, null}
!915 = metadata !{i32 45, i32 0, metadata !907, null}
!916 = metadata !{i32 50, i32 0, metadata !907, null}
!917 = metadata !{i32 59, i32 0, metadata !907, null}
!918 = metadata !{i32 60, i32 0, metadata !907, null}
!919 = metadata !{i32 63, i32 0, metadata !907, null}
!920 = metadata !{i32 64, i32 0, metadata !907, null}
!921 = metadata !{i32 67, i32 0, metadata !907, null}
!922 = metadata !{i32 66, i32 0, metadata !923, null}
!923 = metadata !{i32 524299, metadata !545, i32 62, i32 0, metadata !546, i32 0} ; [ DW_TAG_lexical_block ]
!924 = metadata !{i32 71, i32 0, metadata !923, null}
!925 = metadata !{i32 13, i32 0, metadata !926, null}
!926 = metadata !{i32 524299, metadata !595, i32 12, i32 0, metadata !596, i32 0} ; [ DW_TAG_lexical_block ]
!927 = metadata !{i32 14, i32 0, metadata !926, null}
!928 = metadata !{i32 15, i32 0, metadata !926, null}
