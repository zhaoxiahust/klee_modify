; ModuleID = 'kkkkkkkkkkk.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [12 x i8] c"input111111\00", align 1
@.str1 = private constant [14 x i8] c"inputkkkkkkkk\00", align 1
@.str2 = private constant [3 x i8] c"hi\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %retval = alloca i32
  %c = alloca i32
  %i = alloca i32
  %j = alloca i32
  %cc = alloca i32
  %mm = alloca i32
  %kk = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  store i32 100, i32* %cc, align 4, !dbg !64
  %0 = call i32 (...)* @klee_make_symbolic(i32* %c, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !66
  %1 = call i32 (...)* @klee_make_symbolic(i32* %kk, i64 4, i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !67
  store i32 0, i32* %j, align 4, !dbg !68
  br label %bb4, !dbg !68

bb:                                               ; preds = %bb4
  store i32 0, i32* %i, align 4, !dbg !69
  br label %bb2, !dbg !69

bb1:                                              ; preds = %bb2
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !70
  %3 = load i32* %i, align 4, !dbg !69
  %4 = add nsw i32 %3, 1, !dbg !69
  store i32 %4, i32* %i, align 4, !dbg !69
  br label %bb2, !dbg !69

bb2:                                              ; preds = %bb1, %bb
  %5 = load i32* %c, align 4, !dbg !69
  %6 = load i32* %i, align 4, !dbg !69
  %7 = icmp slt i32 %6, %5, !dbg !69
  br i1 %7, label %bb1, label %bb3, !dbg !69

bb3:                                              ; preds = %bb2
  %8 = load i32* %j, align 4, !dbg !68
  %9 = add nsw i32 %8, 1, !dbg !68
  store i32 %9, i32* %j, align 4, !dbg !68
  br label %bb4, !dbg !68

bb4:                                              ; preds = %bb3, %entry
  %10 = load i32* %kk, align 4, !dbg !68
  %11 = load i32* %j, align 4, !dbg !68
  %12 = icmp slt i32 %11, %10, !dbg !68
  br i1 %12, label %bb, label %return, !dbg !68

return:                                           ; preds = %bb4
  %retval6 = load i32* %retval, !dbg !71
  ret i32 %retval6, !dbg !71
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @klee_make_symbolic(...)

declare i32 @printf(i8*, ...) nounwind

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !9, !18, !27}
!llvm.dbg.lv.memcpy = !{!37, !38, !39, !40, !44}
!llvm.dbg.lv.memmove = !{!47, !48, !49, !50, !54}
!llvm.dbg.lv.memset = !{!57, !58, !59, !60}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 7, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"ceshixunhuancishu.c", metadata !"/home/kain/Documents/bishe/klee/examples/for/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"ceshixunhuancishu.c", metadata !"/home/kain/Documents/bishe/klee/examples/for/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_comp
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5, metadata !6}
!5 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 524334, i32 0, metadata !10, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !10, i32 12, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!10 = metadata !{i32 524329, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !11} ; [ DW_TAG_file_type ]
!11 = metadata !{i32 524305, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!12 = metadata !{i32 524309, metadata !10, metadata !"", metadata !10, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null} ; [ DW_TAG_subroutine_type ]
!13 = metadata !{metadata !14, metadata !14, metadata !14, metadata !15}
!14 = metadata !{i32 524303, metadata !10, metadata !"", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!15 = metadata !{i32 524310, metadata !16, metadata !"size_t", metadata !16, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ]
!16 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !11} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 524324, metadata !10, metadata !"long unsigned int", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!18 = metadata !{i32 524334, i32 0, metadata !19, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !19, i32 12, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!19 = metadata !{i32 524329, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !20} ; [ DW_TAG_file_type ]
!20 = metadata !{i32 524305, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_u
!21 = metadata !{i32 524309, metadata !19, metadata !"", metadata !19, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{metadata !23, metadata !23, metadata !23, metadata !24}
!23 = metadata !{i32 524303, metadata !19, metadata !"", metadata !19, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!24 = metadata !{i32 524310, metadata !25, metadata !"size_t", metadata !25, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !26} ; [ DW_TAG_typedef ]
!25 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !20} ; [ DW_TAG_file_type ]
!26 = metadata !{i32 524324, metadata !19, metadata !"long unsigned int", metadata !19, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!27 = metadata !{i32 524334, i32 0, metadata !28, metadata !"memset", metadata !"memset", metadata !"memset", metadata !28, i32 12, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!28 = metadata !{i32 524329, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !29} ; [ DW_TAG_file_type ]
!29 = metadata !{i32 524305, i32 0, i32 1, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!30 = metadata !{i32 524309, metadata !28, metadata !"", metadata !28, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null} ; [ DW_TAG_subroutine_type ]
!31 = metadata !{metadata !32, metadata !32, metadata !33, metadata !34}
!32 = metadata !{i32 524303, metadata !28, metadata !"", metadata !28, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!33 = metadata !{i32 524324, metadata !28, metadata !"int", metadata !28, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!34 = metadata !{i32 524310, metadata !35, metadata !"size_t", metadata !35, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_typedef ]
!35 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !29} ; [ DW_TAG_file_type ]
!36 = metadata !{i32 524324, metadata !28, metadata !"long unsigned int", metadata !28, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!37 = metadata !{i32 524545, metadata !9, metadata !"destaddr", metadata !10, i32 12, metadata !14} ; [ DW_TAG_arg_variable ]
!38 = metadata !{i32 524545, metadata !9, metadata !"srcaddr", metadata !10, i32 12, metadata !14} ; [ DW_TAG_arg_variable ]
!39 = metadata !{i32 524545, metadata !9, metadata !"len", metadata !10, i32 12, metadata !15} ; [ DW_TAG_arg_variable ]
!40 = metadata !{i32 524544, metadata !41, metadata !"dest", metadata !10, i32 13, metadata !42} ; [ DW_TAG_auto_variable ]
!41 = metadata !{i32 524299, metadata !9, i32 12, i32 0, metadata !10, i32 0} ; [ DW_TAG_lexical_block ]
!42 = metadata !{i32 524303, metadata !10, metadata !"", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !43} ; [ DW_TAG_pointer_type ]
!43 = metadata !{i32 524324, metadata !10, metadata !"char", metadata !10, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!44 = metadata !{i32 524544, metadata !41, metadata !"src", metadata !10, i32 14, metadata !45} ; [ DW_TAG_auto_variable ]
!45 = metadata !{i32 524303, metadata !10, metadata !"", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ]
!46 = metadata !{i32 524326, metadata !10, metadata !"", metadata !10, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !43} ; [ DW_TAG_const_type ]
!47 = metadata !{i32 524545, metadata !18, metadata !"dst", metadata !19, i32 12, metadata !23} ; [ DW_TAG_arg_variable ]
!48 = metadata !{i32 524545, metadata !18, metadata !"src", metadata !19, i32 12, metadata !23} ; [ DW_TAG_arg_variable ]
!49 = metadata !{i32 524545, metadata !18, metadata !"count", metadata !19, i32 12, metadata !24} ; [ DW_TAG_arg_variable ]
!50 = metadata !{i32 524544, metadata !51, metadata !"a", metadata !19, i32 13, metadata !52} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 524299, metadata !18, i32 12, i32 0, metadata !19, i32 0} ; [ DW_TAG_lexical_block ]
!52 = metadata !{i32 524303, metadata !19, metadata !"", metadata !19, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !53} ; [ DW_TAG_pointer_type ]
!53 = metadata !{i32 524324, metadata !19, metadata !"char", metadata !19, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!54 = metadata !{i32 524544, metadata !51, metadata !"b", metadata !19, i32 14, metadata !55} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 524303, metadata !19, metadata !"", metadata !19, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !56} ; [ DW_TAG_pointer_type ]
!56 = metadata !{i32 524326, metadata !19, metadata !"", metadata !19, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !53} ; [ DW_TAG_const_type ]
!57 = metadata !{i32 524545, metadata !27, metadata !"dst", metadata !28, i32 12, metadata !32} ; [ DW_TAG_arg_variable ]
!58 = metadata !{i32 524545, metadata !27, metadata !"s", metadata !28, i32 12, metadata !33} ; [ DW_TAG_arg_variable ]
!59 = metadata !{i32 524545, metadata !27, metadata !"count", metadata !28, i32 12, metadata !34} ; [ DW_TAG_arg_variable ]
!60 = metadata !{i32 524544, metadata !61, metadata !"a", metadata !28, i32 13, metadata !62} ; [ DW_TAG_auto_variable ]
!61 = metadata !{i32 524299, metadata !27, i32 12, i32 0, metadata !28, i32 0} ; [ DW_TAG_lexical_block ]
!62 = metadata !{i32 524303, metadata !28, metadata !"", metadata !28, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ]
!63 = metadata !{i32 524324, metadata !28, metadata !"char", metadata !28, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!64 = metadata !{i32 11, i32 0, metadata !65, null}
!65 = metadata !{i32 524299, metadata !0, i32 7, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!66 = metadata !{i32 16, i32 0, metadata !65, null}
!67 = metadata !{i32 17, i32 0, metadata !65, null}
!68 = metadata !{i32 18, i32 0, metadata !65, null}
!69 = metadata !{i32 20, i32 0, metadata !65, null}
!70 = metadata !{i32 22, i32 0, metadata !65, null}
!71 = metadata !{i32 25, i32 0, metadata !65, null}
