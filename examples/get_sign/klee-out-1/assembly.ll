; ModuleID = 'get_signfun.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [2 x i8] c"a\00", align 1

define i32 @get_sign(i8 signext %x) nounwind {
entry:
  %x_addr = alloca i8, align 1
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8 %x, i8* %x_addr
  %1 = load i8* %x_addr, align 1, !dbg !67
  %2 = icmp eq i8 %1, 97, !dbg !67
  br i1 %2, label %bb, label %bb1, !dbg !67

bb:                                               ; preds = %entry
  store i32 0, i32* %0, align 4, !dbg !69
  br label %bb4, !dbg !69

bb1:                                              ; preds = %entry
  %3 = load i8* %x_addr, align 1, !dbg !70
  %4 = icmp sle i8 %3, 96, !dbg !70
  br i1 %4, label %bb2, label %bb3, !dbg !70

bb2:                                              ; preds = %bb1
  store i32 -1, i32* %0, align 4, !dbg !71
  br label %bb4, !dbg !71

bb3:                                              ; preds = %bb1
  store i32 1, i32* %0, align 4, !dbg !72
  br label %bb4, !dbg !72

bb4:                                              ; preds = %bb3, %bb2, %bb
  %5 = load i32* %0, align 4, !dbg !69
  store i32 %5, i32* %retval, align 4, !dbg !69
  %retval5 = load i32* %retval, !dbg !69
  ret i32 %retval5, !dbg !69
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %retval = alloca i32
  %0 = alloca i32
  %a = alloca i8
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  %1 = call i32 (...)* @klee_make_symbolic(i8* %a, i64 1, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !73
  %2 = load i8* %a, align 1, !dbg !75
  %3 = sext i8 %2 to i32, !dbg !75
  %4 = trunc i32 %3 to i8, !dbg !75
  %5 = call i32 @get_sign(i8 signext %4) nounwind, !dbg !75
  store i32 %5, i32* %0, align 4, !dbg !75
  %6 = load i32* %0, align 4, !dbg !75
  store i32 %6, i32* %retval, align 4, !dbg !75
  %retval1 = load i32* %retval, !dbg !75
  ret i32 %retval1, !dbg !75
}

declare i32 @klee_make_symbolic(...)

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !7, !12, !21, !30}
!llvm.dbg.lv.memcpy = !{!40, !41, !42, !43, !47}
!llvm.dbg.lv.memmove = !{!50, !51, !52, !53, !57}
!llvm.dbg.lv.memset = !{!60, !61, !62, !63}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"get_sign", metadata !"get_sign", metadata !"get_sign", metadata !1, i32 6, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i8)* @get_sign} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"get_signfun.c", metadata !"/home/kain/Documents/bishe/klee/examples/get_sign/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"get_signfun.c", metadata !"/home/kain/Documents/bishe/klee/examples/get_sign/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compi
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !6}
!5 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 524334, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 16, metadata !8, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!8 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !9, i32 0, null} ; [ DW_TAG_subroutine_type ]
!9 = metadata !{metadata !5, metadata !5, metadata !10}
!10 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 524334, i32 0, metadata !13, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !13, i32 12, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!13 = metadata !{i32 524329, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !14} ; [ DW_TAG_file_type ]
!14 = metadata !{i32 524305, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!15 = metadata !{i32 524309, metadata !13, metadata !"", metadata !13, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null} ; [ DW_TAG_subroutine_type ]
!16 = metadata !{metadata !17, metadata !17, metadata !17, metadata !18}
!17 = metadata !{i32 524303, metadata !13, metadata !"", metadata !13, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!18 = metadata !{i32 524310, metadata !19, metadata !"size_t", metadata !19, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!19 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !14} ; [ DW_TAG_file_type ]
!20 = metadata !{i32 524324, metadata !13, metadata !"long unsigned int", metadata !13, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!21 = metadata !{i32 524334, i32 0, metadata !22, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !22, i32 12, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!22 = metadata !{i32 524329, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !23} ; [ DW_TAG_file_type ]
!23 = metadata !{i32 524305, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_u
!24 = metadata !{i32 524309, metadata !22, metadata !"", metadata !22, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null} ; [ DW_TAG_subroutine_type ]
!25 = metadata !{metadata !26, metadata !26, metadata !26, metadata !27}
!26 = metadata !{i32 524303, metadata !22, metadata !"", metadata !22, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!27 = metadata !{i32 524310, metadata !28, metadata !"size_t", metadata !28, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ]
!28 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !23} ; [ DW_TAG_file_type ]
!29 = metadata !{i32 524324, metadata !22, metadata !"long unsigned int", metadata !22, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!30 = metadata !{i32 524334, i32 0, metadata !31, metadata !"memset", metadata !"memset", metadata !"memset", metadata !31, i32 12, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!31 = metadata !{i32 524329, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !32} ; [ DW_TAG_file_type ]
!32 = metadata !{i32 524305, i32 0, i32 1, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!33 = metadata !{i32 524309, metadata !31, metadata !"", metadata !31, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null} ; [ DW_TAG_subroutine_type ]
!34 = metadata !{metadata !35, metadata !35, metadata !36, metadata !37}
!35 = metadata !{i32 524303, metadata !31, metadata !"", metadata !31, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!36 = metadata !{i32 524324, metadata !31, metadata !"int", metadata !31, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!37 = metadata !{i32 524310, metadata !38, metadata !"size_t", metadata !38, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!38 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !32} ; [ DW_TAG_file_type ]
!39 = metadata !{i32 524324, metadata !31, metadata !"long unsigned int", metadata !31, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!40 = metadata !{i32 524545, metadata !12, metadata !"destaddr", metadata !13, i32 12, metadata !17} ; [ DW_TAG_arg_variable ]
!41 = metadata !{i32 524545, metadata !12, metadata !"srcaddr", metadata !13, i32 12, metadata !17} ; [ DW_TAG_arg_variable ]
!42 = metadata !{i32 524545, metadata !12, metadata !"len", metadata !13, i32 12, metadata !18} ; [ DW_TAG_arg_variable ]
!43 = metadata !{i32 524544, metadata !44, metadata !"dest", metadata !13, i32 13, metadata !45} ; [ DW_TAG_auto_variable ]
!44 = metadata !{i32 524299, metadata !12, i32 12, i32 0, metadata !13, i32 0} ; [ DW_TAG_lexical_block ]
!45 = metadata !{i32 524303, metadata !13, metadata !"", metadata !13, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ]
!46 = metadata !{i32 524324, metadata !13, metadata !"char", metadata !13, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!47 = metadata !{i32 524544, metadata !44, metadata !"src", metadata !13, i32 14, metadata !48} ; [ DW_TAG_auto_variable ]
!48 = metadata !{i32 524303, metadata !13, metadata !"", metadata !13, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ]
!49 = metadata !{i32 524326, metadata !13, metadata !"", metadata !13, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !46} ; [ DW_TAG_const_type ]
!50 = metadata !{i32 524545, metadata !21, metadata !"dst", metadata !22, i32 12, metadata !26} ; [ DW_TAG_arg_variable ]
!51 = metadata !{i32 524545, metadata !21, metadata !"src", metadata !22, i32 12, metadata !26} ; [ DW_TAG_arg_variable ]
!52 = metadata !{i32 524545, metadata !21, metadata !"count", metadata !22, i32 12, metadata !27} ; [ DW_TAG_arg_variable ]
!53 = metadata !{i32 524544, metadata !54, metadata !"a", metadata !22, i32 13, metadata !55} ; [ DW_TAG_auto_variable ]
!54 = metadata !{i32 524299, metadata !21, i32 12, i32 0, metadata !22, i32 0} ; [ DW_TAG_lexical_block ]
!55 = metadata !{i32 524303, metadata !22, metadata !"", metadata !22, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !56} ; [ DW_TAG_pointer_type ]
!56 = metadata !{i32 524324, metadata !22, metadata !"char", metadata !22, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!57 = metadata !{i32 524544, metadata !54, metadata !"b", metadata !22, i32 14, metadata !58} ; [ DW_TAG_auto_variable ]
!58 = metadata !{i32 524303, metadata !22, metadata !"", metadata !22, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ]
!59 = metadata !{i32 524326, metadata !22, metadata !"", metadata !22, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !56} ; [ DW_TAG_const_type ]
!60 = metadata !{i32 524545, metadata !30, metadata !"dst", metadata !31, i32 12, metadata !35} ; [ DW_TAG_arg_variable ]
!61 = metadata !{i32 524545, metadata !30, metadata !"s", metadata !31, i32 12, metadata !36} ; [ DW_TAG_arg_variable ]
!62 = metadata !{i32 524545, metadata !30, metadata !"count", metadata !31, i32 12, metadata !37} ; [ DW_TAG_arg_variable ]
!63 = metadata !{i32 524544, metadata !64, metadata !"a", metadata !31, i32 13, metadata !65} ; [ DW_TAG_auto_variable ]
!64 = metadata !{i32 524299, metadata !30, i32 12, i32 0, metadata !31, i32 0} ; [ DW_TAG_lexical_block ]
!65 = metadata !{i32 524303, metadata !31, metadata !"", metadata !31, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !66} ; [ DW_TAG_pointer_type ]
!66 = metadata !{i32 524324, metadata !31, metadata !"char", metadata !31, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!67 = metadata !{i32 7, i32 0, metadata !68, null}
!68 = metadata !{i32 524299, metadata !0, i32 6, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!69 = metadata !{i32 8, i32 0, metadata !68, null}
!70 = metadata !{i32 10, i32 0, metadata !68, null}
!71 = metadata !{i32 11, i32 0, metadata !68, null}
!72 = metadata !{i32 13, i32 0, metadata !68, null}
!73 = metadata !{i32 18, i32 0, metadata !74, null}
!74 = metadata !{i32 524299, metadata !7, i32 16, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!75 = metadata !{i32 19, i32 0, metadata !74, null}
