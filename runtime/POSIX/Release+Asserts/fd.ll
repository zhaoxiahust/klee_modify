; ModuleID = 'fd.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__fsid_t = type { [2 x i32] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.exe_disk_file_t = type { i32, i8*, %struct.stat* }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }
%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_sym_env_t = type { [32 x %struct.exe_file_t], i32, i32, i32 }
%struct.fd_set = type { [16 x i64] }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, [5 x i64] }
%struct.timespec = type { i64, i64 }

@__exe_fs = external global %struct.exe_file_system_t
@__exe_env = external global %struct.exe_sym_env_t
@.str = private constant [18 x i8] c"ignoring (ENOENT)\00", align 1
@.str1 = private constant [17 x i8] c"ignoring (EPERM)\00", align 1
@.str2 = private constant [32 x i8] c"symbolic file, ignoring (EPERM)\00", align 8
@.str3 = private constant [32 x i8] c"symbolic file, ignoring (EBADF)\00", align 8
@n_calls.5116 = internal global i32 0
@.str4 = private constant [30 x i8] c"symbolic file, ignoring (EIO)\00", align 1
@.str5 = private constant [33 x i8] c"symbolic file, ignoring (ENOENT)\00", align 8
@n_calls.5676 = internal global i32 0
@n_calls.4743 = internal global i32 0
@.str6 = private constant [33 x i8] c"symbolic file, ignoring (EINVAL)\00", align 8
@.str7 = private constant [41 x i8] c"(TCGETS) symbolic file, incomplete model\00", align 8
@.str8 = private constant [42 x i8] c"(TCSETS) symbolic file, silently ignoring\00", align 8
@.str9 = private constant [43 x i8] c"(TCSETSW) symbolic file, silently ignoring\00", align 8
@.str10 = private constant [43 x i8] c"(TCSETSF) symbolic file, silently ignoring\00", align 8
@.str11 = private constant [45 x i8] c"(TIOCGWINSZ) symbolic file, incomplete model\00", align 8
@.str12 = private constant [46 x i8] c"(TIOCSWINSZ) symbolic file, ignoring (EINVAL)\00", align 8
@.str13 = private constant [43 x i8] c"(FIONREAD) symbolic file, incomplete model\00", align 8
@.str14 = private constant [44 x i8] c"(MTIOCGET) symbolic file, ignoring (EINVAL)\00", align 8
@.str15 = private constant [18 x i8] c"s != (off64_t) -1\00", align 1
@.str16 = private constant [5 x i8] c"fd.c\00", align 1
@__PRETTY_FUNCTION__.5153 = internal constant [14 x i8] c"__fd_getdents\00"
@.str17 = private constant [18 x i8] c"new_off == f->off\00", align 1
@__PRETTY_FUNCTION__.4897 = internal constant [11 x i8] c"__fd_lseek\00"
@n_calls.4763 = internal global i32 0
@.str18 = private constant [12 x i8] c"f->off >= 0\00", align 1
@__PRETTY_FUNCTION__.4766 = internal constant [5 x i8] c"read\00"
@n_calls.5023 = internal global i32 0
@n_calls.5000 = internal global i32 0
@n_calls.4824 = internal global i32 0
@.str19 = private constant [7 x i8] c"r >= 0\00", align 1
@__PRETTY_FUNCTION__.4827 = internal constant [6 x i8] c"write\00"
@.str20 = private constant [2 x i8] c"0\00", align 1
@stderr = external global %struct._IO_FILE*
@.str21 = private constant [33 x i8] c"WARNING: write() ignores bytes.\0A\00", align 8
@.str22 = private constant [47 x i8] c"Undefined call to open(): O_EXCL w/o O_RDONLY\0A\00", align 8

define i32 @access(i8* %pathname, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !344), !dbg !554
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !345), !dbg !554
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !229), !dbg !555
  %0 = load i8* %pathname, align 1, !dbg !557
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !557
  %1 = icmp eq i8 %0, 0, !dbg !558
  br i1 %1, label %bb1, label %bb.i, !dbg !558

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i64 1, !dbg !558
  %3 = load i8* %2, align 1, !dbg !558
  %4 = icmp eq i8 %3, 0, !dbg !558
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !558

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !559
  %6 = sext i8 %0 to i32, !dbg !560
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !560
  %9 = icmp eq i32 %6, %8, !dbg !560
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !560

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !561
  %11 = zext i32 %18 to i64, !dbg !561
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !561
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !563
  %13 = load %struct.stat** %12, align 8, !dbg !563
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !563
  %15 = load i64* %14, align 8, !dbg !563
  %16 = icmp eq i64 %15, 0, !dbg !563
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !563

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !559
  br label %bb8.i, !dbg !559

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !559
  br i1 %19, label %bb3.i, label %bb1, !dbg !559

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !561
  %phitmp = icmp eq %struct.exe_disk_file_t* %20, null
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !346), !dbg !556
  br i1 %phitmp, label %bb1, label %bb4, !dbg !564

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !311) nounwind, !dbg !565
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !301) nounwind, !dbg !567
  %21 = ptrtoint i8* %pathname to i64, !dbg !569
  %22 = tail call i64 @klee_get_valuel(i64 %21) nounwind, !dbg !569
  %23 = inttoptr i64 %22 to i8*, !dbg !569
  tail call void @llvm.dbg.value(metadata !{i8* %23}, i64 0, metadata !302) nounwind, !dbg !569
  %24 = icmp eq i8* %23, %pathname, !dbg !570
  %25 = zext i1 %24 to i64, !dbg !570
  tail call void @klee_assume(i64 %25) nounwind, !dbg !570
  tail call void @llvm.dbg.value(metadata !{i8* %23}, i64 0, metadata !312) nounwind, !dbg !568
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !314) nounwind, !dbg !572
  br label %bb.i6, !dbg !572

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %23, %bb1 ], [ %sc.0.i, %bb6.i8 ]
  %26 = phi i32 [ 0, %bb1 ], [ %38, %bb6.i8 ]
  %tmp.i = add i32 %26, -1
  %27 = load i8* %sc.1.i, align 1, !dbg !573
  %28 = and i32 %tmp.i, %26, !dbg !574
  %29 = icmp eq i32 %28, 0, !dbg !574
  br i1 %29, label %bb1.i, label %bb5.i, !dbg !574

bb1.i:                                            ; preds = %bb.i6
  switch i8 %27, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %27}, i64 0, metadata !315) nounwind, !dbg !573
  store i8 0, i8* %sc.1.i, align 1, !dbg !575
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !575
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !576
  %30 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !576
  br label %bb6.i8, !dbg !576

bb5.i:                                            ; preds = %bb.i6
  %31 = sext i8 %27 to i64, !dbg !577
  %32 = tail call i64 @klee_get_valuel(i64 %31) nounwind, !dbg !577
  %33 = trunc i64 %32 to i8, !dbg !577
  %34 = icmp eq i8 %33, %27, !dbg !578
  %35 = zext i1 %34 to i64, !dbg !578
  tail call void @klee_assume(i64 %35) nounwind, !dbg !578
  store i8 %33, i8* %sc.1.i, align 1, !dbg !579
  %36 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !579
  %37 = icmp eq i8 %33, 0, !dbg !580
  br i1 %37, label %__concretize_string.exit, label %bb6.i8, !dbg !580

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %30, %bb4.i7 ], [ %36, %bb5.i ], [ %sc.1.i, %bb1.i ]
  %38 = add i32 %26, 1, !dbg !572
  br label %bb.i6, !dbg !572

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %39 = tail call i64 (i64, ...)* @syscall(i64 21, i8* %pathname, i32 %mode) nounwind, !dbg !566
  %40 = trunc i64 %39 to i32, !dbg !566
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !348), !dbg !566
  %41 = icmp eq i32 %40, -1, !dbg !581
  br i1 %41, label %bb2, label %bb4, !dbg !581

bb2:                                              ; preds = %__concretize_string.exit
  %42 = tail call i32* @__errno_location() nounwind readnone, !dbg !582
  %43 = tail call i32 @klee_get_errno() nounwind, !dbg !582
  store i32 %43, i32* %42, align 4, !dbg !582
  ret i32 %40, !dbg !583

bb4:                                              ; preds = %__concretize_string.exit, %__get_sym_file.exit
  %.0 = phi i32 [ 0, %__get_sym_file.exit ], [ %40, %__concretize_string.exit ]
  ret i32 %.0, !dbg !583
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @umask(i32 %mask) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %mask}, i64 0, metadata !239), !dbg !584
  %0 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !585
  tail call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !240), !dbg !585
  %1 = and i32 %mask, 511, !dbg !586
  store i32 %1, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !586
  ret i32 %0, !dbg !587
}

define i32 @chroot(i8* nocapture %path) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !248), !dbg !588
  %0 = load i8* %path, align 1, !dbg !589
  switch i8 %0, label %bb4 [
    i8 0, label %bb
    i8 47, label %bb2
  ]

bb:                                               ; preds = %entry
  %1 = tail call i32* @__errno_location() nounwind readnone, !dbg !591
  store i32 2, i32* %1, align 4, !dbg !591
  ret i32 -1, !dbg !592

bb2:                                              ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !593
  %3 = load i8* %2, align 1, !dbg !593
  %4 = icmp eq i8 %3, 0, !dbg !593
  br i1 %4, label %bb5, label %bb4, !dbg !593

bb4:                                              ; preds = %entry, %bb2
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !594
  %5 = tail call i32* @__errno_location() nounwind readnone, !dbg !595
  store i32 2, i32* %5, align 4, !dbg !595
  ret i32 -1, !dbg !592

bb5:                                              ; preds = %bb2
  ret i32 0, !dbg !592
}

declare i32* @__errno_location() nounwind readnone

declare void @klee_warning(i8*)

define i32 @unlink(i8* nocapture %pathname) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !249), !dbg !596
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !229), !dbg !597
  %0 = load i8* %pathname, align 1, !dbg !599
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !599
  %1 = icmp eq i8 %0, 0, !dbg !600
  br i1 %1, label %bb5, label %bb.i, !dbg !600

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i64 1, !dbg !600
  %3 = load i8* %2, align 1, !dbg !600
  %4 = icmp eq i8 %3, 0, !dbg !600
  br i1 %4, label %bb8.preheader.i, label %bb5, !dbg !600

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !601
  %6 = sext i8 %0 to i32, !dbg !602
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !602
  %9 = icmp eq i32 %6, %8, !dbg !602
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !602

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !603
  %11 = zext i32 %18 to i64, !dbg !603
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !603
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !604
  %13 = load %struct.stat** %12, align 8, !dbg !604
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !604
  %15 = load i64* %14, align 8, !dbg !604
  %16 = icmp eq i64 %15, 0, !dbg !604
  br i1 %16, label %bb5, label %__get_sym_file.exit, !dbg !604

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !601
  br label %bb8.i, !dbg !601

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !601
  br i1 %19, label %bb3.i, label %bb5, !dbg !601

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !603
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !250), !dbg !598
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !605
  br i1 %21, label %bb5, label %bb, !dbg !605

bb:                                               ; preds = %__get_sym_file.exit
  %22 = getelementptr inbounds %struct.stat* %13, i64 0, i32 3, !dbg !606
  %23 = load i32* %22, align 8, !dbg !606
  %24 = and i32 %23, 61440, !dbg !606
  %25 = icmp eq i32 %24, 32768, !dbg !606
  br i1 %25, label %bb1, label %bb2, !dbg !606

bb1:                                              ; preds = %bb
  store i64 0, i64* %14, align 8, !dbg !607
  ret i32 0, !dbg !608

bb2:                                              ; preds = %bb
  %26 = icmp eq i32 %24, 16384, !dbg !609
  %27 = tail call i32* @__errno_location() nounwind readnone, !dbg !610
  br i1 %26, label %bb3, label %bb4, !dbg !609

bb3:                                              ; preds = %bb2
  store i32 21, i32* %27, align 4, !dbg !610
  ret i32 -1, !dbg !608

bb4:                                              ; preds = %bb2
  store i32 1, i32* %27, align 4, !dbg !611
  ret i32 -1, !dbg !608

bb5:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !612
  %28 = tail call i32* @__errno_location() nounwind readnone, !dbg !613
  store i32 1, i32* %28, align 4, !dbg !613
  ret i32 -1, !dbg !608
}

define i32 @rmdir(i8* nocapture %pathname) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !252), !dbg !614
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !229), !dbg !615
  %0 = load i8* %pathname, align 1, !dbg !617
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !617
  %1 = icmp eq i8 %0, 0, !dbg !618
  br i1 %1, label %bb3, label %bb.i, !dbg !618

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i64 1, !dbg !618
  %3 = load i8* %2, align 1, !dbg !618
  %4 = icmp eq i8 %3, 0, !dbg !618
  br i1 %4, label %bb8.preheader.i, label %bb3, !dbg !618

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !619
  %6 = sext i8 %0 to i32, !dbg !620
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !620
  %9 = icmp eq i32 %6, %8, !dbg !620
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !620

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !621
  %11 = zext i32 %18 to i64, !dbg !621
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !621
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !622
  %13 = load %struct.stat** %12, align 8, !dbg !622
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !622
  %15 = load i64* %14, align 8, !dbg !622
  %16 = icmp eq i64 %15, 0, !dbg !622
  br i1 %16, label %bb3, label %__get_sym_file.exit, !dbg !622

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !619
  br label %bb8.i, !dbg !619

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !619
  br i1 %19, label %bb3.i, label %bb3, !dbg !619

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !621
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !253), !dbg !616
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !623
  br i1 %21, label %bb3, label %bb, !dbg !623

bb:                                               ; preds = %__get_sym_file.exit
  %22 = getelementptr inbounds %struct.stat* %13, i64 0, i32 3, !dbg !624
  %23 = load i32* %22, align 8, !dbg !624
  %24 = and i32 %23, 61440, !dbg !624
  %25 = icmp eq i32 %24, 16384, !dbg !624
  br i1 %25, label %bb1, label %bb2, !dbg !624

bb1:                                              ; preds = %bb
  store i64 0, i64* %14, align 8, !dbg !625
  ret i32 0, !dbg !626

bb2:                                              ; preds = %bb
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !627
  store i32 20, i32* %26, align 4, !dbg !627
  ret i32 -1, !dbg !626

bb3:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !628
  %27 = tail call i32* @__errno_location() nounwind readnone, !dbg !629
  store i32 1, i32* %27, align 4, !dbg !629
  ret i32 -1, !dbg !626
}

define i64 @readlink(i8* %path, i8* %buf, i64 %bufsize) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !258), !dbg !630
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !259), !dbg !630
  tail call void @llvm.dbg.value(metadata !{i64 %bufsize}, i64 0, metadata !260), !dbg !630
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !631
  %0 = load i8* %path, align 1, !dbg !633
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !633
  %1 = icmp eq i8 %0, 0, !dbg !634
  br i1 %1, label %bb12, label %bb.i, !dbg !634

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !634
  %3 = load i8* %2, align 1, !dbg !634
  %4 = icmp eq i8 %3, 0, !dbg !634
  br i1 %4, label %bb8.preheader.i, label %bb12, !dbg !634

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !635
  %6 = sext i8 %0 to i32, !dbg !636
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !636
  %9 = icmp eq i32 %6, %8, !dbg !636
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !636

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !637
  %11 = zext i32 %18 to i64, !dbg !637
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !637
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !638
  %13 = load %struct.stat** %12, align 8, !dbg !638
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !638
  %15 = load i64* %14, align 8, !dbg !638
  %16 = icmp eq i64 %15, 0, !dbg !638
  br i1 %16, label %bb12, label %__get_sym_file.exit, !dbg !638

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !635
  br label %bb8.i, !dbg !635

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !635
  br i1 %19, label %bb3.i, label %bb12, !dbg !635

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !637
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !261), !dbg !632
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !639
  br i1 %21, label %bb12, label %bb, !dbg !639

bb:                                               ; preds = %__get_sym_file.exit
  %22 = getelementptr inbounds %struct.stat* %13, i64 0, i32 3, !dbg !640
  %23 = load i32* %22, align 8, !dbg !640
  %24 = and i32 %23, 61440, !dbg !640
  %25 = icmp eq i32 %24, 40960, !dbg !640
  br i1 %25, label %bb1, label %bb11, !dbg !640

bb1:                                              ; preds = %bb
  store i8 %0, i8* %buf, align 1, !dbg !641
  %26 = icmp ugt i64 %bufsize, 1, !dbg !642
  br i1 %26, label %bb3, label %bb9, !dbg !642

bb3:                                              ; preds = %bb1
  %27 = getelementptr inbounds i8* %buf, i64 1, !dbg !642
  store i8 46, i8* %27, align 1, !dbg !642
  %28 = icmp ugt i64 %bufsize, 2, !dbg !643
  br i1 %28, label %bb5, label %bb9, !dbg !643

bb5:                                              ; preds = %bb3
  %29 = getelementptr inbounds i8* %buf, i64 2, !dbg !643
  store i8 108, i8* %29, align 1, !dbg !643
  %30 = icmp ugt i64 %bufsize, 3, !dbg !644
  br i1 %30, label %bb7, label %bb9, !dbg !644

bb7:                                              ; preds = %bb5
  %31 = getelementptr inbounds i8* %buf, i64 3, !dbg !644
  store i8 110, i8* %31, align 1, !dbg !644
  %32 = icmp ugt i64 %bufsize, 4, !dbg !645
  br i1 %32, label %bb8, label %bb9, !dbg !645

bb8:                                              ; preds = %bb7
  %33 = getelementptr inbounds i8* %buf, i64 4, !dbg !645
  store i8 107, i8* %33, align 1, !dbg !645
  br label %bb9, !dbg !645

bb9:                                              ; preds = %bb1, %bb3, %bb5, %bb8, %bb7
  %34 = icmp ugt i64 %bufsize, 5
  %min = select i1 %34, i64 5, i64 %bufsize, !dbg !646
  ret i64 %min, !dbg !646

bb11:                                             ; preds = %bb
  %35 = tail call i32* @__errno_location() nounwind readnone, !dbg !647
  store i32 22, i32* %35, align 4, !dbg !647
  ret i64 -1, !dbg !646

bb12:                                             ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  %36 = tail call i64 (i64, ...)* @syscall(i64 89, i8* %path, i8* %buf, i64 %bufsize) nounwind, !dbg !648
  %37 = trunc i64 %36 to i32, !dbg !648
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !263), !dbg !648
  %38 = icmp eq i32 %37, -1, !dbg !649
  br i1 %38, label %bb13, label %bb14, !dbg !649

bb13:                                             ; preds = %bb12
  %39 = tail call i32* @__errno_location() nounwind readnone, !dbg !650
  %40 = tail call i32 @klee_get_errno() nounwind, !dbg !650
  store i32 %40, i32* %39, align 4, !dbg !650
  br label %bb14, !dbg !650

bb14:                                             ; preds = %bb13, %bb12
  %41 = sext i32 %37 to i64, !dbg !651
  ret i64 %41, !dbg !646
}

declare i64 @syscall(i64, ...) nounwind

declare i32 @klee_get_errno()

define i32 @fsync(i32 %fd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !265), !dbg !652
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !653
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !655

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !656
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !656
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !657
  %4 = and i32 %3, 1, !dbg !657
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !657

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !266), !dbg !654
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !658
  br i1 %6, label %bb, label %bb1, !dbg !658

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !659
  store i32 9, i32* %7, align 4, !dbg !659
  ret i32 -1, !dbg !660

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !661
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !661
  br i1 %10, label %bb3, label %bb6, !dbg !661

bb3:                                              ; preds = %bb1
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %12 = load i32* %11, align 8, !dbg !662
  %13 = tail call i64 (i64, ...)* @syscall(i64 74, i32 %12) nounwind, !dbg !662
  %14 = trunc i64 %13 to i32, !dbg !662
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !268), !dbg !662
  %15 = icmp eq i32 %14, -1, !dbg !663
  br i1 %15, label %bb4, label %bb6, !dbg !663

bb4:                                              ; preds = %bb3
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !664
  %17 = tail call i32 @klee_get_errno() nounwind, !dbg !664
  store i32 %17, i32* %16, align 4, !dbg !664
  ret i32 %14, !dbg !660

bb6:                                              ; preds = %bb3, %bb1
  %.0 = phi i32 [ 0, %bb1 ], [ %14, %bb3 ]
  ret i32 %.0, !dbg !660
}

define i32 @fstatfs(i32 %fd, %struct.statfs* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !270), !dbg !665
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !271), !dbg !665
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !666
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !668

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !669
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !669
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !670
  %4 = and i32 %3, 1, !dbg !670
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !670

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !272), !dbg !667
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !671
  br i1 %6, label %bb, label %bb1, !dbg !671

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !672
  store i32 9, i32* %7, align 4, !dbg !672
  ret i32 -1, !dbg !673

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !674
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !674
  br i1 %10, label %bb3, label %bb2, !dbg !674

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str3, i64 0, i64 0)) nounwind, !dbg !675
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !676
  store i32 9, i32* %11, align 4, !dbg !676
  ret i32 -1, !dbg !673

bb3:                                              ; preds = %bb1
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %13 = load i32* %12, align 8, !dbg !677
  %14 = tail call i64 (i64, ...)* @syscall(i64 138, i32 %13, %struct.statfs* %buf) nounwind, !dbg !677
  %15 = trunc i64 %14 to i32, !dbg !677
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !274), !dbg !677
  %16 = icmp eq i32 %15, -1, !dbg !678
  br i1 %16, label %bb4, label %bb6, !dbg !678

bb4:                                              ; preds = %bb3
  %17 = tail call i32* @__errno_location() nounwind readnone, !dbg !679
  %18 = tail call i32 @klee_get_errno() nounwind, !dbg !679
  store i32 %18, i32* %17, align 4, !dbg !679
  ret i32 %15, !dbg !673

bb6:                                              ; preds = %bb3
  ret i32 %15, !dbg !673
}

define i32 @__fd_ftruncate(i32 %fd, i64 %length) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !276), !dbg !680
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !277), !dbg !680
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !681
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %__get_file.exit.thread, !dbg !683

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !684
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !684
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !685
  %4 = and i32 %3, 1, !dbg !685
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %__get_file.exit.thread, label %__get_file.exit, !dbg !685

__get_file.exit.thread:                           ; preds = %bb.i, %entry
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %7}, i64 0, metadata !278), !dbg !682
  %5 = load i32* @n_calls.5116, align 4, !dbg !686
  %6 = add nsw i32 %5, 1, !dbg !686
  store i32 %6, i32* @n_calls.5116, align 4, !dbg !686
  br label %bb

__get_file.exit:                                  ; preds = %bb.i
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %7}, i64 0, metadata !278), !dbg !682
  %8 = load i32* @n_calls.5116, align 4, !dbg !686
  %9 = add nsw i32 %8, 1, !dbg !686
  store i32 %9, i32* @n_calls.5116, align 4, !dbg !686
  %10 = icmp eq %struct.exe_file_t* %7, null, !dbg !687
  br i1 %10, label %bb, label %bb1, !dbg !687

bb:                                               ; preds = %__get_file.exit.thread, %__get_file.exit
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !688
  store i32 9, i32* %11, align 4, !dbg !688
  ret i32 -1, !dbg !689

bb1:                                              ; preds = %__get_file.exit
  %12 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !690
  %13 = icmp eq i32 %12, 0, !dbg !690
  br i1 %13, label %bb4, label %bb2, !dbg !690

bb2:                                              ; preds = %bb1
  %14 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !690
  %15 = load i32* %14, align 4, !dbg !690
  %16 = icmp eq i32 %15, %9, !dbg !690
  br i1 %16, label %bb3, label %bb4, !dbg !690

bb3:                                              ; preds = %bb2
  %17 = add i32 %12, -1
  store i32 %17, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !691
  %18 = tail call i32* @__errno_location() nounwind readnone, !dbg !692
  store i32 5, i32* %18, align 4, !dbg !692
  ret i32 -1, !dbg !689

bb4:                                              ; preds = %bb1, %bb2
  %19 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %20 = load %struct.exe_disk_file_t** %19, align 8, !dbg !693
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !693
  br i1 %21, label %bb6, label %bb5, !dbg !693

bb5:                                              ; preds = %bb4
  tail call void @klee_warning(i8* getelementptr inbounds ([30 x i8]* @.str4, i64 0, i64 0)) nounwind, !dbg !694
  %22 = tail call i32* @__errno_location() nounwind readnone, !dbg !695
  store i32 5, i32* %22, align 4, !dbg !695
  ret i32 -1, !dbg !689

bb6:                                              ; preds = %bb4
  %23 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %24 = load i32* %23, align 8, !dbg !696
  %25 = tail call i64 (i64, ...)* @syscall(i64 77, i32 %24, i64 %length) nounwind, !dbg !696
  %26 = trunc i64 %25 to i32, !dbg !696
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !280), !dbg !696
  %27 = icmp eq i32 %26, -1, !dbg !697
  br i1 %27, label %bb7, label %bb9, !dbg !697

bb7:                                              ; preds = %bb6
  %28 = tail call i32* @__errno_location() nounwind readnone, !dbg !698
  %29 = tail call i32 @klee_get_errno() nounwind, !dbg !698
  store i32 %29, i32* %28, align 4, !dbg !698
  ret i32 %26, !dbg !689

bb9:                                              ; preds = %bb6
  ret i32 %26, !dbg !689
}

define i32 @fchown(i32 %fd, i32 %owner, i32 %group) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !289), !dbg !699
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !290), !dbg !699
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !291), !dbg !699
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !700
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !702

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !703
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !703
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !704
  %4 = and i32 %3, 1, !dbg !704
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !704

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !292), !dbg !701
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !705
  br i1 %6, label %bb, label %bb1, !dbg !705

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !706
  store i32 9, i32* %7, align 4, !dbg !706
  ret i32 -1, !dbg !707

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !708
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !708
  br i1 %10, label %bb3, label %bb2, !dbg !708

bb2:                                              ; preds = %bb1
  tail call void @llvm.dbg.value(metadata !709, i64 0, metadata !255) nounwind, !dbg !710
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !256) nounwind, !dbg !710
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !257) nounwind, !dbg !710
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !712
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !714
  store i32 1, i32* %11, align 4, !dbg !714
  ret i32 -1, !dbg !707

bb3:                                              ; preds = %bb1
  %12 = tail call i64 (i64, ...)* @syscall(i64 93, i32 %fd, i32 %owner, i32 %group) nounwind, !dbg !715
  %13 = trunc i64 %12 to i32, !dbg !715
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !294), !dbg !715
  %14 = icmp eq i32 %13, -1, !dbg !716
  br i1 %14, label %bb4, label %bb6, !dbg !716

bb4:                                              ; preds = %bb3
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !717
  %16 = tail call i32 @klee_get_errno() nounwind, !dbg !717
  store i32 %16, i32* %15, align 4, !dbg !717
  ret i32 %13, !dbg !707

bb6:                                              ; preds = %bb3
  ret i32 %13, !dbg !707
}

define i32 @fchdir(i32 %fd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !296), !dbg !718
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !719
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !721

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !722
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !722
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !723
  %4 = and i32 %3, 1, !dbg !723
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !723

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !297), !dbg !720
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !724
  br i1 %6, label %bb, label %bb1, !dbg !724

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !725
  store i32 9, i32* %7, align 4, !dbg !725
  ret i32 -1, !dbg !726

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !727
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !727
  br i1 %10, label %bb3, label %bb2, !dbg !727

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i64 0, i64 0)) nounwind, !dbg !728
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !729
  store i32 2, i32* %11, align 4, !dbg !729
  ret i32 -1, !dbg !726

bb3:                                              ; preds = %bb1
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %13 = load i32* %12, align 8, !dbg !730
  %14 = tail call i64 (i64, ...)* @syscall(i64 81, i32 %13) nounwind, !dbg !730
  %15 = trunc i64 %14 to i32, !dbg !730
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !299), !dbg !730
  %16 = icmp eq i32 %15, -1, !dbg !731
  br i1 %16, label %bb4, label %bb6, !dbg !731

bb4:                                              ; preds = %bb3
  %17 = tail call i32* @__errno_location() nounwind readnone, !dbg !732
  %18 = tail call i32 @klee_get_errno() nounwind, !dbg !732
  store i32 %18, i32* %17, align 4, !dbg !732
  ret i32 %15, !dbg !726

bb6:                                              ; preds = %bb3
  ret i32 %15, !dbg !726
}

declare i64 @klee_get_valuel(i64)

declare void @klee_assume(i64)

define i8* @getcwd(i8* %buf, i64 %size) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !307), !dbg !733
  tail call void @llvm.dbg.value(metadata !{i64 %size}, i64 0, metadata !308), !dbg !733
  %0 = load i32* @n_calls.5676, align 4, !dbg !734
  %1 = add nsw i32 %0, 1, !dbg !734
  store i32 %1, i32* @n_calls.5676, align 4, !dbg !734
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !735
  %3 = icmp eq i32 %2, 0, !dbg !735
  br i1 %3, label %bb2, label %bb, !dbg !735

bb:                                               ; preds = %entry
  %4 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !735
  %5 = load i32* %4, align 4, !dbg !735
  %6 = icmp eq i32 %5, %1, !dbg !735
  br i1 %6, label %bb1, label %bb2, !dbg !735

bb1:                                              ; preds = %bb
  %7 = add i32 %2, -1
  store i32 %7, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !736
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !737
  store i32 34, i32* %8, align 4, !dbg !737
  ret i8* null, !dbg !738

bb2:                                              ; preds = %entry, %bb
  %9 = icmp eq i8* %buf, null, !dbg !739
  br i1 %9, label %bb3, label %bb6, !dbg !739

bb3:                                              ; preds = %bb2
  %10 = icmp eq i64 %size, 0, !dbg !740
  tail call void @llvm.dbg.value(metadata !741, i64 0, metadata !308), !dbg !742
  %size_addr.0 = select i1 %10, i64 1024, i64 %size
  %11 = tail call noalias i8* @malloc(i64 %size_addr.0) nounwind, !dbg !743
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !307), !dbg !743
  br label %bb6, !dbg !743

bb6:                                              ; preds = %bb3, %bb2
  %size_addr.1 = phi i64 [ %size_addr.0, %bb3 ], [ %size, %bb2 ]
  %buf_addr.0 = phi i8* [ %11, %bb3 ], [ %buf, %bb2 ]
  tail call void @llvm.dbg.value(metadata !{i8* %buf_addr.0}, i64 0, metadata !301) nounwind, !dbg !744
  %12 = ptrtoint i8* %buf_addr.0 to i64, !dbg !746
  %13 = tail call i64 @klee_get_valuel(i64 %12) nounwind, !dbg !746
  %14 = inttoptr i64 %13 to i8*, !dbg !746
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !302) nounwind, !dbg !746
  %15 = icmp eq i8* %14, %buf_addr.0, !dbg !747
  %16 = zext i1 %15 to i64, !dbg !747
  tail call void @klee_assume(i64 %16) nounwind, !dbg !747
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !307), !dbg !745
  tail call void @llvm.dbg.value(metadata !{i64 %size_addr.1}, i64 0, metadata !304) nounwind, !dbg !748
  %17 = tail call i64 @klee_get_valuel(i64 %size_addr.1) nounwind, !dbg !750
  tail call void @llvm.dbg.value(metadata !{i64 %17}, i64 0, metadata !305) nounwind, !dbg !750
  %18 = icmp eq i64 %17, %size_addr.1, !dbg !751
  %19 = zext i1 %18 to i64, !dbg !751
  tail call void @klee_assume(i64 %19) nounwind, !dbg !751
  tail call void @llvm.dbg.value(metadata !{i64 %17}, i64 0, metadata !308), !dbg !749
  tail call void @klee_check_memory_access(i8* %14, i64 %17) nounwind, !dbg !752
  %20 = tail call i64 (i64, ...)* @syscall(i64 79, i8* %14, i64 %17) nounwind, !dbg !753
  %21 = trunc i64 %20 to i32, !dbg !753
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !309), !dbg !753
  %22 = icmp eq i32 %21, -1, !dbg !754
  br i1 %22, label %bb7, label %bb9, !dbg !754

bb7:                                              ; preds = %bb6
  %23 = tail call i32* @__errno_location() nounwind readnone, !dbg !755
  %24 = tail call i32 @klee_get_errno() nounwind, !dbg !755
  store i32 %24, i32* %23, align 4, !dbg !755
  ret i8* null, !dbg !738

bb9:                                              ; preds = %bb6
  ret i8* %14, !dbg !738
}

declare noalias i8* @malloc(i64) nounwind

declare void @klee_check_memory_access(i8*, i64)

define i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !319), !dbg !756
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !320), !dbg !756
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !757
  %0 = load i8* %path, align 1, !dbg !759
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !759
  %1 = icmp eq i8 %0, 0, !dbg !760
  br i1 %1, label %bb1, label %bb.i, !dbg !760

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !760
  %3 = load i8* %2, align 1, !dbg !760
  %4 = icmp eq i8 %3, 0, !dbg !760
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !760

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !761
  %6 = sext i8 %0 to i32, !dbg !762
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !762
  %9 = icmp eq i32 %6, %8, !dbg !762
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !762

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !763
  %11 = zext i32 %18 to i64, !dbg !763
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !763
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !764
  %13 = load %struct.stat** %12, align 8, !dbg !764
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !764
  %15 = load i64* %14, align 8, !dbg !764
  %16 = icmp eq i64 %15, 0, !dbg !764
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !764

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !761
  br label %bb8.i, !dbg !761

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !761
  br i1 %19, label %bb3.i, label %bb1, !dbg !761

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !763
  %phitmp = icmp eq %struct.exe_disk_file_t* %20, null
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !321), !dbg !758
  br i1 %phitmp, label %bb1, label %bb, !dbg !765

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i64 0, i64 0)) nounwind, !dbg !766
  %21 = tail call i32* @__errno_location() nounwind readnone, !dbg !767
  store i32 2, i32* %21, align 4, !dbg !767
  ret i32 -1, !dbg !768

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !769
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !771
  %22 = ptrtoint i8* %path to i64, !dbg !773
  %23 = tail call i64 @klee_get_valuel(i64 %22) nounwind, !dbg !773
  %24 = inttoptr i64 %23 to i8*, !dbg !773
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !302) nounwind, !dbg !773
  %25 = icmp eq i8* %24, %path, !dbg !774
  %26 = zext i1 %25 to i64, !dbg !774
  tail call void @klee_assume(i64 %26) nounwind, !dbg !774
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !312) nounwind, !dbg !772
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !314) nounwind, !dbg !775
  br label %bb.i6, !dbg !775

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %24, %bb1 ], [ %sc.0.i, %bb6.i8 ]
  %27 = phi i32 [ 0, %bb1 ], [ %39, %bb6.i8 ]
  %tmp.i = add i32 %27, -1
  %28 = load i8* %sc.1.i, align 1, !dbg !776
  %29 = and i32 %tmp.i, %27, !dbg !777
  %30 = icmp eq i32 %29, 0, !dbg !777
  br i1 %30, label %bb1.i, label %bb5.i, !dbg !777

bb1.i:                                            ; preds = %bb.i6
  switch i8 %28, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %28}, i64 0, metadata !315) nounwind, !dbg !776
  store i8 0, i8* %sc.1.i, align 1, !dbg !778
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !778
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !779
  %31 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !779
  br label %bb6.i8, !dbg !779

bb5.i:                                            ; preds = %bb.i6
  %32 = sext i8 %28 to i64, !dbg !780
  %33 = tail call i64 @klee_get_valuel(i64 %32) nounwind, !dbg !780
  %34 = trunc i64 %33 to i8, !dbg !780
  %35 = icmp eq i8 %34, %28, !dbg !781
  %36 = zext i1 %35 to i64, !dbg !781
  tail call void @klee_assume(i64 %36) nounwind, !dbg !781
  store i8 %34, i8* %sc.1.i, align 1, !dbg !782
  %37 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !782
  %38 = icmp eq i8 %34, 0, !dbg !783
  br i1 %38, label %__concretize_string.exit, label %bb6.i8, !dbg !783

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %31, %bb4.i7 ], [ %37, %bb5.i ], [ %sc.1.i, %bb1.i ]
  %39 = add i32 %27, 1, !dbg !775
  br label %bb.i6, !dbg !775

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %40 = tail call i64 (i64, ...)* @syscall(i64 137, i8* %path, %struct.statfs* %buf) nounwind, !dbg !770
  %41 = trunc i64 %40 to i32, !dbg !770
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !323), !dbg !770
  %42 = icmp eq i32 %41, -1, !dbg !784
  br i1 %42, label %bb2, label %bb4, !dbg !784

bb2:                                              ; preds = %__concretize_string.exit
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !785
  %44 = tail call i32 @klee_get_errno() nounwind, !dbg !785
  store i32 %44, i32* %43, align 4, !dbg !785
  ret i32 %41, !dbg !768

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %41, !dbg !768
}

define i32 @lchown(i8* %path, i32 %owner, i32 %group) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !325), !dbg !786
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !326), !dbg !786
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !327), !dbg !786
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !787
  %0 = load i8* %path, align 1, !dbg !789
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !789
  %1 = icmp eq i8 %0, 0, !dbg !790
  br i1 %1, label %bb1, label %bb.i, !dbg !790

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !790
  %3 = load i8* %2, align 1, !dbg !790
  %4 = icmp eq i8 %3, 0, !dbg !790
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !790

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !791
  %6 = sext i8 %0 to i32, !dbg !792
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !792
  %9 = icmp eq i32 %6, %8, !dbg !792
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !792

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !793
  %11 = zext i32 %18 to i64, !dbg !793
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !793
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !794
  %13 = load %struct.stat** %12, align 8, !dbg !794
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !794
  %15 = load i64* %14, align 8, !dbg !794
  %16 = icmp eq i64 %15, 0, !dbg !794
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !794

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !791
  br label %bb8.i, !dbg !791

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !791
  br i1 %19, label %bb3.i, label %bb1, !dbg !791

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !793
  %phitmp = icmp eq %struct.exe_disk_file_t* %20, null
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !328), !dbg !788
  br i1 %phitmp, label %bb1, label %bb, !dbg !795

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !709, i64 0, metadata !255) nounwind, !dbg !796
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !256) nounwind, !dbg !796
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !257) nounwind, !dbg !796
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !798
  %21 = tail call i32* @__errno_location() nounwind readnone, !dbg !799
  store i32 1, i32* %21, align 4, !dbg !799
  ret i32 -1, !dbg !797

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !800
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !802
  %22 = ptrtoint i8* %path to i64, !dbg !804
  %23 = tail call i64 @klee_get_valuel(i64 %22) nounwind, !dbg !804
  %24 = inttoptr i64 %23 to i8*, !dbg !804
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !302) nounwind, !dbg !804
  %25 = icmp eq i8* %24, %path, !dbg !805
  %26 = zext i1 %25 to i64, !dbg !805
  tail call void @klee_assume(i64 %26) nounwind, !dbg !805
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !312) nounwind, !dbg !803
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !314) nounwind, !dbg !806
  br label %bb.i6, !dbg !806

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %24, %bb1 ], [ %sc.0.i, %bb6.i8 ]
  %27 = phi i32 [ 0, %bb1 ], [ %39, %bb6.i8 ]
  %tmp.i = add i32 %27, -1
  %28 = load i8* %sc.1.i, align 1, !dbg !807
  %29 = and i32 %tmp.i, %27, !dbg !808
  %30 = icmp eq i32 %29, 0, !dbg !808
  br i1 %30, label %bb1.i, label %bb5.i, !dbg !808

bb1.i:                                            ; preds = %bb.i6
  switch i8 %28, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %28}, i64 0, metadata !315) nounwind, !dbg !807
  store i8 0, i8* %sc.1.i, align 1, !dbg !809
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !809
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !810
  %31 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !810
  br label %bb6.i8, !dbg !810

bb5.i:                                            ; preds = %bb.i6
  %32 = sext i8 %28 to i64, !dbg !811
  %33 = tail call i64 @klee_get_valuel(i64 %32) nounwind, !dbg !811
  %34 = trunc i64 %33 to i8, !dbg !811
  %35 = icmp eq i8 %34, %28, !dbg !812
  %36 = zext i1 %35 to i64, !dbg !812
  tail call void @klee_assume(i64 %36) nounwind, !dbg !812
  store i8 %34, i8* %sc.1.i, align 1, !dbg !813
  %37 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !813
  %38 = icmp eq i8 %34, 0, !dbg !814
  br i1 %38, label %__concretize_string.exit, label %bb6.i8, !dbg !814

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %31, %bb4.i7 ], [ %37, %bb5.i ], [ %sc.1.i, %bb1.i ]
  %39 = add i32 %27, 1, !dbg !806
  br label %bb.i6, !dbg !806

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %40 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) nounwind, !dbg !801
  %41 = trunc i64 %40 to i32, !dbg !801
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !330), !dbg !801
  %42 = icmp eq i32 %41, -1, !dbg !815
  br i1 %42, label %bb2, label %bb4, !dbg !815

bb2:                                              ; preds = %__concretize_string.exit
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !816
  %44 = tail call i32 @klee_get_errno() nounwind, !dbg !816
  store i32 %44, i32* %43, align 4, !dbg !816
  ret i32 %41, !dbg !797

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %41, !dbg !797
}

define i32 @chown(i8* %path, i32 %owner, i32 %group) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !332), !dbg !817
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !333), !dbg !817
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !334), !dbg !817
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !818
  %0 = load i8* %path, align 1, !dbg !820
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !820
  %1 = icmp eq i8 %0, 0, !dbg !821
  br i1 %1, label %bb1, label %bb.i, !dbg !821

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !821
  %3 = load i8* %2, align 1, !dbg !821
  %4 = icmp eq i8 %3, 0, !dbg !821
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !821

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !822
  %6 = sext i8 %0 to i32, !dbg !823
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !823
  %9 = icmp eq i32 %6, %8, !dbg !823
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !823

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !824
  %11 = zext i32 %18 to i64, !dbg !824
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !824
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !825
  %13 = load %struct.stat** %12, align 8, !dbg !825
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !825
  %15 = load i64* %14, align 8, !dbg !825
  %16 = icmp eq i64 %15, 0, !dbg !825
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !825

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !822
  br label %bb8.i, !dbg !822

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !822
  br i1 %19, label %bb3.i, label %bb1, !dbg !822

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !824
  %phitmp = icmp eq %struct.exe_disk_file_t* %20, null
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !335), !dbg !819
  br i1 %phitmp, label %bb1, label %bb, !dbg !826

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !709, i64 0, metadata !255) nounwind, !dbg !827
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !256) nounwind, !dbg !827
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !257) nounwind, !dbg !827
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !829
  %21 = tail call i32* @__errno_location() nounwind readnone, !dbg !830
  store i32 1, i32* %21, align 4, !dbg !830
  ret i32 -1, !dbg !828

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !831
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !833
  %22 = ptrtoint i8* %path to i64, !dbg !835
  %23 = tail call i64 @klee_get_valuel(i64 %22) nounwind, !dbg !835
  %24 = inttoptr i64 %23 to i8*, !dbg !835
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !302) nounwind, !dbg !835
  %25 = icmp eq i8* %24, %path, !dbg !836
  %26 = zext i1 %25 to i64, !dbg !836
  tail call void @klee_assume(i64 %26) nounwind, !dbg !836
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !312) nounwind, !dbg !834
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !314) nounwind, !dbg !837
  br label %bb.i6, !dbg !837

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %24, %bb1 ], [ %sc.0.i, %bb6.i8 ]
  %27 = phi i32 [ 0, %bb1 ], [ %39, %bb6.i8 ]
  %tmp.i = add i32 %27, -1
  %28 = load i8* %sc.1.i, align 1, !dbg !838
  %29 = and i32 %tmp.i, %27, !dbg !839
  %30 = icmp eq i32 %29, 0, !dbg !839
  br i1 %30, label %bb1.i, label %bb5.i, !dbg !839

bb1.i:                                            ; preds = %bb.i6
  switch i8 %28, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %28}, i64 0, metadata !315) nounwind, !dbg !838
  store i8 0, i8* %sc.1.i, align 1, !dbg !840
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !840
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !841
  %31 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !841
  br label %bb6.i8, !dbg !841

bb5.i:                                            ; preds = %bb.i6
  %32 = sext i8 %28 to i64, !dbg !842
  %33 = tail call i64 @klee_get_valuel(i64 %32) nounwind, !dbg !842
  %34 = trunc i64 %33 to i8, !dbg !842
  %35 = icmp eq i8 %34, %28, !dbg !843
  %36 = zext i1 %35 to i64, !dbg !843
  tail call void @klee_assume(i64 %36) nounwind, !dbg !843
  store i8 %34, i8* %sc.1.i, align 1, !dbg !844
  %37 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !844
  %38 = icmp eq i8 %34, 0, !dbg !845
  br i1 %38, label %__concretize_string.exit, label %bb6.i8, !dbg !845

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %31, %bb4.i7 ], [ %37, %bb5.i ], [ %sc.1.i, %bb1.i ]
  %39 = add i32 %27, 1, !dbg !837
  br label %bb.i6, !dbg !837

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %40 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) nounwind, !dbg !832
  %41 = trunc i64 %40 to i32, !dbg !832
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !337), !dbg !832
  %42 = icmp eq i32 %41, -1, !dbg !846
  br i1 %42, label %bb2, label %bb4, !dbg !846

bb2:                                              ; preds = %__concretize_string.exit
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !847
  %44 = tail call i32 @klee_get_errno() nounwind, !dbg !847
  store i32 %44, i32* %43, align 4, !dbg !847
  ret i32 %41, !dbg !828

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %41, !dbg !828
}

define i32 @chdir(i8* %path) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !339), !dbg !848
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !849
  %0 = load i8* %path, align 1, !dbg !851
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !851
  %1 = icmp eq i8 %0, 0, !dbg !852
  br i1 %1, label %bb1, label %bb.i, !dbg !852

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !852
  %3 = load i8* %2, align 1, !dbg !852
  %4 = icmp eq i8 %3, 0, !dbg !852
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !852

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !853
  %6 = sext i8 %0 to i32, !dbg !854
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !854
  %9 = icmp eq i32 %6, %8, !dbg !854
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !854

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !855
  %11 = zext i32 %18 to i64, !dbg !855
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !855
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !856
  %13 = load %struct.stat** %12, align 8, !dbg !856
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !856
  %15 = load i64* %14, align 8, !dbg !856
  %16 = icmp eq i64 %15, 0, !dbg !856
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !856

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !853
  br label %bb8.i, !dbg !853

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !853
  br i1 %19, label %bb3.i, label %bb1, !dbg !853

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !855
  %phitmp = icmp eq %struct.exe_disk_file_t* %20, null
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !340), !dbg !850
  br i1 %phitmp, label %bb1, label %bb, !dbg !857

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i64 0, i64 0)) nounwind, !dbg !858
  %21 = tail call i32* @__errno_location() nounwind readnone, !dbg !859
  store i32 2, i32* %21, align 4, !dbg !859
  ret i32 -1, !dbg !860

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !861
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !863
  %22 = ptrtoint i8* %path to i64, !dbg !865
  %23 = tail call i64 @klee_get_valuel(i64 %22) nounwind, !dbg !865
  %24 = inttoptr i64 %23 to i8*, !dbg !865
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !302) nounwind, !dbg !865
  %25 = icmp eq i8* %24, %path, !dbg !866
  %26 = zext i1 %25 to i64, !dbg !866
  tail call void @klee_assume(i64 %26) nounwind, !dbg !866
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !312) nounwind, !dbg !864
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !314) nounwind, !dbg !867
  br label %bb.i6, !dbg !867

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %24, %bb1 ], [ %sc.0.i, %bb6.i8 ]
  %27 = phi i32 [ 0, %bb1 ], [ %39, %bb6.i8 ]
  %tmp.i = add i32 %27, -1
  %28 = load i8* %sc.1.i, align 1, !dbg !868
  %29 = and i32 %tmp.i, %27, !dbg !869
  %30 = icmp eq i32 %29, 0, !dbg !869
  br i1 %30, label %bb1.i, label %bb5.i, !dbg !869

bb1.i:                                            ; preds = %bb.i6
  switch i8 %28, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %28}, i64 0, metadata !315) nounwind, !dbg !868
  store i8 0, i8* %sc.1.i, align 1, !dbg !870
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !870
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !871
  %31 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !871
  br label %bb6.i8, !dbg !871

bb5.i:                                            ; preds = %bb.i6
  %32 = sext i8 %28 to i64, !dbg !872
  %33 = tail call i64 @klee_get_valuel(i64 %32) nounwind, !dbg !872
  %34 = trunc i64 %33 to i8, !dbg !872
  %35 = icmp eq i8 %34, %28, !dbg !873
  %36 = zext i1 %35 to i64, !dbg !873
  tail call void @klee_assume(i64 %36) nounwind, !dbg !873
  store i8 %34, i8* %sc.1.i, align 1, !dbg !874
  %37 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !874
  %38 = icmp eq i8 %34, 0, !dbg !875
  br i1 %38, label %__concretize_string.exit, label %bb6.i8, !dbg !875

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %31, %bb4.i7 ], [ %37, %bb5.i ], [ %sc.1.i, %bb1.i ]
  %39 = add i32 %27, 1, !dbg !867
  br label %bb.i6, !dbg !867

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %40 = tail call i64 (i64, ...)* @syscall(i64 80, i8* %path) nounwind, !dbg !862
  %41 = trunc i64 %40 to i32, !dbg !862
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !342), !dbg !862
  %42 = icmp eq i32 %41, -1, !dbg !876
  br i1 %42, label %bb2, label %bb4, !dbg !876

bb2:                                              ; preds = %__concretize_string.exit
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !877
  %44 = tail call i32 @klee_get_errno() nounwind, !dbg !877
  store i32 %44, i32* %43, align 4, !dbg !877
  ret i32 %41, !dbg !860

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %41, !dbg !860
}

define i32 @select(i32 %nfds, %struct.fd_set* %read, %struct.fd_set* %write, %struct.fd_set* %except, %struct.timespec* nocapture %timeout) nounwind {
entry:
  %in_read = alloca %struct.fd_set, align 8
  %in_write = alloca %struct.fd_set, align 8
  %in_except = alloca %struct.fd_set, align 8
  %os_read = alloca %struct.fd_set, align 8
  %os_write = alloca %struct.fd_set, align 8
  %os_except = alloca %struct.fd_set, align 8
  %tv = alloca %struct.timespec, align 8
  call void @llvm.dbg.value(metadata !{i32 %nfds}, i64 0, metadata !350), !dbg !878
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %read}, i64 0, metadata !351), !dbg !878
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %write}, i64 0, metadata !352), !dbg !878
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %except}, i64 0, metadata !353), !dbg !879
  call void @llvm.dbg.value(metadata !{%struct.timespec* %timeout}, i64 0, metadata !354), !dbg !879
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_read}, metadata !355), !dbg !880
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_write}, metadata !357), !dbg !880
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_except}, metadata !358), !dbg !880
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_read}, metadata !359), !dbg !880
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_write}, metadata !360), !dbg !880
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_except}, metadata !361), !dbg !880
  call void @llvm.dbg.value(metadata !571, i64 0, metadata !363), !dbg !881
  call void @llvm.dbg.value(metadata !571, i64 0, metadata !364), !dbg !881
  %0 = icmp eq %struct.fd_set* %read, null, !dbg !882
  %in_read3 = bitcast %struct.fd_set* %in_read to i8*, !dbg !883
  br i1 %0, label %bb2, label %bb, !dbg !882

bb:                                               ; preds = %entry
  %1 = bitcast %struct.fd_set* %read to i8*, !dbg !884
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %in_read3, i8* %1, i64 128, i32 8, i1 false), !dbg !884
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 128, i32 8, i1 false), !dbg !885
  br label %bb4, !dbg !885

bb2:                                              ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* %in_read3, i8 0, i64 128, i32 8, i1 false), !dbg !883
  br label %bb4, !dbg !883

bb4:                                              ; preds = %bb2, %bb
  %2 = icmp eq %struct.fd_set* %write, null, !dbg !886
  %in_write8 = bitcast %struct.fd_set* %in_write to i8*, !dbg !887
  br i1 %2, label %bb7, label %bb5, !dbg !886

bb5:                                              ; preds = %bb4
  %3 = bitcast %struct.fd_set* %write to i8*, !dbg !888
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %in_write8, i8* %3, i64 128, i32 8, i1 false), !dbg !888
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 128, i32 8, i1 false), !dbg !889
  br label %bb9, !dbg !889

bb7:                                              ; preds = %bb4
  call void @llvm.memset.p0i8.i64(i8* %in_write8, i8 0, i64 128, i32 8, i1 false), !dbg !887
  br label %bb9, !dbg !887

bb9:                                              ; preds = %bb7, %bb5
  %4 = icmp eq %struct.fd_set* %except, null, !dbg !890
  %in_except13 = bitcast %struct.fd_set* %in_except to i8*, !dbg !891
  br i1 %4, label %bb12, label %bb10, !dbg !890

bb10:                                             ; preds = %bb9
  %5 = bitcast %struct.fd_set* %except to i8*, !dbg !892
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %in_except13, i8* %5, i64 128, i32 8, i1 false), !dbg !892
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 128, i32 8, i1 false), !dbg !893
  br label %bb14, !dbg !893

bb12:                                             ; preds = %bb9
  call void @llvm.memset.p0i8.i64(i8* %in_except13, i8 0, i64 128, i32 8, i1 false), !dbg !891
  br label %bb14, !dbg !891

bb14:                                             ; preds = %bb12, %bb10
  %os_read15 = bitcast %struct.fd_set* %os_read to i8*, !dbg !894
  call void @llvm.memset.p0i8.i64(i8* %os_read15, i8 0, i64 128, i32 8, i1 false), !dbg !894
  %os_write16 = bitcast %struct.fd_set* %os_write to i8*, !dbg !895
  call void @llvm.memset.p0i8.i64(i8* %os_write16, i8 0, i64 128, i32 8, i1 false), !dbg !895
  %os_except17 = bitcast %struct.fd_set* %os_except to i8*, !dbg !896
  call void @llvm.memset.p0i8.i64(i8* %os_except17, i8 0, i64 128, i32 8, i1 false), !dbg !896
  call void @llvm.dbg.value(metadata !571, i64 0, metadata !362), !dbg !897
  br label %bb40, !dbg !897

bb18:                                             ; preds = %bb40
  %6 = sdiv i32 %i.0, 64, !dbg !898
  %7 = sext i32 %6 to i64, !dbg !898
  %8 = getelementptr inbounds %struct.fd_set* %in_read, i64 0, i32 0, i64 %7
  %9 = load i64* %8, align 8, !dbg !898
  %10 = srem i32 %i.0, 64, !dbg !898
  %11 = shl i32 1, %10, !dbg !898
  %12 = sext i32 %11 to i64, !dbg !898
  %13 = and i64 %12, %9, !dbg !898
  %14 = icmp eq i64 %13, 0, !dbg !898
  br i1 %14, label %bb19, label %bb21, !dbg !898

bb19:                                             ; preds = %bb18
  %15 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %7
  %16 = load i64* %15, align 8, !dbg !898
  %17 = and i64 %12, %16, !dbg !898
  %18 = icmp eq i64 %17, 0, !dbg !898
  br i1 %18, label %bb20, label %bb21, !dbg !898

bb20:                                             ; preds = %bb19
  %19 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %7
  %20 = load i64* %19, align 8, !dbg !898
  %21 = and i64 %12, %20, !dbg !898
  %22 = icmp eq i64 %21, 0, !dbg !898
  br i1 %22, label %bb39, label %bb21, !dbg !898

bb21:                                             ; preds = %bb20, %bb19, %bb18
  %23 = icmp ult i32 %i.0, 32
  br i1 %23, label %bb.i, label %bb22, !dbg !899

bb.i:                                             ; preds = %bb21
  %24 = load i32* %scevgep82, align 4, !dbg !901
  %25 = and i32 %24, 1, !dbg !901
  %toBool.i = icmp eq i32 %25, 0
  br i1 %toBool.i, label %bb22, label %bb23, !dbg !901

bb22:                                             ; preds = %bb21, %bb.i
  tail call void @llvm.dbg.value(metadata !902, i64 0, metadata !235), !dbg !903
  %26 = call i32* @__errno_location() nounwind readnone, !dbg !904
  store i32 9, i32* %26, align 4, !dbg !904
  ret i32 -1, !dbg !905

bb23:                                             ; preds = %bb.i
  %27 = load %struct.exe_disk_file_t** %scevgep81, align 8, !dbg !906
  %28 = icmp eq %struct.exe_disk_file_t* %27, null, !dbg !906
  %29 = icmp ne i64 %13, 0, !dbg !907
  br i1 %28, label %bb31, label %bb24, !dbg !906

bb24:                                             ; preds = %bb23
  br i1 %29, label %bb25, label %bb26, !dbg !907

bb25:                                             ; preds = %bb24
  %30 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %7
  %31 = load i64* %30, align 8, !dbg !907
  %32 = or i64 %12, %31, !dbg !907
  store i64 %32, i64* %30, align 8, !dbg !907
  br label %bb26, !dbg !907

bb26:                                             ; preds = %bb24, %bb25
  %33 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %7
  %34 = load i64* %33, align 8, !dbg !908
  %35 = and i64 %12, %34, !dbg !908
  %36 = icmp eq i64 %35, 0, !dbg !908
  br i1 %36, label %bb28, label %bb27, !dbg !908

bb27:                                             ; preds = %bb26
  %37 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %7
  %38 = load i64* %37, align 8, !dbg !908
  %39 = or i64 %12, %38, !dbg !908
  store i64 %39, i64* %37, align 8, !dbg !908
  br label %bb28, !dbg !908

bb28:                                             ; preds = %bb26, %bb27
  %40 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %7
  %41 = load i64* %40, align 8, !dbg !909
  %42 = and i64 %12, %41, !dbg !909
  %43 = icmp eq i64 %42, 0, !dbg !909
  br i1 %43, label %bb30, label %bb29, !dbg !909

bb29:                                             ; preds = %bb28
  %44 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %7
  %45 = load i64* %44, align 8, !dbg !909
  %46 = or i64 %12, %45, !dbg !909
  store i64 %46, i64* %44, align 8, !dbg !909
  br label %bb30, !dbg !909

bb30:                                             ; preds = %bb28, %bb29
  %47 = add nsw i32 %count.1, 1, !dbg !910
  br label %bb39, !dbg !910

bb31:                                             ; preds = %bb23
  br i1 %29, label %bb32, label %bb33, !dbg !911

bb32:                                             ; preds = %bb31
  %48 = load i32* %scevgep7980, align 8, !dbg !911
  %49 = sdiv i32 %48, 64, !dbg !911
  %50 = sext i32 %49 to i64, !dbg !911
  %51 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %50
  %52 = load i64* %51, align 8, !dbg !911
  %53 = srem i32 %48, 64, !dbg !911
  %54 = shl i32 1, %53, !dbg !911
  %55 = sext i32 %54 to i64, !dbg !911
  %56 = or i64 %55, %52, !dbg !911
  store i64 %56, i64* %51, align 8, !dbg !911
  br label %bb33, !dbg !911

bb33:                                             ; preds = %bb31, %bb32
  %57 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %7
  %58 = load i64* %57, align 8, !dbg !912
  %59 = and i64 %12, %58, !dbg !912
  %60 = icmp eq i64 %59, 0, !dbg !912
  br i1 %60, label %bb35, label %bb34, !dbg !912

bb34:                                             ; preds = %bb33
  %61 = load i32* %scevgep7980, align 8, !dbg !912
  %62 = sdiv i32 %61, 64, !dbg !912
  %63 = sext i32 %62 to i64, !dbg !912
  %64 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %63
  %65 = load i64* %64, align 8, !dbg !912
  %66 = srem i32 %61, 64, !dbg !912
  %67 = shl i32 1, %66, !dbg !912
  %68 = sext i32 %67 to i64, !dbg !912
  %69 = or i64 %68, %65, !dbg !912
  store i64 %69, i64* %64, align 8, !dbg !912
  br label %bb35, !dbg !912

bb35:                                             ; preds = %bb33, %bb34
  %70 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %7
  %71 = load i64* %70, align 8, !dbg !913
  %72 = and i64 %12, %71, !dbg !913
  %73 = icmp eq i64 %72, 0, !dbg !913
  %.pre = load i32* %scevgep7980, align 8
  br i1 %73, label %bb37, label %bb36, !dbg !913

bb36:                                             ; preds = %bb35
  %74 = sdiv i32 %.pre, 64, !dbg !913
  %75 = sext i32 %74 to i64, !dbg !913
  %76 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %75
  %77 = load i64* %76, align 8, !dbg !913
  %78 = srem i32 %.pre, 64, !dbg !913
  %79 = shl i32 1, %78, !dbg !913
  %80 = sext i32 %79 to i64, !dbg !913
  %81 = or i64 %80, %77, !dbg !913
  store i64 %81, i64* %76, align 8, !dbg !913
  br label %bb37, !dbg !913

bb37:                                             ; preds = %bb35, %bb36
  %82 = phi i32 [ %.pre, %bb36 ], [ %.pre, %bb35 ]
  %83 = add nsw i32 %.pre, 1, !dbg !914
  %84 = icmp slt i32 %.pre, %os_nfds.1, !dbg !914
  %os_nfds.1. = select i1 %84, i32 %os_nfds.1, i32 %83
  br label %bb39, !dbg !914

bb39:                                             ; preds = %bb37, %bb20, %bb30
  %count.0 = phi i32 [ %47, %bb30 ], [ %count.1, %bb20 ], [ %count.1, %bb37 ]
  %os_nfds.0 = phi i32 [ %os_nfds.1, %bb30 ], [ %os_nfds.1, %bb20 ], [ %os_nfds.1., %bb37 ]
  %indvar.next78 = add i64 %indvar77, 1
  br label %bb40, !dbg !897

bb40:                                             ; preds = %bb39, %bb14
  %indvar77 = phi i64 [ %indvar.next78, %bb39 ], [ 0, %bb14 ]
  %count.1 = phi i32 [ %count.0, %bb39 ], [ 0, %bb14 ]
  %os_nfds.1 = phi i32 [ %os_nfds.0, %bb39 ], [ 0, %bb14 ]
  %scevgep7980 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar77, i32 0
  %scevgep81 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar77, i32 3
  %scevgep82 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar77, i32 1
  %i.0 = trunc i64 %indvar77 to i32
  %85 = icmp slt i32 %i.0, %nfds, !dbg !897
  br i1 %85, label %bb18, label %bb41, !dbg !897

bb41:                                             ; preds = %bb40
  %86 = icmp sgt i32 %os_nfds.1, 0, !dbg !915
  br i1 %86, label %bb42, label %bb61, !dbg !915

bb42:                                             ; preds = %bb41
  call void @llvm.dbg.declare(metadata !{%struct.timespec* %tv}, metadata !367), !dbg !916
  %87 = getelementptr inbounds %struct.timespec* %tv, i64 0, i32 0, !dbg !916
  store i64 0, i64* %87, align 8, !dbg !916
  %88 = getelementptr inbounds %struct.timespec* %tv, i64 0, i32 1, !dbg !916
  store i64 0, i64* %88, align 8, !dbg !916
  %89 = call i64 (i64, ...)* @syscall(i64 23, i32 %os_nfds.1, %struct.fd_set* %os_read, %struct.fd_set* %os_write, %struct.fd_set* %os_except, %struct.timespec* %tv) nounwind, !dbg !917
  %90 = trunc i64 %89 to i32, !dbg !917
  call void @llvm.dbg.value(metadata !{i32 %90}, i64 0, metadata !369), !dbg !917
  %91 = icmp eq i32 %90, -1, !dbg !918
  br i1 %91, label %bb43, label %bb45, !dbg !918

bb43:                                             ; preds = %bb42
  %92 = icmp eq i32 %count.1, 0, !dbg !919
  br i1 %92, label %bb44, label %bb61, !dbg !919

bb44:                                             ; preds = %bb43
  %93 = call i32* @__errno_location() nounwind readnone, !dbg !920
  %94 = call i32 @klee_get_errno() nounwind, !dbg !920
  store i32 %94, i32* %93, align 4, !dbg !920
  ret i32 -1, !dbg !905

bb45:                                             ; preds = %bb42
  %95 = add nsw i32 %90, %count.1, !dbg !921
  call void @llvm.dbg.value(metadata !{i32 %95}, i64 0, metadata !363), !dbg !921
  call void @llvm.dbg.value(metadata !571, i64 0, metadata !362), !dbg !922
  %96 = icmp sgt i32 %nfds, 0, !dbg !922
  br i1 %96, label %bb.nph, label %bb61, !dbg !922

bb.nph:                                           ; preds = %bb45
  %tmp = zext i32 %nfds to i64
  br label %bb46

bb46:                                             ; preds = %bb58, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %bb58 ]
  %i.168 = trunc i64 %indvar to i32
  %scevgep72 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 0
  %scevgep73 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 3
  %97 = icmp ult i32 %i.168, 32
  br i1 %97, label %bb.i64, label %bb58, !dbg !923

bb.i64:                                           ; preds = %bb46
  %scevgep74 = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 1
  %98 = load i32* %scevgep74, align 4, !dbg !925
  %99 = and i32 %98, 1, !dbg !925
  %toBool.i63 = icmp eq i32 %99, 0
  br i1 %toBool.i63, label %bb58, label %bb48, !dbg !925

bb48:                                             ; preds = %bb.i64
  %100 = load %struct.exe_disk_file_t** %scevgep73, align 8, !dbg !926
  %101 = icmp eq %struct.exe_disk_file_t* %100, null, !dbg !926
  br i1 %101, label %bb49, label %bb58, !dbg !926

bb49:                                             ; preds = %bb48
  br i1 %0, label %bb52, label %bb50, !dbg !927

bb50:                                             ; preds = %bb49
  %102 = load i32* %scevgep72, align 8, !dbg !927
  %103 = sdiv i32 %102, 64, !dbg !927
  %104 = sext i32 %103 to i64, !dbg !927
  %105 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %104
  %106 = load i64* %105, align 8, !dbg !927
  %107 = srem i32 %102, 64, !dbg !927
  %108 = shl i32 1, %107, !dbg !927
  %109 = sext i32 %108 to i64, !dbg !927
  %110 = and i64 %109, %106, !dbg !927
  %111 = icmp eq i64 %110, 0, !dbg !927
  br i1 %111, label %bb52, label %bb51, !dbg !927

bb51:                                             ; preds = %bb50
  %112 = sdiv i32 %i.168, 64, !dbg !927
  %113 = sext i32 %112 to i64, !dbg !927
  %114 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %113
  %115 = load i64* %114, align 8, !dbg !927
  %116 = srem i32 %i.168, 64, !dbg !927
  %117 = shl i32 1, %116, !dbg !927
  %118 = sext i32 %117 to i64, !dbg !927
  %119 = or i64 %118, %115, !dbg !927
  store i64 %119, i64* %114, align 8, !dbg !927
  br label %bb52, !dbg !927

bb52:                                             ; preds = %bb50, %bb49, %bb51
  br i1 %2, label %bb55, label %bb53, !dbg !928

bb53:                                             ; preds = %bb52
  %120 = load i32* %scevgep72, align 8, !dbg !928
  %121 = sdiv i32 %120, 64, !dbg !928
  %122 = sext i32 %121 to i64, !dbg !928
  %123 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %122
  %124 = load i64* %123, align 8, !dbg !928
  %125 = srem i32 %120, 64, !dbg !928
  %126 = shl i32 1, %125, !dbg !928
  %127 = sext i32 %126 to i64, !dbg !928
  %128 = and i64 %127, %124, !dbg !928
  %129 = icmp eq i64 %128, 0, !dbg !928
  br i1 %129, label %bb55, label %bb54, !dbg !928

bb54:                                             ; preds = %bb53
  %130 = sdiv i32 %i.168, 64, !dbg !928
  %131 = sext i32 %130 to i64, !dbg !928
  %132 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %131
  %133 = load i64* %132, align 8, !dbg !928
  %134 = srem i32 %i.168, 64, !dbg !928
  %135 = shl i32 1, %134, !dbg !928
  %136 = sext i32 %135 to i64, !dbg !928
  %137 = or i64 %136, %133, !dbg !928
  store i64 %137, i64* %132, align 8, !dbg !928
  br label %bb55, !dbg !928

bb55:                                             ; preds = %bb53, %bb52, %bb54
  br i1 %4, label %bb58, label %bb56, !dbg !929

bb56:                                             ; preds = %bb55
  %138 = load i32* %scevgep72, align 8, !dbg !929
  %139 = sdiv i32 %138, 64, !dbg !929
  %140 = sext i32 %139 to i64, !dbg !929
  %141 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %140
  %142 = load i64* %141, align 8, !dbg !929
  %143 = srem i32 %138, 64, !dbg !929
  %144 = shl i32 1, %143, !dbg !929
  %145 = sext i32 %144 to i64, !dbg !929
  %146 = and i64 %145, %142, !dbg !929
  %147 = icmp eq i64 %146, 0, !dbg !929
  br i1 %147, label %bb58, label %bb57, !dbg !929

bb57:                                             ; preds = %bb56
  %148 = sdiv i32 %i.168, 64, !dbg !929
  %149 = sext i32 %148 to i64, !dbg !929
  %150 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %149
  %151 = load i64* %150, align 8, !dbg !929
  %152 = srem i32 %i.168, 64, !dbg !929
  %153 = shl i32 1, %152, !dbg !929
  %154 = sext i32 %153 to i64, !dbg !929
  %155 = or i64 %154, %151, !dbg !929
  store i64 %155, i64* %150, align 8, !dbg !929
  br label %bb58, !dbg !929

bb58:                                             ; preds = %bb46, %bb.i64, %bb56, %bb55, %bb57, %bb48
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp
  br i1 %exitcond, label %bb61, label %bb46, !dbg !922

bb61:                                             ; preds = %bb45, %bb58, %bb41, %bb43
  %.0 = phi i32 [ %count.1, %bb43 ], [ %count.1, %bb41 ], [ %95, %bb58 ], [ %95, %bb45 ]
  ret i32 %.0, !dbg !905
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @close(i32 %fd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !372), !dbg !930
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !375), !dbg !931
  %0 = load i32* @n_calls.4743, align 4, !dbg !932
  %1 = add nsw i32 %0, 1, !dbg !932
  store i32 %1, i32* @n_calls.4743, align 4, !dbg !932
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !933
  %2 = icmp ult i32 %fd, 32
  br i1 %2, label %bb.i, label %bb, !dbg !935

bb.i:                                             ; preds = %entry
  %3 = sext i32 %fd to i64, !dbg !936
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !936
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1
  %5 = load i32* %4, align 4, !dbg !937
  %6 = and i32 %5, 1, !dbg !937
  %toBool.i = icmp eq i32 %6, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !937

__get_file.exit:                                  ; preds = %bb.i
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %7}, i64 0, metadata !373), !dbg !934
  %8 = icmp eq %struct.exe_file_t* %7, null, !dbg !938
  br i1 %8, label %bb, label %bb1, !dbg !938

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %9 = tail call i32* @__errno_location() nounwind readnone, !dbg !939
  store i32 9, i32* %9, align 4, !dbg !939
  ret i32 -1, !dbg !940

bb1:                                              ; preds = %__get_file.exit
  %10 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !941
  %11 = icmp eq i32 %10, 0, !dbg !941
  br i1 %11, label %bb4, label %bb2, !dbg !941

bb2:                                              ; preds = %bb1
  %12 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !941
  %13 = load i32* %12, align 4, !dbg !941
  %14 = icmp eq i32 %13, %1, !dbg !941
  br i1 %14, label %bb3, label %bb4, !dbg !941

bb3:                                              ; preds = %bb2
  %15 = add i32 %10, -1
  store i32 %15, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !942
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !943
  store i32 5, i32* %16, align 4, !dbg !943
  ret i32 -1, !dbg !940

bb4:                                              ; preds = %bb1, %bb2
  %17 = bitcast %struct.exe_file_t* %7 to i8*, !dbg !944
  tail call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 24, i32 8, i1 false), !dbg !944
  ret i32 0, !dbg !940
}

define i32 @dup2(i32 %oldfd, i32 %newfd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !376), !dbg !945
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !377), !dbg !945
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !235), !dbg !946
  %0 = icmp ult i32 %oldfd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !948

bb.i:                                             ; preds = %entry
  %1 = sext i32 %oldfd to i64, !dbg !949
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !949
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !950
  %4 = and i32 %3, 1, !dbg !950
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !950

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !378), !dbg !947
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !951
  %7 = icmp ugt i32 %newfd, 31, !dbg !951
  %8 = or i1 %6, %7, !dbg !951
  br i1 %8, label %bb, label %bb3, !dbg !951

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %9 = tail call i32* @__errno_location() nounwind readnone, !dbg !952
  store i32 9, i32* %9, align 4, !dbg !952
  ret i32 -1, !dbg !953

bb3:                                              ; preds = %__get_file.exit
  %10 = sext i32 %newfd to i64, !dbg !954
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !380), !dbg !954
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %10, i32 1
  %12 = load i32* %11, align 4, !dbg !955
  %13 = and i32 %12, 1, !dbg !955
  %toBool4 = icmp eq i32 %13, 0
  br i1 %toBool4, label %bb6, label %bb5, !dbg !955

bb5:                                              ; preds = %bb3
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !372) nounwind, !dbg !956
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !375) nounwind, !dbg !957
  %14 = load i32* @n_calls.4743, align 4, !dbg !958
  %15 = add nsw i32 %14, 1, !dbg !958
  store i32 %15, i32* @n_calls.4743, align 4, !dbg !958
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !235) nounwind, !dbg !959
  %16 = icmp ult i32 %newfd, 32
  br i1 %16, label %__get_file.exit.i, label %bb.i9, !dbg !961

__get_file.exit.i:                                ; preds = %bb5
  %17 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %10
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %17}, i64 0, metadata !373) nounwind, !dbg !960
  %18 = icmp eq %struct.exe_file_t* %17, null, !dbg !962
  br i1 %18, label %bb.i9, label %bb1.i10, !dbg !962

bb.i9:                                            ; preds = %__get_file.exit.i, %bb5
  %19 = tail call i32* @__errno_location() nounwind readnone, !dbg !963
  store i32 9, i32* %19, align 4, !dbg !963
  br label %bb6

bb1.i10:                                          ; preds = %__get_file.exit.i
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !964
  %21 = icmp eq i32 %20, 0, !dbg !964
  br i1 %21, label %bb4.i, label %bb2.i, !dbg !964

bb2.i:                                            ; preds = %bb1.i10
  %22 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !964
  %23 = load i32* %22, align 4, !dbg !964
  %24 = icmp eq i32 %23, %15, !dbg !964
  br i1 %24, label %bb3.i11, label %bb4.i, !dbg !964

bb3.i11:                                          ; preds = %bb2.i
  %25 = add i32 %20, -1
  store i32 %25, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !965
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !966
  store i32 5, i32* %26, align 4, !dbg !966
  br label %bb6

bb4.i:                                            ; preds = %bb2.i, %bb1.i10
  %27 = bitcast %struct.exe_file_t* %17 to i8*, !dbg !967
  tail call void @llvm.memset.p0i8.i64(i8* %27, i8 0, i64 24, i32 8, i1 false) nounwind, !dbg !967
  br label %bb6

bb6:                                              ; preds = %bb.i9, %bb4.i, %bb3.i11, %bb3
  %28 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %10, i32 0
  %29 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %30 = load i32* %29, align 8, !dbg !968
  store i32 %30, i32* %28, align 8, !dbg !968
  %31 = load i32* %2, align 4, !dbg !968
  %32 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %10, i32 2
  %33 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2
  %34 = load i64* %33, align 8, !dbg !968
  store i64 %34, i64* %32, align 8, !dbg !968
  %35 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %10, i32 3
  %36 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %37 = load %struct.exe_disk_file_t** %36, align 8, !dbg !968
  store %struct.exe_disk_file_t* %37, %struct.exe_disk_file_t** %35, align 8, !dbg !968
  %38 = and i32 %31, -3, !dbg !969
  store i32 %38, i32* %11, align 4, !dbg !969
  ret i32 %newfd, !dbg !953
}

define i32 @dup(i32 %oldfd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !382), !dbg !970
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !235), !dbg !971
  %0 = icmp ult i32 %oldfd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !973

bb.i:                                             ; preds = %entry
  %1 = sext i32 %oldfd to i64, !dbg !974
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !974
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !975
  %4 = and i32 %3, 1, !dbg !975
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !975

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  %phitmp = icmp eq %struct.exe_file_t* %5, null
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !383), !dbg !972
  br i1 %phitmp, label %bb, label %bb4, !dbg !976

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !977
  store i32 9, i32* %6, align 4, !dbg !977
  ret i32 -1, !dbg !978

bb2:                                              ; preds = %bb4
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 1
  %7 = load i32* %scevgep, align 4, !dbg !979
  %8 = and i32 %7, 1, !dbg !979
  %9 = icmp eq i32 %8, 0, !dbg !979
  br i1 %9, label %bb7, label %bb3, !dbg !979

bb3:                                              ; preds = %bb2
  %indvar.next = add i64 %indvar, 1
  br label %bb4, !dbg !980

bb4:                                              ; preds = %__get_file.exit, %bb3
  %indvar = phi i64 [ %indvar.next, %bb3 ], [ 0, %__get_file.exit ]
  %fd.0 = trunc i64 %indvar to i32
  %10 = icmp slt i32 %fd.0, 32
  br i1 %10, label %bb2, label %bb6, !dbg !980

bb6:                                              ; preds = %bb4
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !981
  store i32 24, i32* %11, align 4, !dbg !981
  ret i32 -1, !dbg !978

bb7:                                              ; preds = %bb2
  %12 = tail call i32 @dup2(i32 %oldfd, i32 %fd.0) nounwind, !dbg !982
  ret i32 %12, !dbg !978
}

define i32 @fcntl(i32 %fd, i32 %cmd, ...) nounwind {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 8
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !387), !dbg !983
  call void @llvm.dbg.value(metadata !{i32 %cmd}, i64 0, metadata !388), !dbg !983
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !391), !dbg !984
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !985
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !987

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !988
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !988
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !989
  %4 = and i32 %3, 1, !dbg !989
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !989

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !389), !dbg !986
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !990
  br i1 %6, label %bb, label %bb1, !dbg !990

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = call i32* @__errno_location() nounwind readnone, !dbg !991
  store i32 9, i32* %7, align 4, !dbg !991
  ret i32 -1, !dbg !992

bb1:                                              ; preds = %__get_file.exit
  switch i32 %cmd, label %bb4 [
    i32 1, label %bb21
    i32 3, label %bb21
  ]

bb4:                                              ; preds = %bb1
  %8 = icmp eq i32 %cmd, 9, !dbg !993
  %9 = icmp eq i32 %cmd, 11, !dbg !993
  %10 = or i1 %8, %9, !dbg !993
  %cmd.off = add i32 %cmd, -1025
  %11 = icmp ult i32 %cmd.off, 2
  %or.cond = or i1 %10, %11
  br i1 %or.cond, label %bb21, label %bb13, !dbg !993

bb13:                                             ; preds = %bb4
  %ap1415 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !994
  call void @llvm.va_start(i8* %ap1415), !dbg !994
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %13 = load i32* %12, align 8, !dbg !995
  %14 = icmp ugt i32 %13, 47
  br i1 %14, label %bb17, label %bb16, !dbg !995

bb16:                                             ; preds = %bb13
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %16 = load i8** %15, align 8, !dbg !995
  %tmp = zext i32 %13 to i64
  %17 = ptrtoint i8* %16 to i64, !dbg !995
  %18 = add i64 %tmp, %17, !dbg !995
  %19 = inttoptr i64 %18 to i8*, !dbg !995
  %20 = add i32 %13, 8, !dbg !995
  store i32 %20, i32* %12, align 8, !dbg !995
  br label %bb18, !dbg !995

bb17:                                             ; preds = %bb13
  %21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %22 = load i8** %21, align 8, !dbg !995
  %23 = getelementptr inbounds i8* %22, i64 8, !dbg !995
  store i8* %23, i8** %21, align 8, !dbg !995
  br label %bb18, !dbg !995

bb18:                                             ; preds = %bb17, %bb16
  %addr.48.0 = phi i8* [ %22, %bb17 ], [ %19, %bb16 ]
  %24 = bitcast i8* %addr.48.0 to i32*, !dbg !995
  %25 = load i32* %24, align 4, !dbg !995
  call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !404), !dbg !995
  call void @llvm.va_end(i8* %ap1415), !dbg !996
  br label %bb21, !dbg !996

bb21:                                             ; preds = %bb4, %bb1, %bb1, %bb18
  %arg.0 = phi i32 [ %25, %bb18 ], [ 0, %bb1 ], [ 0, %bb1 ], [ 0, %bb4 ]
  %26 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %27 = load %struct.exe_disk_file_t** %26, align 8, !dbg !997
  %28 = icmp eq %struct.exe_disk_file_t* %27, null, !dbg !997
  br i1 %28, label %bb32, label %bb22, !dbg !997

bb22:                                             ; preds = %bb21
  switch i32 %cmd, label %bb31 [
    i32 1, label %bb23
    i32 2, label %bb26
    i32 3, label %bb35
  ], !dbg !998

bb23:                                             ; preds = %bb22
  call void @llvm.dbg.value(metadata !571, i64 0, metadata !405), !dbg !999
  %29 = load i32* %2, align 4, !dbg !1000
  call void @llvm.dbg.value(metadata !1001, i64 0, metadata !405), !dbg !1002
  %30 = lshr i32 %29, 1
  %.lobit = and i32 %30, 1
  ret i32 %.lobit, !dbg !992

bb26:                                             ; preds = %bb22
  %31 = load i32* %2, align 4, !dbg !1003
  %32 = and i32 %31, -3, !dbg !1003
  store i32 %32, i32* %2, align 4, !dbg !1003
  %33 = and i32 %arg.0, 1, !dbg !1004
  %toBool27 = icmp eq i32 %33, 0
  br i1 %toBool27, label %bb35, label %bb28, !dbg !1004

bb28:                                             ; preds = %bb26
  %34 = or i32 %31, 2, !dbg !1005
  store i32 %34, i32* %2, align 4, !dbg !1005
  ret i32 0, !dbg !992

bb31:                                             ; preds = %bb22
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str6, i64 0, i64 0)) nounwind, !dbg !1006
  %35 = call i32* @__errno_location() nounwind readnone, !dbg !1007
  store i32 22, i32* %35, align 4, !dbg !1007
  ret i32 -1, !dbg !992

bb32:                                             ; preds = %bb21
  %36 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %37 = load i32* %36, align 8, !dbg !1008
  %38 = call i64 (i64, ...)* @syscall(i64 72, i32 %37, i32 %cmd, i32 %arg.0) nounwind, !dbg !1008
  %39 = trunc i64 %38 to i32, !dbg !1008
  call void @llvm.dbg.value(metadata !{i32 %39}, i64 0, metadata !407), !dbg !1008
  %40 = icmp eq i32 %39, -1, !dbg !1009
  br i1 %40, label %bb33, label %bb35, !dbg !1009

bb33:                                             ; preds = %bb32
  %41 = call i32* @__errno_location() nounwind readnone, !dbg !1010
  %42 = call i32 @klee_get_errno() nounwind, !dbg !1010
  store i32 %42, i32* %41, align 4, !dbg !1010
  ret i32 %39, !dbg !992

bb35:                                             ; preds = %bb32, %bb22, %bb26
  %.0 = phi i32 [ 0, %bb26 ], [ 0, %bb22 ], [ %39, %bb32 ]
  ret i32 %.0, !dbg !992
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @ioctl(i32 %fd, i64 %request, ...) nounwind {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 8
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !409), !dbg !1011
  call void @llvm.dbg.value(metadata !{i64 %request}, i64 0, metadata !410), !dbg !1011
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !413), !dbg !1012
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1013
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !1015

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1016
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !1016
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !1017
  %4 = and i32 %3, 1, !dbg !1017
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1017

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !411), !dbg !1014
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1018
  br i1 %6, label %bb, label %bb1, !dbg !1018

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = call i32* @__errno_location() nounwind readnone, !dbg !1019
  store i32 9, i32* %7, align 4, !dbg !1019
  ret i32 -1, !dbg !1020

bb1:                                              ; preds = %__get_file.exit
  %ap23 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !1021
  call void @llvm.va_start(i8* %ap23), !dbg !1021
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %9 = load i32* %8, align 8, !dbg !1022
  %10 = icmp ugt i32 %9, 47
  br i1 %10, label %bb5, label %bb4, !dbg !1022

bb4:                                              ; preds = %bb1
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %12 = load i8** %11, align 8, !dbg !1022
  %tmp = zext i32 %9 to i64
  %13 = ptrtoint i8* %12 to i64, !dbg !1022
  %14 = add i64 %tmp, %13, !dbg !1022
  %15 = inttoptr i64 %14 to i8*, !dbg !1022
  %16 = add i32 %9, 8, !dbg !1022
  store i32 %16, i32* %8, align 8, !dbg !1022
  br label %bb6, !dbg !1022

bb5:                                              ; preds = %bb1
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %18 = load i8** %17, align 8, !dbg !1022
  %19 = getelementptr inbounds i8* %18, i64 8, !dbg !1022
  store i8* %19, i8** %17, align 8, !dbg !1022
  br label %bb6, !dbg !1022

bb6:                                              ; preds = %bb5, %bb4
  %addr.46.0 = phi i8* [ %18, %bb5 ], [ %15, %bb4 ]
  %20 = bitcast i8* %addr.46.0 to i8**, !dbg !1022
  %21 = load i8** %20, align 8, !dbg !1022
  call void @llvm.dbg.value(metadata !{i8* %21}, i64 0, metadata !414), !dbg !1022
  call void @llvm.va_end(i8* %ap23), !dbg !1023
  %22 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %23 = load %struct.exe_disk_file_t** %22, align 8, !dbg !1024
  %24 = icmp eq %struct.exe_disk_file_t* %23, null, !dbg !1024
  br i1 %24, label %bb36, label %bb9, !dbg !1024

bb9:                                              ; preds = %bb6
  %25 = getelementptr inbounds %struct.exe_disk_file_t* %23, i64 0, i32 2, !dbg !1025
  %26 = load %struct.stat** %25, align 8, !dbg !1025
  call void @llvm.dbg.value(metadata !{%struct.stat* %26}, i64 0, metadata !415), !dbg !1025
  switch i64 %request, label %bb35 [
    i64 21505, label %bb10
    i64 21506, label %bb13
    i64 21507, label %bb16
    i64 21508, label %bb19
    i64 21523, label %bb22
    i64 21524, label %bb25
    i64 21531, label %bb28
    i64 2150657282, label %bb34
  ], !dbg !1026

bb10:                                             ; preds = %bb9
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !437), !dbg !1027
  call void @klee_warning_once(i8* getelementptr inbounds ([41 x i8]* @.str7, i64 0, i64 0)) nounwind, !dbg !1028
  %27 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1029
  %28 = load i32* %27, align 8, !dbg !1029
  %29 = and i32 %28, 61440, !dbg !1029
  %30 = icmp eq i32 %29, 8192, !dbg !1029
  br i1 %30, label %bb11, label %bb12, !dbg !1029

bb11:                                             ; preds = %bb10
  %31 = bitcast i8* %21 to i32*
  store i32 27906, i32* %31, align 4, !dbg !1030
  %32 = getelementptr inbounds i8* %21, i64 4
  %33 = bitcast i8* %32 to i32*
  store i32 5, i32* %33, align 4, !dbg !1031
  %34 = getelementptr inbounds i8* %21, i64 8
  %35 = bitcast i8* %34 to i32*
  store i32 1215, i32* %35, align 4, !dbg !1032
  %36 = getelementptr inbounds i8* %21, i64 12
  %37 = bitcast i8* %36 to i32*
  store i32 35287, i32* %37, align 4, !dbg !1033
  %38 = getelementptr inbounds i8* %21, i64 16
  store i8 0, i8* %38, align 4, !dbg !1034
  %39 = getelementptr inbounds i8* %21, i64 17
  store i8 3, i8* %39, align 1, !dbg !1035
  %40 = getelementptr inbounds i8* %21, i64 18
  store i8 28, i8* %40, align 1, !dbg !1036
  %41 = getelementptr inbounds i8* %21, i64 19
  store i8 127, i8* %41, align 1, !dbg !1037
  %42 = getelementptr inbounds i8* %21, i64 20
  store i8 21, i8* %42, align 1, !dbg !1038
  %43 = getelementptr inbounds i8* %21, i64 21
  store i8 4, i8* %43, align 1, !dbg !1039
  %44 = getelementptr inbounds i8* %21, i64 22
  store i8 0, i8* %44, align 1, !dbg !1040
  %45 = getelementptr inbounds i8* %21, i64 23
  store i8 1, i8* %45, align 1, !dbg !1041
  %46 = getelementptr inbounds i8* %21, i64 24
  store i8 -1, i8* %46, align 1, !dbg !1042
  %47 = getelementptr inbounds i8* %21, i64 25
  store i8 17, i8* %47, align 1, !dbg !1043
  %48 = getelementptr inbounds i8* %21, i64 26
  store i8 19, i8* %48, align 1, !dbg !1044
  %49 = getelementptr inbounds i8* %21, i64 27
  store i8 26, i8* %49, align 1, !dbg !1045
  %50 = getelementptr inbounds i8* %21, i64 28
  store i8 -1, i8* %50, align 1, !dbg !1046
  %51 = getelementptr inbounds i8* %21, i64 29
  store i8 18, i8* %51, align 1, !dbg !1047
  %52 = getelementptr inbounds i8* %21, i64 30
  store i8 15, i8* %52, align 1, !dbg !1048
  %53 = getelementptr inbounds i8* %21, i64 31
  store i8 23, i8* %53, align 1, !dbg !1049
  %54 = getelementptr inbounds i8* %21, i64 32
  store i8 22, i8* %54, align 1, !dbg !1050
  %55 = getelementptr inbounds i8* %21, i64 33
  store i8 -1, i8* %55, align 1, !dbg !1051
  %56 = getelementptr inbounds i8* %21, i64 34
  store i8 0, i8* %56, align 1, !dbg !1052
  %57 = getelementptr inbounds i8* %21, i64 35
  store i8 0, i8* %57, align 1, !dbg !1053
  ret i32 0, !dbg !1020

bb12:                                             ; preds = %bb10
  %58 = call i32* @__errno_location() nounwind readnone, !dbg !1054
  store i32 25, i32* %58, align 4, !dbg !1054
  ret i32 -1, !dbg !1020

bb13:                                             ; preds = %bb9
  call void @klee_warning_once(i8* getelementptr inbounds ([42 x i8]* @.str8, i64 0, i64 0)) nounwind, !dbg !1055
  %59 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1056
  %60 = load i32* %59, align 8, !dbg !1056
  %61 = and i32 %60, 61440, !dbg !1056
  %62 = icmp eq i32 %61, 8192, !dbg !1056
  br i1 %62, label %bb39, label %bb15, !dbg !1056

bb15:                                             ; preds = %bb13
  %63 = call i32* @__errno_location() nounwind readnone, !dbg !1057
  store i32 25, i32* %63, align 4, !dbg !1057
  ret i32 -1, !dbg !1020

bb16:                                             ; preds = %bb9
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str9, i64 0, i64 0)) nounwind, !dbg !1058
  %64 = icmp eq i32 %fd, 0, !dbg !1059
  br i1 %64, label %bb39, label %bb18, !dbg !1059

bb18:                                             ; preds = %bb16
  %65 = call i32* @__errno_location() nounwind readnone, !dbg !1060
  store i32 25, i32* %65, align 4, !dbg !1060
  ret i32 -1, !dbg !1020

bb19:                                             ; preds = %bb9
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str10, i64 0, i64 0)) nounwind, !dbg !1061
  %66 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1062
  %67 = load i32* %66, align 8, !dbg !1062
  %68 = and i32 %67, 61440, !dbg !1062
  %69 = icmp eq i32 %68, 8192, !dbg !1062
  br i1 %69, label %bb39, label %bb21, !dbg !1062

bb21:                                             ; preds = %bb19
  %70 = call i32* @__errno_location() nounwind readnone, !dbg !1063
  store i32 25, i32* %70, align 4, !dbg !1063
  ret i32 -1, !dbg !1020

bb22:                                             ; preds = %bb9
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !457), !dbg !1064
  %71 = bitcast i8* %21 to i16*
  store i16 24, i16* %71, align 2, !dbg !1065
  %72 = getelementptr inbounds i8* %21, i64 2
  %73 = bitcast i8* %72 to i16*
  store i16 80, i16* %73, align 2, !dbg !1066
  call void @klee_warning_once(i8* getelementptr inbounds ([45 x i8]* @.str11, i64 0, i64 0)) nounwind, !dbg !1067
  %74 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1068
  %75 = load i32* %74, align 8, !dbg !1068
  %76 = and i32 %75, 61440, !dbg !1068
  %77 = icmp eq i32 %76, 8192, !dbg !1068
  br i1 %77, label %bb39, label %bb24, !dbg !1068

bb24:                                             ; preds = %bb22
  %78 = call i32* @__errno_location() nounwind readnone, !dbg !1069
  store i32 25, i32* %78, align 4, !dbg !1069
  ret i32 -1, !dbg !1020

bb25:                                             ; preds = %bb9
  call void @klee_warning_once(i8* getelementptr inbounds ([46 x i8]* @.str12, i64 0, i64 0)) nounwind, !dbg !1070
  %79 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1071
  %80 = load i32* %79, align 8, !dbg !1071
  %81 = and i32 %80, 61440, !dbg !1071
  %82 = icmp eq i32 %81, 8192, !dbg !1071
  %83 = call i32* @__errno_location() nounwind readnone, !dbg !1072
  br i1 %82, label %bb26, label %bb27, !dbg !1071

bb26:                                             ; preds = %bb25
  store i32 22, i32* %83, align 4, !dbg !1072
  ret i32 -1, !dbg !1020

bb27:                                             ; preds = %bb25
  store i32 25, i32* %83, align 4, !dbg !1073
  ret i32 -1, !dbg !1020

bb28:                                             ; preds = %bb9
  %84 = bitcast i8* %21 to i32*, !dbg !1074
  call void @llvm.dbg.value(metadata !{i32* %84}, i64 0, metadata !467), !dbg !1074
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str13, i64 0, i64 0)) nounwind, !dbg !1075
  %85 = getelementptr inbounds %struct.stat* %26, i64 0, i32 3, !dbg !1076
  %86 = load i32* %85, align 8, !dbg !1076
  %87 = and i32 %86, 61440, !dbg !1076
  %88 = icmp eq i32 %87, 8192, !dbg !1076
  br i1 %88, label %bb29, label %bb33, !dbg !1076

bb29:                                             ; preds = %bb28
  %89 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2
  %90 = load i64* %89, align 8, !dbg !1077
  %91 = load %struct.exe_disk_file_t** %22, align 8, !dbg !1077
  %92 = getelementptr inbounds %struct.exe_disk_file_t* %91, i64 0, i32 0, !dbg !1077
  %93 = load i32* %92, align 8, !dbg !1077
  %94 = zext i32 %93 to i64, !dbg !1077
  %95 = icmp slt i64 %90, %94, !dbg !1077
  br i1 %95, label %bb30, label %bb32, !dbg !1077

bb30:                                             ; preds = %bb29
  %96 = trunc i64 %90 to i32, !dbg !1078
  %97 = sub i32 %93, %96, !dbg !1078
  br label %bb32, !dbg !1078

bb32:                                             ; preds = %bb29, %bb30
  %storemerge = phi i32 [ %97, %bb30 ], [ 0, %bb29 ]
  store i32 %storemerge, i32* %84, align 4
  ret i32 0, !dbg !1020

bb33:                                             ; preds = %bb28
  %98 = call i32* @__errno_location() nounwind readnone, !dbg !1079
  store i32 25, i32* %98, align 4, !dbg !1079
  ret i32 -1, !dbg !1020

bb34:                                             ; preds = %bb9
  call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str14, i64 0, i64 0)) nounwind, !dbg !1080
  %99 = call i32* @__errno_location() nounwind readnone, !dbg !1081
  store i32 22, i32* %99, align 4, !dbg !1081
  ret i32 -1, !dbg !1020

bb35:                                             ; preds = %bb9
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str6, i64 0, i64 0)) nounwind, !dbg !1082
  %100 = call i32* @__errno_location() nounwind readnone, !dbg !1083
  store i32 22, i32* %100, align 4, !dbg !1083
  ret i32 -1, !dbg !1020

bb36:                                             ; preds = %bb6
  %101 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %102 = load i32* %101, align 8, !dbg !1084
  %103 = call i64 (i64, ...)* @syscall(i64 16, i32 %102, i64 %request, i8* %21) nounwind, !dbg !1084
  %104 = trunc i64 %103 to i32, !dbg !1084
  call void @llvm.dbg.value(metadata !{i32 %104}, i64 0, metadata !470), !dbg !1084
  %105 = icmp eq i32 %104, -1, !dbg !1085
  br i1 %105, label %bb37, label %bb39, !dbg !1085

bb37:                                             ; preds = %bb36
  %106 = call i32* @__errno_location() nounwind readnone, !dbg !1086
  %107 = call i32 @klee_get_errno() nounwind, !dbg !1086
  store i32 %107, i32* %106, align 4, !dbg !1086
  ret i32 %104, !dbg !1020

bb39:                                             ; preds = %bb36, %bb22, %bb19, %bb16, %bb13
  %.0 = phi i32 [ 0, %bb13 ], [ 0, %bb16 ], [ 0, %bb19 ], [ 0, %bb22 ], [ %104, %bb36 ]
  ret i32 %.0, !dbg !1020
}

declare void @klee_warning_once(i8*)

define i32 @__fd_getdents(i32 %fd, %struct.dirent64* %dirp, i32 %count) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !472), !dbg !1087
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %dirp}, i64 0, metadata !473), !dbg !1087
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !474), !dbg !1087
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1088
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !1090

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1091
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !1091
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !1092
  %4 = and i32 %3, 1, !dbg !1092
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1092

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !475), !dbg !1089
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1093
  br i1 %6, label %bb, label %bb1, !dbg !1093

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !1094
  store i32 9, i32* %7, align 4, !dbg !1094
  ret i32 -1, !dbg !1095

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !1096
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !1096
  br i1 %10, label %bb3, label %bb2, !dbg !1096

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str6, i64 0, i64 0)) nounwind, !dbg !1097
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !1098
  store i32 22, i32* %11, align 4, !dbg !1098
  ret i32 -1, !dbg !1095

bb3:                                              ; preds = %bb1
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2
  %13 = load i64* %12, align 8, !dbg !1099
  %14 = icmp ult i64 %13, 4096
  br i1 %14, label %bb4, label %bb10, !dbg !1099

bb4:                                              ; preds = %bb3
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !480), !dbg !1100
  %15 = udiv i64 %13, 280, !dbg !1101
  %16 = trunc i64 %15 to i32, !dbg !1101
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !477), !dbg !1101
  %17 = and i64 %15, 4294967295
  %18 = mul i64 %17, 280, !dbg !1102
  %19 = icmp eq i64 %18, %13, !dbg !1102
  br i1 %19, label %bb5, label %bb6, !dbg !1102

bb5:                                              ; preds = %bb4
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1102
  %21 = icmp ult i32 %20, %16, !dbg !1102
  br i1 %21, label %bb6, label %bb8.preheader, !dbg !1102

bb8.preheader:                                    ; preds = %bb5
  %22 = icmp ugt i32 %20, %16, !dbg !1103
  br i1 %22, label %bb.nph26, label %bb9, !dbg !1103

bb6:                                              ; preds = %bb4, %bb5
  %23 = tail call i32* @__errno_location() nounwind readnone, !dbg !1104
  store i32 22, i32* %23, align 4, !dbg !1104
  ret i32 -1, !dbg !1095

bb.nph26:                                         ; preds = %bb8.preheader
  %tmp40 = add i64 %15, 65
  %tmp45 = add i64 %15, 1
  br label %bb7

bb7:                                              ; preds = %bb.nph26, %bb7
  %indvar = phi i64 [ 0, %bb.nph26 ], [ %tmp, %bb7 ]
  %bytes.024 = phi i32 [ 0, %bb.nph26 ], [ %38, %bb7 ]
  %scevgep29 = getelementptr inbounds %struct.dirent64* %dirp, i64 %indvar, i32 0
  %scevgep30 = getelementptr %struct.dirent64* %dirp, i64 %indvar, i32 2
  %scevgep31 = getelementptr %struct.dirent64* %dirp, i64 %indvar, i32 3
  %scevgep32 = getelementptr %struct.dirent64* %dirp, i64 %indvar, i32 1
  %tmp = add i64 %indvar, 1
  %scevgep34 = getelementptr %struct.dirent64* %dirp, i64 %indvar, i32 4, i64 0
  %scevgep35 = getelementptr %struct.dirent64* %dirp, i64 %indvar, i32 4, i64 1
  %tmp37 = add i64 %15, %indvar
  %tmp42 = add i64 %tmp40, %indvar
  %tmp43 = trunc i64 %tmp42 to i8
  %tmp47 = add i64 %tmp45, %indvar
  %24 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1105
  %25 = and i64 %tmp37, 4294967295
  %26 = getelementptr inbounds %struct.exe_disk_file_t* %24, i64 %25, i32 2, !dbg !1106
  %27 = load %struct.stat** %26, align 8, !dbg !1106
  %28 = getelementptr inbounds %struct.stat* %27, i64 0, i32 1, !dbg !1106
  %29 = load i64* %28, align 8, !dbg !1106
  store i64 %29, i64* %scevgep29, align 8, !dbg !1106
  store i16 280, i16* %scevgep30, align 8, !dbg !1107
  %30 = load %struct.stat** %26, align 8, !dbg !1108
  %31 = getelementptr inbounds %struct.stat* %30, i64 0, i32 3, !dbg !1108
  %32 = load i32* %31, align 8, !dbg !1108
  %33 = lshr i32 %32, 12
  %34 = and i32 %33, 15
  %35 = trunc i32 %34 to i8, !dbg !1108
  store i8 %35, i8* %scevgep31, align 2, !dbg !1108
  store i8 %tmp43, i8* %scevgep34, align 1, !dbg !1109
  store i8 0, i8* %scevgep35, align 1, !dbg !1110
  %36 = and i64 %tmp47, 4294967295
  %37 = mul i64 %36, 280, !dbg !1111
  store i64 %37, i64* %scevgep32, align 8, !dbg !1111
  %38 = add i32 %bytes.024, 280, !dbg !1112
  %tmp48 = trunc i64 %tmp47 to i32
  %39 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1103
  %40 = icmp ugt i32 %39, %tmp48, !dbg !1103
  br i1 %40, label %bb7, label %bb8.bb9_crit_edge, !dbg !1103

bb8.bb9_crit_edge:                                ; preds = %bb7
  %scevgep33 = getelementptr %struct.dirent64* %dirp, i64 %tmp
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !481), !dbg !1105
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !480), !dbg !1112
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !473), !dbg !1113
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !477), !dbg !1103
  br label %bb9

bb9:                                              ; preds = %bb8.bb9_crit_edge, %bb8.preheader
  %dirp_addr.0.lcssa = phi %struct.dirent64* [ %scevgep33, %bb8.bb9_crit_edge ], [ %dirp, %bb8.preheader ]
  %bytes.0.lcssa = phi i32 [ %38, %bb8.bb9_crit_edge ], [ 0, %bb8.preheader ]
  %41 = icmp ugt i32 %count, 4096
  %min = select i1 %41, i32 4096, i32 %count, !dbg !1114
  tail call void @llvm.dbg.value(metadata !{i32 %min}, i64 0, metadata !479), !dbg !1114
  %42 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i64 0, i32 0, !dbg !1115
  store i64 0, i64* %42, align 8, !dbg !1115
  %43 = trunc i32 %min to i16, !dbg !1116
  %44 = trunc i32 %bytes.0.lcssa to i16, !dbg !1116
  %45 = sub i16 %43, %44, !dbg !1116
  %46 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i64 0, i32 2, !dbg !1116
  store i16 %45, i16* %46, align 8, !dbg !1116
  %47 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i64 0, i32 3, !dbg !1117
  store i8 0, i8* %47, align 2, !dbg !1117
  %48 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i64 0, i32 4, i64 0
  store i8 0, i8* %48, align 1, !dbg !1118
  %49 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i64 0, i32 1, !dbg !1119
  store i64 4096, i64* %49, align 8, !dbg !1119
  %50 = zext i16 %45 to i32, !dbg !1120
  %51 = add i32 %50, %bytes.0.lcssa, !dbg !1120
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !480), !dbg !1120
  %52 = zext i32 %min to i64, !dbg !1121
  store i64 %52, i64* %12, align 8, !dbg !1121
  ret i32 %51, !dbg !1095

bb10:                                             ; preds = %bb3
  %53 = trunc i64 %13 to i32, !dbg !1122
  %54 = add i32 %53, -4096
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !483), !dbg !1122
  %55 = zext i32 %count to i64, !dbg !1123
  %56 = bitcast %struct.dirent64* %dirp to i8*, !dbg !1123
  tail call void @llvm.memset.p0i8.i64(i8* %56, i8 0, i64 %55, i32 8, i1 false), !dbg !1123
  %57 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %58 = load i32* %57, align 8, !dbg !1124
  %59 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %58, i32 %54, i32 0) nounwind, !dbg !1124
  %60 = trunc i64 %59 to i32, !dbg !1124
  tail call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !486), !dbg !1124
  %61 = icmp eq i32 %60, -1, !dbg !1125
  br i1 %61, label %bb11, label %bb12, !dbg !1125

bb11:                                             ; preds = %bb10
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i64 0, i64 0), i32 735, i8* getelementptr inbounds ([14 x i8]* @__PRETTY_FUNCTION__.5153, i64 0, i64 0)) noreturn nounwind, !dbg !1125
  unreachable, !dbg !1125

bb12:                                             ; preds = %bb10
  %62 = load i32* %57, align 8, !dbg !1126
  %63 = tail call i64 (i64, ...)* @syscall(i64 217, i32 %62, %struct.dirent64* %dirp, i32 %count) nounwind, !dbg !1126
  %64 = trunc i64 %63 to i32, !dbg !1126
  tail call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !485), !dbg !1126
  %65 = icmp eq i32 %64, -1, !dbg !1127
  br i1 %65, label %bb13, label %bb14, !dbg !1127

bb13:                                             ; preds = %bb12
  %66 = tail call i32* @__errno_location() nounwind readnone, !dbg !1128
  %67 = tail call i32 @klee_get_errno() nounwind, !dbg !1128
  store i32 %67, i32* %66, align 4, !dbg !1128
  ret i32 %64, !dbg !1095

bb14:                                             ; preds = %bb12
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !487), !dbg !1129
  %68 = load i32* %57, align 8, !dbg !1130
  %69 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %68, i32 0, i32 1) nounwind, !dbg !1130
  %70 = add nsw i64 %69, 4096, !dbg !1130
  store i64 %70, i64* %12, align 8, !dbg !1130
  %71 = icmp sgt i32 %64, 0, !dbg !1131
  br i1 %71, label %bb15, label %bb18, !dbg !1131

bb15:                                             ; preds = %bb14, %bb15
  %pos.022 = phi i32 [ %81, %bb15 ], [ 0, %bb14 ]
  %72 = sext i32 %pos.022 to i64, !dbg !1132
  %.sum = add i64 %72, 8
  %73 = getelementptr inbounds i8* %56, i64 %.sum
  %74 = bitcast i8* %73 to i64*
  %75 = load i64* %74, align 8, !dbg !1133
  %76 = add nsw i64 %75, 4096, !dbg !1133
  store i64 %76, i64* %74, align 8, !dbg !1133
  %.sum21 = add i64 %72, 16
  %77 = getelementptr inbounds i8* %56, i64 %.sum21
  %78 = bitcast i8* %77 to i16*
  %79 = load i16* %78, align 8, !dbg !1134
  %80 = zext i16 %79 to i32, !dbg !1134
  %81 = add nsw i32 %80, %pos.022, !dbg !1134
  %82 = icmp slt i32 %81, %64, !dbg !1131
  br i1 %82, label %bb15, label %bb18, !dbg !1131

bb18:                                             ; preds = %bb15, %bb14
  ret i32 %64, !dbg !1095
}

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

define i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !491), !dbg !1135
  tail call void @llvm.dbg.value(metadata !{i64 %offset}, i64 0, metadata !492), !dbg !1135
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !493), !dbg !1135
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1136
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !1138

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1139
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !1139
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !1140
  %4 = and i32 %3, 1, !dbg !1140
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1140

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !496), !dbg !1137
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1141
  br i1 %6, label %bb, label %bb1, !dbg !1141

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !1142
  store i32 9, i32* %7, align 4, !dbg !1142
  ret i64 -1, !dbg !1143

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !1144
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !1144
  br i1 %10, label %bb2, label %bb11, !dbg !1144

bb2:                                              ; preds = %bb1
  %11 = icmp eq i32 %whence, 0, !dbg !1145
  br i1 %11, label %bb3, label %bb4, !dbg !1145

bb3:                                              ; preds = %bb2
  %12 = trunc i64 %offset to i32, !dbg !1146
  %13 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %14 = load i32* %13, align 8, !dbg !1146
  %15 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %14, i32 %12, i32 0) nounwind, !dbg !1146
  tail call void @llvm.dbg.value(metadata !{i64 %15}, i64 0, metadata !494), !dbg !1146
  br label %bb8, !dbg !1146

bb4:                                              ; preds = %bb2
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2
  %17 = load i64* %16, align 8, !dbg !1147
  %18 = trunc i64 %17 to i32, !dbg !1147
  %19 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %20 = load i32* %19, align 8, !dbg !1147
  %21 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %20, i32 %18, i32 0) nounwind, !dbg !1147
  tail call void @llvm.dbg.value(metadata !{i64 %21}, i64 0, metadata !494), !dbg !1147
  %22 = icmp eq i64 %21, -1, !dbg !1148
  br i1 %22, label %bb9, label %bb5, !dbg !1148

bb5:                                              ; preds = %bb4
  %23 = load i64* %16, align 8, !dbg !1149
  %24 = icmp eq i64 %23, %21, !dbg !1149
  br i1 %24, label %bb7, label %bb6, !dbg !1149

bb6:                                              ; preds = %bb5
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i64 0, i64 0), i32 397, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.4897, i64 0, i64 0)) noreturn nounwind, !dbg !1149
  unreachable, !dbg !1149

bb7:                                              ; preds = %bb5
  %25 = trunc i64 %offset to i32, !dbg !1150
  %26 = load i32* %19, align 8, !dbg !1150
  %27 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %26, i32 %25, i32 %whence) nounwind, !dbg !1150
  tail call void @llvm.dbg.value(metadata !{i64 %27}, i64 0, metadata !494), !dbg !1150
  br label %bb8, !dbg !1150

bb8:                                              ; preds = %bb7, %bb3
  %new_off.0 = phi i64 [ %15, %bb3 ], [ %27, %bb7 ]
  %28 = icmp eq i64 %new_off.0, -1, !dbg !1151
  br i1 %28, label %bb9, label %bb10, !dbg !1151

bb9:                                              ; preds = %bb4, %bb8
  %29 = tail call i32* @__errno_location() nounwind readnone, !dbg !1152
  %30 = tail call i32 @klee_get_errno() nounwind, !dbg !1152
  store i32 %30, i32* %29, align 4, !dbg !1152
  ret i64 -1, !dbg !1143

bb10:                                             ; preds = %bb8
  %31 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2
  store i64 %new_off.0, i64* %31, align 8, !dbg !1153
  ret i64 %new_off.0, !dbg !1143

bb11:                                             ; preds = %bb1
  switch i32 %whence, label %bb15 [
    i32 0, label %bb16
    i32 1, label %bb13
    i32 2, label %bb14
  ], !dbg !1154

bb13:                                             ; preds = %bb11
  %32 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2
  %33 = load i64* %32, align 8, !dbg !1155
  %34 = add nsw i64 %33, %offset, !dbg !1155
  tail call void @llvm.dbg.value(metadata !{i64 %34}, i64 0, metadata !494), !dbg !1155
  br label %bb16, !dbg !1155

bb14:                                             ; preds = %bb11
  %35 = getelementptr inbounds %struct.exe_disk_file_t* %9, i64 0, i32 0, !dbg !1156
  %36 = load i32* %35, align 8, !dbg !1156
  %37 = zext i32 %36 to i64, !dbg !1156
  %38 = add nsw i64 %37, %offset, !dbg !1156
  tail call void @llvm.dbg.value(metadata !{i64 %38}, i64 0, metadata !494), !dbg !1156
  br label %bb16, !dbg !1156

bb15:                                             ; preds = %bb11
  %39 = tail call i32* @__errno_location() nounwind readnone, !dbg !1157
  store i32 22, i32* %39, align 4, !dbg !1157
  ret i64 -1, !dbg !1143

bb16:                                             ; preds = %bb11, %bb14, %bb13
  %new_off.1 = phi i64 [ %38, %bb14 ], [ %34, %bb13 ], [ %offset, %bb11 ]
  %40 = icmp slt i64 %new_off.1, 0, !dbg !1158
  br i1 %40, label %bb17, label %bb18, !dbg !1158

bb17:                                             ; preds = %bb16
  %41 = tail call i32* @__errno_location() nounwind readnone, !dbg !1159
  store i32 22, i32* %41, align 4, !dbg !1159
  ret i64 -1, !dbg !1143

bb18:                                             ; preds = %bb16
  %42 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 2
  store i64 %new_off.1, i64* %42, align 8, !dbg !1160
  ret i64 %new_off.1, !dbg !1143
}

define i32 @__fd_fstat(i32 %fd, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !497), !dbg !1161
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !498), !dbg !1161
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1162
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !1164

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1165
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !1165
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !1166
  %4 = and i32 %3, 1, !dbg !1166
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1166

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !499), !dbg !1163
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1167
  br i1 %6, label %bb, label %bb1, !dbg !1167

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !1168
  store i32 9, i32* %7, align 4, !dbg !1168
  ret i32 -1, !dbg !1169

bb1:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %9 = load %struct.exe_disk_file_t** %8, align 8, !dbg !1170
  %10 = icmp eq %struct.exe_disk_file_t* %9, null, !dbg !1170
  br i1 %10, label %bb2, label %bb5, !dbg !1170

bb2:                                              ; preds = %bb1
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %12 = load i32* %11, align 8, !dbg !1171
  %13 = tail call i64 (i64, ...)* @syscall(i64 5, i32 %12, %struct.stat* %buf) nounwind, !dbg !1171
  %14 = trunc i64 %13 to i32, !dbg !1171
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !501), !dbg !1171
  %15 = icmp eq i32 %14, -1, !dbg !1172
  br i1 %15, label %bb3, label %bb6, !dbg !1172

bb3:                                              ; preds = %bb2
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !1173
  %17 = tail call i32 @klee_get_errno() nounwind, !dbg !1173
  store i32 %17, i32* %16, align 4, !dbg !1173
  ret i32 %14, !dbg !1169

bb5:                                              ; preds = %bb1
  %18 = getelementptr inbounds %struct.exe_disk_file_t* %9, i64 0, i32 2, !dbg !1174
  %19 = load %struct.stat** %18, align 8, !dbg !1174
  %20 = bitcast %struct.stat* %buf to i8*, !dbg !1174
  %21 = bitcast %struct.stat* %19 to i8*, !dbg !1174
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %21, i64 144, i32 8, i1 false), !dbg !1174
  ret i32 0, !dbg !1169

bb6:                                              ; preds = %bb2
  ret i32 %14, !dbg !1169
}

define i32 @__fd_lstat(i8* %path, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !503), !dbg !1175
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !504), !dbg !1175
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !1176
  %0 = load i8* %path, align 1, !dbg !1178
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !1178
  %1 = icmp eq i8 %0, 0, !dbg !1179
  br i1 %1, label %bb1, label %bb.i, !dbg !1179

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !1179
  %3 = load i8* %2, align 1, !dbg !1179
  %4 = icmp eq i8 %3, 0, !dbg !1179
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !1179

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1180
  %6 = sext i8 %0 to i32, !dbg !1181
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !1181
  %9 = icmp eq i32 %6, %8, !dbg !1181
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !1181

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1182
  %11 = zext i32 %18 to i64, !dbg !1182
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !1182
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !1183
  %13 = load %struct.stat** %12, align 8, !dbg !1183
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !1183
  %15 = load i64* %14, align 8, !dbg !1183
  %16 = icmp eq i64 %15, 0, !dbg !1183
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !1183

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !1180
  br label %bb8.i, !dbg !1180

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !1180
  br i1 %19, label %bb3.i, label %bb1, !dbg !1180

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !1182
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !505), !dbg !1177
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !1184
  br i1 %21, label %bb1, label %bb, !dbg !1184

bb:                                               ; preds = %__get_sym_file.exit
  %22 = bitcast %struct.stat* %buf to i8*, !dbg !1185
  %23 = bitcast %struct.stat* %13 to i8*, !dbg !1185
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %23, i64 144, i32 8, i1 false), !dbg !1185
  ret i32 0, !dbg !1186

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !1187
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !1189
  %24 = ptrtoint i8* %path to i64, !dbg !1191
  %25 = tail call i64 @klee_get_valuel(i64 %24) nounwind, !dbg !1191
  %26 = inttoptr i64 %25 to i8*, !dbg !1191
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !302) nounwind, !dbg !1191
  %27 = icmp eq i8* %26, %path, !dbg !1192
  %28 = zext i1 %27 to i64, !dbg !1192
  tail call void @klee_assume(i64 %28) nounwind, !dbg !1192
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !312) nounwind, !dbg !1190
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !314) nounwind, !dbg !1193
  br label %bb.i6, !dbg !1193

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %26, %bb1 ], [ %sc.0.i, %bb6.i8 ]
  %29 = phi i32 [ 0, %bb1 ], [ %41, %bb6.i8 ]
  %tmp.i = add i32 %29, -1
  %30 = load i8* %sc.1.i, align 1, !dbg !1194
  %31 = and i32 %tmp.i, %29, !dbg !1195
  %32 = icmp eq i32 %31, 0, !dbg !1195
  br i1 %32, label %bb1.i, label %bb5.i, !dbg !1195

bb1.i:                                            ; preds = %bb.i6
  switch i8 %30, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %30}, i64 0, metadata !315) nounwind, !dbg !1194
  store i8 0, i8* %sc.1.i, align 1, !dbg !1196
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !1196
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !1197
  %33 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !1197
  br label %bb6.i8, !dbg !1197

bb5.i:                                            ; preds = %bb.i6
  %34 = sext i8 %30 to i64, !dbg !1198
  %35 = tail call i64 @klee_get_valuel(i64 %34) nounwind, !dbg !1198
  %36 = trunc i64 %35 to i8, !dbg !1198
  %37 = icmp eq i8 %36, %30, !dbg !1199
  %38 = zext i1 %37 to i64, !dbg !1199
  tail call void @klee_assume(i64 %38) nounwind, !dbg !1199
  store i8 %36, i8* %sc.1.i, align 1, !dbg !1200
  %39 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !1200
  %40 = icmp eq i8 %36, 0, !dbg !1201
  br i1 %40, label %__concretize_string.exit, label %bb6.i8, !dbg !1201

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %33, %bb4.i7 ], [ %39, %bb5.i ], [ %sc.1.i, %bb1.i ]
  %41 = add i32 %29, 1, !dbg !1193
  br label %bb.i6, !dbg !1193

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %42 = tail call i64 (i64, ...)* @syscall(i64 6, i8* %path, %struct.stat* %buf) nounwind, !dbg !1188
  %43 = trunc i64 %42 to i32, !dbg !1188
  tail call void @llvm.dbg.value(metadata !{i32 %43}, i64 0, metadata !507), !dbg !1188
  %44 = icmp eq i32 %43, -1, !dbg !1202
  br i1 %44, label %bb2, label %bb4, !dbg !1202

bb2:                                              ; preds = %__concretize_string.exit
  %45 = tail call i32* @__errno_location() nounwind readnone, !dbg !1203
  %46 = tail call i32 @klee_get_errno() nounwind, !dbg !1203
  store i32 %46, i32* %45, align 4, !dbg !1203
  ret i32 %43, !dbg !1186

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %43, !dbg !1186
}

define i32 @__fd_stat(i8* %path, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !509), !dbg !1204
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !510), !dbg !1204
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !1205
  %0 = load i8* %path, align 1, !dbg !1207
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !1207
  %1 = icmp eq i8 %0, 0, !dbg !1208
  br i1 %1, label %bb1, label %bb.i, !dbg !1208

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !1208
  %3 = load i8* %2, align 1, !dbg !1208
  %4 = icmp eq i8 %3, 0, !dbg !1208
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !1208

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1209
  %6 = sext i8 %0 to i32, !dbg !1210
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !1210
  %9 = icmp eq i32 %6, %8, !dbg !1210
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !1210

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1211
  %11 = zext i32 %18 to i64, !dbg !1211
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !1211
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !1212
  %13 = load %struct.stat** %12, align 8, !dbg !1212
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !1212
  %15 = load i64* %14, align 8, !dbg !1212
  %16 = icmp eq i64 %15, 0, !dbg !1212
  br i1 %16, label %bb1, label %__get_sym_file.exit, !dbg !1212

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !1209
  br label %bb8.i, !dbg !1209

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !1209
  br i1 %19, label %bb3.i, label %bb1, !dbg !1209

__get_sym_file.exit:                              ; preds = %bb4.i
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !1211
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %20}, i64 0, metadata !511), !dbg !1206
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !1213
  br i1 %21, label %bb1, label %bb, !dbg !1213

bb:                                               ; preds = %__get_sym_file.exit
  %22 = bitcast %struct.stat* %buf to i8*, !dbg !1214
  %23 = bitcast %struct.stat* %13 to i8*, !dbg !1214
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %23, i64 144, i32 8, i1 false), !dbg !1214
  ret i32 0, !dbg !1215

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !1216
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !1218
  %24 = ptrtoint i8* %path to i64, !dbg !1220
  %25 = tail call i64 @klee_get_valuel(i64 %24) nounwind, !dbg !1220
  %26 = inttoptr i64 %25 to i8*, !dbg !1220
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !302) nounwind, !dbg !1220
  %27 = icmp eq i8* %26, %path, !dbg !1221
  %28 = zext i1 %27 to i64, !dbg !1221
  tail call void @klee_assume(i64 %28) nounwind, !dbg !1221
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !312) nounwind, !dbg !1219
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !314) nounwind, !dbg !1222
  br label %bb.i6, !dbg !1222

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %26, %bb1 ], [ %sc.0.i, %bb6.i8 ]
  %29 = phi i32 [ 0, %bb1 ], [ %41, %bb6.i8 ]
  %tmp.i = add i32 %29, -1
  %30 = load i8* %sc.1.i, align 1, !dbg !1223
  %31 = and i32 %tmp.i, %29, !dbg !1224
  %32 = icmp eq i32 %31, 0, !dbg !1224
  br i1 %32, label %bb1.i, label %bb5.i, !dbg !1224

bb1.i:                                            ; preds = %bb.i6
  switch i8 %30, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %30}, i64 0, metadata !315) nounwind, !dbg !1223
  store i8 0, i8* %sc.1.i, align 1, !dbg !1225
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !1225
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !1226
  %33 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !1226
  br label %bb6.i8, !dbg !1226

bb5.i:                                            ; preds = %bb.i6
  %34 = sext i8 %30 to i64, !dbg !1227
  %35 = tail call i64 @klee_get_valuel(i64 %34) nounwind, !dbg !1227
  %36 = trunc i64 %35 to i8, !dbg !1227
  %37 = icmp eq i8 %36, %30, !dbg !1228
  %38 = zext i1 %37 to i64, !dbg !1228
  tail call void @klee_assume(i64 %38) nounwind, !dbg !1228
  store i8 %36, i8* %sc.1.i, align 1, !dbg !1229
  %39 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !1229
  %40 = icmp eq i8 %36, 0, !dbg !1230
  br i1 %40, label %__concretize_string.exit, label %bb6.i8, !dbg !1230

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %33, %bb4.i7 ], [ %39, %bb5.i ], [ %sc.1.i, %bb1.i ]
  %41 = add i32 %29, 1, !dbg !1222
  br label %bb.i6, !dbg !1222

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %42 = tail call i64 (i64, ...)* @syscall(i64 4, i8* %path, %struct.stat* %buf) nounwind, !dbg !1217
  %43 = trunc i64 %42 to i32, !dbg !1217
  tail call void @llvm.dbg.value(metadata !{i32 %43}, i64 0, metadata !513), !dbg !1217
  %44 = icmp eq i32 %43, -1, !dbg !1231
  br i1 %44, label %bb2, label %bb4, !dbg !1231

bb2:                                              ; preds = %__concretize_string.exit
  %45 = tail call i32* @__errno_location() nounwind readnone, !dbg !1232
  %46 = tail call i32 @klee_get_errno() nounwind, !dbg !1232
  store i32 %46, i32* %45, align 4, !dbg !1232
  ret i32 %43, !dbg !1215

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %43, !dbg !1215
}

define i64 @read(i32 %fd, i8* %buf, i64 %count) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !515), !dbg !1233
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !516), !dbg !1233
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !517), !dbg !1233
  %0 = load i32* @n_calls.4763, align 4, !dbg !1234
  %1 = add nsw i32 %0, 1, !dbg !1234
  store i32 %1, i32* @n_calls.4763, align 4, !dbg !1234
  %2 = icmp eq i64 %count, 0, !dbg !1235
  br i1 %2, label %bb24, label %bb1, !dbg !1235

bb1:                                              ; preds = %entry
  %3 = icmp eq i8* %buf, null, !dbg !1236
  br i1 %3, label %bb2, label %bb3, !dbg !1236

bb2:                                              ; preds = %bb1
  %4 = tail call i32* @__errno_location() nounwind readnone, !dbg !1237
  store i32 14, i32* %4, align 4, !dbg !1237
  ret i64 -1, !dbg !1238

bb3:                                              ; preds = %bb1
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1239
  %5 = icmp ult i32 %fd, 32
  br i1 %5, label %bb.i, label %bb4, !dbg !1241

bb.i:                                             ; preds = %bb3
  %6 = sext i32 %fd to i64, !dbg !1242
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !1242
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 1
  %8 = load i32* %7, align 4, !dbg !1243
  %9 = and i32 %8, 1, !dbg !1243
  %toBool.i = icmp eq i32 %9, 0
  br i1 %toBool.i, label %bb4, label %__get_file.exit, !dbg !1243

__get_file.exit:                                  ; preds = %bb.i
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !518), !dbg !1240
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !1244
  br i1 %11, label %bb4, label %bb5, !dbg !1244

bb4:                                              ; preds = %bb3, %bb.i, %__get_file.exit
  %12 = tail call i32* @__errno_location() nounwind readnone, !dbg !1245
  store i32 9, i32* %12, align 4, !dbg !1245
  ret i64 -1, !dbg !1238

bb5:                                              ; preds = %__get_file.exit
  %13 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1246
  %14 = icmp eq i32 %13, 0, !dbg !1246
  br i1 %14, label %bb8, label %bb6, !dbg !1246

bb6:                                              ; preds = %bb5
  %15 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 6), align 8, !dbg !1246
  %16 = load i32* %15, align 4, !dbg !1246
  %17 = icmp eq i32 %16, %1, !dbg !1246
  br i1 %17, label %bb7, label %bb8, !dbg !1246

bb7:                                              ; preds = %bb6
  %18 = add i32 %13, -1
  store i32 %18, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1247
  %19 = tail call i32* @__errno_location() nounwind readnone, !dbg !1248
  store i32 5, i32* %19, align 4, !dbg !1248
  ret i64 -1, !dbg !1238

bb8:                                              ; preds = %bb5, %bb6
  %20 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 3
  %21 = load %struct.exe_disk_file_t** %20, align 8, !dbg !1249
  %22 = icmp eq %struct.exe_disk_file_t* %21, null, !dbg !1249
  br i1 %22, label %bb9, label %bb17, !dbg !1249

bb9:                                              ; preds = %bb8
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !301) nounwind, !dbg !1250
  %23 = ptrtoint i8* %buf to i64, !dbg !1252
  %24 = tail call i64 @klee_get_valuel(i64 %23) nounwind, !dbg !1252
  %25 = inttoptr i64 %24 to i8*, !dbg !1252
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !302) nounwind, !dbg !1252
  %26 = icmp eq i8* %25, %buf, !dbg !1253
  %27 = zext i1 %26 to i64, !dbg !1253
  tail call void @klee_assume(i64 %27) nounwind, !dbg !1253
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !516), !dbg !1251
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !304) nounwind, !dbg !1254
  %28 = tail call i64 @klee_get_valuel(i64 %count) nounwind, !dbg !1256
  tail call void @llvm.dbg.value(metadata !{i64 %28}, i64 0, metadata !305) nounwind, !dbg !1256
  %29 = icmp eq i64 %28, %count, !dbg !1257
  %30 = zext i1 %29 to i64, !dbg !1257
  tail call void @klee_assume(i64 %30) nounwind, !dbg !1257
  tail call void @llvm.dbg.value(metadata !{i64 %28}, i64 0, metadata !517), !dbg !1255
  tail call void @klee_check_memory_access(i8* %25, i64 %28) nounwind, !dbg !1258
  %31 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 0
  %32 = load i32* %31, align 8, !dbg !1259
  %33 = icmp eq i32 %32, 0, !dbg !1259
  br i1 %33, label %bb10, label %bb11, !dbg !1259

bb10:                                             ; preds = %bb9
  %34 = tail call i64 (i64, ...)* @syscall(i64 0, i32 %32, i8* %25, i64 %28) nounwind, !dbg !1260
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !520), !dbg !1260
  br label %bb12, !dbg !1260

bb11:                                             ; preds = %bb9
  %35 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 2
  %36 = load i64* %35, align 8, !dbg !1261
  %37 = tail call i64 (i64, ...)* @syscall(i64 17, i32 %32, i8* %25, i64 %28, i64 %36) nounwind, !dbg !1261
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !520), !dbg !1261
  br label %bb12, !dbg !1261

bb12:                                             ; preds = %bb11, %bb10
  %r.0.in = phi i64 [ %34, %bb10 ], [ %37, %bb11 ]
  %r.0 = trunc i64 %r.0.in to i32
  %38 = icmp eq i32 %r.0, -1, !dbg !1262
  br i1 %38, label %bb13, label %bb14, !dbg !1262

bb13:                                             ; preds = %bb12
  %39 = tail call i32* @__errno_location() nounwind readnone, !dbg !1263
  %40 = tail call i32 @klee_get_errno() nounwind, !dbg !1263
  store i32 %40, i32* %39, align 4, !dbg !1263
  ret i64 -1, !dbg !1238

bb14:                                             ; preds = %bb12
  %41 = load i32* %31, align 8, !dbg !1264
  %42 = icmp eq i32 %41, 0, !dbg !1264
  br i1 %42, label %bb16, label %bb15, !dbg !1264

bb15:                                             ; preds = %bb14
  %43 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 2
  %44 = load i64* %43, align 8, !dbg !1265
  %45 = sext i32 %r.0 to i64, !dbg !1265
  %46 = add nsw i64 %44, %45, !dbg !1265
  store i64 %46, i64* %43, align 8, !dbg !1265
  br label %bb16, !dbg !1265

bb16:                                             ; preds = %bb14, %bb15
  %47 = sext i32 %r.0 to i64, !dbg !1266
  ret i64 %47, !dbg !1238

bb17:                                             ; preds = %bb8
  %48 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %6, i32 2
  %49 = load i64* %48, align 8, !dbg !1267
  %50 = icmp slt i64 %49, 0, !dbg !1267
  br i1 %50, label %bb18, label %bb19, !dbg !1267

bb18:                                             ; preds = %bb17
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str18, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i64 0, i64 0), i32 284, i8* getelementptr inbounds ([5 x i8]* @__PRETTY_FUNCTION__.4766, i64 0, i64 0)) noreturn nounwind, !dbg !1267
  unreachable, !dbg !1267

bb19:                                             ; preds = %bb17
  %51 = getelementptr inbounds %struct.exe_disk_file_t* %21, i64 0, i32 0, !dbg !1268
  %52 = load i32* %51, align 8, !dbg !1268
  %53 = zext i32 %52 to i64, !dbg !1268
  %54 = icmp slt i64 %53, %49, !dbg !1268
  br i1 %54, label %bb24, label %bb21, !dbg !1268

bb21:                                             ; preds = %bb19
  %55 = add i64 %49, %count, !dbg !1269
  %56 = sub nsw i64 %53, %49, !dbg !1270
  %57 = icmp ugt i64 %55, %53, !dbg !1269
  %.count = select i1 %57, i64 %56, i64 %count
  tail call void @llvm.dbg.value(metadata !{i64 %56}, i64 0, metadata !517), !dbg !1270
  %count_addr.0 = select i1 %57, i64 %.count, i64 %.count
  %58 = getelementptr inbounds %struct.exe_disk_file_t* %21, i64 0, i32 1, !dbg !1271
  %59 = load i8** %58, align 8, !dbg !1271
  %60 = getelementptr inbounds i8* %59, i64 %49, !dbg !1271
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %buf, i8* %60, i64 %.count, i32 1, i1 false), !dbg !1271
  %61 = load i64* %48, align 8, !dbg !1272
  %62 = add i64 %61, %.count, !dbg !1272
  store i64 %62, i64* %48, align 8, !dbg !1272
  ret i64 %.count, !dbg !1238

bb24:                                             ; preds = %bb19, %entry
  ret i64 0, !dbg !1238
}

declare i32 @geteuid() nounwind

declare i32 @getgid() nounwind

define i32 @fchmod(i32 %fd, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !524), !dbg !1273
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !525), !dbg !1273
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1274
  %0 = icmp ult i32 %fd, 32
  br i1 %0, label %bb.i, label %bb, !dbg !1276

bb.i:                                             ; preds = %entry
  %1 = sext i32 %fd to i64, !dbg !1277
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !1277
  %2 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 1
  %3 = load i32* %2, align 4, !dbg !1278
  %4 = and i32 %3, 1, !dbg !1278
  %toBool.i = icmp eq i32 %4, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1278

__get_file.exit:                                  ; preds = %bb.i
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %5}, i64 0, metadata !526), !dbg !1275
  %6 = icmp eq %struct.exe_file_t* %5, null, !dbg !1279
  br i1 %6, label %bb, label %bb1, !dbg !1279

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !1280
  store i32 9, i32* %7, align 4, !dbg !1280
  ret i32 -1, !dbg !1281

bb1:                                              ; preds = %__get_file.exit
  %8 = load i32* @n_calls.5023, align 4, !dbg !1282
  %9 = add nsw i32 %8, 1, !dbg !1282
  store i32 %9, i32* @n_calls.5023, align 4, !dbg !1282
  %10 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1283
  %11 = icmp eq i32 %10, 0, !dbg !1283
  br i1 %11, label %bb4, label %bb2, !dbg !1283

bb2:                                              ; preds = %bb1
  %12 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 12), align 8, !dbg !1283
  %13 = load i32* %12, align 4, !dbg !1283
  %14 = icmp eq i32 %13, %9, !dbg !1283
  br i1 %14, label %bb3, label %bb4, !dbg !1283

bb3:                                              ; preds = %bb2
  %15 = add i32 %10, -1
  store i32 %15, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1284
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !1285
  store i32 5, i32* %16, align 4, !dbg !1285
  ret i32 -1, !dbg !1281

bb4:                                              ; preds = %bb1, %bb2
  %17 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 3
  %18 = load %struct.exe_disk_file_t** %17, align 8, !dbg !1286
  %19 = icmp eq %struct.exe_disk_file_t* %18, null, !dbg !1286
  br i1 %19, label %bb6, label %bb5, !dbg !1286

bb5:                                              ; preds = %bb4
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %18}, i64 0, metadata !522) nounwind, !dbg !1287
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !523) nounwind, !dbg !1287
  %20 = tail call i32 @geteuid() nounwind, !dbg !1289
  %21 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 0, i32 2, !dbg !1289
  %22 = load %struct.stat** %21, align 8, !dbg !1289
  %23 = getelementptr inbounds %struct.stat* %22, i64 0, i32 4, !dbg !1289
  %24 = load i32* %23, align 4, !dbg !1289
  %25 = icmp eq i32 %20, %24, !dbg !1289
  br i1 %25, label %bb.i11, label %bb3.i12, !dbg !1289

bb.i11:                                           ; preds = %bb5
  %26 = tail call i32 @getgid() nounwind, !dbg !1291
  %27 = load %struct.stat** %21, align 8, !dbg !1291
  %28 = getelementptr inbounds %struct.stat* %27, i64 0, i32 5, !dbg !1291
  %29 = load i32* %28, align 8, !dbg !1291
  %30 = and i32 %mode, 3071, !dbg !1292
  %31 = icmp eq i32 %26, %29, !dbg !1291
  %mode..i = select i1 %31, i32 %mode, i32 %30
  tail call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !523) nounwind, !dbg !1292
  %32 = getelementptr inbounds %struct.stat* %27, i64 0, i32 3, !dbg !1293
  %33 = load i32* %32, align 8, !dbg !1293
  %34 = and i32 %33, -4096, !dbg !1293
  %35 = and i32 %mode..i, 4095, !dbg !1293
  %36 = or i32 %35, %34, !dbg !1293
  store i32 %36, i32* %32, align 8, !dbg !1293
  ret i32 0, !dbg !1281

bb3.i12:                                          ; preds = %bb5
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !1294
  store i32 1, i32* %37, align 4, !dbg !1294
  ret i32 -1, !dbg !1281

bb6:                                              ; preds = %bb4
  %38 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %1, i32 0
  %39 = load i32* %38, align 8, !dbg !1295
  %40 = tail call i64 (i64, ...)* @syscall(i64 91, i32 %39, i32 %mode) nounwind, !dbg !1295
  %41 = trunc i64 %40 to i32, !dbg !1295
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !528), !dbg !1295
  %42 = icmp eq i32 %41, -1, !dbg !1296
  br i1 %42, label %bb7, label %bb9, !dbg !1296

bb7:                                              ; preds = %bb6
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !1297
  %44 = tail call i32 @klee_get_errno() nounwind, !dbg !1297
  store i32 %44, i32* %43, align 4, !dbg !1297
  ret i32 %41, !dbg !1281

bb9:                                              ; preds = %bb6
  ret i32 %41, !dbg !1281
}

define i32 @chmod(i8* %path, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !530), !dbg !1298
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !531), !dbg !1298
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !1299
  %0 = load i8* %path, align 1, !dbg !1301
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !1301
  %1 = icmp eq i8 %0, 0, !dbg !1302
  br i1 %1, label %__get_sym_file.exit, label %bb.i, !dbg !1302

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i64 1, !dbg !1302
  %3 = load i8* %2, align 1, !dbg !1302
  %4 = icmp eq i8 %3, 0, !dbg !1302
  br i1 %4, label %bb8.preheader.i, label %__get_sym_file.exit, !dbg !1302

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1303
  %6 = sext i8 %0 to i32, !dbg !1304
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %19, 24
  %7 = ashr i32 %sext.i, 24
  %8 = add nsw i32 %7, 65, !dbg !1304
  %9 = icmp eq i32 %6, %8, !dbg !1304
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !1304

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1305
  %11 = zext i32 %19 to i64, !dbg !1305
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !1305
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, i32 2, !dbg !1306
  %13 = load %struct.stat** %12, align 8, !dbg !1306
  %14 = getelementptr inbounds %struct.stat* %13, i64 0, i32 1, !dbg !1306
  %15 = load i64* %14, align 8, !dbg !1306
  %16 = icmp eq i64 %15, 0, !dbg !1306
  br i1 %16, label %__get_sym_file.exit, label %bb6.i, !dbg !1306

bb6.i:                                            ; preds = %bb4.i
  %17 = getelementptr inbounds %struct.exe_disk_file_t* %10, i64 %11, !dbg !1305
  br label %__get_sym_file.exit

bb7.i:                                            ; preds = %bb3.i
  %18 = add i32 %19, 1, !dbg !1303
  br label %bb8.i, !dbg !1303

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %19 = phi i32 [ %18, %bb7.i ], [ 0, %bb8.preheader.i ]
  %20 = icmp ugt i32 %5, %19, !dbg !1303
  br i1 %20, label %bb3.i, label %__get_sym_file.exit, !dbg !1303

__get_sym_file.exit:                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %bb6.i
  %21 = phi %struct.exe_disk_file_t* [ %17, %bb6.i ], [ null, %bb4.i ], [ null, %bb.i ], [ null, %entry ], [ null, %bb8.i ]
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %21}, i64 0, metadata !532), !dbg !1300
  %22 = load i32* @n_calls.5000, align 4, !dbg !1307
  %23 = add nsw i32 %22, 1, !dbg !1307
  store i32 %23, i32* @n_calls.5000, align 4, !dbg !1307
  %24 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1308
  %25 = icmp eq i32 %24, 0, !dbg !1308
  br i1 %25, label %bb2, label %bb, !dbg !1308

bb:                                               ; preds = %__get_sym_file.exit
  %26 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 11), align 8, !dbg !1308
  %27 = load i32* %26, align 4, !dbg !1308
  %28 = icmp eq i32 %27, %23, !dbg !1308
  br i1 %28, label %bb1, label %bb2, !dbg !1308

bb1:                                              ; preds = %bb
  %29 = add i32 %24, -1
  store i32 %29, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1309
  %30 = tail call i32* @__errno_location() nounwind readnone, !dbg !1310
  store i32 5, i32* %30, align 4, !dbg !1310
  ret i32 -1, !dbg !1311

bb2:                                              ; preds = %__get_sym_file.exit, %bb
  %31 = icmp eq %struct.exe_disk_file_t* %21, null, !dbg !1312
  br i1 %31, label %bb4, label %bb3, !dbg !1312

bb3:                                              ; preds = %bb2
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %21}, i64 0, metadata !522) nounwind, !dbg !1313
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !523) nounwind, !dbg !1313
  %32 = tail call i32 @geteuid() nounwind, !dbg !1315
  %33 = getelementptr inbounds %struct.exe_disk_file_t* %21, i64 0, i32 2, !dbg !1315
  %34 = load %struct.stat** %33, align 8, !dbg !1315
  %35 = getelementptr inbounds %struct.stat* %34, i64 0, i32 4, !dbg !1315
  %36 = load i32* %35, align 4, !dbg !1315
  %37 = icmp eq i32 %32, %36, !dbg !1315
  br i1 %37, label %bb.i13, label %bb3.i14, !dbg !1315

bb.i13:                                           ; preds = %bb3
  %38 = tail call i32 @getgid() nounwind, !dbg !1316
  %39 = load %struct.stat** %33, align 8, !dbg !1316
  %40 = getelementptr inbounds %struct.stat* %39, i64 0, i32 5, !dbg !1316
  %41 = load i32* %40, align 8, !dbg !1316
  %42 = and i32 %mode, 3071, !dbg !1317
  %43 = icmp eq i32 %38, %41, !dbg !1316
  %mode..i = select i1 %43, i32 %mode, i32 %42
  tail call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !523) nounwind, !dbg !1317
  %44 = getelementptr inbounds %struct.stat* %39, i64 0, i32 3, !dbg !1318
  %45 = load i32* %44, align 8, !dbg !1318
  %46 = and i32 %45, -4096, !dbg !1318
  %47 = and i32 %mode..i, 4095, !dbg !1318
  %48 = or i32 %47, %46, !dbg !1318
  store i32 %48, i32* %44, align 8, !dbg !1318
  ret i32 0, !dbg !1311

bb3.i14:                                          ; preds = %bb3
  %49 = tail call i32* @__errno_location() nounwind readnone, !dbg !1319
  store i32 1, i32* %49, align 4, !dbg !1319
  ret i32 -1, !dbg !1311

bb4:                                              ; preds = %bb2
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !1320
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !1322
  %50 = ptrtoint i8* %path to i64, !dbg !1324
  %51 = tail call i64 @klee_get_valuel(i64 %50) nounwind, !dbg !1324
  %52 = inttoptr i64 %51 to i8*, !dbg !1324
  tail call void @llvm.dbg.value(metadata !{i8* %52}, i64 0, metadata !302) nounwind, !dbg !1324
  %53 = icmp eq i8* %52, %path, !dbg !1325
  %54 = zext i1 %53 to i64, !dbg !1325
  tail call void @klee_assume(i64 %54) nounwind, !dbg !1325
  tail call void @llvm.dbg.value(metadata !{i8* %52}, i64 0, metadata !312) nounwind, !dbg !1323
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !314) nounwind, !dbg !1326
  br label %bb.i9, !dbg !1326

bb.i9:                                            ; preds = %bb6.i11, %bb4
  %sc.1.i = phi i8* [ %52, %bb4 ], [ %sc.0.i, %bb6.i11 ]
  %55 = phi i32 [ 0, %bb4 ], [ %67, %bb6.i11 ]
  %tmp.i = add i32 %55, -1
  %56 = load i8* %sc.1.i, align 1, !dbg !1327
  %57 = and i32 %tmp.i, %55, !dbg !1328
  %58 = icmp eq i32 %57, 0, !dbg !1328
  br i1 %58, label %bb1.i, label %bb5.i, !dbg !1328

bb1.i:                                            ; preds = %bb.i9
  switch i8 %56, label %bb6.i11 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i10
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %56}, i64 0, metadata !315) nounwind, !dbg !1327
  store i8 0, i8* %sc.1.i, align 1, !dbg !1329
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !1329
  br label %__concretize_string.exit

bb4.i10:                                          ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !1330
  %59 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !1330
  br label %bb6.i11, !dbg !1330

bb5.i:                                            ; preds = %bb.i9
  %60 = sext i8 %56 to i64, !dbg !1331
  %61 = tail call i64 @klee_get_valuel(i64 %60) nounwind, !dbg !1331
  %62 = trunc i64 %61 to i8, !dbg !1331
  %63 = icmp eq i8 %62, %56, !dbg !1332
  %64 = zext i1 %63 to i64, !dbg !1332
  tail call void @klee_assume(i64 %64) nounwind, !dbg !1332
  store i8 %62, i8* %sc.1.i, align 1, !dbg !1333
  %65 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !1333
  %66 = icmp eq i8 %62, 0, !dbg !1334
  br i1 %66, label %__concretize_string.exit, label %bb6.i11, !dbg !1334

bb6.i11:                                          ; preds = %bb5.i, %bb4.i10, %bb1.i
  %sc.0.i = phi i8* [ %59, %bb4.i10 ], [ %65, %bb5.i ], [ %sc.1.i, %bb1.i ]
  %67 = add i32 %55, 1, !dbg !1326
  br label %bb.i9, !dbg !1326

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %68 = tail call i64 (i64, ...)* @syscall(i64 90, i8* %path, i32 %mode) nounwind, !dbg !1321
  %69 = trunc i64 %68 to i32, !dbg !1321
  tail call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !534), !dbg !1321
  %70 = icmp eq i32 %69, -1, !dbg !1335
  br i1 %70, label %bb5, label %bb7, !dbg !1335

bb5:                                              ; preds = %__concretize_string.exit
  %71 = tail call i32* @__errno_location() nounwind readnone, !dbg !1336
  %72 = tail call i32 @klee_get_errno() nounwind, !dbg !1336
  store i32 %72, i32* %71, align 4, !dbg !1336
  ret i32 %69, !dbg !1311

bb7:                                              ; preds = %__concretize_string.exit
  ret i32 %69, !dbg !1311
}

define i64 @write(i32 %fd, i8* %buf, i64 %count) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !536), !dbg !1337
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !537), !dbg !1337
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !538), !dbg !1337
  %0 = load i32* @n_calls.4824, align 4, !dbg !1338
  %1 = add nsw i32 %0, 1, !dbg !1338
  store i32 %1, i32* @n_calls.4824, align 4, !dbg !1338
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1339
  %2 = icmp ult i32 %fd, 32
  br i1 %2, label %bb.i, label %bb, !dbg !1341

bb.i:                                             ; preds = %entry
  %3 = sext i32 %fd to i64, !dbg !1342
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !236), !dbg !1342
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1
  %5 = load i32* %4, align 4, !dbg !1343
  %6 = and i32 %5, 1, !dbg !1343
  %toBool.i = icmp eq i32 %6, 0
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1343

__get_file.exit:                                  ; preds = %bb.i
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %7}, i64 0, metadata !539), !dbg !1340
  %8 = icmp eq %struct.exe_file_t* %7, null, !dbg !1344
  br i1 %8, label %bb, label %bb1, !dbg !1344

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %9 = tail call i32* @__errno_location() nounwind readnone, !dbg !1345
  store i32 9, i32* %9, align 4, !dbg !1345
  ret i64 -1, !dbg !1346

bb1:                                              ; preds = %__get_file.exit
  %10 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1347
  %11 = icmp eq i32 %10, 0, !dbg !1347
  br i1 %11, label %bb4, label %bb2, !dbg !1347

bb2:                                              ; preds = %bb1
  %12 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !1347
  %13 = load i32* %12, align 4, !dbg !1347
  %14 = icmp eq i32 %13, %1, !dbg !1347
  br i1 %14, label %bb3, label %bb4, !dbg !1347

bb3:                                              ; preds = %bb2
  %15 = add i32 %10, -1
  store i32 %15, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1348
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !1349
  store i32 5, i32* %16, align 4, !dbg !1349
  ret i64 -1, !dbg !1346

bb4:                                              ; preds = %bb1, %bb2
  %17 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3
  %18 = load %struct.exe_disk_file_t** %17, align 8, !dbg !1350
  %19 = icmp eq %struct.exe_disk_file_t* %18, null, !dbg !1350
  br i1 %19, label %bb5, label %bb15, !dbg !1350

bb5:                                              ; preds = %bb4
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !301) nounwind, !dbg !1351
  %20 = ptrtoint i8* %buf to i64, !dbg !1353
  %21 = tail call i64 @klee_get_valuel(i64 %20) nounwind, !dbg !1353
  %22 = inttoptr i64 %21 to i8*, !dbg !1353
  tail call void @llvm.dbg.value(metadata !{i8* %22}, i64 0, metadata !302) nounwind, !dbg !1353
  %23 = icmp eq i8* %22, %buf, !dbg !1354
  %24 = zext i1 %23 to i64, !dbg !1354
  tail call void @klee_assume(i64 %24) nounwind, !dbg !1354
  tail call void @llvm.dbg.value(metadata !{i8* %22}, i64 0, metadata !537), !dbg !1352
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !304) nounwind, !dbg !1355
  %25 = tail call i64 @klee_get_valuel(i64 %count) nounwind, !dbg !1357
  tail call void @llvm.dbg.value(metadata !{i64 %25}, i64 0, metadata !305) nounwind, !dbg !1357
  %26 = icmp eq i64 %25, %count, !dbg !1358
  %27 = zext i1 %26 to i64, !dbg !1358
  tail call void @klee_assume(i64 %27) nounwind, !dbg !1358
  tail call void @llvm.dbg.value(metadata !{i64 %25}, i64 0, metadata !538), !dbg !1356
  tail call void @klee_check_memory_access(i8* %22, i64 %25) nounwind, !dbg !1359
  %28 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 0
  %29 = load i32* %28, align 8, !dbg !1360
  %30 = add i32 %29, -1
  %31 = icmp ult i32 %30, 2
  br i1 %31, label %bb6, label %bb7, !dbg !1360

bb6:                                              ; preds = %bb5
  %32 = tail call i64 (i64, ...)* @syscall(i64 1, i32 %29, i8* %22, i64 %25) nounwind, !dbg !1361
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !541), !dbg !1361
  br label %bb8, !dbg !1361

bb7:                                              ; preds = %bb5
  %33 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2
  %34 = load i64* %33, align 8, !dbg !1362
  %35 = tail call i64 (i64, ...)* @syscall(i64 18, i32 %29, i8* %22, i64 %25, i64 %34) nounwind, !dbg !1362
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !541), !dbg !1362
  br label %bb8, !dbg !1362

bb8:                                              ; preds = %bb7, %bb6
  %r.0.in = phi i64 [ %32, %bb6 ], [ %35, %bb7 ]
  %r.0 = trunc i64 %r.0.in to i32
  %36 = icmp eq i32 %r.0, -1, !dbg !1363
  br i1 %36, label %bb9, label %bb10, !dbg !1363

bb9:                                              ; preds = %bb8
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !1364
  %38 = tail call i32 @klee_get_errno() nounwind, !dbg !1364
  store i32 %38, i32* %37, align 4, !dbg !1364
  ret i64 -1, !dbg !1346

bb10:                                             ; preds = %bb8
  %39 = icmp slt i32 %r.0, 0, !dbg !1365
  br i1 %39, label %bb11, label %bb12, !dbg !1365

bb11:                                             ; preds = %bb10
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i64 0, i64 0), i32 338, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.4827, i64 0, i64 0)) noreturn nounwind, !dbg !1365
  unreachable, !dbg !1365

bb12:                                             ; preds = %bb10
  %40 = load i32* %28, align 8, !dbg !1366
  %41 = add i32 %40, -1
  %42 = icmp ugt i32 %41, 1, !dbg !1366
  br i1 %42, label %bb13, label %bb14, !dbg !1366

bb13:                                             ; preds = %bb12
  %43 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2
  %44 = load i64* %43, align 8, !dbg !1367
  %45 = sext i32 %r.0 to i64, !dbg !1367
  %46 = add nsw i64 %44, %45, !dbg !1367
  store i64 %46, i64* %43, align 8, !dbg !1367
  br label %bb14, !dbg !1367

bb14:                                             ; preds = %bb12, %bb13
  %47 = sext i32 %r.0 to i64, !dbg !1368
  ret i64 %47, !dbg !1346

bb15:                                             ; preds = %bb4
  tail call void @llvm.dbg.value(metadata !1369, i64 0, metadata !543), !dbg !1370
  %48 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2
  %49 = load i64* %48, align 8, !dbg !1371
  %50 = add i64 %49, %count, !dbg !1371
  %51 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 0, i32 0, !dbg !1371
  %52 = load i32* %51, align 8, !dbg !1371
  %53 = zext i32 %52 to i64, !dbg !1371
  %54 = icmp ugt i64 %50, %53, !dbg !1371
  br i1 %54, label %bb17, label %bb21, !dbg !1371

bb17:                                             ; preds = %bb15
  %55 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 3), align 8, !dbg !1372
  %56 = icmp eq i32 %55, 0, !dbg !1372
  br i1 %56, label %bb19, label %bb18, !dbg !1372

bb18:                                             ; preds = %bb17
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i64 0, i64 0), i32 351, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.4827, i64 0, i64 0)) noreturn nounwind, !dbg !1373
  unreachable, !dbg !1373

bb19:                                             ; preds = %bb17
  %57 = icmp slt i64 %49, %53, !dbg !1374
  br i1 %57, label %bb20, label %bb23, !dbg !1374

bb20:                                             ; preds = %bb19
  %58 = sub nsw i64 %53, %49, !dbg !1375
  tail call void @llvm.dbg.value(metadata !{i64 %58}, i64 0, metadata !543), !dbg !1375
  br label %bb21, !dbg !1375

bb21:                                             ; preds = %bb15, %bb20
  %actual_count.0 = phi i64 [ %58, %bb20 ], [ %count, %bb15 ]
  %59 = icmp eq i64 %actual_count.0, 0, !dbg !1376
  br i1 %59, label %bb23, label %bb22, !dbg !1376

bb22:                                             ; preds = %bb21
  %60 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 0, i32 1, !dbg !1377
  %61 = load i8** %60, align 8, !dbg !1377
  %62 = getelementptr inbounds i8* %61, i64 %49, !dbg !1377
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %62, i8* %buf, i64 %actual_count.0, i32 1, i1 false), !dbg !1377
  br label %bb23, !dbg !1377

bb23:                                             ; preds = %bb19, %bb21, %bb22
  %actual_count.030 = phi i64 [ 0, %bb21 ], [ %actual_count.0, %bb22 ], [ 0, %bb19 ]
  %63 = icmp eq i64 %actual_count.030, %count, !dbg !1378
  br i1 %63, label %bb25, label %bb24, !dbg !1378

bb24:                                             ; preds = %bb23
  %64 = load %struct._IO_FILE** @stderr, align 8, !dbg !1379
  %65 = bitcast %struct._IO_FILE* %64 to i8*, !dbg !1379
  %66 = tail call i64 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str21, i64 0, i64 0), i64 1, i64 32, i8* %65) nounwind, !dbg !1379
  br label %bb25, !dbg !1379

bb25:                                             ; preds = %bb23, %bb24
  %67 = load %struct.exe_disk_file_t** %17, align 8, !dbg !1380
  %68 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !1380
  %69 = icmp eq %struct.exe_disk_file_t* %67, %68, !dbg !1380
  br i1 %69, label %bb26, label %bb27, !dbg !1380

bb26:                                             ; preds = %bb25
  %70 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !1381
  %71 = trunc i64 %actual_count.030 to i32, !dbg !1381
  %72 = add i32 %70, %71, !dbg !1381
  store i32 %72, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !1381
  br label %bb27, !dbg !1381

bb27:                                             ; preds = %bb25, %bb26
  %73 = load i64* %48, align 8, !dbg !1382
  %74 = add i64 %73, %count, !dbg !1382
  store i64 %74, i64* %48, align 8, !dbg !1382
  ret i64 %count, !dbg !1346
}

declare i64 @fwrite(i8* nocapture, i64, i64, i8* nocapture) nounwind

define i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !545), !dbg !1383
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !546), !dbg !1383
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !547), !dbg !1383
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !551), !dbg !1384
  br label %bb2, !dbg !1384

bb:                                               ; preds = %bb2
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvar, i32 1
  %0 = load i32* %scevgep, align 4, !dbg !1385
  %1 = and i32 %0, 1, !dbg !1385
  %2 = icmp eq i32 %1, 0, !dbg !1385
  br i1 %2, label %bb5, label %bb1, !dbg !1385

bb1:                                              ; preds = %bb
  %indvar.next = add i64 %indvar, 1
  br label %bb2, !dbg !1384

bb2:                                              ; preds = %bb1, %entry
  %indvar = phi i64 [ %indvar.next, %bb1 ], [ 0, %entry ]
  %fd.0 = trunc i64 %indvar to i32
  %3 = icmp slt i32 %fd.0, 32
  br i1 %3, label %bb, label %bb4, !dbg !1384

bb4:                                              ; preds = %bb2
  %4 = tail call i32* @__errno_location() nounwind readnone, !dbg !1386
  store i32 24, i32* %4, align 4, !dbg !1386
  ret i32 -1, !dbg !1387

bb5:                                              ; preds = %bb
  %5 = sext i32 %fd.0 to i64, !dbg !1388
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %6}, i64 0, metadata !550), !dbg !1388
  %7 = bitcast %struct.exe_file_t* %6 to i8*, !dbg !1389
  tail call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 24, i32 8, i1 false), !dbg !1389
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !229), !dbg !1390
  %8 = load i8* %pathname, align 1, !dbg !1392
  tail call void @llvm.dbg.value(metadata !{i8 %8}, i64 0, metadata !230), !dbg !1392
  %9 = icmp eq i8 %8, 0, !dbg !1393
  br i1 %9, label %bb16, label %bb.i, !dbg !1393

bb.i:                                             ; preds = %bb5
  %10 = getelementptr inbounds i8* %pathname, i64 1, !dbg !1393
  %11 = load i8* %10, align 1, !dbg !1393
  %12 = icmp eq i8 %11, 0, !dbg !1393
  br i1 %12, label %bb8.preheader.i, label %bb16, !dbg !1393

bb8.preheader.i:                                  ; preds = %bb.i
  %13 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1394
  %14 = sext i8 %8 to i32, !dbg !1395
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %26, 24
  %15 = ashr i32 %sext.i, 24
  %16 = add nsw i32 %15, 65, !dbg !1395
  %17 = icmp eq i32 %14, %16, !dbg !1395
  br i1 %17, label %bb4.i, label %bb7.i, !dbg !1395

bb4.i:                                            ; preds = %bb3.i
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1396
  %19 = zext i32 %26 to i64, !dbg !1396
  tail call void @llvm.dbg.value(metadata !562, i64 0, metadata !233), !dbg !1396
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %19, i32 2, !dbg !1397
  %21 = load %struct.stat** %20, align 8, !dbg !1397
  %22 = getelementptr inbounds %struct.stat* %21, i64 0, i32 1, !dbg !1397
  %23 = load i64* %22, align 8, !dbg !1397
  %24 = icmp eq i64 %23, 0, !dbg !1397
  br i1 %24, label %bb16, label %__get_sym_file.exit, !dbg !1397

bb7.i:                                            ; preds = %bb3.i
  %25 = add i32 %26, 1, !dbg !1394
  br label %bb8.i, !dbg !1394

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %26 = phi i32 [ %25, %bb7.i ], [ 0, %bb8.preheader.i ]
  %27 = icmp ugt i32 %13, %26, !dbg !1394
  br i1 %27, label %bb3.i, label %bb16, !dbg !1394

__get_sym_file.exit:                              ; preds = %bb4.i
  %28 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %19, !dbg !1396
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %28}, i64 0, metadata !548), !dbg !1391
  %29 = icmp eq %struct.exe_disk_file_t* %28, null, !dbg !1398
  br i1 %29, label %bb16, label %bb6, !dbg !1398

bb6:                                              ; preds = %__get_sym_file.exit
  %30 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 3
  store %struct.exe_disk_file_t* %28, %struct.exe_disk_file_t** %30, align 8, !dbg !1399
  %31 = and i32 %flags, 192
  %32 = icmp eq i32 %31, 192
  br i1 %32, label %bb8, label %bb9, !dbg !1400

bb8:                                              ; preds = %bb6
  %33 = tail call i32* @__errno_location() nounwind readnone, !dbg !1401
  store i32 17, i32* %33, align 4, !dbg !1401
  ret i32 -1, !dbg !1387

bb9:                                              ; preds = %bb6
  %34 = and i32 %flags, 128, !dbg !1402
  %.not = icmp ne i32 %34, 0
  %35 = and i32 %flags, 64, !dbg !1402
  %36 = icmp eq i32 %35, 0, !dbg !1402
  %or.cond29 = and i1 %.not, %36
  br i1 %or.cond29, label %bb11, label %bb12, !dbg !1402

bb11:                                             ; preds = %bb9
  %37 = load %struct._IO_FILE** @stderr, align 8, !dbg !1403
  %38 = bitcast %struct._IO_FILE* %37 to i8*, !dbg !1403
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([47 x i8]* @.str22, i64 0, i64 0), i64 1, i64 46, i8* %38) nounwind, !dbg !1403
  %40 = tail call i32* @__errno_location() nounwind readnone, !dbg !1404
  store i32 13, i32* %40, align 4, !dbg !1404
  ret i32 -1, !dbg !1387

bb12:                                             ; preds = %bb9
  %41 = load %struct.stat** %20, align 8, !dbg !1405
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !242), !dbg !1406
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %41}, i64 0, metadata !243), !dbg !1406
  %42 = getelementptr inbounds %struct.stat* %41, i64 0, i32 3, !dbg !1407
  %43 = load i32* %42, align 8, !dbg !1407
  tail call void @llvm.dbg.value(metadata !{i32 %43}, i64 0, metadata !247), !dbg !1407
  %44 = and i32 %flags, 2, !dbg !1408
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !246), !dbg !1409
  %45 = and i32 %flags, 3
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !244), !dbg !1410
  %not..i = icmp eq i32 %45, 0
  %46 = icmp eq i32 %44, 0
  br i1 %46, label %bb9.i, label %bb7.i34, !dbg !1411

bb7.i34:                                          ; preds = %bb12
  %47 = and i32 %43, 292, !dbg !1411
  %48 = icmp eq i32 %47, 0, !dbg !1411
  br i1 %48, label %bb9.i, label %bb13, !dbg !1411

bb9.i:                                            ; preds = %bb7.i34, %bb12
  br i1 %not..i, label %bb14, label %has_permission.exit, !dbg !1412

has_permission.exit:                              ; preds = %bb9.i
  %49 = and i32 %43, 146, !dbg !1412
  %phitmp = icmp eq i32 %49, 0
  br i1 %phitmp, label %bb13, label %bb14, !dbg !1405

bb13:                                             ; preds = %bb7.i34, %has_permission.exit
  %50 = tail call i32* @__errno_location() nounwind readnone, !dbg !1413
  store i32 13, i32* %50, align 4, !dbg !1413
  ret i32 -1, !dbg !1387

bb14:                                             ; preds = %bb9.i, %has_permission.exit
  %51 = and i32 %43, -512, !dbg !1414
  %52 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !1414
  %not = xor i32 %52, -1, !dbg !1414
  %53 = and i32 %not, %mode, !dbg !1414
  %54 = or i32 %53, %51, !dbg !1414
  store i32 %54, i32* %42, align 8, !dbg !1414
  br label %bb19, !dbg !1414

bb16:                                             ; preds = %bb8.i, %bb5, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !311) nounwind, !dbg !1415
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !301) nounwind, !dbg !1417
  %55 = ptrtoint i8* %pathname to i64, !dbg !1419
  %56 = tail call i64 @klee_get_valuel(i64 %55) nounwind, !dbg !1419
  %57 = inttoptr i64 %56 to i8*, !dbg !1419
  tail call void @llvm.dbg.value(metadata !{i8* %57}, i64 0, metadata !302) nounwind, !dbg !1419
  %58 = icmp eq i8* %57, %pathname, !dbg !1420
  %59 = zext i1 %58 to i64, !dbg !1420
  tail call void @klee_assume(i64 %59) nounwind, !dbg !1420
  tail call void @llvm.dbg.value(metadata !{i8* %57}, i64 0, metadata !312) nounwind, !dbg !1418
  tail call void @llvm.dbg.value(metadata !571, i64 0, metadata !314) nounwind, !dbg !1421
  br label %bb.i30, !dbg !1421

bb.i30:                                           ; preds = %bb6.i32, %bb16
  %sc.1.i = phi i8* [ %57, %bb16 ], [ %sc.0.i, %bb6.i32 ]
  %60 = phi i32 [ 0, %bb16 ], [ %72, %bb6.i32 ]
  %tmp.i = add i32 %60, -1
  %61 = load i8* %sc.1.i, align 1, !dbg !1422
  %62 = and i32 %tmp.i, %60, !dbg !1423
  %63 = icmp eq i32 %62, 0, !dbg !1423
  br i1 %63, label %bb1.i, label %bb5.i, !dbg !1423

bb1.i:                                            ; preds = %bb.i30
  switch i8 %61, label %bb6.i32 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i31
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %61}, i64 0, metadata !315) nounwind, !dbg !1422
  store i8 0, i8* %sc.1.i, align 1, !dbg !1424
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !1424
  br label %__concretize_string.exit

bb4.i31:                                          ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !1425
  %64 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !1425
  br label %bb6.i32, !dbg !1425

bb5.i:                                            ; preds = %bb.i30
  %65 = sext i8 %61 to i64, !dbg !1426
  %66 = tail call i64 @klee_get_valuel(i64 %65) nounwind, !dbg !1426
  %67 = trunc i64 %66 to i8, !dbg !1426
  %68 = icmp eq i8 %67, %61, !dbg !1427
  %69 = zext i1 %68 to i64, !dbg !1427
  tail call void @klee_assume(i64 %69) nounwind, !dbg !1427
  store i8 %67, i8* %sc.1.i, align 1, !dbg !1428
  %70 = getelementptr inbounds i8* %sc.1.i, i64 1, !dbg !1428
  %71 = icmp eq i8 %67, 0, !dbg !1429
  br i1 %71, label %__concretize_string.exit, label %bb6.i32, !dbg !1429

bb6.i32:                                          ; preds = %bb5.i, %bb4.i31, %bb1.i
  %sc.0.i = phi i8* [ %64, %bb4.i31 ], [ %70, %bb5.i ], [ %sc.1.i, %bb1.i ]
  %72 = add i32 %60, 1, !dbg !1421
  br label %bb.i30, !dbg !1421

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %73 = tail call i64 (i64, ...)* @syscall(i64 2, i8* %pathname, i32 %flags, i32 %mode) nounwind, !dbg !1416
  %74 = trunc i64 %73 to i32, !dbg !1416
  tail call void @llvm.dbg.value(metadata !{i32 %74}, i64 0, metadata !552), !dbg !1416
  %75 = icmp eq i32 %74, -1, !dbg !1430
  br i1 %75, label %bb17, label %bb18, !dbg !1430

bb17:                                             ; preds = %__concretize_string.exit
  %76 = tail call i32* @__errno_location() nounwind readnone, !dbg !1431
  %77 = tail call i32 @klee_get_errno() nounwind, !dbg !1431
  store i32 %77, i32* %76, align 4, !dbg !1431
  ret i32 -1, !dbg !1387

bb18:                                             ; preds = %__concretize_string.exit
  %78 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 0
  store i32 %74, i32* %78, align 8, !dbg !1432
  br label %bb19, !dbg !1432

bb19:                                             ; preds = %bb18, %bb14
  %79 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1
  store i32 1, i32* %79, align 4, !dbg !1433
  %80 = and i32 %flags, 3, !dbg !1434
  switch i32 %80, label %bb23 [
    i32 0, label %bb20
    i32 1, label %bb22
  ]

bb20:                                             ; preds = %bb19
  store i32 5, i32* %79, align 4, !dbg !1435
  ret i32 %fd.0, !dbg !1387

bb22:                                             ; preds = %bb19
  store i32 9, i32* %79, align 4, !dbg !1436
  ret i32 %fd.0, !dbg !1387

bb23:                                             ; preds = %bb19
  store i32 13, i32* %79, align 4, !dbg !1437
  ret i32 %fd.0, !dbg !1387
}

!llvm.dbg.sp = !{!0, !59, !72, !76, !79, !82, !83, !84, !89, !94, !97, !127, !130, !133, !134, !138, !141, !144, !147, !150, !153, !154, !155, !158, !178, !179, !182, !183, !184, !187, !205, !208, !209, !212, !213, !216, !219, !222, !225, !226}
!llvm.dbg.lv.__get_sym_file = !{!229, !230, !232, !233}
!llvm.dbg.lv.__get_file = !{!235, !236}
!llvm.dbg.lv.umask = !{!239, !240}
!llvm.dbg.lv.has_permission = !{!242, !243, !244, !246, !247}
!llvm.dbg.lv.chroot = !{!248}
!llvm.dbg.lv.unlink = !{!249, !250}
!llvm.dbg.lv.rmdir = !{!252, !253}
!llvm.dbg.lv.__df_chown = !{!255, !256, !257}
!llvm.dbg.lv.readlink = !{!258, !259, !260, !261, !263}
!llvm.dbg.lv.fsync = !{!265, !266, !268}
!llvm.dbg.lv.fstatfs = !{!270, !271, !272, !274}
!llvm.dbg.lv.__fd_ftruncate = !{!276, !277, !278, !280}
!llvm.dbg.gv = !{!282, !283, !284, !285, !286, !287, !288}
!llvm.dbg.lv.fchown = !{!289, !290, !291, !292, !294}
!llvm.dbg.lv.fchdir = !{!296, !297, !299}
!llvm.dbg.lv.__concretize_ptr = !{!301, !302}
!llvm.dbg.lv.__concretize_size = !{!304, !305}
!llvm.dbg.lv.getcwd = !{!307, !308, !309}
!llvm.dbg.lv.__concretize_string = !{!311, !312, !314, !315, !317}
!llvm.dbg.lv.__fd_statfs = !{!319, !320, !321, !323}
!llvm.dbg.lv.lchown = !{!325, !326, !327, !328, !330}
!llvm.dbg.lv.chown = !{!332, !333, !334, !335, !337}
!llvm.dbg.lv.chdir = !{!339, !340, !342}
!llvm.dbg.lv.access = !{!344, !345, !346, !348}
!llvm.dbg.lv.select = !{!350, !351, !352, !353, !354, !355, !357, !358, !359, !360, !361, !362, !363, !364, !365, !367, !369, !370}
!llvm.dbg.lv.close = !{!372, !373, !375}
!llvm.dbg.lv.dup2 = !{!376, !377, !378, !380}
!llvm.dbg.lv.dup = !{!382, !383, !385}
!llvm.dbg.lv.fcntl = !{!387, !388, !389, !391, !404, !405, !407}
!llvm.dbg.lv.ioctl = !{!409, !410, !411, !413, !414, !415, !437, !457, !467, !470}
!llvm.dbg.lv.__fd_getdents = !{!472, !473, !474, !475, !477, !479, !480, !481, !483, !485, !486, !487, !489}
!llvm.dbg.lv.__fd_lseek = !{!491, !492, !493, !494, !496}
!llvm.dbg.lv.__fd_fstat = !{!497, !498, !499, !501}
!llvm.dbg.lv.__fd_lstat = !{!503, !504, !505, !507}
!llvm.dbg.lv.__fd_stat = !{!509, !510, !511, !513}
!llvm.dbg.lv.read = !{!515, !516, !517, !518, !520}
!llvm.dbg.lv.__df_chmod = !{!522, !523}
!llvm.dbg.lv.fchmod = !{!524, !525, !526, !528}
!llvm.dbg.lv.chmod = !{!530, !531, !532, !534}
!llvm.dbg.lv.write = !{!536, !537, !538, !539, !541, !543}
!llvm.dbg.lv.__fd_open = !{!545, !546, !547, !548, !550, !551, !552}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__get_sym_file", metadata !"__get_sym_file", metadata !"", metadata !1, i32 39, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"fd.c", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"fd.c", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !57}
!5 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 524310, metadata !7, metadata !"exe_disk_file_t", metadata !7, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!7 = metadata !{i32 524329, metadata !"fd.h", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!8 = metadata !{i32 524307, metadata !1, metadata !"", metadata !7, i32 20, i64 192, i64 64, i64 0, i32 0, null, metadata !9, i32 0, null} ; [ DW_TAG_structure_type ]
!9 = metadata !{metadata !10, metadata !12, metadata !15}
!10 = metadata !{i32 524301, metadata !8, metadata !"size", metadata !7, i32 21, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!11 = metadata !{i32 524324, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 524301, metadata !8, metadata !"contents", metadata !7, i32 22, i64 64, i64 64, i64 64, i32 0, metadata !13} ; [ DW_TAG_member ]
!13 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ]
!14 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!15 = metadata !{i32 524301, metadata !8, metadata !"stat", metadata !7, i32 23, i64 64, i64 64, i64 128, i32 0, metadata !16} ; [ DW_TAG_member ]
!16 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ]
!17 = metadata !{i32 524307, metadata !1, metadata !"stat64", metadata !7, i32 23, i64 1152, i64 64, i64 0, i32 0, null, metadata !18, i32 0, null} ; [ DW_TAG_structure_type ]
!18 = metadata !{metadata !19, metadata !24, metadata !26, metadata !28, metadata !30, metadata !32, metadata !34, metadata !36, metadata !37, metadata !40, metadata !42, metadata !44, metadata !51, metadata !52, metadata !53}
!19 = metadata !{i32 524301, metadata !17, metadata !"st_dev", metadata !20, i32 121, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ]
!20 = metadata !{i32 524329, metadata !"stat.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!21 = metadata !{i32 524310, metadata !22, metadata !"__dev_t", metadata !22, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!22 = metadata !{i32 524329, metadata !"types.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!23 = metadata !{i32 524324, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!24 = metadata !{i32 524301, metadata !17, metadata !"st_ino", metadata !20, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !25} ; [ DW_TAG_member ]
!25 = metadata !{i32 524310, metadata !22, metadata !"__ino64_t", metadata !22, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!26 = metadata !{i32 524301, metadata !17, metadata !"st_nlink", metadata !20, i32 124, i64 64, i64 64, i64 128, i32 0, metadata !27} ; [ DW_TAG_member ]
!27 = metadata !{i32 524310, metadata !22, metadata !"__nlink_t", metadata !22, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!28 = metadata !{i32 524301, metadata !17, metadata !"st_mode", metadata !20, i32 125, i64 32, i64 32, i64 192, i32 0, metadata !29} ; [ DW_TAG_member ]
!29 = metadata !{i32 524310, metadata !22, metadata !"__mode_t", metadata !22, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!30 = metadata !{i32 524301, metadata !17, metadata !"st_uid", metadata !20, i32 132, i64 32, i64 32, i64 224, i32 0, metadata !31} ; [ DW_TAG_member ]
!31 = metadata !{i32 524310, metadata !22, metadata !"__uid_t", metadata !22, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!32 = metadata !{i32 524301, metadata !17, metadata !"st_gid", metadata !20, i32 133, i64 32, i64 32, i64 256, i32 0, metadata !33} ; [ DW_TAG_member ]
!33 = metadata !{i32 524310, metadata !22, metadata !"__gid_t", metadata !22, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!34 = metadata !{i32 524301, metadata !17, metadata !"__pad0", metadata !20, i32 135, i64 32, i64 32, i64 288, i32 0, metadata !35} ; [ DW_TAG_member ]
!35 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!36 = metadata !{i32 524301, metadata !17, metadata !"st_rdev", metadata !20, i32 136, i64 64, i64 64, i64 320, i32 0, metadata !21} ; [ DW_TAG_member ]
!37 = metadata !{i32 524301, metadata !17, metadata !"st_size", metadata !20, i32 137, i64 64, i64 64, i64 384, i32 0, metadata !38} ; [ DW_TAG_member ]
!38 = metadata !{i32 524310, metadata !22, metadata !"__off_t", metadata !22, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!39 = metadata !{i32 524324, metadata !1, metadata !"long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!40 = metadata !{i32 524301, metadata !17, metadata !"st_blksize", metadata !20, i32 143, i64 64, i64 64, i64 448, i32 0, metadata !41} ; [ DW_TAG_member ]
!41 = metadata !{i32 524310, metadata !22, metadata !"__blksize_t", metadata !22, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!42 = metadata !{i32 524301, metadata !17, metadata !"st_blocks", metadata !20, i32 144, i64 64, i64 64, i64 512, i32 0, metadata !43} ; [ DW_TAG_member ]
!43 = metadata !{i32 524310, metadata !22, metadata !"__blkcnt64_t", metadata !22, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!44 = metadata !{i32 524301, metadata !17, metadata !"st_atim", metadata !20, i32 152, i64 128, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ]
!45 = metadata !{i32 524307, metadata !1, metadata !"timespec", metadata !46, i32 121, i64 128, i64 64, i64 0, i32 0, null, metadata !47, i32 0, null} ; [ DW_TAG_structure_type ]
!46 = metadata !{i32 524329, metadata !"time.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!47 = metadata !{metadata !48, metadata !50}
!48 = metadata !{i32 524301, metadata !45, metadata !"tv_sec", metadata !46, i32 122, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_member ]
!49 = metadata !{i32 524310, metadata !22, metadata !"__time_t", metadata !22, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!50 = metadata !{i32 524301, metadata !45, metadata !"tv_nsec", metadata !46, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !39} ; [ DW_TAG_member ]
!51 = metadata !{i32 524301, metadata !17, metadata !"st_mtim", metadata !20, i32 153, i64 128, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ]
!52 = metadata !{i32 524301, metadata !17, metadata !"st_ctim", metadata !20, i32 154, i64 128, i64 64, i64 832, i32 0, metadata !45} ; [ DW_TAG_member ]
!53 = metadata !{i32 524301, metadata !17, metadata !"__unused", metadata !20, i32 167, i64 192, i64 64, i64 960, i32 0, metadata !54} ; [ DW_TAG_member ]
!54 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 192, i64 64, i64 0, i32 0, metadata !39, metadata !55, i32 0, null} ; [ DW_TAG_array_type ]
!55 = metadata !{metadata !56}
!56 = metadata !{i32 524321, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!57 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !58} ; [ DW_TAG_pointer_type ]
!58 = metadata !{i32 524326, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ]
!59 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__get_file", metadata !"__get_file", metadata !"", metadata !1, i32 63, metadata !60, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!60 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null} ; [ DW_TAG_subroutine_type ]
!61 = metadata !{metadata !62, metadata !35}
!62 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ]
!63 = metadata !{i32 524310, metadata !7, metadata !"exe_file_t", metadata !7, i32 42, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ]
!64 = metadata !{i32 524307, metadata !1, metadata !"", metadata !7, i32 33, i64 192, i64 64, i64 0, i32 0, null, metadata !65, i32 0, null} ; [ DW_TAG_structure_type ]
!65 = metadata !{metadata !66, metadata !67, metadata !68, metadata !71}
!66 = metadata !{i32 524301, metadata !64, metadata !"fd", metadata !7, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !35} ; [ DW_TAG_member ]
!67 = metadata !{i32 524301, metadata !64, metadata !"flags", metadata !7, i32 35, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ]
!68 = metadata !{i32 524301, metadata !64, metadata !"off", metadata !7, i32 38, i64 64, i64 64, i64 64, i32 0, metadata !69} ; [ DW_TAG_member ]
!69 = metadata !{i32 524310, metadata !70, metadata !"off64_t", metadata !70, i32 99, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!70 = metadata !{i32 524329, metadata !"types.h", metadata !"/usr/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!71 = metadata !{i32 524301, metadata !64, metadata !"dfile", metadata !7, i32 39, i64 64, i64 64, i64 128, i32 0, metadata !5} ; [ DW_TAG_member ]
!72 = metadata !{i32 524334, i32 0, metadata !1, metadata !"umask", metadata !"umask", metadata !"umask", metadata !1, i32 88, metadata !73, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32)* @umask} ; [ DW_TAG_subprogram ]
!73 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, null} ; [ DW_TAG_subroutine_type ]
!74 = metadata !{metadata !75, metadata !75}
!75 = metadata !{i32 524310, metadata !70, metadata !"mode_t", metadata !70, i32 76, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!76 = metadata !{i32 524334, i32 0, metadata !1, metadata !"has_permission", metadata !"has_permission", metadata !"", metadata !1, i32 97, metadata !77, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!77 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !78, i32 0, null} ; [ DW_TAG_subroutine_type ]
!78 = metadata !{metadata !35, metadata !35, metadata !16}
!79 = metadata !{i32 524334, i32 0, metadata !1, metadata !"chroot", metadata !"chroot", metadata !"chroot", metadata !1, i32 1294, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*)* @chroot} ; [ DW_TAG_subprogram ]
!80 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !81, i32 0, null} ; [ DW_TAG_subroutine_type ]
!81 = metadata !{metadata !35, metadata !57}
!82 = metadata !{i32 524334, i32 0, metadata !1, metadata !"unlink", metadata !"unlink", metadata !"unlink", metadata !1, i32 1078, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*)* @unlink} ; [ DW_TAG_subprogram ]
!83 = metadata !{i32 524334, i32 0, metadata !1, metadata !"rmdir", metadata !"rmdir", metadata !"rmdir", metadata !1, i32 1060, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*)* @rmdir} ; [ DW_TAG_subprogram ]
!84 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__df_chown", metadata !"__df_chown", metadata !"", metadata !1, i32 569, metadata !85, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!85 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !86, i32 0, null} ; [ DW_TAG_subroutine_type ]
!86 = metadata !{metadata !35, metadata !5, metadata !87, metadata !88}
!87 = metadata !{i32 524310, metadata !70, metadata !"uid_t", metadata !70, i32 87, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!88 = metadata !{i32 524310, metadata !70, metadata !"gid_t", metadata !70, i32 71, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!89 = metadata !{i32 524334, i32 0, metadata !1, metadata !"readlink", metadata !"readlink", metadata !"readlink", metadata !1, i32 1099, metadata !90, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i64 (i8*, i8*, i64)* @readlink} ; [ DW_TAG_subprogram ]
!90 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !91, i32 0, null} ; [ DW_TAG_subroutine_type ]
!91 = metadata !{metadata !92, metadata !57, metadata !13, metadata !93}
!92 = metadata !{i32 524310, metadata !70, metadata !"ssize_t", metadata !70, i32 116, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!93 = metadata !{i32 524310, metadata !70, metadata !"size_t", metadata !70, i32 151, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!94 = metadata !{i32 524334, i32 0, metadata !1, metadata !"fsync", metadata !"fsync", metadata !"fsync", metadata !1, i32 1000, metadata !95, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32)* @fsync} ; [ DW_TAG_subprogram ]
!95 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !96, i32 0, null} ; [ DW_TAG_subroutine_type ]
!96 = metadata !{metadata !35, metadata !35}
!97 = metadata !{i32 524334, i32 0, metadata !1, metadata !"fstatfs", metadata !"fstatfs", metadata !"fstatfs", metadata !1, i32 980, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, %struct.statfs*)* @fstatfs} ; [ DW_TAG_subprogram ]
!98 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, null} ; [ DW_TAG_subroutine_type ]
!99 = metadata !{metadata !35, metadata !35, metadata !100}
!100 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !101} ; [ DW_TAG_pointer_type ]
!101 = metadata !{i32 524307, metadata !1, metadata !"statfs", metadata !102, i32 26, i64 960, i64 64, i64 0, i32 0, null, metadata !103, i32 0, null} ; [ DW_TAG_structure_type ]
!102 = metadata !{i32 524329, metadata !"statfs.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!103 = metadata !{metadata !104, metadata !105, metadata !106, metadata !108, metadata !109, metadata !110, metadata !112, metadata !113, metadata !121, metadata !122, metadata !123}
!104 = metadata !{i32 524301, metadata !101, metadata !"f_type", metadata !102, i32 27, i64 64, i64 64, i64 0, i32 0, metadata !39} ; [ DW_TAG_member ]
!105 = metadata !{i32 524301, metadata !101, metadata !"f_bsize", metadata !102, i32 28, i64 64, i64 64, i64 64, i32 0, metadata !39} ; [ DW_TAG_member ]
!106 = metadata !{i32 524301, metadata !101, metadata !"f_blocks", metadata !102, i32 30, i64 64, i64 64, i64 128, i32 0, metadata !107} ; [ DW_TAG_member ]
!107 = metadata !{i32 524310, metadata !22, metadata !"__fsblkcnt_t", metadata !22, i32 174, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!108 = metadata !{i32 524301, metadata !101, metadata !"f_bfree", metadata !102, i32 31, i64 64, i64 64, i64 192, i32 0, metadata !107} ; [ DW_TAG_member ]
!109 = metadata !{i32 524301, metadata !101, metadata !"f_bavail", metadata !102, i32 32, i64 64, i64 64, i64 256, i32 0, metadata !107} ; [ DW_TAG_member ]
!110 = metadata !{i32 524301, metadata !101, metadata !"f_files", metadata !102, i32 33, i64 64, i64 64, i64 320, i32 0, metadata !111} ; [ DW_TAG_member ]
!111 = metadata !{i32 524310, metadata !22, metadata !"__fsfilcnt_t", metadata !22, i32 178, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!112 = metadata !{i32 524301, metadata !101, metadata !"f_ffree", metadata !102, i32 34, i64 64, i64 64, i64 384, i32 0, metadata !111} ; [ DW_TAG_member ]
!113 = metadata !{i32 524301, metadata !101, metadata !"f_fsid", metadata !102, i32 42, i64 64, i64 32, i64 448, i32 0, metadata !114} ; [ DW_TAG_member ]
!114 = metadata !{i32 524310, metadata !22, metadata !"__fsid_t", metadata !22, i32 145, i64 0, i64 0, i64 0, i32 0, metadata !115} ; [ DW_TAG_typedef ]
!115 = metadata !{i32 524307, metadata !1, metadata !"", metadata !22, i32 144, i64 64, i64 32, i64 0, i32 0, null, metadata !116, i32 0, null} ; [ DW_TAG_structure_type ]
!116 = metadata !{metadata !117}
!117 = metadata !{i32 524301, metadata !115, metadata !"__val", metadata !22, i32 144, i64 64, i64 32, i64 0, i32 0, metadata !118} ; [ DW_TAG_member ]
!118 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !35, metadata !119, i32 0, null} ; [ DW_TAG_array_type ]
!119 = metadata !{metadata !120}
!120 = metadata !{i32 524321, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!121 = metadata !{i32 524301, metadata !101, metadata !"f_namelen", metadata !102, i32 43, i64 64, i64 64, i64 512, i32 0, metadata !39} ; [ DW_TAG_member ]
!122 = metadata !{i32 524301, metadata !101, metadata !"f_frsize", metadata !102, i32 44, i64 64, i64 64, i64 576, i32 0, metadata !39} ; [ DW_TAG_member ]
!123 = metadata !{i32 524301, metadata !101, metadata !"f_spare", metadata !102, i32 45, i64 320, i64 64, i64 640, i32 0, metadata !124} ; [ DW_TAG_member ]
!124 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 320, i64 64, i64 0, i32 0, metadata !39, metadata !125, i32 0, null} ; [ DW_TAG_array_type ]
!125 = metadata !{metadata !126}
!126 = metadata !{i32 524321, i64 0, i64 4}       ; [ DW_TAG_subrange_type ]
!127 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !1, i32 643, metadata !128, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i64)* @__fd_ftruncate} ; [ DW_TAG_subprogram ]
!128 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !129, i32 0, null} ; [ DW_TAG_subroutine_type ]
!129 = metadata !{metadata !35, metadata !35, metadata !69}
!130 = metadata !{i32 524334, i32 0, metadata !1, metadata !"fchown", metadata !"fchown", metadata !"fchown", metadata !1, i32 588, metadata !131, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i32, i32)* @fchown} ; [ DW_TAG_subprogram ]
!131 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !132, i32 0, null} ; [ DW_TAG_subroutine_type ]
!132 = metadata !{metadata !35, metadata !35, metadata !87, metadata !88}
!133 = metadata !{i32 524334, i32 0, metadata !1, metadata !"fchdir", metadata !"fchdir", metadata !"fchdir", metadata !1, i32 486, metadata !95, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32)* @fchdir} ; [ DW_TAG_subprogram ]
!134 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__concretize_ptr", metadata !"__concretize_ptr", metadata !"", metadata !1, i32 1252, metadata !135, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!135 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !136, i32 0, null} ; [ DW_TAG_subroutine_type ]
!136 = metadata !{metadata !137, metadata !137}
!137 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!138 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__concretize_size", metadata !"__concretize_size", metadata !"", metadata !1, i32 1259, metadata !139, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!139 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !140, i32 0, null} ; [ DW_TAG_subroutine_type ]
!140 = metadata !{metadata !93, metadata !93}
!141 = metadata !{i32 524334, i32 0, metadata !1, metadata !"getcwd", metadata !"getcwd", metadata !"getcwd", metadata !1, i32 1217, metadata !142, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i8* (i8*, i64)* @getcwd} ; [ DW_TAG_subprogram ]
!142 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !143, i32 0, null} ; [ DW_TAG_subroutine_type ]
!143 = metadata !{metadata !13, metadata !13, metadata !93}
!144 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__concretize_string", metadata !"__concretize_string", metadata !"", metadata !1, i32 1265, metadata !145, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!145 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !146, i32 0, null} ; [ DW_TAG_subroutine_type ]
!146 = metadata !{metadata !57, metadata !57}
!147 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !1, i32 963, metadata !148, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, %struct.statfs*)* @__fd_statfs} ; [ DW_TAG_subprogram ]
!148 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !149, i32 0, null} ; [ DW_TAG_subroutine_type ]
!149 = metadata !{metadata !35, metadata !57, metadata !100}
!150 = metadata !{i32 524334, i32 0, metadata !1, metadata !"lchown", metadata !"lchown", metadata !"lchown", metadata !1, i32 606, metadata !151, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, i32, i32)* @lchown} ; [ DW_TAG_subprogram ]
!151 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !152, i32 0, null} ; [ DW_TAG_subroutine_type ]
!152 = metadata !{metadata !35, metadata !57, metadata !87, metadata !88}
!153 = metadata !{i32 524334, i32 0, metadata !1, metadata !"chown", metadata !"chown", metadata !"chown", metadata !1, i32 575, metadata !151, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, i32, i32)* @chown} ; [ DW_TAG_subprogram ]
!154 = metadata !{i32 524334, i32 0, metadata !1, metadata !"chdir", metadata !"chdir", metadata !"chdir", metadata !1, i32 468, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*)* @chdir} ; [ DW_TAG_subprogram ]
!155 = metadata !{i32 524334, i32 0, metadata !1, metadata !"access", metadata !"access", metadata !"access", metadata !1, i32 73, metadata !156, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, i32)* @access} ; [ DW_TAG_subprogram ]
!156 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !157, i32 0, null} ; [ DW_TAG_subroutine_type ]
!157 = metadata !{metadata !35, metadata !57, metadata !35}
!158 = metadata !{i32 524334, i32 0, metadata !1, metadata !"select", metadata !"select", metadata !"select", metadata !1, i32 1132, metadata !159, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timespec*)* @select} ; [ DW_TAG_subprogram ]
!159 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !160, i32 0, null} ; [ DW_TAG_subroutine_type ]
!160 = metadata !{metadata !35, metadata !35, metadata !161, metadata !161, metadata !161, metadata !171}
!161 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !162} ; [ DW_TAG_pointer_type ]
!162 = metadata !{i32 524310, metadata !163, metadata !"fd_set", metadata !163, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !164} ; [ DW_TAG_typedef ]
!163 = metadata !{i32 524329, metadata !"select.h", metadata !"/usr/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!164 = metadata !{i32 524307, metadata !1, metadata !"", metadata !163, i32 68, i64 1024, i64 64, i64 0, i32 0, null, metadata !165, i32 0, null} ; [ DW_TAG_structure_type ]
!165 = metadata !{metadata !166}
!166 = metadata !{i32 524301, metadata !164, metadata !"fds_bits", metadata !163, i32 72, i64 1024, i64 64, i64 0, i32 0, metadata !167} ; [ DW_TAG_member ]
!167 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !168, metadata !169, i32 0, null} ; [ DW_TAG_array_type ]
!168 = metadata !{i32 524310, metadata !163, metadata !"__fd_mask", metadata !163, i32 68, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!169 = metadata !{metadata !170}
!170 = metadata !{i32 524321, i64 0, i64 15}      ; [ DW_TAG_subrange_type ]
!171 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !172} ; [ DW_TAG_pointer_type ]
!172 = metadata !{i32 524307, metadata !1, metadata !"timeval", metadata !173, i32 76, i64 128, i64 64, i64 0, i32 0, null, metadata !174, i32 0, null} ; [ DW_TAG_structure_type ]
!173 = metadata !{i32 524329, metadata !"time.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!174 = metadata !{metadata !175, metadata !176}
!175 = metadata !{i32 524301, metadata !172, metadata !"tv_sec", metadata !173, i32 77, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_member ]
!176 = metadata !{i32 524301, metadata !172, metadata !"tv_usec", metadata !173, i32 78, i64 64, i64 64, i64 64, i32 0, metadata !177} ; [ DW_TAG_member ]
!177 = metadata !{i32 524310, metadata !22, metadata !"__suseconds_t", metadata !22, i32 153, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!178 = metadata !{i32 524334, i32 0, metadata !1, metadata !"close", metadata !"close", metadata !"close", metadata !1, i32 201, metadata !95, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32)* @close} ; [ DW_TAG_subprogram ]
!179 = metadata !{i32 524334, i32 0, metadata !1, metadata !"dup2", metadata !"dup2", metadata !"dup2", metadata !1, i32 1016, metadata !180, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i32)* @dup2} ; [ DW_TAG_subprogram ]
!180 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !181, i32 0, null} ; [ DW_TAG_subroutine_type ]
!181 = metadata !{metadata !35, metadata !35, metadata !35}
!182 = metadata !{i32 524334, i32 0, metadata !1, metadata !"dup", metadata !"dup", metadata !"dup", metadata !1, i32 1041, metadata !95, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32)* @dup} ; [ DW_TAG_subprogram ]
!183 = metadata !{i32 524334, i32 0, metadata !1, metadata !"fcntl", metadata !"fcntl", metadata !"fcntl", metadata !1, i32 908, metadata !180, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i32, ...)* @fcntl} ; [ DW_TAG_subprogram ]
!184 = metadata !{i32 524334, i32 0, metadata !1, metadata !"ioctl", metadata !"ioctl", metadata !"ioctl", metadata !1, i32 758, metadata !185, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i64, ...)* @ioctl} ; [ DW_TAG_subprogram ]
!185 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !186, i32 0, null} ; [ DW_TAG_subroutine_type ]
!186 = metadata !{metadata !35, metadata !35, metadata !23}
!187 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !1, i32 676, metadata !188, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, %struct.dirent64*, i32)* @__fd_getdents} ; [ DW_TAG_subprogram ]
!188 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !189, i32 0, null} ; [ DW_TAG_subroutine_type ]
!189 = metadata !{metadata !35, metadata !11, metadata !190, metadata !11}
!190 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !191} ; [ DW_TAG_pointer_type ]
!191 = metadata !{i32 524307, metadata !1, metadata !"dirent64", metadata !192, i32 39, i64 2240, i64 64, i64 0, i32 0, null, metadata !193, i32 0, null} ; [ DW_TAG_structure_type ]
!192 = metadata !{i32 524329, metadata !"dirent.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!193 = metadata !{metadata !194, metadata !195, metadata !197, metadata !199, metadata !201}
!194 = metadata !{i32 524301, metadata !191, metadata !"d_ino", metadata !192, i32 40, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_member ]
!195 = metadata !{i32 524301, metadata !191, metadata !"d_off", metadata !192, i32 41, i64 64, i64 64, i64 64, i32 0, metadata !196} ; [ DW_TAG_member ]
!196 = metadata !{i32 524310, metadata !22, metadata !"__off64_t", metadata !22, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!197 = metadata !{i32 524301, metadata !191, metadata !"d_reclen", metadata !192, i32 42, i64 16, i64 16, i64 128, i32 0, metadata !198} ; [ DW_TAG_member ]
!198 = metadata !{i32 524324, metadata !1, metadata !"short unsigned int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!199 = metadata !{i32 524301, metadata !191, metadata !"d_type", metadata !192, i32 43, i64 8, i64 8, i64 144, i32 0, metadata !200} ; [ DW_TAG_member ]
!200 = metadata !{i32 524324, metadata !1, metadata !"unsigned char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!201 = metadata !{i32 524301, metadata !191, metadata !"d_name", metadata !192, i32 44, i64 2048, i64 8, i64 152, i32 0, metadata !202} ; [ DW_TAG_member ]
!202 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 2048, i64 8, i64 0, i32 0, metadata !14, metadata !203, i32 0, null} ; [ DW_TAG_array_type ]
!203 = metadata !{metadata !204}
!204 = metadata !{i32 524321, i64 0, i64 255}     ; [ DW_TAG_subrange_type ]
!205 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !1, i32 373, metadata !206, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i64 (i32, i64, i32)* @__fd_lseek} ; [ DW_TAG_subprogram ]
!206 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !207, i32 0, null} ; [ DW_TAG_subroutine_type ]
!207 = metadata !{metadata !69, metadata !35, metadata !69, metadata !35}
!208 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !1, i32 620, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, %struct.stat*)* @__fd_fstat} ; [ DW_TAG_subprogram ]
!209 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !1, i32 449, metadata !210, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, %struct.stat*)* @__fd_lstat} ; [ DW_TAG_subprogram ]
!210 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !211, i32 0, null} ; [ DW_TAG_subroutine_type ]
!211 = metadata !{metadata !35, metadata !57, metadata !16}
!212 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__fd_stat", metadata !"__fd_stat", metadata !"__fd_stat", metadata !1, i32 430, metadata !210, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, %struct.stat*)* @__fd_stat} ; [ DW_TAG_subprogram ]
!213 = metadata !{i32 524334, i32 0, metadata !1, metadata !"read", metadata !"read", metadata !"read", metadata !1, i32 233, metadata !214, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i64 (i32, i8*, i64)* @read} ; [ DW_TAG_subprogram ]
!214 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !215, i32 0, null} ; [ DW_TAG_subroutine_type ]
!215 = metadata !{metadata !92, metadata !35, metadata !137, metadata !93}
!216 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__df_chmod", metadata !"__df_chmod", metadata !"", metadata !1, i32 507, metadata !217, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!217 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !218, i32 0, null} ; [ DW_TAG_subroutine_type ]
!218 = metadata !{metadata !35, metadata !5, metadata !75}
!219 = metadata !{i32 524334, i32 0, metadata !1, metadata !"fchmod", metadata !"fchmod", metadata !"fchmod", metadata !1, i32 542, metadata !220, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i32)* @fchmod} ; [ DW_TAG_subprogram ]
!220 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !221, i32 0, null} ; [ DW_TAG_subroutine_type ]
!221 = metadata !{metadata !35, metadata !35, metadata !75}
!222 = metadata !{i32 524334, i32 0, metadata !1, metadata !"chmod", metadata !"chmod", metadata !"chmod", metadata !1, i32 520, metadata !223, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, i32)* @chmod} ; [ DW_TAG_subprogram ]
!223 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !224, i32 0, null} ; [ DW_TAG_subroutine_type ]
!224 = metadata !{metadata !35, metadata !57, metadata !75}
!225 = metadata !{i32 524334, i32 0, metadata !1, metadata !"write", metadata !"write", metadata !"write", metadata !1, i32 301, metadata !214, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i64 (i32, i8*, i64)* @write} ; [ DW_TAG_subprogram ]
!226 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__fd_open", metadata !"__fd_open", metadata !"__fd_open", metadata !1, i32 128, metadata !227, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, i32, i32)* @__fd_open} ; [ DW_TAG_subprogram ]
!227 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !228, i32 0, null} ; [ DW_TAG_subroutine_type ]
!228 = metadata !{metadata !35, metadata !57, metadata !35, metadata !75}
!229 = metadata !{i32 524545, metadata !0, metadata !"pathname", metadata !1, i32 39, metadata !57} ; [ DW_TAG_arg_variable ]
!230 = metadata !{i32 524544, metadata !231, metadata !"c", metadata !1, i32 40, metadata !14} ; [ DW_TAG_auto_variable ]
!231 = metadata !{i32 524299, metadata !0, i32 39, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!232 = metadata !{i32 524544, metadata !231, metadata !"i", metadata !1, i32 41, metadata !11} ; [ DW_TAG_auto_variable ]
!233 = metadata !{i32 524544, metadata !234, metadata !"df", metadata !1, i32 48, metadata !5} ; [ DW_TAG_auto_variable ]
!234 = metadata !{i32 524299, metadata !231, i32 48, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!235 = metadata !{i32 524545, metadata !59, metadata !"fd", metadata !1, i32 63, metadata !35} ; [ DW_TAG_arg_variable ]
!236 = metadata !{i32 524544, metadata !237, metadata !"f", metadata !1, i32 65, metadata !62} ; [ DW_TAG_auto_variable ]
!237 = metadata !{i32 524299, metadata !238, i32 63, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!238 = metadata !{i32 524299, metadata !59, i32 63, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!239 = metadata !{i32 524545, metadata !72, metadata !"mask", metadata !1, i32 88, metadata !75} ; [ DW_TAG_arg_variable ]
!240 = metadata !{i32 524544, metadata !241, metadata !"r", metadata !1, i32 89, metadata !75} ; [ DW_TAG_auto_variable ]
!241 = metadata !{i32 524299, metadata !72, i32 88, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!242 = metadata !{i32 524545, metadata !76, metadata !"flags", metadata !1, i32 97, metadata !35} ; [ DW_TAG_arg_variable ]
!243 = metadata !{i32 524545, metadata !76, metadata !"s", metadata !1, i32 97, metadata !16} ; [ DW_TAG_arg_variable ]
!244 = metadata !{i32 524544, metadata !245, metadata !"write_access", metadata !1, i32 98, metadata !35} ; [ DW_TAG_auto_variable ]
!245 = metadata !{i32 524299, metadata !76, i32 97, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!246 = metadata !{i32 524544, metadata !245, metadata !"read_access", metadata !1, i32 98, metadata !35} ; [ DW_TAG_auto_variable ]
!247 = metadata !{i32 524544, metadata !245, metadata !"mode", metadata !1, i32 99, metadata !75} ; [ DW_TAG_auto_variable ]
!248 = metadata !{i32 524545, metadata !79, metadata !"path", metadata !1, i32 1294, metadata !57} ; [ DW_TAG_arg_variable ]
!249 = metadata !{i32 524545, metadata !82, metadata !"pathname", metadata !1, i32 1078, metadata !57} ; [ DW_TAG_arg_variable ]
!250 = metadata !{i32 524544, metadata !251, metadata !"dfile", metadata !1, i32 1079, metadata !5} ; [ DW_TAG_auto_variable ]
!251 = metadata !{i32 524299, metadata !82, i32 1078, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!252 = metadata !{i32 524545, metadata !83, metadata !"pathname", metadata !1, i32 1060, metadata !57} ; [ DW_TAG_arg_variable ]
!253 = metadata !{i32 524544, metadata !254, metadata !"dfile", metadata !1, i32 1061, metadata !5} ; [ DW_TAG_auto_variable ]
!254 = metadata !{i32 524299, metadata !83, i32 1060, i32 0, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!255 = metadata !{i32 524545, metadata !84, metadata !"df", metadata !1, i32 569, metadata !5} ; [ DW_TAG_arg_variable ]
!256 = metadata !{i32 524545, metadata !84, metadata !"owner", metadata !1, i32 569, metadata !87} ; [ DW_TAG_arg_variable ]
!257 = metadata !{i32 524545, metadata !84, metadata !"group", metadata !1, i32 569, metadata !88} ; [ DW_TAG_arg_variable ]
!258 = metadata !{i32 524545, metadata !89, metadata !"path", metadata !1, i32 1099, metadata !57} ; [ DW_TAG_arg_variable ]
!259 = metadata !{i32 524545, metadata !89, metadata !"buf", metadata !1, i32 1099, metadata !13} ; [ DW_TAG_arg_variable ]
!260 = metadata !{i32 524545, metadata !89, metadata !"bufsize", metadata !1, i32 1099, metadata !93} ; [ DW_TAG_arg_variable ]
!261 = metadata !{i32 524544, metadata !262, metadata !"dfile", metadata !1, i32 1100, metadata !5} ; [ DW_TAG_auto_variable ]
!262 = metadata !{i32 524299, metadata !89, i32 1099, i32 0, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
!263 = metadata !{i32 524544, metadata !264, metadata !"r", metadata !1, i32 1116, metadata !35} ; [ DW_TAG_auto_variable ]
!264 = metadata !{i32 524299, metadata !262, i32 1116, i32 0, metadata !1, i32 11} ; [ DW_TAG_lexical_block ]
!265 = metadata !{i32 524545, metadata !94, metadata !"fd", metadata !1, i32 1000, metadata !35} ; [ DW_TAG_arg_variable ]
!266 = metadata !{i32 524544, metadata !267, metadata !"f", metadata !1, i32 1001, metadata !62} ; [ DW_TAG_auto_variable ]
!267 = metadata !{i32 524299, metadata !94, i32 1000, i32 0, metadata !1, i32 12} ; [ DW_TAG_lexical_block ]
!268 = metadata !{i32 524544, metadata !269, metadata !"r", metadata !1, i32 1009, metadata !35} ; [ DW_TAG_auto_variable ]
!269 = metadata !{i32 524299, metadata !267, i32 1009, i32 0, metadata !1, i32 13} ; [ DW_TAG_lexical_block ]
!270 = metadata !{i32 524545, metadata !97, metadata !"fd", metadata !1, i32 980, metadata !35} ; [ DW_TAG_arg_variable ]
!271 = metadata !{i32 524545, metadata !97, metadata !"buf", metadata !1, i32 980, metadata !100} ; [ DW_TAG_arg_variable ]
!272 = metadata !{i32 524544, metadata !273, metadata !"f", metadata !1, i32 981, metadata !62} ; [ DW_TAG_auto_variable ]
!273 = metadata !{i32 524299, metadata !97, i32 980, i32 0, metadata !1, i32 14} ; [ DW_TAG_lexical_block ]
!274 = metadata !{i32 524544, metadata !275, metadata !"r", metadata !1, i32 993, metadata !35} ; [ DW_TAG_auto_variable ]
!275 = metadata !{i32 524299, metadata !273, i32 993, i32 0, metadata !1, i32 15} ; [ DW_TAG_lexical_block ]
!276 = metadata !{i32 524545, metadata !127, metadata !"fd", metadata !1, i32 643, metadata !35} ; [ DW_TAG_arg_variable ]
!277 = metadata !{i32 524545, metadata !127, metadata !"length", metadata !1, i32 643, metadata !69} ; [ DW_TAG_arg_variable ]
!278 = metadata !{i32 524544, metadata !279, metadata !"f", metadata !1, i32 645, metadata !62} ; [ DW_TAG_auto_variable ]
!279 = metadata !{i32 524299, metadata !127, i32 643, i32 0, metadata !1, i32 16} ; [ DW_TAG_lexical_block ]
!280 = metadata !{i32 524544, metadata !281, metadata !"r", metadata !1, i32 666, metadata !35} ; [ DW_TAG_auto_variable ]
!281 = metadata !{i32 524299, metadata !279, i32 666, i32 0, metadata !1, i32 17} ; [ DW_TAG_lexical_block ]
!282 = metadata !{i32 524340, i32 0, metadata !127, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 644, metadata !35, i1 true, i1 true, i32* @n_calls.5116} ; [ DW_TAG_variable ]
!283 = metadata !{i32 524340, i32 0, metadata !141, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 1218, metadata !35, i1 true, i1 true, i32* @n_calls.5676} ; [ DW_TAG_variable ]
!284 = metadata !{i32 524340, i32 0, metadata !178, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 202, metadata !35, i1 true, i1 true, i32* @n_calls.4743} ; [ DW_TAG_variable ]
!285 = metadata !{i32 524340, i32 0, metadata !213, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 234, metadata !35, i1 true, i1 true, i32* @n_calls.4763} ; [ DW_TAG_variable ]
!286 = metadata !{i32 524340, i32 0, metadata !219, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 543, metadata !35, i1 true, i1 true, i32* @n_calls.5023} ; [ DW_TAG_variable ]
!287 = metadata !{i32 524340, i32 0, metadata !222, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 521, metadata !35, i1 true, i1 true, i32* @n_calls.5000} ; [ DW_TAG_variable ]
!288 = metadata !{i32 524340, i32 0, metadata !225, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 302, metadata !35, i1 true, i1 true, i32* @n_calls.4824} ; [ DW_TAG_variable ]
!289 = metadata !{i32 524545, metadata !130, metadata !"fd", metadata !1, i32 588, metadata !35} ; [ DW_TAG_arg_variable ]
!290 = metadata !{i32 524545, metadata !130, metadata !"owner", metadata !1, i32 588, metadata !87} ; [ DW_TAG_arg_variable ]
!291 = metadata !{i32 524545, metadata !130, metadata !"group", metadata !1, i32 588, metadata !88} ; [ DW_TAG_arg_variable ]
!292 = metadata !{i32 524544, metadata !293, metadata !"f", metadata !1, i32 589, metadata !62} ; [ DW_TAG_auto_variable ]
!293 = metadata !{i32 524299, metadata !130, i32 588, i32 0, metadata !1, i32 18} ; [ DW_TAG_lexical_block ]
!294 = metadata !{i32 524544, metadata !295, metadata !"r", metadata !1, i32 599, metadata !35} ; [ DW_TAG_auto_variable ]
!295 = metadata !{i32 524299, metadata !293, i32 599, i32 0, metadata !1, i32 19} ; [ DW_TAG_lexical_block ]
!296 = metadata !{i32 524545, metadata !133, metadata !"fd", metadata !1, i32 486, metadata !35} ; [ DW_TAG_arg_variable ]
!297 = metadata !{i32 524544, metadata !298, metadata !"f", metadata !1, i32 487, metadata !62} ; [ DW_TAG_auto_variable ]
!298 = metadata !{i32 524299, metadata !133, i32 486, i32 0, metadata !1, i32 20} ; [ DW_TAG_lexical_block ]
!299 = metadata !{i32 524544, metadata !300, metadata !"r", metadata !1, i32 499, metadata !35} ; [ DW_TAG_auto_variable ]
!300 = metadata !{i32 524299, metadata !298, i32 499, i32 0, metadata !1, i32 21} ; [ DW_TAG_lexical_block ]
!301 = metadata !{i32 524545, metadata !134, metadata !"p", metadata !1, i32 1252, metadata !137} ; [ DW_TAG_arg_variable ]
!302 = metadata !{i32 524544, metadata !303, metadata !"pc", metadata !1, i32 1254, metadata !13} ; [ DW_TAG_auto_variable ]
!303 = metadata !{i32 524299, metadata !134, i32 1252, i32 0, metadata !1, i32 22} ; [ DW_TAG_lexical_block ]
!304 = metadata !{i32 524545, metadata !138, metadata !"s", metadata !1, i32 1259, metadata !93} ; [ DW_TAG_arg_variable ]
!305 = metadata !{i32 524544, metadata !306, metadata !"sc", metadata !1, i32 1260, metadata !93} ; [ DW_TAG_auto_variable ]
!306 = metadata !{i32 524299, metadata !138, i32 1259, i32 0, metadata !1, i32 23} ; [ DW_TAG_lexical_block ]
!307 = metadata !{i32 524545, metadata !141, metadata !"buf", metadata !1, i32 1217, metadata !13} ; [ DW_TAG_arg_variable ]
!308 = metadata !{i32 524545, metadata !141, metadata !"size", metadata !1, i32 1217, metadata !93} ; [ DW_TAG_arg_variable ]
!309 = metadata !{i32 524544, metadata !310, metadata !"r", metadata !1, i32 1219, metadata !35} ; [ DW_TAG_auto_variable ]
!310 = metadata !{i32 524299, metadata !141, i32 1217, i32 0, metadata !1, i32 24} ; [ DW_TAG_lexical_block ]
!311 = metadata !{i32 524545, metadata !144, metadata !"s", metadata !1, i32 1265, metadata !57} ; [ DW_TAG_arg_variable ]
!312 = metadata !{i32 524544, metadata !313, metadata !"sc", metadata !1, i32 1266, metadata !13} ; [ DW_TAG_auto_variable ]
!313 = metadata !{i32 524299, metadata !144, i32 1265, i32 0, metadata !1, i32 25} ; [ DW_TAG_lexical_block ]
!314 = metadata !{i32 524544, metadata !313, metadata !"i", metadata !1, i32 1267, metadata !11} ; [ DW_TAG_auto_variable ]
!315 = metadata !{i32 524544, metadata !316, metadata !"c", metadata !1, i32 1270, metadata !14} ; [ DW_TAG_auto_variable ]
!316 = metadata !{i32 524299, metadata !313, i32 1270, i32 0, metadata !1, i32 26} ; [ DW_TAG_lexical_block ]
!317 = metadata !{i32 524544, metadata !318, metadata !"cc", metadata !1, i32 1279, metadata !14} ; [ DW_TAG_auto_variable ]
!318 = metadata !{i32 524299, metadata !316, i32 1279, i32 0, metadata !1, i32 27} ; [ DW_TAG_lexical_block ]
!319 = metadata !{i32 524545, metadata !147, metadata !"path", metadata !1, i32 963, metadata !57} ; [ DW_TAG_arg_variable ]
!320 = metadata !{i32 524545, metadata !147, metadata !"buf", metadata !1, i32 963, metadata !100} ; [ DW_TAG_arg_variable ]
!321 = metadata !{i32 524544, metadata !322, metadata !"dfile", metadata !1, i32 964, metadata !5} ; [ DW_TAG_auto_variable ]
!322 = metadata !{i32 524299, metadata !147, i32 963, i32 0, metadata !1, i32 28} ; [ DW_TAG_lexical_block ]
!323 = metadata !{i32 524544, metadata !324, metadata !"r", metadata !1, i32 973, metadata !35} ; [ DW_TAG_auto_variable ]
!324 = metadata !{i32 524299, metadata !322, i32 973, i32 0, metadata !1, i32 29} ; [ DW_TAG_lexical_block ]
!325 = metadata !{i32 524545, metadata !150, metadata !"path", metadata !1, i32 606, metadata !57} ; [ DW_TAG_arg_variable ]
!326 = metadata !{i32 524545, metadata !150, metadata !"owner", metadata !1, i32 606, metadata !87} ; [ DW_TAG_arg_variable ]
!327 = metadata !{i32 524545, metadata !150, metadata !"group", metadata !1, i32 606, metadata !88} ; [ DW_TAG_arg_variable ]
!328 = metadata !{i32 524544, metadata !329, metadata !"df", metadata !1, i32 608, metadata !5} ; [ DW_TAG_auto_variable ]
!329 = metadata !{i32 524299, metadata !150, i32 606, i32 0, metadata !1, i32 30} ; [ DW_TAG_lexical_block ]
!330 = metadata !{i32 524544, metadata !331, metadata !"r", metadata !1, i32 613, metadata !35} ; [ DW_TAG_auto_variable ]
!331 = metadata !{i32 524299, metadata !329, i32 613, i32 0, metadata !1, i32 31} ; [ DW_TAG_lexical_block ]
!332 = metadata !{i32 524545, metadata !153, metadata !"path", metadata !1, i32 575, metadata !57} ; [ DW_TAG_arg_variable ]
!333 = metadata !{i32 524545, metadata !153, metadata !"owner", metadata !1, i32 575, metadata !87} ; [ DW_TAG_arg_variable ]
!334 = metadata !{i32 524545, metadata !153, metadata !"group", metadata !1, i32 575, metadata !88} ; [ DW_TAG_arg_variable ]
!335 = metadata !{i32 524544, metadata !336, metadata !"df", metadata !1, i32 576, metadata !5} ; [ DW_TAG_auto_variable ]
!336 = metadata !{i32 524299, metadata !153, i32 575, i32 0, metadata !1, i32 32} ; [ DW_TAG_lexical_block ]
!337 = metadata !{i32 524544, metadata !338, metadata !"r", metadata !1, i32 581, metadata !35} ; [ DW_TAG_auto_variable ]
!338 = metadata !{i32 524299, metadata !336, i32 581, i32 0, metadata !1, i32 33} ; [ DW_TAG_lexical_block ]
!339 = metadata !{i32 524545, metadata !154, metadata !"path", metadata !1, i32 468, metadata !57} ; [ DW_TAG_arg_variable ]
!340 = metadata !{i32 524544, metadata !341, metadata !"dfile", metadata !1, i32 469, metadata !5} ; [ DW_TAG_auto_variable ]
!341 = metadata !{i32 524299, metadata !154, i32 468, i32 0, metadata !1, i32 34} ; [ DW_TAG_lexical_block ]
!342 = metadata !{i32 524544, metadata !343, metadata !"r", metadata !1, i32 479, metadata !35} ; [ DW_TAG_auto_variable ]
!343 = metadata !{i32 524299, metadata !341, i32 479, i32 0, metadata !1, i32 35} ; [ DW_TAG_lexical_block ]
!344 = metadata !{i32 524545, metadata !155, metadata !"pathname", metadata !1, i32 73, metadata !57} ; [ DW_TAG_arg_variable ]
!345 = metadata !{i32 524545, metadata !155, metadata !"mode", metadata !1, i32 73, metadata !35} ; [ DW_TAG_arg_variable ]
!346 = metadata !{i32 524544, metadata !347, metadata !"dfile", metadata !1, i32 74, metadata !5} ; [ DW_TAG_auto_variable ]
!347 = metadata !{i32 524299, metadata !155, i32 73, i32 0, metadata !1, i32 36} ; [ DW_TAG_lexical_block ]
!348 = metadata !{i32 524544, metadata !349, metadata !"r", metadata !1, i32 81, metadata !35} ; [ DW_TAG_auto_variable ]
!349 = metadata !{i32 524299, metadata !347, i32 81, i32 0, metadata !1, i32 37} ; [ DW_TAG_lexical_block ]
!350 = metadata !{i32 524545, metadata !158, metadata !"nfds", metadata !1, i32 1131, metadata !35} ; [ DW_TAG_arg_variable ]
!351 = metadata !{i32 524545, metadata !158, metadata !"read", metadata !1, i32 1131, metadata !161} ; [ DW_TAG_arg_variable ]
!352 = metadata !{i32 524545, metadata !158, metadata !"write", metadata !1, i32 1131, metadata !161} ; [ DW_TAG_arg_variable ]
!353 = metadata !{i32 524545, metadata !158, metadata !"except", metadata !1, i32 1132, metadata !161} ; [ DW_TAG_arg_variable ]
!354 = metadata !{i32 524545, metadata !158, metadata !"timeout", metadata !1, i32 1132, metadata !171} ; [ DW_TAG_arg_variable ]
!355 = metadata !{i32 524544, metadata !356, metadata !"in_read", metadata !1, i32 1133, metadata !162} ; [ DW_TAG_auto_variable ]
!356 = metadata !{i32 524299, metadata !158, i32 1132, i32 0, metadata !1, i32 38} ; [ DW_TAG_lexical_block ]
!357 = metadata !{i32 524544, metadata !356, metadata !"in_write", metadata !1, i32 1133, metadata !162} ; [ DW_TAG_auto_variable ]
!358 = metadata !{i32 524544, metadata !356, metadata !"in_except", metadata !1, i32 1133, metadata !162} ; [ DW_TAG_auto_variable ]
!359 = metadata !{i32 524544, metadata !356, metadata !"os_read", metadata !1, i32 1133, metadata !162} ; [ DW_TAG_auto_variable ]
!360 = metadata !{i32 524544, metadata !356, metadata !"os_write", metadata !1, i32 1133, metadata !162} ; [ DW_TAG_auto_variable ]
!361 = metadata !{i32 524544, metadata !356, metadata !"os_except", metadata !1, i32 1133, metadata !162} ; [ DW_TAG_auto_variable ]
!362 = metadata !{i32 524544, metadata !356, metadata !"i", metadata !1, i32 1134, metadata !35} ; [ DW_TAG_auto_variable ]
!363 = metadata !{i32 524544, metadata !356, metadata !"count", metadata !1, i32 1134, metadata !35} ; [ DW_TAG_auto_variable ]
!364 = metadata !{i32 524544, metadata !356, metadata !"os_nfds", metadata !1, i32 1134, metadata !35} ; [ DW_TAG_auto_variable ]
!365 = metadata !{i32 524544, metadata !366, metadata !"f", metadata !1, i32 1164, metadata !62} ; [ DW_TAG_auto_variable ]
!366 = metadata !{i32 524299, metadata !356, i32 1164, i32 0, metadata !1, i32 39} ; [ DW_TAG_lexical_block ]
!367 = metadata !{i32 524544, metadata !368, metadata !"tv", metadata !1, i32 1186, metadata !172} ; [ DW_TAG_auto_variable ]
!368 = metadata !{i32 524299, metadata !356, i32 1186, i32 0, metadata !1, i32 40} ; [ DW_TAG_lexical_block ]
!369 = metadata !{i32 524544, metadata !368, metadata !"r", metadata !1, i32 1187, metadata !35} ; [ DW_TAG_auto_variable ]
!370 = metadata !{i32 524544, metadata !371, metadata !"f", metadata !1, i32 1202, metadata !62} ; [ DW_TAG_auto_variable ]
!371 = metadata !{i32 524299, metadata !368, i32 1202, i32 0, metadata !1, i32 41} ; [ DW_TAG_lexical_block ]
!372 = metadata !{i32 524545, metadata !178, metadata !"fd", metadata !1, i32 201, metadata !35} ; [ DW_TAG_arg_variable ]
!373 = metadata !{i32 524544, metadata !374, metadata !"f", metadata !1, i32 203, metadata !62} ; [ DW_TAG_auto_variable ]
!374 = metadata !{i32 524299, metadata !178, i32 201, i32 0, metadata !1, i32 42} ; [ DW_TAG_lexical_block ]
!375 = metadata !{i32 524544, metadata !374, metadata !"r", metadata !1, i32 204, metadata !35} ; [ DW_TAG_auto_variable ]
!376 = metadata !{i32 524545, metadata !179, metadata !"oldfd", metadata !1, i32 1016, metadata !35} ; [ DW_TAG_arg_variable ]
!377 = metadata !{i32 524545, metadata !179, metadata !"newfd", metadata !1, i32 1016, metadata !35} ; [ DW_TAG_arg_variable ]
!378 = metadata !{i32 524544, metadata !379, metadata !"f", metadata !1, i32 1017, metadata !62} ; [ DW_TAG_auto_variable ]
!379 = metadata !{i32 524299, metadata !179, i32 1016, i32 0, metadata !1, i32 43} ; [ DW_TAG_lexical_block ]
!380 = metadata !{i32 524544, metadata !381, metadata !"f2", metadata !1, i32 1023, metadata !62} ; [ DW_TAG_auto_variable ]
!381 = metadata !{i32 524299, metadata !379, i32 1023, i32 0, metadata !1, i32 44} ; [ DW_TAG_lexical_block ]
!382 = metadata !{i32 524545, metadata !182, metadata !"oldfd", metadata !1, i32 1041, metadata !35} ; [ DW_TAG_arg_variable ]
!383 = metadata !{i32 524544, metadata !384, metadata !"f", metadata !1, i32 1042, metadata !62} ; [ DW_TAG_auto_variable ]
!384 = metadata !{i32 524299, metadata !182, i32 1041, i32 0, metadata !1, i32 45} ; [ DW_TAG_lexical_block ]
!385 = metadata !{i32 524544, metadata !386, metadata !"fd", metadata !1, i32 1047, metadata !35} ; [ DW_TAG_auto_variable ]
!386 = metadata !{i32 524299, metadata !384, i32 1048, i32 0, metadata !1, i32 46} ; [ DW_TAG_lexical_block ]
!387 = metadata !{i32 524545, metadata !183, metadata !"fd", metadata !1, i32 908, metadata !35} ; [ DW_TAG_arg_variable ]
!388 = metadata !{i32 524545, metadata !183, metadata !"cmd", metadata !1, i32 908, metadata !35} ; [ DW_TAG_arg_variable ]
!389 = metadata !{i32 524544, metadata !390, metadata !"f", metadata !1, i32 909, metadata !62} ; [ DW_TAG_auto_variable ]
!390 = metadata !{i32 524299, metadata !183, i32 908, i32 0, metadata !1, i32 47} ; [ DW_TAG_lexical_block ]
!391 = metadata !{i32 524544, metadata !390, metadata !"ap", metadata !1, i32 910, metadata !392} ; [ DW_TAG_auto_variable ]
!392 = metadata !{i32 524310, metadata !393, metadata !"va_list", metadata !393, i32 111, i64 0, i64 0, i64 0, i32 0, metadata !394} ; [ DW_TAG_typedef ]
!393 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!394 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 192, i64 64, i64 0, i32 0, metadata !395, metadata !402, i32 0, null} ; [ DW_TAG_array_type ]
!395 = metadata !{i32 524307, metadata !1, metadata !"__va_list_tag", metadata !396, i32 0, i64 192, i64 64, i64 0, i32 0, null, metadata !397, i32 0, null} ; [ DW_TAG_structure_type ]
!396 = metadata !{i32 524329, metadata !"<built-in>", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!397 = metadata !{metadata !398, metadata !399, metadata !400, metadata !401}
!398 = metadata !{i32 524301, metadata !395, metadata !"gp_offset", metadata !396, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!399 = metadata !{i32 524301, metadata !395, metadata !"fp_offset", metadata !396, i32 0, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ]
!400 = metadata !{i32 524301, metadata !395, metadata !"overflow_arg_area", metadata !396, i32 0, i64 64, i64 64, i64 64, i32 0, metadata !137} ; [ DW_TAG_member ]
!401 = metadata !{i32 524301, metadata !395, metadata !"reg_save_area", metadata !396, i32 0, i64 64, i64 64, i64 128, i32 0, metadata !137} ; [ DW_TAG_member ]
!402 = metadata !{metadata !403}
!403 = metadata !{i32 524321, i64 0, i64 0}       ; [ DW_TAG_subrange_type ]
!404 = metadata !{i32 524544, metadata !390, metadata !"arg", metadata !1, i32 911, metadata !11} ; [ DW_TAG_auto_variable ]
!405 = metadata !{i32 524544, metadata !406, metadata !"flags", metadata !1, i32 930, metadata !35} ; [ DW_TAG_auto_variable ]
!406 = metadata !{i32 524299, metadata !390, i32 930, i32 0, metadata !1, i32 48} ; [ DW_TAG_lexical_block ]
!407 = metadata !{i32 524544, metadata !408, metadata !"r", metadata !1, i32 956, metadata !35} ; [ DW_TAG_auto_variable ]
!408 = metadata !{i32 524299, metadata !390, i32 956, i32 0, metadata !1, i32 49} ; [ DW_TAG_lexical_block ]
!409 = metadata !{i32 524545, metadata !184, metadata !"fd", metadata !1, i32 758, metadata !35} ; [ DW_TAG_arg_variable ]
!410 = metadata !{i32 524545, metadata !184, metadata !"request", metadata !1, i32 758, metadata !23} ; [ DW_TAG_arg_variable ]
!411 = metadata !{i32 524544, metadata !412, metadata !"f", metadata !1, i32 762, metadata !62} ; [ DW_TAG_auto_variable ]
!412 = metadata !{i32 524299, metadata !184, i32 758, i32 0, metadata !1, i32 50} ; [ DW_TAG_lexical_block ]
!413 = metadata !{i32 524544, metadata !412, metadata !"ap", metadata !1, i32 763, metadata !392} ; [ DW_TAG_auto_variable ]
!414 = metadata !{i32 524544, metadata !412, metadata !"buf", metadata !1, i32 764, metadata !137} ; [ DW_TAG_auto_variable ]
!415 = metadata !{i32 524544, metadata !416, metadata !"stat", metadata !1, i32 780, metadata !417} ; [ DW_TAG_auto_variable ]
!416 = metadata !{i32 524299, metadata !412, i32 780, i32 0, metadata !1, i32 51} ; [ DW_TAG_lexical_block ]
!417 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !418} ; [ DW_TAG_pointer_type ]
!418 = metadata !{i32 524307, metadata !1, metadata !"stat", metadata !20, i32 47, i64 1152, i64 64, i64 0, i32 0, null, metadata !419, i32 0, null} ; [ DW_TAG_structure_type ]
!419 = metadata !{metadata !420, metadata !421, metadata !423, metadata !424, metadata !425, metadata !426, metadata !427, metadata !428, metadata !429, metadata !430, metadata !431, metadata !433, metadata !434, metadata !435, metadata !436}
!420 = metadata !{i32 524301, metadata !418, metadata !"st_dev", metadata !20, i32 48, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ]
!421 = metadata !{i32 524301, metadata !418, metadata !"st_ino", metadata !20, i32 53, i64 64, i64 64, i64 64, i32 0, metadata !422} ; [ DW_TAG_member ]
!422 = metadata !{i32 524310, metadata !22, metadata !"__ino_t", metadata !22, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!423 = metadata !{i32 524301, metadata !418, metadata !"st_nlink", metadata !20, i32 61, i64 64, i64 64, i64 128, i32 0, metadata !27} ; [ DW_TAG_member ]
!424 = metadata !{i32 524301, metadata !418, metadata !"st_mode", metadata !20, i32 62, i64 32, i64 32, i64 192, i32 0, metadata !29} ; [ DW_TAG_member ]
!425 = metadata !{i32 524301, metadata !418, metadata !"st_uid", metadata !20, i32 64, i64 32, i64 32, i64 224, i32 0, metadata !31} ; [ DW_TAG_member ]
!426 = metadata !{i32 524301, metadata !418, metadata !"st_gid", metadata !20, i32 65, i64 32, i64 32, i64 256, i32 0, metadata !33} ; [ DW_TAG_member ]
!427 = metadata !{i32 524301, metadata !418, metadata !"__pad0", metadata !20, i32 67, i64 32, i64 32, i64 288, i32 0, metadata !35} ; [ DW_TAG_member ]
!428 = metadata !{i32 524301, metadata !418, metadata !"st_rdev", metadata !20, i32 69, i64 64, i64 64, i64 320, i32 0, metadata !21} ; [ DW_TAG_member ]
!429 = metadata !{i32 524301, metadata !418, metadata !"st_size", metadata !20, i32 74, i64 64, i64 64, i64 384, i32 0, metadata !38} ; [ DW_TAG_member ]
!430 = metadata !{i32 524301, metadata !418, metadata !"st_blksize", metadata !20, i32 78, i64 64, i64 64, i64 448, i32 0, metadata !41} ; [ DW_TAG_member ]
!431 = metadata !{i32 524301, metadata !418, metadata !"st_blocks", metadata !20, i32 80, i64 64, i64 64, i64 512, i32 0, metadata !432} ; [ DW_TAG_member ]
!432 = metadata !{i32 524310, metadata !22, metadata !"__blkcnt_t", metadata !22, i32 170, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!433 = metadata !{i32 524301, metadata !418, metadata !"st_atim", metadata !20, i32 91, i64 128, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ]
!434 = metadata !{i32 524301, metadata !418, metadata !"st_mtim", metadata !20, i32 92, i64 128, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ]
!435 = metadata !{i32 524301, metadata !418, metadata !"st_ctim", metadata !20, i32 93, i64 128, i64 64, i64 832, i32 0, metadata !45} ; [ DW_TAG_member ]
!436 = metadata !{i32 524301, metadata !418, metadata !"__unused", metadata !20, i32 106, i64 192, i64 64, i64 960, i32 0, metadata !54} ; [ DW_TAG_member ]
!437 = metadata !{i32 524544, metadata !438, metadata !"ts", metadata !1, i32 784, metadata !439} ; [ DW_TAG_auto_variable ]
!438 = metadata !{i32 524299, metadata !416, i32 784, i32 0, metadata !1, i32 52} ; [ DW_TAG_lexical_block ]
!439 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !440} ; [ DW_TAG_pointer_type ]
!440 = metadata !{i32 524307, metadata !1, metadata !"termios", metadata !441, i32 31, i64 480, i64 32, i64 0, i32 0, null, metadata !442, i32 0, null} ; [ DW_TAG_structure_type ]
!441 = metadata !{i32 524329, metadata !"termios.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!442 = metadata !{metadata !443, metadata !445, metadata !446, metadata !447, metadata !448, metadata !450, metadata !454, metadata !456}
!443 = metadata !{i32 524301, metadata !440, metadata !"c_iflag", metadata !441, i32 32, i64 32, i64 32, i64 0, i32 0, metadata !444} ; [ DW_TAG_member ]
!444 = metadata !{i32 524310, metadata !441, metadata !"tcflag_t", metadata !441, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!445 = metadata !{i32 524301, metadata !440, metadata !"c_oflag", metadata !441, i32 33, i64 32, i64 32, i64 32, i32 0, metadata !444} ; [ DW_TAG_member ]
!446 = metadata !{i32 524301, metadata !440, metadata !"c_cflag", metadata !441, i32 34, i64 32, i64 32, i64 64, i32 0, metadata !444} ; [ DW_TAG_member ]
!447 = metadata !{i32 524301, metadata !440, metadata !"c_lflag", metadata !441, i32 35, i64 32, i64 32, i64 96, i32 0, metadata !444} ; [ DW_TAG_member ]
!448 = metadata !{i32 524301, metadata !440, metadata !"c_line", metadata !441, i32 36, i64 8, i64 8, i64 128, i32 0, metadata !449} ; [ DW_TAG_member ]
!449 = metadata !{i32 524310, metadata !441, metadata !"cc_t", metadata !441, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !200} ; [ DW_TAG_typedef ]
!450 = metadata !{i32 524301, metadata !440, metadata !"c_cc", metadata !441, i32 37, i64 256, i64 8, i64 136, i32 0, metadata !451} ; [ DW_TAG_member ]
!451 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 256, i64 8, i64 0, i32 0, metadata !449, metadata !452, i32 0, null} ; [ DW_TAG_array_type ]
!452 = metadata !{metadata !453}
!453 = metadata !{i32 524321, i64 0, i64 31}      ; [ DW_TAG_subrange_type ]
!454 = metadata !{i32 524301, metadata !440, metadata !"c_ispeed", metadata !441, i32 38, i64 32, i64 32, i64 416, i32 0, metadata !455} ; [ DW_TAG_member ]
!455 = metadata !{i32 524310, metadata !441, metadata !"speed_t", metadata !441, i32 27, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!456 = metadata !{i32 524301, metadata !440, metadata !"c_ospeed", metadata !441, i32 39, i64 32, i64 32, i64 448, i32 0, metadata !455} ; [ DW_TAG_member ]
!457 = metadata !{i32 524544, metadata !458, metadata !"ws", metadata !1, i32 853, metadata !459} ; [ DW_TAG_auto_variable ]
!458 = metadata !{i32 524299, metadata !416, i32 853, i32 0, metadata !1, i32 53} ; [ DW_TAG_lexical_block ]
!459 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !460} ; [ DW_TAG_pointer_type ]
!460 = metadata !{i32 524307, metadata !1, metadata !"winsize", metadata !461, i32 29, i64 64, i64 16, i64 0, i32 0, null, metadata !462, i32 0, null} ; [ DW_TAG_structure_type ]
!461 = metadata !{i32 524329, metadata !"ioctl-types.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!462 = metadata !{metadata !463, metadata !464, metadata !465, metadata !466}
!463 = metadata !{i32 524301, metadata !460, metadata !"ws_row", metadata !461, i32 30, i64 16, i64 16, i64 0, i32 0, metadata !198} ; [ DW_TAG_member ]
!464 = metadata !{i32 524301, metadata !460, metadata !"ws_col", metadata !461, i32 31, i64 16, i64 16, i64 16, i32 0, metadata !198} ; [ DW_TAG_member ]
!465 = metadata !{i32 524301, metadata !460, metadata !"ws_xpixel", metadata !461, i32 32, i64 16, i64 16, i64 32, i32 0, metadata !198} ; [ DW_TAG_member ]
!466 = metadata !{i32 524301, metadata !460, metadata !"ws_ypixel", metadata !461, i32 33, i64 16, i64 16, i64 48, i32 0, metadata !198} ; [ DW_TAG_member ]
!467 = metadata !{i32 524544, metadata !468, metadata !"res", metadata !1, i32 876, metadata !469} ; [ DW_TAG_auto_variable ]
!468 = metadata !{i32 524299, metadata !416, i32 876, i32 0, metadata !1, i32 54} ; [ DW_TAG_lexical_block ]
!469 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ]
!470 = metadata !{i32 524544, metadata !471, metadata !"r", metadata !1, i32 901, metadata !35} ; [ DW_TAG_auto_variable ]
!471 = metadata !{i32 524299, metadata !412, i32 901, i32 0, metadata !1, i32 55} ; [ DW_TAG_lexical_block ]
!472 = metadata !{i32 524545, metadata !187, metadata !"fd", metadata !1, i32 676, metadata !11} ; [ DW_TAG_arg_variable ]
!473 = metadata !{i32 524545, metadata !187, metadata !"dirp", metadata !1, i32 676, metadata !190} ; [ DW_TAG_arg_variable ]
!474 = metadata !{i32 524545, metadata !187, metadata !"count", metadata !1, i32 676, metadata !11} ; [ DW_TAG_arg_variable ]
!475 = metadata !{i32 524544, metadata !476, metadata !"f", metadata !1, i32 677, metadata !62} ; [ DW_TAG_auto_variable ]
!476 = metadata !{i32 524299, metadata !187, i32 676, i32 0, metadata !1, i32 56} ; [ DW_TAG_lexical_block ]
!477 = metadata !{i32 524544, metadata !478, metadata !"i", metadata !1, i32 691, metadata !11} ; [ DW_TAG_auto_variable ]
!478 = metadata !{i32 524299, metadata !476, i32 691, i32 0, metadata !1, i32 57} ; [ DW_TAG_lexical_block ]
!479 = metadata !{i32 524544, metadata !478, metadata !"pad", metadata !1, i32 691, metadata !11} ; [ DW_TAG_auto_variable ]
!480 = metadata !{i32 524544, metadata !478, metadata !"bytes", metadata !1, i32 691, metadata !11} ; [ DW_TAG_auto_variable ]
!481 = metadata !{i32 524544, metadata !482, metadata !"df", metadata !1, i32 701, metadata !5} ; [ DW_TAG_auto_variable ]
!482 = metadata !{i32 524299, metadata !478, i32 701, i32 0, metadata !1, i32 58} ; [ DW_TAG_lexical_block ]
!483 = metadata !{i32 524544, metadata !484, metadata !"os_pos", metadata !1, i32 723, metadata !11} ; [ DW_TAG_auto_variable ]
!484 = metadata !{i32 524299, metadata !476, i32 723, i32 0, metadata !1, i32 59} ; [ DW_TAG_lexical_block ]
!485 = metadata !{i32 524544, metadata !484, metadata !"res", metadata !1, i32 724, metadata !35} ; [ DW_TAG_auto_variable ]
!486 = metadata !{i32 524544, metadata !484, metadata !"s", metadata !1, i32 724, metadata !35} ; [ DW_TAG_auto_variable ]
!487 = metadata !{i32 524544, metadata !488, metadata !"pos", metadata !1, i32 740, metadata !35} ; [ DW_TAG_auto_variable ]
!488 = metadata !{i32 524299, metadata !484, i32 740, i32 0, metadata !1, i32 60} ; [ DW_TAG_lexical_block ]
!489 = metadata !{i32 524544, metadata !490, metadata !"dp", metadata !1, i32 747, metadata !190} ; [ DW_TAG_auto_variable ]
!490 = metadata !{i32 524299, metadata !488, i32 747, i32 0, metadata !1, i32 61} ; [ DW_TAG_lexical_block ]
!491 = metadata !{i32 524545, metadata !205, metadata !"fd", metadata !1, i32 373, metadata !35} ; [ DW_TAG_arg_variable ]
!492 = metadata !{i32 524545, metadata !205, metadata !"offset", metadata !1, i32 373, metadata !69} ; [ DW_TAG_arg_variable ]
!493 = metadata !{i32 524545, metadata !205, metadata !"whence", metadata !1, i32 373, metadata !35} ; [ DW_TAG_arg_variable ]
!494 = metadata !{i32 524544, metadata !495, metadata !"new_off", metadata !1, i32 374, metadata !69} ; [ DW_TAG_auto_variable ]
!495 = metadata !{i32 524299, metadata !205, i32 373, i32 0, metadata !1, i32 62} ; [ DW_TAG_lexical_block ]
!496 = metadata !{i32 524544, metadata !495, metadata !"f", metadata !1, i32 375, metadata !62} ; [ DW_TAG_auto_variable ]
!497 = metadata !{i32 524545, metadata !208, metadata !"fd", metadata !1, i32 620, metadata !35} ; [ DW_TAG_arg_variable ]
!498 = metadata !{i32 524545, metadata !208, metadata !"buf", metadata !1, i32 620, metadata !16} ; [ DW_TAG_arg_variable ]
!499 = metadata !{i32 524544, metadata !500, metadata !"f", metadata !1, i32 621, metadata !62} ; [ DW_TAG_auto_variable ]
!500 = metadata !{i32 524299, metadata !208, i32 620, i32 0, metadata !1, i32 63} ; [ DW_TAG_lexical_block ]
!501 = metadata !{i32 524544, metadata !502, metadata !"r", metadata !1, i32 630, metadata !35} ; [ DW_TAG_auto_variable ]
!502 = metadata !{i32 524299, metadata !500, i32 630, i32 0, metadata !1, i32 64} ; [ DW_TAG_lexical_block ]
!503 = metadata !{i32 524545, metadata !209, metadata !"path", metadata !1, i32 449, metadata !57} ; [ DW_TAG_arg_variable ]
!504 = metadata !{i32 524545, metadata !209, metadata !"buf", metadata !1, i32 449, metadata !16} ; [ DW_TAG_arg_variable ]
!505 = metadata !{i32 524544, metadata !506, metadata !"dfile", metadata !1, i32 450, metadata !5} ; [ DW_TAG_auto_variable ]
!506 = metadata !{i32 524299, metadata !209, i32 449, i32 0, metadata !1, i32 65} ; [ DW_TAG_lexical_block ]
!507 = metadata !{i32 524544, metadata !508, metadata !"r", metadata !1, i32 458, metadata !35} ; [ DW_TAG_auto_variable ]
!508 = metadata !{i32 524299, metadata !506, i32 458, i32 0, metadata !1, i32 66} ; [ DW_TAG_lexical_block ]
!509 = metadata !{i32 524545, metadata !212, metadata !"path", metadata !1, i32 430, metadata !57} ; [ DW_TAG_arg_variable ]
!510 = metadata !{i32 524545, metadata !212, metadata !"buf", metadata !1, i32 430, metadata !16} ; [ DW_TAG_arg_variable ]
!511 = metadata !{i32 524544, metadata !512, metadata !"dfile", metadata !1, i32 431, metadata !5} ; [ DW_TAG_auto_variable ]
!512 = metadata !{i32 524299, metadata !212, i32 430, i32 0, metadata !1, i32 67} ; [ DW_TAG_lexical_block ]
!513 = metadata !{i32 524544, metadata !514, metadata !"r", metadata !1, i32 439, metadata !35} ; [ DW_TAG_auto_variable ]
!514 = metadata !{i32 524299, metadata !512, i32 439, i32 0, metadata !1, i32 68} ; [ DW_TAG_lexical_block ]
!515 = metadata !{i32 524545, metadata !213, metadata !"fd", metadata !1, i32 233, metadata !35} ; [ DW_TAG_arg_variable ]
!516 = metadata !{i32 524545, metadata !213, metadata !"buf", metadata !1, i32 233, metadata !137} ; [ DW_TAG_arg_variable ]
!517 = metadata !{i32 524545, metadata !213, metadata !"count", metadata !1, i32 233, metadata !93} ; [ DW_TAG_arg_variable ]
!518 = metadata !{i32 524544, metadata !519, metadata !"f", metadata !1, i32 235, metadata !62} ; [ DW_TAG_auto_variable ]
!519 = metadata !{i32 524299, metadata !213, i32 233, i32 0, metadata !1, i32 69} ; [ DW_TAG_lexical_block ]
!520 = metadata !{i32 524544, metadata !521, metadata !"r", metadata !1, i32 262, metadata !35} ; [ DW_TAG_auto_variable ]
!521 = metadata !{i32 524299, metadata !519, i32 263, i32 0, metadata !1, i32 70} ; [ DW_TAG_lexical_block ]
!522 = metadata !{i32 524545, metadata !216, metadata !"df", metadata !1, i32 507, metadata !5} ; [ DW_TAG_arg_variable ]
!523 = metadata !{i32 524545, metadata !216, metadata !"mode", metadata !1, i32 507, metadata !75} ; [ DW_TAG_arg_variable ]
!524 = metadata !{i32 524545, metadata !219, metadata !"fd", metadata !1, i32 542, metadata !35} ; [ DW_TAG_arg_variable ]
!525 = metadata !{i32 524545, metadata !219, metadata !"mode", metadata !1, i32 542, metadata !75} ; [ DW_TAG_arg_variable ]
!526 = metadata !{i32 524544, metadata !527, metadata !"f", metadata !1, i32 545, metadata !62} ; [ DW_TAG_auto_variable ]
!527 = metadata !{i32 524299, metadata !219, i32 542, i32 0, metadata !1, i32 72} ; [ DW_TAG_lexical_block ]
!528 = metadata !{i32 524544, metadata !529, metadata !"r", metadata !1, i32 562, metadata !35} ; [ DW_TAG_auto_variable ]
!529 = metadata !{i32 524299, metadata !527, i32 562, i32 0, metadata !1, i32 73} ; [ DW_TAG_lexical_block ]
!530 = metadata !{i32 524545, metadata !222, metadata !"path", metadata !1, i32 520, metadata !57} ; [ DW_TAG_arg_variable ]
!531 = metadata !{i32 524545, metadata !222, metadata !"mode", metadata !1, i32 520, metadata !75} ; [ DW_TAG_arg_variable ]
!532 = metadata !{i32 524544, metadata !533, metadata !"dfile", metadata !1, i32 523, metadata !5} ; [ DW_TAG_auto_variable ]
!533 = metadata !{i32 524299, metadata !222, i32 520, i32 0, metadata !1, i32 74} ; [ DW_TAG_lexical_block ]
!534 = metadata !{i32 524544, metadata !535, metadata !"r", metadata !1, i32 535, metadata !35} ; [ DW_TAG_auto_variable ]
!535 = metadata !{i32 524299, metadata !533, i32 535, i32 0, metadata !1, i32 75} ; [ DW_TAG_lexical_block ]
!536 = metadata !{i32 524545, metadata !225, metadata !"fd", metadata !1, i32 301, metadata !35} ; [ DW_TAG_arg_variable ]
!537 = metadata !{i32 524545, metadata !225, metadata !"buf", metadata !1, i32 301, metadata !137} ; [ DW_TAG_arg_variable ]
!538 = metadata !{i32 524545, metadata !225, metadata !"count", metadata !1, i32 301, metadata !93} ; [ DW_TAG_arg_variable ]
!539 = metadata !{i32 524544, metadata !540, metadata !"f", metadata !1, i32 303, metadata !62} ; [ DW_TAG_auto_variable ]
!540 = metadata !{i32 524299, metadata !225, i32 301, i32 0, metadata !1, i32 76} ; [ DW_TAG_lexical_block ]
!541 = metadata !{i32 524544, metadata !542, metadata !"r", metadata !1, i32 321, metadata !35} ; [ DW_TAG_auto_variable ]
!542 = metadata !{i32 524299, metadata !540, i32 323, i32 0, metadata !1, i32 77} ; [ DW_TAG_lexical_block ]
!543 = metadata !{i32 524544, metadata !544, metadata !"actual_count", metadata !1, i32 346, metadata !93} ; [ DW_TAG_auto_variable ]
!544 = metadata !{i32 524299, metadata !540, i32 346, i32 0, metadata !1, i32 78} ; [ DW_TAG_lexical_block ]
!545 = metadata !{i32 524545, metadata !226, metadata !"pathname", metadata !1, i32 128, metadata !57} ; [ DW_TAG_arg_variable ]
!546 = metadata !{i32 524545, metadata !226, metadata !"flags", metadata !1, i32 128, metadata !35} ; [ DW_TAG_arg_variable ]
!547 = metadata !{i32 524545, metadata !226, metadata !"mode", metadata !1, i32 128, metadata !75} ; [ DW_TAG_arg_variable ]
!548 = metadata !{i32 524544, metadata !549, metadata !"df", metadata !1, i32 129, metadata !5} ; [ DW_TAG_auto_variable ]
!549 = metadata !{i32 524299, metadata !226, i32 128, i32 0, metadata !1, i32 79} ; [ DW_TAG_lexical_block ]
!550 = metadata !{i32 524544, metadata !549, metadata !"f", metadata !1, i32 130, metadata !62} ; [ DW_TAG_auto_variable ]
!551 = metadata !{i32 524544, metadata !549, metadata !"fd", metadata !1, i32 131, metadata !35} ; [ DW_TAG_auto_variable ]
!552 = metadata !{i32 524544, metadata !553, metadata !"os_fd", metadata !1, i32 181, metadata !35} ; [ DW_TAG_auto_variable ]
!553 = metadata !{i32 524299, metadata !549, i32 181, i32 0, metadata !1, i32 80} ; [ DW_TAG_lexical_block ]
!554 = metadata !{i32 73, i32 0, metadata !155, null}
!555 = metadata !{i32 39, i32 0, metadata !0, metadata !556}
!556 = metadata !{i32 74, i32 0, metadata !347, null}
!557 = metadata !{i32 40, i32 0, metadata !231, metadata !556}
!558 = metadata !{i32 43, i32 0, metadata !231, metadata !556}
!559 = metadata !{i32 46, i32 0, metadata !231, metadata !556}
!560 = metadata !{i32 47, i32 0, metadata !231, metadata !556}
!561 = metadata !{i32 48, i32 0, metadata !234, metadata !556}
!562 = metadata !{null}
!563 = metadata !{i32 49, i32 0, metadata !234, metadata !556}
!564 = metadata !{i32 76, i32 0, metadata !347, null}
!565 = metadata !{i32 1265, i32 0, metadata !144, metadata !566}
!566 = metadata !{i32 81, i32 0, metadata !349, null}
!567 = metadata !{i32 1252, i32 0, metadata !134, metadata !568}
!568 = metadata !{i32 1266, i32 0, metadata !313, metadata !566}
!569 = metadata !{i32 1254, i32 0, metadata !303, metadata !568}
!570 = metadata !{i32 1255, i32 0, metadata !303, metadata !568}
!571 = metadata !{i32 0}
!572 = metadata !{i32 1269, i32 0, metadata !313, metadata !566}
!573 = metadata !{i32 1270, i32 0, metadata !316, metadata !566}
!574 = metadata !{i32 1271, i32 0, metadata !316, metadata !566}
!575 = metadata !{i32 1273, i32 0, metadata !316, metadata !566}
!576 = metadata !{i32 1276, i32 0, metadata !316, metadata !566}
!577 = metadata !{i32 1279, i32 0, metadata !318, metadata !566}
!578 = metadata !{i32 1280, i32 0, metadata !318, metadata !566}
!579 = metadata !{i32 1281, i32 0, metadata !318, metadata !566}
!580 = metadata !{i32 1282, i32 0, metadata !318, metadata !566}
!581 = metadata !{i32 82, i32 0, metadata !349, null}
!582 = metadata !{i32 83, i32 0, metadata !349, null}
!583 = metadata !{i32 79, i32 0, metadata !347, null}
!584 = metadata !{i32 88, i32 0, metadata !72, null}
!585 = metadata !{i32 89, i32 0, metadata !241, null}
!586 = metadata !{i32 90, i32 0, metadata !241, null}
!587 = metadata !{i32 91, i32 0, metadata !241, null}
!588 = metadata !{i32 1294, i32 0, metadata !79, null}
!589 = metadata !{i32 1295, i32 0, metadata !590, null}
!590 = metadata !{i32 524299, metadata !79, i32 1294, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!591 = metadata !{i32 1296, i32 0, metadata !590, null}
!592 = metadata !{i32 1297, i32 0, metadata !590, null}
!593 = metadata !{i32 1300, i32 0, metadata !590, null}
!594 = metadata !{i32 1304, i32 0, metadata !590, null}
!595 = metadata !{i32 1305, i32 0, metadata !590, null}
!596 = metadata !{i32 1078, i32 0, metadata !82, null}
!597 = metadata !{i32 39, i32 0, metadata !0, metadata !598}
!598 = metadata !{i32 1079, i32 0, metadata !251, null}
!599 = metadata !{i32 40, i32 0, metadata !231, metadata !598}
!600 = metadata !{i32 43, i32 0, metadata !231, metadata !598}
!601 = metadata !{i32 46, i32 0, metadata !231, metadata !598}
!602 = metadata !{i32 47, i32 0, metadata !231, metadata !598}
!603 = metadata !{i32 48, i32 0, metadata !234, metadata !598}
!604 = metadata !{i32 49, i32 0, metadata !234, metadata !598}
!605 = metadata !{i32 1080, i32 0, metadata !251, null}
!606 = metadata !{i32 1082, i32 0, metadata !251, null}
!607 = metadata !{i32 1083, i32 0, metadata !251, null}
!608 = metadata !{i32 1084, i32 0, metadata !251, null}
!609 = metadata !{i32 1085, i32 0, metadata !251, null}
!610 = metadata !{i32 1086, i32 0, metadata !251, null}
!611 = metadata !{i32 1089, i32 0, metadata !251, null}
!612 = metadata !{i32 1094, i32 0, metadata !251, null}
!613 = metadata !{i32 1095, i32 0, metadata !251, null}
!614 = metadata !{i32 1060, i32 0, metadata !83, null}
!615 = metadata !{i32 39, i32 0, metadata !0, metadata !616}
!616 = metadata !{i32 1061, i32 0, metadata !254, null}
!617 = metadata !{i32 40, i32 0, metadata !231, metadata !616}
!618 = metadata !{i32 43, i32 0, metadata !231, metadata !616}
!619 = metadata !{i32 46, i32 0, metadata !231, metadata !616}
!620 = metadata !{i32 47, i32 0, metadata !231, metadata !616}
!621 = metadata !{i32 48, i32 0, metadata !234, metadata !616}
!622 = metadata !{i32 49, i32 0, metadata !234, metadata !616}
!623 = metadata !{i32 1062, i32 0, metadata !254, null}
!624 = metadata !{i32 1064, i32 0, metadata !254, null}
!625 = metadata !{i32 1065, i32 0, metadata !254, null}
!626 = metadata !{i32 1066, i32 0, metadata !254, null}
!627 = metadata !{i32 1068, i32 0, metadata !254, null}
!628 = metadata !{i32 1073, i32 0, metadata !254, null}
!629 = metadata !{i32 1074, i32 0, metadata !254, null}
!630 = metadata !{i32 1099, i32 0, metadata !89, null}
!631 = metadata !{i32 39, i32 0, metadata !0, metadata !632}
!632 = metadata !{i32 1100, i32 0, metadata !262, null}
!633 = metadata !{i32 40, i32 0, metadata !231, metadata !632}
!634 = metadata !{i32 43, i32 0, metadata !231, metadata !632}
!635 = metadata !{i32 46, i32 0, metadata !231, metadata !632}
!636 = metadata !{i32 47, i32 0, metadata !231, metadata !632}
!637 = metadata !{i32 48, i32 0, metadata !234, metadata !632}
!638 = metadata !{i32 49, i32 0, metadata !234, metadata !632}
!639 = metadata !{i32 1101, i32 0, metadata !262, null}
!640 = metadata !{i32 1104, i32 0, metadata !262, null}
!641 = metadata !{i32 1105, i32 0, metadata !262, null}
!642 = metadata !{i32 1106, i32 0, metadata !262, null}
!643 = metadata !{i32 1107, i32 0, metadata !262, null}
!644 = metadata !{i32 1108, i32 0, metadata !262, null}
!645 = metadata !{i32 1109, i32 0, metadata !262, null}
!646 = metadata !{i32 1110, i32 0, metadata !262, null}
!647 = metadata !{i32 1112, i32 0, metadata !262, null}
!648 = metadata !{i32 1116, i32 0, metadata !264, null}
!649 = metadata !{i32 1117, i32 0, metadata !264, null}
!650 = metadata !{i32 1118, i32 0, metadata !264, null}
!651 = metadata !{i32 1119, i32 0, metadata !264, null}
!652 = metadata !{i32 1000, i32 0, metadata !94, null}
!653 = metadata !{i32 63, i32 0, metadata !59, metadata !654}
!654 = metadata !{i32 1001, i32 0, metadata !267, null}
!655 = metadata !{i32 64, i32 0, metadata !238, metadata !654}
!656 = metadata !{i32 65, i32 0, metadata !237, metadata !654}
!657 = metadata !{i32 66, i32 0, metadata !237, metadata !654}
!658 = metadata !{i32 1003, i32 0, metadata !267, null}
!659 = metadata !{i32 1004, i32 0, metadata !267, null}
!660 = metadata !{i32 1005, i32 0, metadata !267, null}
!661 = metadata !{i32 1006, i32 0, metadata !267, null}
!662 = metadata !{i32 1009, i32 0, metadata !269, null}
!663 = metadata !{i32 1010, i32 0, metadata !269, null}
!664 = metadata !{i32 1011, i32 0, metadata !269, null}
!665 = metadata !{i32 980, i32 0, metadata !97, null}
!666 = metadata !{i32 63, i32 0, metadata !59, metadata !667}
!667 = metadata !{i32 981, i32 0, metadata !273, null}
!668 = metadata !{i32 64, i32 0, metadata !238, metadata !667}
!669 = metadata !{i32 65, i32 0, metadata !237, metadata !667}
!670 = metadata !{i32 66, i32 0, metadata !237, metadata !667}
!671 = metadata !{i32 983, i32 0, metadata !273, null}
!672 = metadata !{i32 984, i32 0, metadata !273, null}
!673 = metadata !{i32 985, i32 0, metadata !273, null}
!674 = metadata !{i32 988, i32 0, metadata !273, null}
!675 = metadata !{i32 989, i32 0, metadata !273, null}
!676 = metadata !{i32 990, i32 0, metadata !273, null}
!677 = metadata !{i32 993, i32 0, metadata !275, null}
!678 = metadata !{i32 994, i32 0, metadata !275, null}
!679 = metadata !{i32 995, i32 0, metadata !275, null}
!680 = metadata !{i32 643, i32 0, metadata !127, null}
!681 = metadata !{i32 63, i32 0, metadata !59, metadata !682}
!682 = metadata !{i32 645, i32 0, metadata !279, null}
!683 = metadata !{i32 64, i32 0, metadata !238, metadata !682}
!684 = metadata !{i32 65, i32 0, metadata !237, metadata !682}
!685 = metadata !{i32 66, i32 0, metadata !237, metadata !682}
!686 = metadata !{i32 647, i32 0, metadata !279, null}
!687 = metadata !{i32 649, i32 0, metadata !279, null}
!688 = metadata !{i32 650, i32 0, metadata !279, null}
!689 = metadata !{i32 651, i32 0, metadata !279, null}
!690 = metadata !{i32 654, i32 0, metadata !279, null}
!691 = metadata !{i32 655, i32 0, metadata !279, null}
!692 = metadata !{i32 656, i32 0, metadata !279, null}
!693 = metadata !{i32 660, i32 0, metadata !279, null}
!694 = metadata !{i32 661, i32 0, metadata !279, null}
!695 = metadata !{i32 662, i32 0, metadata !279, null}
!696 = metadata !{i32 666, i32 0, metadata !281, null}
!697 = metadata !{i32 670, i32 0, metadata !281, null}
!698 = metadata !{i32 671, i32 0, metadata !281, null}
!699 = metadata !{i32 588, i32 0, metadata !130, null}
!700 = metadata !{i32 63, i32 0, metadata !59, metadata !701}
!701 = metadata !{i32 589, i32 0, metadata !293, null}
!702 = metadata !{i32 64, i32 0, metadata !238, metadata !701}
!703 = metadata !{i32 65, i32 0, metadata !237, metadata !701}
!704 = metadata !{i32 66, i32 0, metadata !237, metadata !701}
!705 = metadata !{i32 591, i32 0, metadata !293, null}
!706 = metadata !{i32 592, i32 0, metadata !293, null}
!707 = metadata !{i32 593, i32 0, metadata !293, null}
!708 = metadata !{i32 596, i32 0, metadata !293, null}
!709 = metadata !{%struct.exe_disk_file_t* null}
!710 = metadata !{i32 569, i32 0, metadata !84, metadata !711}
!711 = metadata !{i32 597, i32 0, metadata !293, null}
!712 = metadata !{i32 570, i32 0, metadata !713, metadata !711}
!713 = metadata !{i32 524299, metadata !84, i32 569, i32 0, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
!714 = metadata !{i32 571, i32 0, metadata !713, metadata !711}
!715 = metadata !{i32 599, i32 0, metadata !295, null}
!716 = metadata !{i32 600, i32 0, metadata !295, null}
!717 = metadata !{i32 601, i32 0, metadata !295, null}
!718 = metadata !{i32 486, i32 0, metadata !133, null}
!719 = metadata !{i32 63, i32 0, metadata !59, metadata !720}
!720 = metadata !{i32 487, i32 0, metadata !298, null}
!721 = metadata !{i32 64, i32 0, metadata !238, metadata !720}
!722 = metadata !{i32 65, i32 0, metadata !237, metadata !720}
!723 = metadata !{i32 66, i32 0, metadata !237, metadata !720}
!724 = metadata !{i32 489, i32 0, metadata !298, null}
!725 = metadata !{i32 490, i32 0, metadata !298, null}
!726 = metadata !{i32 491, i32 0, metadata !298, null}
!727 = metadata !{i32 494, i32 0, metadata !298, null}
!728 = metadata !{i32 495, i32 0, metadata !298, null}
!729 = metadata !{i32 496, i32 0, metadata !298, null}
!730 = metadata !{i32 499, i32 0, metadata !300, null}
!731 = metadata !{i32 500, i32 0, metadata !300, null}
!732 = metadata !{i32 501, i32 0, metadata !300, null}
!733 = metadata !{i32 1217, i32 0, metadata !141, null}
!734 = metadata !{i32 1221, i32 0, metadata !310, null}
!735 = metadata !{i32 1223, i32 0, metadata !310, null}
!736 = metadata !{i32 1224, i32 0, metadata !310, null}
!737 = metadata !{i32 1225, i32 0, metadata !310, null}
!738 = metadata !{i32 1226, i32 0, metadata !310, null}
!739 = metadata !{i32 1229, i32 0, metadata !310, null}
!740 = metadata !{i32 1230, i32 0, metadata !310, null}
!741 = metadata !{i64 1024}
!742 = metadata !{i32 1231, i32 0, metadata !310, null}
!743 = metadata !{i32 1232, i32 0, metadata !310, null}
!744 = metadata !{i32 1252, i32 0, metadata !134, metadata !745}
!745 = metadata !{i32 1235, i32 0, metadata !310, null}
!746 = metadata !{i32 1254, i32 0, metadata !303, metadata !745}
!747 = metadata !{i32 1255, i32 0, metadata !303, metadata !745}
!748 = metadata !{i32 1259, i32 0, metadata !138, metadata !749}
!749 = metadata !{i32 1236, i32 0, metadata !310, null}
!750 = metadata !{i32 1260, i32 0, metadata !306, metadata !749}
!751 = metadata !{i32 1261, i32 0, metadata !306, metadata !749}
!752 = metadata !{i32 1240, i32 0, metadata !310, null}
!753 = metadata !{i32 1241, i32 0, metadata !310, null}
!754 = metadata !{i32 1242, i32 0, metadata !310, null}
!755 = metadata !{i32 1243, i32 0, metadata !310, null}
!756 = metadata !{i32 963, i32 0, metadata !147, null}
!757 = metadata !{i32 39, i32 0, metadata !0, metadata !758}
!758 = metadata !{i32 964, i32 0, metadata !322, null}
!759 = metadata !{i32 40, i32 0, metadata !231, metadata !758}
!760 = metadata !{i32 43, i32 0, metadata !231, metadata !758}
!761 = metadata !{i32 46, i32 0, metadata !231, metadata !758}
!762 = metadata !{i32 47, i32 0, metadata !231, metadata !758}
!763 = metadata !{i32 48, i32 0, metadata !234, metadata !758}
!764 = metadata !{i32 49, i32 0, metadata !234, metadata !758}
!765 = metadata !{i32 965, i32 0, metadata !322, null}
!766 = metadata !{i32 967, i32 0, metadata !322, null}
!767 = metadata !{i32 968, i32 0, metadata !322, null}
!768 = metadata !{i32 969, i32 0, metadata !322, null}
!769 = metadata !{i32 1265, i32 0, metadata !144, metadata !770}
!770 = metadata !{i32 973, i32 0, metadata !324, null}
!771 = metadata !{i32 1252, i32 0, metadata !134, metadata !772}
!772 = metadata !{i32 1266, i32 0, metadata !313, metadata !770}
!773 = metadata !{i32 1254, i32 0, metadata !303, metadata !772}
!774 = metadata !{i32 1255, i32 0, metadata !303, metadata !772}
!775 = metadata !{i32 1269, i32 0, metadata !313, metadata !770}
!776 = metadata !{i32 1270, i32 0, metadata !316, metadata !770}
!777 = metadata !{i32 1271, i32 0, metadata !316, metadata !770}
!778 = metadata !{i32 1273, i32 0, metadata !316, metadata !770}
!779 = metadata !{i32 1276, i32 0, metadata !316, metadata !770}
!780 = metadata !{i32 1279, i32 0, metadata !318, metadata !770}
!781 = metadata !{i32 1280, i32 0, metadata !318, metadata !770}
!782 = metadata !{i32 1281, i32 0, metadata !318, metadata !770}
!783 = metadata !{i32 1282, i32 0, metadata !318, metadata !770}
!784 = metadata !{i32 974, i32 0, metadata !324, null}
!785 = metadata !{i32 975, i32 0, metadata !324, null}
!786 = metadata !{i32 606, i32 0, metadata !150, null}
!787 = metadata !{i32 39, i32 0, metadata !0, metadata !788}
!788 = metadata !{i32 608, i32 0, metadata !329, null}
!789 = metadata !{i32 40, i32 0, metadata !231, metadata !788}
!790 = metadata !{i32 43, i32 0, metadata !231, metadata !788}
!791 = metadata !{i32 46, i32 0, metadata !231, metadata !788}
!792 = metadata !{i32 47, i32 0, metadata !231, metadata !788}
!793 = metadata !{i32 48, i32 0, metadata !234, metadata !788}
!794 = metadata !{i32 49, i32 0, metadata !234, metadata !788}
!795 = metadata !{i32 610, i32 0, metadata !329, null}
!796 = metadata !{i32 569, i32 0, metadata !84, metadata !797}
!797 = metadata !{i32 611, i32 0, metadata !329, null}
!798 = metadata !{i32 570, i32 0, metadata !713, metadata !797}
!799 = metadata !{i32 571, i32 0, metadata !713, metadata !797}
!800 = metadata !{i32 1265, i32 0, metadata !144, metadata !801}
!801 = metadata !{i32 613, i32 0, metadata !331, null}
!802 = metadata !{i32 1252, i32 0, metadata !134, metadata !803}
!803 = metadata !{i32 1266, i32 0, metadata !313, metadata !801}
!804 = metadata !{i32 1254, i32 0, metadata !303, metadata !803}
!805 = metadata !{i32 1255, i32 0, metadata !303, metadata !803}
!806 = metadata !{i32 1269, i32 0, metadata !313, metadata !801}
!807 = metadata !{i32 1270, i32 0, metadata !316, metadata !801}
!808 = metadata !{i32 1271, i32 0, metadata !316, metadata !801}
!809 = metadata !{i32 1273, i32 0, metadata !316, metadata !801}
!810 = metadata !{i32 1276, i32 0, metadata !316, metadata !801}
!811 = metadata !{i32 1279, i32 0, metadata !318, metadata !801}
!812 = metadata !{i32 1280, i32 0, metadata !318, metadata !801}
!813 = metadata !{i32 1281, i32 0, metadata !318, metadata !801}
!814 = metadata !{i32 1282, i32 0, metadata !318, metadata !801}
!815 = metadata !{i32 614, i32 0, metadata !331, null}
!816 = metadata !{i32 615, i32 0, metadata !331, null}
!817 = metadata !{i32 575, i32 0, metadata !153, null}
!818 = metadata !{i32 39, i32 0, metadata !0, metadata !819}
!819 = metadata !{i32 576, i32 0, metadata !336, null}
!820 = metadata !{i32 40, i32 0, metadata !231, metadata !819}
!821 = metadata !{i32 43, i32 0, metadata !231, metadata !819}
!822 = metadata !{i32 46, i32 0, metadata !231, metadata !819}
!823 = metadata !{i32 47, i32 0, metadata !231, metadata !819}
!824 = metadata !{i32 48, i32 0, metadata !234, metadata !819}
!825 = metadata !{i32 49, i32 0, metadata !234, metadata !819}
!826 = metadata !{i32 578, i32 0, metadata !336, null}
!827 = metadata !{i32 569, i32 0, metadata !84, metadata !828}
!828 = metadata !{i32 579, i32 0, metadata !336, null}
!829 = metadata !{i32 570, i32 0, metadata !713, metadata !828}
!830 = metadata !{i32 571, i32 0, metadata !713, metadata !828}
!831 = metadata !{i32 1265, i32 0, metadata !144, metadata !832}
!832 = metadata !{i32 581, i32 0, metadata !338, null}
!833 = metadata !{i32 1252, i32 0, metadata !134, metadata !834}
!834 = metadata !{i32 1266, i32 0, metadata !313, metadata !832}
!835 = metadata !{i32 1254, i32 0, metadata !303, metadata !834}
!836 = metadata !{i32 1255, i32 0, metadata !303, metadata !834}
!837 = metadata !{i32 1269, i32 0, metadata !313, metadata !832}
!838 = metadata !{i32 1270, i32 0, metadata !316, metadata !832}
!839 = metadata !{i32 1271, i32 0, metadata !316, metadata !832}
!840 = metadata !{i32 1273, i32 0, metadata !316, metadata !832}
!841 = metadata !{i32 1276, i32 0, metadata !316, metadata !832}
!842 = metadata !{i32 1279, i32 0, metadata !318, metadata !832}
!843 = metadata !{i32 1280, i32 0, metadata !318, metadata !832}
!844 = metadata !{i32 1281, i32 0, metadata !318, metadata !832}
!845 = metadata !{i32 1282, i32 0, metadata !318, metadata !832}
!846 = metadata !{i32 582, i32 0, metadata !338, null}
!847 = metadata !{i32 583, i32 0, metadata !338, null}
!848 = metadata !{i32 468, i32 0, metadata !154, null}
!849 = metadata !{i32 39, i32 0, metadata !0, metadata !850}
!850 = metadata !{i32 469, i32 0, metadata !341, null}
!851 = metadata !{i32 40, i32 0, metadata !231, metadata !850}
!852 = metadata !{i32 43, i32 0, metadata !231, metadata !850}
!853 = metadata !{i32 46, i32 0, metadata !231, metadata !850}
!854 = metadata !{i32 47, i32 0, metadata !231, metadata !850}
!855 = metadata !{i32 48, i32 0, metadata !234, metadata !850}
!856 = metadata !{i32 49, i32 0, metadata !234, metadata !850}
!857 = metadata !{i32 471, i32 0, metadata !341, null}
!858 = metadata !{i32 473, i32 0, metadata !341, null}
!859 = metadata !{i32 474, i32 0, metadata !341, null}
!860 = metadata !{i32 475, i32 0, metadata !341, null}
!861 = metadata !{i32 1265, i32 0, metadata !144, metadata !862}
!862 = metadata !{i32 479, i32 0, metadata !343, null}
!863 = metadata !{i32 1252, i32 0, metadata !134, metadata !864}
!864 = metadata !{i32 1266, i32 0, metadata !313, metadata !862}
!865 = metadata !{i32 1254, i32 0, metadata !303, metadata !864}
!866 = metadata !{i32 1255, i32 0, metadata !303, metadata !864}
!867 = metadata !{i32 1269, i32 0, metadata !313, metadata !862}
!868 = metadata !{i32 1270, i32 0, metadata !316, metadata !862}
!869 = metadata !{i32 1271, i32 0, metadata !316, metadata !862}
!870 = metadata !{i32 1273, i32 0, metadata !316, metadata !862}
!871 = metadata !{i32 1276, i32 0, metadata !316, metadata !862}
!872 = metadata !{i32 1279, i32 0, metadata !318, metadata !862}
!873 = metadata !{i32 1280, i32 0, metadata !318, metadata !862}
!874 = metadata !{i32 1281, i32 0, metadata !318, metadata !862}
!875 = metadata !{i32 1282, i32 0, metadata !318, metadata !862}
!876 = metadata !{i32 480, i32 0, metadata !343, null}
!877 = metadata !{i32 481, i32 0, metadata !343, null}
!878 = metadata !{i32 1131, i32 0, metadata !158, null}
!879 = metadata !{i32 1132, i32 0, metadata !158, null}
!880 = metadata !{i32 1133, i32 0, metadata !356, null}
!881 = metadata !{i32 1134, i32 0, metadata !356, null}
!882 = metadata !{i32 1136, i32 0, metadata !356, null}
!883 = metadata !{i32 1140, i32 0, metadata !356, null}
!884 = metadata !{i32 1137, i32 0, metadata !356, null}
!885 = metadata !{i32 1138, i32 0, metadata !356, null}
!886 = metadata !{i32 1143, i32 0, metadata !356, null}
!887 = metadata !{i32 1147, i32 0, metadata !356, null}
!888 = metadata !{i32 1144, i32 0, metadata !356, null}
!889 = metadata !{i32 1145, i32 0, metadata !356, null}
!890 = metadata !{i32 1150, i32 0, metadata !356, null}
!891 = metadata !{i32 1154, i32 0, metadata !356, null}
!892 = metadata !{i32 1151, i32 0, metadata !356, null}
!893 = metadata !{i32 1152, i32 0, metadata !356, null}
!894 = metadata !{i32 1157, i32 0, metadata !356, null}
!895 = metadata !{i32 1158, i32 0, metadata !356, null}
!896 = metadata !{i32 1159, i32 0, metadata !356, null}
!897 = metadata !{i32 1162, i32 0, metadata !356, null}
!898 = metadata !{i32 1163, i32 0, metadata !356, null}
!899 = metadata !{i32 64, i32 0, metadata !238, metadata !900}
!900 = metadata !{i32 1164, i32 0, metadata !366, null}
!901 = metadata !{i32 66, i32 0, metadata !237, metadata !900}
!902 = metadata !{i32 undef}
!903 = metadata !{i32 63, i32 0, metadata !59, metadata !900}
!904 = metadata !{i32 1166, i32 0, metadata !366, null}
!905 = metadata !{i32 1167, i32 0, metadata !366, null}
!906 = metadata !{i32 1168, i32 0, metadata !366, null}
!907 = metadata !{i32 1170, i32 0, metadata !366, null}
!908 = metadata !{i32 1171, i32 0, metadata !366, null}
!909 = metadata !{i32 1172, i32 0, metadata !366, null}
!910 = metadata !{i32 1173, i32 0, metadata !366, null}
!911 = metadata !{i32 1175, i32 0, metadata !366, null}
!912 = metadata !{i32 1176, i32 0, metadata !366, null}
!913 = metadata !{i32 1177, i32 0, metadata !366, null}
!914 = metadata !{i32 1178, i32 0, metadata !366, null}
!915 = metadata !{i32 1183, i32 0, metadata !356, null}
!916 = metadata !{i32 1186, i32 0, metadata !368, null}
!917 = metadata !{i32 1188, i32 0, metadata !368, null}
!918 = metadata !{i32 1190, i32 0, metadata !368, null}
!919 = metadata !{i32 1193, i32 0, metadata !368, null}
!920 = metadata !{i32 1194, i32 0, metadata !368, null}
!921 = metadata !{i32 1198, i32 0, metadata !368, null}
!922 = metadata !{i32 1201, i32 0, metadata !368, null}
!923 = metadata !{i32 64, i32 0, metadata !238, metadata !924}
!924 = metadata !{i32 1202, i32 0, metadata !371, null}
!925 = metadata !{i32 66, i32 0, metadata !237, metadata !924}
!926 = metadata !{i32 1203, i32 0, metadata !371, null}
!927 = metadata !{i32 1204, i32 0, metadata !371, null}
!928 = metadata !{i32 1205, i32 0, metadata !371, null}
!929 = metadata !{i32 1206, i32 0, metadata !371, null}
!930 = metadata !{i32 201, i32 0, metadata !178, null}
!931 = metadata !{i32 204, i32 0, metadata !374, null}
!932 = metadata !{i32 206, i32 0, metadata !374, null}
!933 = metadata !{i32 63, i32 0, metadata !59, metadata !934}
!934 = metadata !{i32 208, i32 0, metadata !374, null}
!935 = metadata !{i32 64, i32 0, metadata !238, metadata !934}
!936 = metadata !{i32 65, i32 0, metadata !237, metadata !934}
!937 = metadata !{i32 66, i32 0, metadata !237, metadata !934}
!938 = metadata !{i32 209, i32 0, metadata !374, null}
!939 = metadata !{i32 210, i32 0, metadata !374, null}
!940 = metadata !{i32 211, i32 0, metadata !374, null}
!941 = metadata !{i32 214, i32 0, metadata !374, null}
!942 = metadata !{i32 215, i32 0, metadata !374, null}
!943 = metadata !{i32 216, i32 0, metadata !374, null}
!944 = metadata !{i32 228, i32 0, metadata !374, null}
!945 = metadata !{i32 1016, i32 0, metadata !179, null}
!946 = metadata !{i32 63, i32 0, metadata !59, metadata !947}
!947 = metadata !{i32 1017, i32 0, metadata !379, null}
!948 = metadata !{i32 64, i32 0, metadata !238, metadata !947}
!949 = metadata !{i32 65, i32 0, metadata !237, metadata !947}
!950 = metadata !{i32 66, i32 0, metadata !237, metadata !947}
!951 = metadata !{i32 1019, i32 0, metadata !379, null}
!952 = metadata !{i32 1020, i32 0, metadata !379, null}
!953 = metadata !{i32 1021, i32 0, metadata !379, null}
!954 = metadata !{i32 1023, i32 0, metadata !381, null}
!955 = metadata !{i32 1024, i32 0, metadata !381, null}
!956 = metadata !{i32 201, i32 0, metadata !178, metadata !955}
!957 = metadata !{i32 204, i32 0, metadata !374, metadata !955}
!958 = metadata !{i32 206, i32 0, metadata !374, metadata !955}
!959 = metadata !{i32 63, i32 0, metadata !59, metadata !960}
!960 = metadata !{i32 208, i32 0, metadata !374, metadata !955}
!961 = metadata !{i32 64, i32 0, metadata !238, metadata !960}
!962 = metadata !{i32 209, i32 0, metadata !374, metadata !955}
!963 = metadata !{i32 210, i32 0, metadata !374, metadata !955}
!964 = metadata !{i32 214, i32 0, metadata !374, metadata !955}
!965 = metadata !{i32 215, i32 0, metadata !374, metadata !955}
!966 = metadata !{i32 216, i32 0, metadata !374, metadata !955}
!967 = metadata !{i32 228, i32 0, metadata !374, metadata !955}
!968 = metadata !{i32 1028, i32 0, metadata !381, null}
!969 = metadata !{i32 1030, i32 0, metadata !381, null}
!970 = metadata !{i32 1041, i32 0, metadata !182, null}
!971 = metadata !{i32 63, i32 0, metadata !59, metadata !972}
!972 = metadata !{i32 1042, i32 0, metadata !384, null}
!973 = metadata !{i32 64, i32 0, metadata !238, metadata !972}
!974 = metadata !{i32 65, i32 0, metadata !237, metadata !972}
!975 = metadata !{i32 66, i32 0, metadata !237, metadata !972}
!976 = metadata !{i32 1043, i32 0, metadata !384, null}
!977 = metadata !{i32 1044, i32 0, metadata !384, null}
!978 = metadata !{i32 1045, i32 0, metadata !384, null}
!979 = metadata !{i32 1049, i32 0, metadata !386, null}
!980 = metadata !{i32 1048, i32 0, metadata !386, null}
!981 = metadata !{i32 1052, i32 0, metadata !386, null}
!982 = metadata !{i32 1055, i32 0, metadata !386, null}
!983 = metadata !{i32 908, i32 0, metadata !183, null}
!984 = metadata !{i32 910, i32 0, metadata !390, null}
!985 = metadata !{i32 63, i32 0, metadata !59, metadata !986}
!986 = metadata !{i32 909, i32 0, metadata !390, null}
!987 = metadata !{i32 64, i32 0, metadata !238, metadata !986}
!988 = metadata !{i32 65, i32 0, metadata !237, metadata !986}
!989 = metadata !{i32 66, i32 0, metadata !237, metadata !986}
!990 = metadata !{i32 913, i32 0, metadata !390, null}
!991 = metadata !{i32 914, i32 0, metadata !390, null}
!992 = metadata !{i32 915, i32 0, metadata !390, null}
!993 = metadata !{i32 918, i32 0, metadata !390, null}
!994 = metadata !{i32 922, i32 0, metadata !390, null}
!995 = metadata !{i32 923, i32 0, metadata !390, null}
!996 = metadata !{i32 924, i32 0, metadata !390, null}
!997 = metadata !{i32 927, i32 0, metadata !390, null}
!998 = metadata !{i32 928, i32 0, metadata !390, null}
!999 = metadata !{i32 930, i32 0, metadata !406, null}
!1000 = metadata !{i32 931, i32 0, metadata !406, null}
!1001 = metadata !{i32 1}
!1002 = metadata !{i32 932, i32 0, metadata !406, null}
!1003 = metadata !{i32 936, i32 0, metadata !390, null}
!1004 = metadata !{i32 937, i32 0, metadata !390, null}
!1005 = metadata !{i32 938, i32 0, metadata !390, null}
!1006 = metadata !{i32 951, i32 0, metadata !390, null}
!1007 = metadata !{i32 952, i32 0, metadata !390, null}
!1008 = metadata !{i32 956, i32 0, metadata !408, null}
!1009 = metadata !{i32 957, i32 0, metadata !408, null}
!1010 = metadata !{i32 958, i32 0, metadata !408, null}
!1011 = metadata !{i32 758, i32 0, metadata !184, null}
!1012 = metadata !{i32 763, i32 0, metadata !412, null}
!1013 = metadata !{i32 63, i32 0, metadata !59, metadata !1014}
!1014 = metadata !{i32 762, i32 0, metadata !412, null}
!1015 = metadata !{i32 64, i32 0, metadata !238, metadata !1014}
!1016 = metadata !{i32 65, i32 0, metadata !237, metadata !1014}
!1017 = metadata !{i32 66, i32 0, metadata !237, metadata !1014}
!1018 = metadata !{i32 770, i32 0, metadata !412, null}
!1019 = metadata !{i32 771, i32 0, metadata !412, null}
!1020 = metadata !{i32 772, i32 0, metadata !412, null}
!1021 = metadata !{i32 775, i32 0, metadata !412, null}
!1022 = metadata !{i32 776, i32 0, metadata !412, null}
!1023 = metadata !{i32 777, i32 0, metadata !412, null}
!1024 = metadata !{i32 779, i32 0, metadata !412, null}
!1025 = metadata !{i32 780, i32 0, metadata !416, null}
!1026 = metadata !{i32 782, i32 0, metadata !416, null}
!1027 = metadata !{i32 784, i32 0, metadata !438, null}
!1028 = metadata !{i32 786, i32 0, metadata !438, null}
!1029 = metadata !{i32 789, i32 0, metadata !438, null}
!1030 = metadata !{i32 792, i32 0, metadata !438, null}
!1031 = metadata !{i32 793, i32 0, metadata !438, null}
!1032 = metadata !{i32 794, i32 0, metadata !438, null}
!1033 = metadata !{i32 795, i32 0, metadata !438, null}
!1034 = metadata !{i32 796, i32 0, metadata !438, null}
!1035 = metadata !{i32 797, i32 0, metadata !438, null}
!1036 = metadata !{i32 798, i32 0, metadata !438, null}
!1037 = metadata !{i32 799, i32 0, metadata !438, null}
!1038 = metadata !{i32 800, i32 0, metadata !438, null}
!1039 = metadata !{i32 801, i32 0, metadata !438, null}
!1040 = metadata !{i32 802, i32 0, metadata !438, null}
!1041 = metadata !{i32 803, i32 0, metadata !438, null}
!1042 = metadata !{i32 804, i32 0, metadata !438, null}
!1043 = metadata !{i32 805, i32 0, metadata !438, null}
!1044 = metadata !{i32 806, i32 0, metadata !438, null}
!1045 = metadata !{i32 807, i32 0, metadata !438, null}
!1046 = metadata !{i32 808, i32 0, metadata !438, null}
!1047 = metadata !{i32 809, i32 0, metadata !438, null}
!1048 = metadata !{i32 810, i32 0, metadata !438, null}
!1049 = metadata !{i32 811, i32 0, metadata !438, null}
!1050 = metadata !{i32 812, i32 0, metadata !438, null}
!1051 = metadata !{i32 813, i32 0, metadata !438, null}
!1052 = metadata !{i32 814, i32 0, metadata !438, null}
!1053 = metadata !{i32 815, i32 0, metadata !438, null}
!1054 = metadata !{i32 818, i32 0, metadata !438, null}
!1055 = metadata !{i32 824, i32 0, metadata !416, null}
!1056 = metadata !{i32 825, i32 0, metadata !416, null}
!1057 = metadata !{i32 828, i32 0, metadata !416, null}
!1058 = metadata !{i32 834, i32 0, metadata !416, null}
!1059 = metadata !{i32 835, i32 0, metadata !416, null}
!1060 = metadata !{i32 838, i32 0, metadata !416, null}
!1061 = metadata !{i32 844, i32 0, metadata !416, null}
!1062 = metadata !{i32 845, i32 0, metadata !416, null}
!1063 = metadata !{i32 848, i32 0, metadata !416, null}
!1064 = metadata !{i32 853, i32 0, metadata !458, null}
!1065 = metadata !{i32 854, i32 0, metadata !458, null}
!1066 = metadata !{i32 855, i32 0, metadata !458, null}
!1067 = metadata !{i32 856, i32 0, metadata !458, null}
!1068 = metadata !{i32 857, i32 0, metadata !458, null}
!1069 = metadata !{i32 860, i32 0, metadata !458, null}
!1070 = metadata !{i32 866, i32 0, metadata !416, null}
!1071 = metadata !{i32 867, i32 0, metadata !416, null}
!1072 = metadata !{i32 868, i32 0, metadata !416, null}
!1073 = metadata !{i32 871, i32 0, metadata !416, null}
!1074 = metadata !{i32 876, i32 0, metadata !468, null}
!1075 = metadata !{i32 877, i32 0, metadata !468, null}
!1076 = metadata !{i32 878, i32 0, metadata !468, null}
!1077 = metadata !{i32 879, i32 0, metadata !468, null}
!1078 = metadata !{i32 880, i32 0, metadata !468, null}
!1079 = metadata !{i32 886, i32 0, metadata !468, null}
!1080 = metadata !{i32 891, i32 0, metadata !416, null}
!1081 = metadata !{i32 892, i32 0, metadata !416, null}
!1082 = metadata !{i32 896, i32 0, metadata !416, null}
!1083 = metadata !{i32 897, i32 0, metadata !416, null}
!1084 = metadata !{i32 901, i32 0, metadata !471, null}
!1085 = metadata !{i32 902, i32 0, metadata !471, null}
!1086 = metadata !{i32 903, i32 0, metadata !471, null}
!1087 = metadata !{i32 676, i32 0, metadata !187, null}
!1088 = metadata !{i32 63, i32 0, metadata !59, metadata !1089}
!1089 = metadata !{i32 677, i32 0, metadata !476, null}
!1090 = metadata !{i32 64, i32 0, metadata !238, metadata !1089}
!1091 = metadata !{i32 65, i32 0, metadata !237, metadata !1089}
!1092 = metadata !{i32 66, i32 0, metadata !237, metadata !1089}
!1093 = metadata !{i32 679, i32 0, metadata !476, null}
!1094 = metadata !{i32 680, i32 0, metadata !476, null}
!1095 = metadata !{i32 681, i32 0, metadata !476, null}
!1096 = metadata !{i32 684, i32 0, metadata !476, null}
!1097 = metadata !{i32 685, i32 0, metadata !476, null}
!1098 = metadata !{i32 686, i32 0, metadata !476, null}
!1099 = metadata !{i32 689, i32 0, metadata !476, null}
!1100 = metadata !{i32 691, i32 0, metadata !478, null}
!1101 = metadata !{i32 694, i32 0, metadata !478, null}
!1102 = metadata !{i32 695, i32 0, metadata !478, null}
!1103 = metadata !{i32 700, i32 0, metadata !478, null}
!1104 = metadata !{i32 697, i32 0, metadata !478, null}
!1105 = metadata !{i32 701, i32 0, metadata !482, null}
!1106 = metadata !{i32 702, i32 0, metadata !482, null}
!1107 = metadata !{i32 703, i32 0, metadata !482, null}
!1108 = metadata !{i32 704, i32 0, metadata !482, null}
!1109 = metadata !{i32 705, i32 0, metadata !482, null}
!1110 = metadata !{i32 706, i32 0, metadata !482, null}
!1111 = metadata !{i32 707, i32 0, metadata !482, null}
!1112 = metadata !{i32 708, i32 0, metadata !482, null}
!1113 = metadata !{i32 709, i32 0, metadata !482, null}
!1114 = metadata !{i32 713, i32 0, metadata !478, null}
!1115 = metadata !{i32 714, i32 0, metadata !478, null}
!1116 = metadata !{i32 715, i32 0, metadata !478, null}
!1117 = metadata !{i32 716, i32 0, metadata !478, null}
!1118 = metadata !{i32 717, i32 0, metadata !478, null}
!1119 = metadata !{i32 718, i32 0, metadata !478, null}
!1120 = metadata !{i32 719, i32 0, metadata !478, null}
!1121 = metadata !{i32 720, i32 0, metadata !478, null}
!1122 = metadata !{i32 723, i32 0, metadata !484, null}
!1123 = metadata !{i32 733, i32 0, metadata !484, null}
!1124 = metadata !{i32 734, i32 0, metadata !484, null}
!1125 = metadata !{i32 735, i32 0, metadata !484, null}
!1126 = metadata !{i32 736, i32 0, metadata !484, null}
!1127 = metadata !{i32 737, i32 0, metadata !484, null}
!1128 = metadata !{i32 738, i32 0, metadata !484, null}
!1129 = metadata !{i32 740, i32 0, metadata !488, null}
!1130 = metadata !{i32 742, i32 0, metadata !488, null}
!1131 = metadata !{i32 746, i32 0, metadata !488, null}
!1132 = metadata !{i32 747, i32 0, metadata !490, null}
!1133 = metadata !{i32 748, i32 0, metadata !490, null}
!1134 = metadata !{i32 749, i32 0, metadata !490, null}
!1135 = metadata !{i32 373, i32 0, metadata !205, null}
!1136 = metadata !{i32 63, i32 0, metadata !59, metadata !1137}
!1137 = metadata !{i32 375, i32 0, metadata !495, null}
!1138 = metadata !{i32 64, i32 0, metadata !238, metadata !1137}
!1139 = metadata !{i32 65, i32 0, metadata !237, metadata !1137}
!1140 = metadata !{i32 66, i32 0, metadata !237, metadata !1137}
!1141 = metadata !{i32 377, i32 0, metadata !495, null}
!1142 = metadata !{i32 378, i32 0, metadata !495, null}
!1143 = metadata !{i32 379, i32 0, metadata !495, null}
!1144 = metadata !{i32 382, i32 0, metadata !495, null}
!1145 = metadata !{i32 389, i32 0, metadata !495, null}
!1146 = metadata !{i32 390, i32 0, metadata !495, null}
!1147 = metadata !{i32 392, i32 0, metadata !495, null}
!1148 = metadata !{i32 396, i32 0, metadata !495, null}
!1149 = metadata !{i32 397, i32 0, metadata !495, null}
!1150 = metadata !{i32 398, i32 0, metadata !495, null}
!1151 = metadata !{i32 402, i32 0, metadata !495, null}
!1152 = metadata !{i32 403, i32 0, metadata !495, null}
!1153 = metadata !{i32 407, i32 0, metadata !495, null}
!1154 = metadata !{i32 411, i32 0, metadata !495, null}
!1155 = metadata !{i32 413, i32 0, metadata !495, null}
!1156 = metadata !{i32 414, i32 0, metadata !495, null}
!1157 = metadata !{i32 416, i32 0, metadata !495, null}
!1158 = metadata !{i32 421, i32 0, metadata !495, null}
!1159 = metadata !{i32 422, i32 0, metadata !495, null}
!1160 = metadata !{i32 426, i32 0, metadata !495, null}
!1161 = metadata !{i32 620, i32 0, metadata !208, null}
!1162 = metadata !{i32 63, i32 0, metadata !59, metadata !1163}
!1163 = metadata !{i32 621, i32 0, metadata !500, null}
!1164 = metadata !{i32 64, i32 0, metadata !238, metadata !1163}
!1165 = metadata !{i32 65, i32 0, metadata !237, metadata !1163}
!1166 = metadata !{i32 66, i32 0, metadata !237, metadata !1163}
!1167 = metadata !{i32 623, i32 0, metadata !500, null}
!1168 = metadata !{i32 624, i32 0, metadata !500, null}
!1169 = metadata !{i32 625, i32 0, metadata !500, null}
!1170 = metadata !{i32 628, i32 0, metadata !500, null}
!1171 = metadata !{i32 630, i32 0, metadata !502, null}
!1172 = metadata !{i32 634, i32 0, metadata !502, null}
!1173 = metadata !{i32 635, i32 0, metadata !502, null}
!1174 = metadata !{i32 639, i32 0, metadata !500, null}
!1175 = metadata !{i32 449, i32 0, metadata !209, null}
!1176 = metadata !{i32 39, i32 0, metadata !0, metadata !1177}
!1177 = metadata !{i32 450, i32 0, metadata !506, null}
!1178 = metadata !{i32 40, i32 0, metadata !231, metadata !1177}
!1179 = metadata !{i32 43, i32 0, metadata !231, metadata !1177}
!1180 = metadata !{i32 46, i32 0, metadata !231, metadata !1177}
!1181 = metadata !{i32 47, i32 0, metadata !231, metadata !1177}
!1182 = metadata !{i32 48, i32 0, metadata !234, metadata !1177}
!1183 = metadata !{i32 49, i32 0, metadata !234, metadata !1177}
!1184 = metadata !{i32 451, i32 0, metadata !506, null}
!1185 = metadata !{i32 452, i32 0, metadata !506, null}
!1186 = metadata !{i32 453, i32 0, metadata !506, null}
!1187 = metadata !{i32 1265, i32 0, metadata !144, metadata !1188}
!1188 = metadata !{i32 458, i32 0, metadata !508, null}
!1189 = metadata !{i32 1252, i32 0, metadata !134, metadata !1190}
!1190 = metadata !{i32 1266, i32 0, metadata !313, metadata !1188}
!1191 = metadata !{i32 1254, i32 0, metadata !303, metadata !1190}
!1192 = metadata !{i32 1255, i32 0, metadata !303, metadata !1190}
!1193 = metadata !{i32 1269, i32 0, metadata !313, metadata !1188}
!1194 = metadata !{i32 1270, i32 0, metadata !316, metadata !1188}
!1195 = metadata !{i32 1271, i32 0, metadata !316, metadata !1188}
!1196 = metadata !{i32 1273, i32 0, metadata !316, metadata !1188}
!1197 = metadata !{i32 1276, i32 0, metadata !316, metadata !1188}
!1198 = metadata !{i32 1279, i32 0, metadata !318, metadata !1188}
!1199 = metadata !{i32 1280, i32 0, metadata !318, metadata !1188}
!1200 = metadata !{i32 1281, i32 0, metadata !318, metadata !1188}
!1201 = metadata !{i32 1282, i32 0, metadata !318, metadata !1188}
!1202 = metadata !{i32 462, i32 0, metadata !508, null}
!1203 = metadata !{i32 463, i32 0, metadata !508, null}
!1204 = metadata !{i32 430, i32 0, metadata !212, null}
!1205 = metadata !{i32 39, i32 0, metadata !0, metadata !1206}
!1206 = metadata !{i32 431, i32 0, metadata !512, null}
!1207 = metadata !{i32 40, i32 0, metadata !231, metadata !1206}
!1208 = metadata !{i32 43, i32 0, metadata !231, metadata !1206}
!1209 = metadata !{i32 46, i32 0, metadata !231, metadata !1206}
!1210 = metadata !{i32 47, i32 0, metadata !231, metadata !1206}
!1211 = metadata !{i32 48, i32 0, metadata !234, metadata !1206}
!1212 = metadata !{i32 49, i32 0, metadata !234, metadata !1206}
!1213 = metadata !{i32 432, i32 0, metadata !512, null}
!1214 = metadata !{i32 433, i32 0, metadata !512, null}
!1215 = metadata !{i32 434, i32 0, metadata !512, null}
!1216 = metadata !{i32 1265, i32 0, metadata !144, metadata !1217}
!1217 = metadata !{i32 439, i32 0, metadata !514, null}
!1218 = metadata !{i32 1252, i32 0, metadata !134, metadata !1219}
!1219 = metadata !{i32 1266, i32 0, metadata !313, metadata !1217}
!1220 = metadata !{i32 1254, i32 0, metadata !303, metadata !1219}
!1221 = metadata !{i32 1255, i32 0, metadata !303, metadata !1219}
!1222 = metadata !{i32 1269, i32 0, metadata !313, metadata !1217}
!1223 = metadata !{i32 1270, i32 0, metadata !316, metadata !1217}
!1224 = metadata !{i32 1271, i32 0, metadata !316, metadata !1217}
!1225 = metadata !{i32 1273, i32 0, metadata !316, metadata !1217}
!1226 = metadata !{i32 1276, i32 0, metadata !316, metadata !1217}
!1227 = metadata !{i32 1279, i32 0, metadata !318, metadata !1217}
!1228 = metadata !{i32 1280, i32 0, metadata !318, metadata !1217}
!1229 = metadata !{i32 1281, i32 0, metadata !318, metadata !1217}
!1230 = metadata !{i32 1282, i32 0, metadata !318, metadata !1217}
!1231 = metadata !{i32 443, i32 0, metadata !514, null}
!1232 = metadata !{i32 444, i32 0, metadata !514, null}
!1233 = metadata !{i32 233, i32 0, metadata !213, null}
!1234 = metadata !{i32 237, i32 0, metadata !519, null}
!1235 = metadata !{i32 239, i32 0, metadata !519, null}
!1236 = metadata !{i32 242, i32 0, metadata !519, null}
!1237 = metadata !{i32 243, i32 0, metadata !519, null}
!1238 = metadata !{i32 240, i32 0, metadata !519, null}
!1239 = metadata !{i32 63, i32 0, metadata !59, metadata !1240}
!1240 = metadata !{i32 247, i32 0, metadata !519, null}
!1241 = metadata !{i32 64, i32 0, metadata !238, metadata !1240}
!1242 = metadata !{i32 65, i32 0, metadata !237, metadata !1240}
!1243 = metadata !{i32 66, i32 0, metadata !237, metadata !1240}
!1244 = metadata !{i32 249, i32 0, metadata !519, null}
!1245 = metadata !{i32 250, i32 0, metadata !519, null}
!1246 = metadata !{i32 254, i32 0, metadata !519, null}
!1247 = metadata !{i32 255, i32 0, metadata !519, null}
!1248 = metadata !{i32 256, i32 0, metadata !519, null}
!1249 = metadata !{i32 260, i32 0, metadata !519, null}
!1250 = metadata !{i32 1252, i32 0, metadata !134, metadata !1251}
!1251 = metadata !{i32 263, i32 0, metadata !521, null}
!1252 = metadata !{i32 1254, i32 0, metadata !303, metadata !1251}
!1253 = metadata !{i32 1255, i32 0, metadata !303, metadata !1251}
!1254 = metadata !{i32 1259, i32 0, metadata !138, metadata !1255}
!1255 = metadata !{i32 264, i32 0, metadata !521, null}
!1256 = metadata !{i32 1260, i32 0, metadata !306, metadata !1255}
!1257 = metadata !{i32 1261, i32 0, metadata !306, metadata !1255}
!1258 = metadata !{i32 268, i32 0, metadata !521, null}
!1259 = metadata !{i32 269, i32 0, metadata !521, null}
!1260 = metadata !{i32 270, i32 0, metadata !521, null}
!1261 = metadata !{i32 272, i32 0, metadata !521, null}
!1262 = metadata !{i32 274, i32 0, metadata !521, null}
!1263 = metadata !{i32 275, i32 0, metadata !521, null}
!1264 = metadata !{i32 279, i32 0, metadata !521, null}
!1265 = metadata !{i32 280, i32 0, metadata !521, null}
!1266 = metadata !{i32 281, i32 0, metadata !521, null}
!1267 = metadata !{i32 284, i32 0, metadata !519, null}
!1268 = metadata !{i32 285, i32 0, metadata !519, null}
!1269 = metadata !{i32 289, i32 0, metadata !519, null}
!1270 = metadata !{i32 290, i32 0, metadata !519, null}
!1271 = metadata !{i32 293, i32 0, metadata !519, null}
!1272 = metadata !{i32 294, i32 0, metadata !519, null}
!1273 = metadata !{i32 542, i32 0, metadata !219, null}
!1274 = metadata !{i32 63, i32 0, metadata !59, metadata !1275}
!1275 = metadata !{i32 545, i32 0, metadata !527, null}
!1276 = metadata !{i32 64, i32 0, metadata !238, metadata !1275}
!1277 = metadata !{i32 65, i32 0, metadata !237, metadata !1275}
!1278 = metadata !{i32 66, i32 0, metadata !237, metadata !1275}
!1279 = metadata !{i32 547, i32 0, metadata !527, null}
!1280 = metadata !{i32 548, i32 0, metadata !527, null}
!1281 = metadata !{i32 549, i32 0, metadata !527, null}
!1282 = metadata !{i32 552, i32 0, metadata !527, null}
!1283 = metadata !{i32 553, i32 0, metadata !527, null}
!1284 = metadata !{i32 554, i32 0, metadata !527, null}
!1285 = metadata !{i32 555, i32 0, metadata !527, null}
!1286 = metadata !{i32 559, i32 0, metadata !527, null}
!1287 = metadata !{i32 507, i32 0, metadata !216, metadata !1288}
!1288 = metadata !{i32 560, i32 0, metadata !527, null}
!1289 = metadata !{i32 508, i32 0, metadata !1290, metadata !1288}
!1290 = metadata !{i32 524299, metadata !216, i32 507, i32 0, metadata !1, i32 71} ; [ DW_TAG_lexical_block ]
!1291 = metadata !{i32 509, i32 0, metadata !1290, metadata !1288}
!1292 = metadata !{i32 510, i32 0, metadata !1290, metadata !1288}
!1293 = metadata !{i32 511, i32 0, metadata !1290, metadata !1288}
!1294 = metadata !{i32 515, i32 0, metadata !1290, metadata !1288}
!1295 = metadata !{i32 562, i32 0, metadata !529, null}
!1296 = metadata !{i32 563, i32 0, metadata !529, null}
!1297 = metadata !{i32 564, i32 0, metadata !529, null}
!1298 = metadata !{i32 520, i32 0, metadata !222, null}
!1299 = metadata !{i32 39, i32 0, metadata !0, metadata !1300}
!1300 = metadata !{i32 523, i32 0, metadata !533, null}
!1301 = metadata !{i32 40, i32 0, metadata !231, metadata !1300}
!1302 = metadata !{i32 43, i32 0, metadata !231, metadata !1300}
!1303 = metadata !{i32 46, i32 0, metadata !231, metadata !1300}
!1304 = metadata !{i32 47, i32 0, metadata !231, metadata !1300}
!1305 = metadata !{i32 48, i32 0, metadata !234, metadata !1300}
!1306 = metadata !{i32 49, i32 0, metadata !234, metadata !1300}
!1307 = metadata !{i32 525, i32 0, metadata !533, null}
!1308 = metadata !{i32 526, i32 0, metadata !533, null}
!1309 = metadata !{i32 527, i32 0, metadata !533, null}
!1310 = metadata !{i32 528, i32 0, metadata !533, null}
!1311 = metadata !{i32 529, i32 0, metadata !533, null}
!1312 = metadata !{i32 532, i32 0, metadata !533, null}
!1313 = metadata !{i32 507, i32 0, metadata !216, metadata !1314}
!1314 = metadata !{i32 533, i32 0, metadata !533, null}
!1315 = metadata !{i32 508, i32 0, metadata !1290, metadata !1314}
!1316 = metadata !{i32 509, i32 0, metadata !1290, metadata !1314}
!1317 = metadata !{i32 510, i32 0, metadata !1290, metadata !1314}
!1318 = metadata !{i32 511, i32 0, metadata !1290, metadata !1314}
!1319 = metadata !{i32 515, i32 0, metadata !1290, metadata !1314}
!1320 = metadata !{i32 1265, i32 0, metadata !144, metadata !1321}
!1321 = metadata !{i32 535, i32 0, metadata !535, null}
!1322 = metadata !{i32 1252, i32 0, metadata !134, metadata !1323}
!1323 = metadata !{i32 1266, i32 0, metadata !313, metadata !1321}
!1324 = metadata !{i32 1254, i32 0, metadata !303, metadata !1323}
!1325 = metadata !{i32 1255, i32 0, metadata !303, metadata !1323}
!1326 = metadata !{i32 1269, i32 0, metadata !313, metadata !1321}
!1327 = metadata !{i32 1270, i32 0, metadata !316, metadata !1321}
!1328 = metadata !{i32 1271, i32 0, metadata !316, metadata !1321}
!1329 = metadata !{i32 1273, i32 0, metadata !316, metadata !1321}
!1330 = metadata !{i32 1276, i32 0, metadata !316, metadata !1321}
!1331 = metadata !{i32 1279, i32 0, metadata !318, metadata !1321}
!1332 = metadata !{i32 1280, i32 0, metadata !318, metadata !1321}
!1333 = metadata !{i32 1281, i32 0, metadata !318, metadata !1321}
!1334 = metadata !{i32 1282, i32 0, metadata !318, metadata !1321}
!1335 = metadata !{i32 536, i32 0, metadata !535, null}
!1336 = metadata !{i32 537, i32 0, metadata !535, null}
!1337 = metadata !{i32 301, i32 0, metadata !225, null}
!1338 = metadata !{i32 305, i32 0, metadata !540, null}
!1339 = metadata !{i32 63, i32 0, metadata !59, metadata !1340}
!1340 = metadata !{i32 307, i32 0, metadata !540, null}
!1341 = metadata !{i32 64, i32 0, metadata !238, metadata !1340}
!1342 = metadata !{i32 65, i32 0, metadata !237, metadata !1340}
!1343 = metadata !{i32 66, i32 0, metadata !237, metadata !1340}
!1344 = metadata !{i32 309, i32 0, metadata !540, null}
!1345 = metadata !{i32 310, i32 0, metadata !540, null}
!1346 = metadata !{i32 311, i32 0, metadata !540, null}
!1347 = metadata !{i32 314, i32 0, metadata !540, null}
!1348 = metadata !{i32 315, i32 0, metadata !540, null}
!1349 = metadata !{i32 316, i32 0, metadata !540, null}
!1350 = metadata !{i32 320, i32 0, metadata !540, null}
!1351 = metadata !{i32 1252, i32 0, metadata !134, metadata !1352}
!1352 = metadata !{i32 323, i32 0, metadata !542, null}
!1353 = metadata !{i32 1254, i32 0, metadata !303, metadata !1352}
!1354 = metadata !{i32 1255, i32 0, metadata !303, metadata !1352}
!1355 = metadata !{i32 1259, i32 0, metadata !138, metadata !1356}
!1356 = metadata !{i32 324, i32 0, metadata !542, null}
!1357 = metadata !{i32 1260, i32 0, metadata !306, metadata !1356}
!1358 = metadata !{i32 1261, i32 0, metadata !306, metadata !1356}
!1359 = metadata !{i32 328, i32 0, metadata !542, null}
!1360 = metadata !{i32 329, i32 0, metadata !542, null}
!1361 = metadata !{i32 330, i32 0, metadata !542, null}
!1362 = metadata !{i32 331, i32 0, metadata !542, null}
!1363 = metadata !{i32 333, i32 0, metadata !542, null}
!1364 = metadata !{i32 334, i32 0, metadata !542, null}
!1365 = metadata !{i32 338, i32 0, metadata !542, null}
!1366 = metadata !{i32 339, i32 0, metadata !542, null}
!1367 = metadata !{i32 340, i32 0, metadata !542, null}
!1368 = metadata !{i32 342, i32 0, metadata !542, null}
!1369 = metadata !{i64 0}
!1370 = metadata !{i32 346, i32 0, metadata !544, null}
!1371 = metadata !{i32 347, i32 0, metadata !544, null}
!1372 = metadata !{i32 350, i32 0, metadata !544, null}
!1373 = metadata !{i32 351, i32 0, metadata !544, null}
!1374 = metadata !{i32 353, i32 0, metadata !544, null}
!1375 = metadata !{i32 354, i32 0, metadata !544, null}
!1376 = metadata !{i32 358, i32 0, metadata !544, null}
!1377 = metadata !{i32 359, i32 0, metadata !544, null}
!1378 = metadata !{i32 361, i32 0, metadata !544, null}
!1379 = metadata !{i32 362, i32 0, metadata !544, null}
!1380 = metadata !{i32 364, i32 0, metadata !544, null}
!1381 = metadata !{i32 365, i32 0, metadata !544, null}
!1382 = metadata !{i32 367, i32 0, metadata !544, null}
!1383 = metadata !{i32 128, i32 0, metadata !226, null}
!1384 = metadata !{i32 133, i32 0, metadata !549, null}
!1385 = metadata !{i32 134, i32 0, metadata !549, null}
!1386 = metadata !{i32 137, i32 0, metadata !549, null}
!1387 = metadata !{i32 138, i32 0, metadata !549, null}
!1388 = metadata !{i32 141, i32 0, metadata !549, null}
!1389 = metadata !{i32 144, i32 0, metadata !549, null}
!1390 = metadata !{i32 39, i32 0, metadata !0, metadata !1391}
!1391 = metadata !{i32 146, i32 0, metadata !549, null}
!1392 = metadata !{i32 40, i32 0, metadata !231, metadata !1391}
!1393 = metadata !{i32 43, i32 0, metadata !231, metadata !1391}
!1394 = metadata !{i32 46, i32 0, metadata !231, metadata !1391}
!1395 = metadata !{i32 47, i32 0, metadata !231, metadata !1391}
!1396 = metadata !{i32 48, i32 0, metadata !234, metadata !1391}
!1397 = metadata !{i32 49, i32 0, metadata !234, metadata !1391}
!1398 = metadata !{i32 147, i32 0, metadata !549, null}
!1399 = metadata !{i32 150, i32 0, metadata !549, null}
!1400 = metadata !{i32 152, i32 0, metadata !549, null}
!1401 = metadata !{i32 153, i32 0, metadata !549, null}
!1402 = metadata !{i32 165, i32 0, metadata !549, null}
!1403 = metadata !{i32 168, i32 0, metadata !549, null}
!1404 = metadata !{i32 169, i32 0, metadata !549, null}
!1405 = metadata !{i32 173, i32 0, metadata !549, null}
!1406 = metadata !{i32 97, i32 0, metadata !76, metadata !1405}
!1407 = metadata !{i32 99, i32 0, metadata !245, metadata !1405}
!1408 = metadata !{i32 101, i32 0, metadata !245, metadata !1405}
!1409 = metadata !{i32 103, i32 0, metadata !245, metadata !1405}
!1410 = metadata !{i32 107, i32 0, metadata !245, metadata !1405}
!1411 = metadata !{i32 118, i32 0, metadata !245, metadata !1405}
!1412 = metadata !{i32 121, i32 0, metadata !245, metadata !1405}
!1413 = metadata !{i32 174, i32 0, metadata !549, null}
!1414 = metadata !{i32 178, i32 0, metadata !549, null}
!1415 = metadata !{i32 1265, i32 0, metadata !144, metadata !1416}
!1416 = metadata !{i32 181, i32 0, metadata !553, null}
!1417 = metadata !{i32 1252, i32 0, metadata !134, metadata !1418}
!1418 = metadata !{i32 1266, i32 0, metadata !313, metadata !1416}
!1419 = metadata !{i32 1254, i32 0, metadata !303, metadata !1418}
!1420 = metadata !{i32 1255, i32 0, metadata !303, metadata !1418}
!1421 = metadata !{i32 1269, i32 0, metadata !313, metadata !1416}
!1422 = metadata !{i32 1270, i32 0, metadata !316, metadata !1416}
!1423 = metadata !{i32 1271, i32 0, metadata !316, metadata !1416}
!1424 = metadata !{i32 1273, i32 0, metadata !316, metadata !1416}
!1425 = metadata !{i32 1276, i32 0, metadata !316, metadata !1416}
!1426 = metadata !{i32 1279, i32 0, metadata !318, metadata !1416}
!1427 = metadata !{i32 1280, i32 0, metadata !318, metadata !1416}
!1428 = metadata !{i32 1281, i32 0, metadata !318, metadata !1416}
!1429 = metadata !{i32 1282, i32 0, metadata !318, metadata !1416}
!1430 = metadata !{i32 182, i32 0, metadata !553, null}
!1431 = metadata !{i32 183, i32 0, metadata !553, null}
!1432 = metadata !{i32 186, i32 0, metadata !553, null}
!1433 = metadata !{i32 189, i32 0, metadata !549, null}
!1434 = metadata !{i32 190, i32 0, metadata !549, null}
!1435 = metadata !{i32 191, i32 0, metadata !549, null}
!1436 = metadata !{i32 193, i32 0, metadata !549, null}
!1437 = metadata !{i32 195, i32 0, metadata !549, null}
