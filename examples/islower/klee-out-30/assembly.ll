; ModuleID = 'ppppppp.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_attr_t = type { i64, [12 x i32] }

@.str = private constant [19 x i8] c"aaaaaaaaaaaaa00000\00", align 1
@.str1 = private constant [19 x i8] c"aaaaaaaaaaaa111111\00", align 1
@.str2 = private constant [12 x i8] c"int hi00000\00", align 1
@.str3 = private constant [13 x i8] c"int hi111111\00", align 1
@.str4 = private constant [10 x i8] c"c main hi\00", align 1
@.str5 = private constant [11 x i8] c"c main cry\00", align 1

define i32 @aa(i32 %b) nounwind {
entry:
  %b_addr = alloca i32, align 4
  %retval = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %b, i32* %b_addr
  %0 = load i32* %b_addr, align 4, !dbg !71
  %1 = icmp sle i32 %0, 39, !dbg !71
  br i1 %1, label %bb, label %bb1, !dbg !71

bb:                                               ; preds = %entry
  %2 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !73
  br label %return, !dbg !73

bb1:                                              ; preds = %entry
  %3 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !74
  br label %return, !dbg !74

return:                                           ; preds = %bb, %bb1
  %retval3 = load i32* %retval, !dbg !75
  ret i32 %retval3, !dbg !75
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @puts(i8*)

define i8* @hi(i8* %ptr) nounwind {
entry:
  %ptr_addr = alloca i8*, align 8
  %retval = alloca i8*
  %a = alloca i32
  %b = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %ptr, i8** %ptr_addr
  %0 = load i8** %ptr_addr, align 8, !dbg !76
  %1 = bitcast i8* %0 to i32*, !dbg !76
  %2 = load i32* %1, align 4, !dbg !76
  store i32 %2, i32* %a, align 4, !dbg !76
  %3 = load i32* %b, align 4, !dbg !78
  %4 = icmp sgt i32 %3, 100, !dbg !78
  %5 = load i32* %a, align 4, !dbg !79
  br i1 %4, label %bb, label %bb4, !dbg !78

bb:                                               ; preds = %entry
  %6 = icmp sgt i32 %5, 20, !dbg !79
  br i1 %6, label %bb1, label %bb2, !dbg !79

bb1:                                              ; preds = %bb
  %7 = call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !80
  br label %return, !dbg !80

bb2:                                              ; preds = %bb
  %8 = call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str3, i64 0, i64 0)) nounwind, !dbg !81
  br label %return, !dbg !81

bb4:                                              ; preds = %entry
  %9 = call i32 @aa(i32 %5) nounwind, !dbg !82
  br label %return, !dbg !82

return:                                           ; preds = %bb4, %bb2, %bb1
  %retval6 = load i8** %retval, !dbg !83
  ret i8* %retval6, !dbg !83
}

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %retval = alloca i32
  %c = alloca i32
  %d = alloca i32
  %thread1 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  %c1 = bitcast i32* %c to i8*, !dbg !84
  %0 = call i32 @pthread_create(i64* noalias %thread1, %union.pthread_attr_t* noalias null, i8* (i8*)* @hi, i8* noalias %c1) nounwind, !dbg !84
  %1 = load i32* %d, align 4, !dbg !86
  %2 = icmp sgt i32 %1, 100, !dbg !86
  br i1 %2, label %bb, label %return, !dbg !86

bb:                                               ; preds = %entry
  %3 = load i32* %c, align 4, !dbg !87
  %4 = icmp sgt i32 %3, 0, !dbg !87
  br i1 %4, label %bb2, label %bb3, !dbg !87

bb2:                                              ; preds = %bb
  %5 = call i32 @puts(i8* getelementptr inbounds ([10 x i8]* @.str4, i64 0, i64 0)) nounwind, !dbg !88
  br label %return, !dbg !88

bb3:                                              ; preds = %bb
  %6 = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0)) nounwind, !dbg !89
  br label %return, !dbg !89

return:                                           ; preds = %entry, %bb2, %bb3
  %retval5 = load i32* %retval, !dbg !90
  ret i32 %retval5, !dbg !90
}

declare i32 @pthread_create(i64* noalias, %union.pthread_attr_t* noalias, i8* (i8*)*, i8* noalias) nounwind

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !6, !10, !16, !25, !34}
!llvm.dbg.lv.memcpy = !{!44, !45, !46, !47, !51}
!llvm.dbg.lv.memmove = !{!54, !55, !56, !57, !61}
!llvm.dbg.lv.memset = !{!64, !65, !66, !67}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"aa", metadata !"aa", metadata !"aa", metadata !1, i32 12, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32)* @aa} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"hihi.c", metadata !"/home/kain/Documents/bishe/klee/examples/islower/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"hihi.c", metadata !"/home/kain/Documents/bishe/klee/examples/islower/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit 
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5}
!5 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524334, i32 0, metadata !1, metadata !"hi", metadata !"hi", metadata !"hi", metadata !1, i32 21, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*)* @hi} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 524334, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 58, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!11 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null} ; [ DW_TAG_subroutine_type ]
!12 = metadata !{metadata !5, metadata !5, metadata !13}
!13 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ]
!14 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ]
!15 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!16 = metadata !{i32 524334, i32 0, metadata !17, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !17, i32 12, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 524329, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !18} ; [ DW_TAG_file_type ]
!18 = metadata !{i32 524305, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!19 = metadata !{i32 524309, metadata !17, metadata !"", metadata !17, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{metadata !21, metadata !21, metadata !21, metadata !22}
!21 = metadata !{i32 524303, metadata !17, metadata !"", metadata !17, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!22 = metadata !{i32 524310, metadata !23, metadata !"size_t", metadata !23, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_typedef ]
!23 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !18} ; [ DW_TAG_file_type ]
!24 = metadata !{i32 524324, metadata !17, metadata !"long unsigned int", metadata !17, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!25 = metadata !{i32 524334, i32 0, metadata !26, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !26, i32 12, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!26 = metadata !{i32 524329, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !27} ; [ DW_TAG_file_type ]
!27 = metadata !{i32 524305, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_u
!28 = metadata !{i32 524309, metadata !26, metadata !"", metadata !26, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, null} ; [ DW_TAG_subroutine_type ]
!29 = metadata !{metadata !30, metadata !30, metadata !30, metadata !31}
!30 = metadata !{i32 524303, metadata !26, metadata !"", metadata !26, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!31 = metadata !{i32 524310, metadata !32, metadata !"size_t", metadata !32, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!32 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !27} ; [ DW_TAG_file_type ]
!33 = metadata !{i32 524324, metadata !26, metadata !"long unsigned int", metadata !26, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!34 = metadata !{i32 524334, i32 0, metadata !35, metadata !"memset", metadata !"memset", metadata !"memset", metadata !35, i32 12, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 524329, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !36} ; [ DW_TAG_file_type ]
!36 = metadata !{i32 524305, i32 0, i32 1, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!37 = metadata !{i32 524309, metadata !35, metadata !"", metadata !35, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null} ; [ DW_TAG_subroutine_type ]
!38 = metadata !{metadata !39, metadata !39, metadata !40, metadata !41}
!39 = metadata !{i32 524303, metadata !35, metadata !"", metadata !35, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!40 = metadata !{i32 524324, metadata !35, metadata !"int", metadata !35, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!41 = metadata !{i32 524310, metadata !42, metadata !"size_t", metadata !42, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ]
!42 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !36} ; [ DW_TAG_file_type ]
!43 = metadata !{i32 524324, metadata !35, metadata !"long unsigned int", metadata !35, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!44 = metadata !{i32 524545, metadata !16, metadata !"destaddr", metadata !17, i32 12, metadata !21} ; [ DW_TAG_arg_variable ]
!45 = metadata !{i32 524545, metadata !16, metadata !"srcaddr", metadata !17, i32 12, metadata !21} ; [ DW_TAG_arg_variable ]
!46 = metadata !{i32 524545, metadata !16, metadata !"len", metadata !17, i32 12, metadata !22} ; [ DW_TAG_arg_variable ]
!47 = metadata !{i32 524544, metadata !48, metadata !"dest", metadata !17, i32 13, metadata !49} ; [ DW_TAG_auto_variable ]
!48 = metadata !{i32 524299, metadata !16, i32 12, i32 0, metadata !17, i32 0} ; [ DW_TAG_lexical_block ]
!49 = metadata !{i32 524303, metadata !17, metadata !"", metadata !17, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ]
!50 = metadata !{i32 524324, metadata !17, metadata !"char", metadata !17, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!51 = metadata !{i32 524544, metadata !48, metadata !"src", metadata !17, i32 14, metadata !52} ; [ DW_TAG_auto_variable ]
!52 = metadata !{i32 524303, metadata !17, metadata !"", metadata !17, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !53} ; [ DW_TAG_pointer_type ]
!53 = metadata !{i32 524326, metadata !17, metadata !"", metadata !17, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !50} ; [ DW_TAG_const_type ]
!54 = metadata !{i32 524545, metadata !25, metadata !"dst", metadata !26, i32 12, metadata !30} ; [ DW_TAG_arg_variable ]
!55 = metadata !{i32 524545, metadata !25, metadata !"src", metadata !26, i32 12, metadata !30} ; [ DW_TAG_arg_variable ]
!56 = metadata !{i32 524545, metadata !25, metadata !"count", metadata !26, i32 12, metadata !31} ; [ DW_TAG_arg_variable ]
!57 = metadata !{i32 524544, metadata !58, metadata !"a", metadata !26, i32 13, metadata !59} ; [ DW_TAG_auto_variable ]
!58 = metadata !{i32 524299, metadata !25, i32 12, i32 0, metadata !26, i32 0} ; [ DW_TAG_lexical_block ]
!59 = metadata !{i32 524303, metadata !26, metadata !"", metadata !26, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ]
!60 = metadata !{i32 524324, metadata !26, metadata !"char", metadata !26, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!61 = metadata !{i32 524544, metadata !58, metadata !"b", metadata !26, i32 14, metadata !62} ; [ DW_TAG_auto_variable ]
!62 = metadata !{i32 524303, metadata !26, metadata !"", metadata !26, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ]
!63 = metadata !{i32 524326, metadata !26, metadata !"", metadata !26, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !60} ; [ DW_TAG_const_type ]
!64 = metadata !{i32 524545, metadata !34, metadata !"dst", metadata !35, i32 12, metadata !39} ; [ DW_TAG_arg_variable ]
!65 = metadata !{i32 524545, metadata !34, metadata !"s", metadata !35, i32 12, metadata !40} ; [ DW_TAG_arg_variable ]
!66 = metadata !{i32 524545, metadata !34, metadata !"count", metadata !35, i32 12, metadata !41} ; [ DW_TAG_arg_variable ]
!67 = metadata !{i32 524544, metadata !68, metadata !"a", metadata !35, i32 13, metadata !69} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 524299, metadata !34, i32 12, i32 0, metadata !35, i32 0} ; [ DW_TAG_lexical_block ]
!69 = metadata !{i32 524303, metadata !35, metadata !"", metadata !35, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !70} ; [ DW_TAG_pointer_type ]
!70 = metadata !{i32 524324, metadata !35, metadata !"char", metadata !35, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!71 = metadata !{i32 13, i32 0, metadata !72, null}
!72 = metadata !{i32 524299, metadata !0, i32 12, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 14, i32 0, metadata !72, null}
!74 = metadata !{i32 16, i32 0, metadata !72, null}
!75 = metadata !{i32 18, i32 0, metadata !72, null}
!76 = metadata !{i32 22, i32 0, metadata !77, null}
!77 = metadata !{i32 524299, metadata !6, i32 21, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!78 = metadata !{i32 30, i32 0, metadata !77, null}
!79 = metadata !{i32 31, i32 0, metadata !77, null}
!80 = metadata !{i32 32, i32 0, metadata !77, null}
!81 = metadata !{i32 34, i32 0, metadata !77, null}
!82 = metadata !{i32 36, i32 0, metadata !77, null}
!83 = metadata !{i32 49, i32 0, metadata !77, null}
!84 = metadata !{i32 79, i32 0, metadata !85, null}
!85 = metadata !{i32 524299, metadata !10, i32 58, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!86 = metadata !{i32 86, i32 0, metadata !85, null}
!87 = metadata !{i32 87, i32 0, metadata !85, null}
!88 = metadata !{i32 88, i32 0, metadata !85, null}
!89 = metadata !{i32 90, i32 0, metadata !85, null}
!90 = metadata !{i32 107, i32 0, metadata !85, null}
