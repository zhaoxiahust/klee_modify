; ModuleID = 'Regexp.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [3 x i8] c"re\00", align 1
@.str1 = private constant [6 x i8] c"hello\00", align 1

define internal i32 @matchstar(i32 %c, i8* %re, i8* %text) nounwind {
entry:
  %c_addr = alloca i32, align 4
  %re_addr = alloca i8*, align 8
  %text_addr = alloca i8*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %c, i32* %c_addr
  store i8* %re, i8** %re_addr
  store i8* %text, i8** %text_addr
  br label %bb, !dbg !70

bb:                                               ; preds = %bb4, %bb3, %entry
  %1 = load i8** %re_addr, align 8, !dbg !71
  %2 = load i8** %text_addr, align 8, !dbg !71
  %3 = call i32 @matchhere(i8* %1, i8* %2) nounwind, !dbg !71
  %4 = icmp ne i32 %3, 0, !dbg !71
  br i1 %4, label %bb1, label %bb2, !dbg !71

bb1:                                              ; preds = %bb
  store i32 1, i32* %0, align 4, !dbg !73
  br label %bb6, !dbg !73

bb2:                                              ; preds = %bb
  %5 = load i8** %text_addr, align 8, !dbg !74
  %6 = load i8* %5, align 1, !dbg !74
  %7 = icmp eq i8 %6, 0, !dbg !74
  br i1 %7, label %bb5, label %bb3, !dbg !74

bb3:                                              ; preds = %bb2
  %8 = load i8** %text_addr, align 8, !dbg !74
  %9 = load i8* %8, align 1, !dbg !74
  %10 = sext i8 %9 to i32, !dbg !74
  %11 = load i32* %c_addr, align 4, !dbg !74
  %12 = icmp eq i32 %10, %11, !dbg !74
  %13 = zext i1 %12 to i8, !dbg !74
  %14 = load i8** %text_addr, align 8, !dbg !74
  %15 = getelementptr inbounds i8* %14, i64 1, !dbg !74
  store i8* %15, i8** %text_addr, align 8, !dbg !74
  %toBool = icmp ne i8 %13, 0, !dbg !74
  br i1 %toBool, label %bb, label %bb4, !dbg !74

bb4:                                              ; preds = %bb3
  %16 = load i32* %c_addr, align 4, !dbg !74
  %17 = icmp eq i32 %16, 46, !dbg !74
  br i1 %17, label %bb, label %bb5, !dbg !74

bb5:                                              ; preds = %bb4, %bb2
  store i32 0, i32* %0, align 4, !dbg !75
  br label %bb6, !dbg !75

bb6:                                              ; preds = %bb5, %bb1
  %18 = load i32* %0, align 4, !dbg !73
  store i32 %18, i32* %retval, align 4, !dbg !73
  %retval7 = load i32* %retval, !dbg !73
  ret i32 %retval7, !dbg !73
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define internal i32 @matchhere(i8* %re, i8* %text) nounwind {
entry:
  %re_addr = alloca i8*, align 8
  %text_addr = alloca i8*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %re, i8** %re_addr
  store i8* %text, i8** %text_addr
  %1 = load i8** %re_addr, align 8, !dbg !76
  %2 = getelementptr inbounds i8* %1, i64 0, !dbg !76
  %3 = load i8* %2, align 1, !dbg !76
  %4 = icmp eq i8 %3, 0, !dbg !76
  br i1 %4, label %bb, label %bb1, !dbg !76

bb:                                               ; preds = %entry
  store i32 0, i32* %0, align 4, !dbg !78
  br label %bb11, !dbg !78

bb1:                                              ; preds = %entry
  %5 = load i8** %re_addr, align 8, !dbg !79
  %6 = getelementptr inbounds i8* %5, i64 1, !dbg !79
  %7 = load i8* %6, align 1, !dbg !79
  %8 = icmp eq i8 %7, 42, !dbg !79
  %9 = load i8** %re_addr, align 8, !dbg !80
  br i1 %8, label %bb2, label %bb3, !dbg !79

bb2:                                              ; preds = %bb1
  %10 = getelementptr inbounds i8* %9, i64 2, !dbg !80
  %11 = load i8** %re_addr, align 8, !dbg !80
  %12 = getelementptr inbounds i8* %11, i64 0, !dbg !80
  %13 = load i8* %12, align 1, !dbg !80
  %14 = sext i8 %13 to i32, !dbg !80
  %15 = load i8** %text_addr, align 8, !dbg !80
  %16 = call i32 @matchstar(i32 %14, i8* %10, i8* %15) nounwind, !dbg !80
  store i32 %16, i32* %0, align 4, !dbg !80
  br label %bb11, !dbg !80

bb3:                                              ; preds = %bb1
  %17 = getelementptr inbounds i8* %9, i64 0, !dbg !81
  %18 = load i8* %17, align 1, !dbg !81
  %19 = icmp eq i8 %18, 36, !dbg !81
  br i1 %19, label %bb4, label %bb6, !dbg !81

bb4:                                              ; preds = %bb3
  %20 = load i8** %re_addr, align 8, !dbg !81
  %21 = getelementptr inbounds i8* %20, i64 1, !dbg !81
  %22 = load i8* %21, align 1, !dbg !81
  %23 = icmp eq i8 %22, 0, !dbg !81
  br i1 %23, label %bb5, label %bb6, !dbg !81

bb5:                                              ; preds = %bb4
  %24 = load i8** %text_addr, align 8, !dbg !82
  %25 = load i8* %24, align 1, !dbg !82
  %26 = icmp eq i8 %25, 0, !dbg !82
  %27 = zext i1 %26 to i32, !dbg !82
  store i32 %27, i32* %0, align 4, !dbg !82
  br label %bb11, !dbg !82

bb6:                                              ; preds = %bb4, %bb3
  %28 = load i8** %text_addr, align 8, !dbg !83
  %29 = load i8* %28, align 1, !dbg !83
  %30 = icmp ne i8 %29, 0, !dbg !83
  br i1 %30, label %bb7, label %bb10, !dbg !83

bb7:                                              ; preds = %bb6
  %31 = load i8** %re_addr, align 8, !dbg !83
  %32 = getelementptr inbounds i8* %31, i64 0, !dbg !83
  %33 = load i8* %32, align 1, !dbg !83
  %34 = icmp eq i8 %33, 46, !dbg !83
  br i1 %34, label %bb9, label %bb8, !dbg !83

bb8:                                              ; preds = %bb7
  %35 = load i8** %re_addr, align 8, !dbg !83
  %36 = getelementptr inbounds i8* %35, i64 0, !dbg !83
  %37 = load i8* %36, align 1, !dbg !83
  %38 = load i8** %text_addr, align 8, !dbg !83
  %39 = load i8* %38, align 1, !dbg !83
  %40 = icmp eq i8 %37, %39, !dbg !83
  br i1 %40, label %bb9, label %bb10, !dbg !83

bb9:                                              ; preds = %bb8, %bb7
  %41 = load i8** %text_addr, align 8, !dbg !84
  %42 = getelementptr inbounds i8* %41, i64 1, !dbg !84
  %43 = load i8** %re_addr, align 8, !dbg !84
  %44 = getelementptr inbounds i8* %43, i64 1, !dbg !84
  %45 = call i32 @matchhere(i8* %44, i8* %42) nounwind, !dbg !84
  store i32 %45, i32* %0, align 4, !dbg !84
  br label %bb11, !dbg !84

bb10:                                             ; preds = %bb8, %bb6
  store i32 0, i32* %0, align 4, !dbg !85
  br label %bb11, !dbg !85

bb11:                                             ; preds = %bb10, %bb9, %bb5, %bb2, %bb
  %46 = load i32* %0, align 4, !dbg !78
  store i32 %46, i32* %retval, align 4, !dbg !78
  %retval12 = load i32* %retval, !dbg !78
  ret i32 %retval12, !dbg !78
}

define i32 @match(i8* %re, i8* %text) nounwind {
entry:
  %re_addr = alloca i8*, align 8
  %text_addr = alloca i8*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %re, i8** %re_addr
  store i8* %text, i8** %text_addr
  %1 = load i8** %re_addr, align 8, !dbg !86
  %2 = getelementptr inbounds i8* %1, i64 0, !dbg !86
  %3 = load i8* %2, align 1, !dbg !86
  %4 = icmp eq i8 %3, 94, !dbg !86
  br i1 %4, label %bb, label %bb1, !dbg !86

bb:                                               ; preds = %entry
  %5 = load i8** %re_addr, align 8, !dbg !88
  %6 = getelementptr inbounds i8* %5, i64 1, !dbg !88
  %7 = load i8** %text_addr, align 8, !dbg !88
  %8 = call i32 @matchhere(i8* %6, i8* %7) nounwind, !dbg !88
  store i32 %8, i32* %0, align 4, !dbg !88
  br label %bb5, !dbg !88

bb1:                                              ; preds = %bb3, %entry
  %9 = load i8** %re_addr, align 8, !dbg !89
  %10 = load i8** %text_addr, align 8, !dbg !89
  %11 = call i32 @matchhere(i8* %9, i8* %10) nounwind, !dbg !89
  %12 = icmp ne i32 %11, 0, !dbg !89
  br i1 %12, label %bb2, label %bb3, !dbg !89

bb2:                                              ; preds = %bb1
  store i32 1, i32* %0, align 4, !dbg !90
  br label %bb5, !dbg !90

bb3:                                              ; preds = %bb1
  %13 = load i8** %text_addr, align 8, !dbg !91
  %14 = load i8* %13, align 1, !dbg !91
  %15 = icmp ne i8 %14, 0, !dbg !91
  %16 = zext i1 %15 to i8, !dbg !91
  %17 = load i8** %text_addr, align 8, !dbg !91
  %18 = getelementptr inbounds i8* %17, i64 1, !dbg !91
  store i8* %18, i8** %text_addr, align 8, !dbg !91
  %toBool = icmp ne i8 %16, 0, !dbg !91
  br i1 %toBool, label %bb1, label %bb4, !dbg !91

bb4:                                              ; preds = %bb3
  store i32 0, i32* %0, align 4, !dbg !92
  br label %bb5, !dbg !92

bb5:                                              ; preds = %bb4, %bb2, %bb
  %19 = load i32* %0, align 4, !dbg !88
  store i32 %19, i32* %retval, align 4, !dbg !88
  %retval6 = load i32* %retval, !dbg !88
  ret i32 %retval6, !dbg !88
}

define i32 @main() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %re = alloca [7 x i8]
  %"alloca point" = bitcast i32 0 to i32
  %re1 = bitcast [7 x i8]* %re to i8*, !dbg !93
  %1 = call i32 (...)* @klee_make_symbolic(i8* %re1, i64 7, i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !93
  %re2 = bitcast [7 x i8]* %re to i8*, !dbg !95
  %2 = call i32 @match(i8* %re2, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !95
  store i32 0, i32* %0, align 4, !dbg !96
  %3 = load i32* %0, align 4, !dbg !96
  store i32 %3, i32* %retval, align 4, !dbg !96
  %retval3 = load i32* %retval, !dbg !96
  ret i32 %retval3, !dbg !96
}

declare i32 @klee_make_symbolic(...)

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !8, !11, !12, !15, !24, !33}
!llvm.dbg.lv.memcpy = !{!43, !44, !45, !46, !50}
!llvm.dbg.lv.memmove = !{!53, !54, !55, !56, !60}
!llvm.dbg.lv.memset = !{!63, !64, !65, !66}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"matchstar", metadata !"matchstar", metadata !"", metadata !1, i32 14, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, i8*, i8*)* @matchstar} ; [ DW_TAG_subprogram
!1 = metadata !{i32 524329, metadata !"Regexp.c", metadata !"/home/kain/Documents/bishe/klee/examples/regexp/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"Regexp.c", metadata !"/home/kain/Documents/bishe/klee/examples/regexp/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5, metadata !6, metadata !6}
!5 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!8 = metadata !{i32 524334, i32 0, metadata !1, metadata !"matchhere", metadata !"matchhere", metadata !"", metadata !1, i32 22, metadata !9, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i8*, i8*)* @matchhere} ; [ DW_TAG_subprogram ]
!9 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_subroutine_type ]
!10 = metadata !{metadata !5, metadata !6, metadata !6}
!11 = metadata !{i32 524334, i32 0, metadata !1, metadata !"match", metadata !"match", metadata !"match", metadata !1, i32 34, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i8*, i8*)* @match} ; [ DW_TAG_subprogram ]
!12 = metadata !{i32 524334, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 51, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 ()* @main} ; [ DW_TAG_subprogram ]
!13 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null} ; [ DW_TAG_subroutine_type ]
!14 = metadata !{metadata !5}
!15 = metadata !{i32 524334, i32 0, metadata !16, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !16, i32 12, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!16 = metadata !{i32 524329, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !17} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 524305, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!18 = metadata !{i32 524309, metadata !16, metadata !"", metadata !16, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{metadata !20, metadata !20, metadata !20, metadata !21}
!20 = metadata !{i32 524303, metadata !16, metadata !"", metadata !16, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!21 = metadata !{i32 524310, metadata !22, metadata !"size_t", metadata !22, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!22 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !17} ; [ DW_TAG_file_type ]
!23 = metadata !{i32 524324, metadata !16, metadata !"long unsigned int", metadata !16, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!24 = metadata !{i32 524334, i32 0, metadata !25, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !25, i32 12, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!25 = metadata !{i32 524329, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !26} ; [ DW_TAG_file_type ]
!26 = metadata !{i32 524305, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_u
!27 = metadata !{i32 524309, metadata !25, metadata !"", metadata !25, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null} ; [ DW_TAG_subroutine_type ]
!28 = metadata !{metadata !29, metadata !29, metadata !29, metadata !30}
!29 = metadata !{i32 524303, metadata !25, metadata !"", metadata !25, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!30 = metadata !{i32 524310, metadata !31, metadata !"size_t", metadata !31, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ]
!31 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !26} ; [ DW_TAG_file_type ]
!32 = metadata !{i32 524324, metadata !25, metadata !"long unsigned int", metadata !25, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!33 = metadata !{i32 524334, i32 0, metadata !34, metadata !"memset", metadata !"memset", metadata !"memset", metadata !34, i32 12, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!34 = metadata !{i32 524329, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !35} ; [ DW_TAG_file_type ]
!35 = metadata !{i32 524305, i32 0, i32 1, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!36 = metadata !{i32 524309, metadata !34, metadata !"", metadata !34, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, null} ; [ DW_TAG_subroutine_type ]
!37 = metadata !{metadata !38, metadata !38, metadata !39, metadata !40}
!38 = metadata !{i32 524303, metadata !34, metadata !"", metadata !34, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!39 = metadata !{i32 524324, metadata !34, metadata !"int", metadata !34, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!40 = metadata !{i32 524310, metadata !41, metadata !"size_t", metadata !41, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!41 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !35} ; [ DW_TAG_file_type ]
!42 = metadata !{i32 524324, metadata !34, metadata !"long unsigned int", metadata !34, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!43 = metadata !{i32 524545, metadata !15, metadata !"destaddr", metadata !16, i32 12, metadata !20} ; [ DW_TAG_arg_variable ]
!44 = metadata !{i32 524545, metadata !15, metadata !"srcaddr", metadata !16, i32 12, metadata !20} ; [ DW_TAG_arg_variable ]
!45 = metadata !{i32 524545, metadata !15, metadata !"len", metadata !16, i32 12, metadata !21} ; [ DW_TAG_arg_variable ]
!46 = metadata !{i32 524544, metadata !47, metadata !"dest", metadata !16, i32 13, metadata !48} ; [ DW_TAG_auto_variable ]
!47 = metadata !{i32 524299, metadata !15, i32 12, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ]
!48 = metadata !{i32 524303, metadata !16, metadata !"", metadata !16, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ]
!49 = metadata !{i32 524324, metadata !16, metadata !"char", metadata !16, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!50 = metadata !{i32 524544, metadata !47, metadata !"src", metadata !16, i32 14, metadata !51} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 524303, metadata !16, metadata !"", metadata !16, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_pointer_type ]
!52 = metadata !{i32 524326, metadata !16, metadata !"", metadata !16, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !49} ; [ DW_TAG_const_type ]
!53 = metadata !{i32 524545, metadata !24, metadata !"dst", metadata !25, i32 12, metadata !29} ; [ DW_TAG_arg_variable ]
!54 = metadata !{i32 524545, metadata !24, metadata !"src", metadata !25, i32 12, metadata !29} ; [ DW_TAG_arg_variable ]
!55 = metadata !{i32 524545, metadata !24, metadata !"count", metadata !25, i32 12, metadata !30} ; [ DW_TAG_arg_variable ]
!56 = metadata !{i32 524544, metadata !57, metadata !"a", metadata !25, i32 13, metadata !58} ; [ DW_TAG_auto_variable ]
!57 = metadata !{i32 524299, metadata !24, i32 12, i32 0, metadata !25, i32 0} ; [ DW_TAG_lexical_block ]
!58 = metadata !{i32 524303, metadata !25, metadata !"", metadata !25, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ]
!59 = metadata !{i32 524324, metadata !25, metadata !"char", metadata !25, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!60 = metadata !{i32 524544, metadata !57, metadata !"b", metadata !25, i32 14, metadata !61} ; [ DW_TAG_auto_variable ]
!61 = metadata !{i32 524303, metadata !25, metadata !"", metadata !25, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !62} ; [ DW_TAG_pointer_type ]
!62 = metadata !{i32 524326, metadata !25, metadata !"", metadata !25, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !59} ; [ DW_TAG_const_type ]
!63 = metadata !{i32 524545, metadata !33, metadata !"dst", metadata !34, i32 12, metadata !38} ; [ DW_TAG_arg_variable ]
!64 = metadata !{i32 524545, metadata !33, metadata !"s", metadata !34, i32 12, metadata !39} ; [ DW_TAG_arg_variable ]
!65 = metadata !{i32 524545, metadata !33, metadata !"count", metadata !34, i32 12, metadata !40} ; [ DW_TAG_arg_variable ]
!66 = metadata !{i32 524544, metadata !67, metadata !"a", metadata !34, i32 13, metadata !68} ; [ DW_TAG_auto_variable ]
!67 = metadata !{i32 524299, metadata !33, i32 12, i32 0, metadata !34, i32 0} ; [ DW_TAG_lexical_block ]
!68 = metadata !{i32 524303, metadata !34, metadata !"", metadata !34, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ]
!69 = metadata !{i32 524324, metadata !34, metadata !"char", metadata !34, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!70 = metadata !{i32 14, i32 0, metadata !0, null}
!71 = metadata !{i32 16, i32 0, metadata !72, null}
!72 = metadata !{i32 524299, metadata !0, i32 14, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 17, i32 0, metadata !72, null}
!74 = metadata !{i32 18, i32 0, metadata !72, null}
!75 = metadata !{i32 19, i32 0, metadata !72, null}
!76 = metadata !{i32 23, i32 0, metadata !77, null}
!77 = metadata !{i32 524299, metadata !8, i32 22, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!78 = metadata !{i32 24, i32 0, metadata !77, null}
!79 = metadata !{i32 25, i32 0, metadata !77, null}
!80 = metadata !{i32 26, i32 0, metadata !77, null}
!81 = metadata !{i32 27, i32 0, metadata !77, null}
!82 = metadata !{i32 28, i32 0, metadata !77, null}
!83 = metadata !{i32 29, i32 0, metadata !77, null}
!84 = metadata !{i32 30, i32 0, metadata !77, null}
!85 = metadata !{i32 31, i32 0, metadata !77, null}
!86 = metadata !{i32 35, i32 0, metadata !87, null}
!87 = metadata !{i32 524299, metadata !11, i32 34, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 36, i32 0, metadata !87, null}
!89 = metadata !{i32 38, i32 0, metadata !87, null}
!90 = metadata !{i32 39, i32 0, metadata !87, null}
!91 = metadata !{i32 40, i32 0, metadata !87, null}
!92 = metadata !{i32 41, i32 0, metadata !87, null}
!93 = metadata !{i32 56, i32 0, metadata !94, null}
!94 = metadata !{i32 524299, metadata !12, i32 51, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!95 = metadata !{i32 59, i32 0, metadata !94, null}
!96 = metadata !{i32 61, i32 0, metadata !94, null}
