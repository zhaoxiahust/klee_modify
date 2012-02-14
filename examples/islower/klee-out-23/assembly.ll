; ModuleID = 'c++++++++.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [6 x i8] c"input\00", align 1
@.str1 = private constant [5 x i8] c"hell\00", align 1
@.str2 = private constant [4 x i8] c"cry\00", align 1

define i8* @_Z2hiPv(i8* %ptr) {
entry:
  %ptr_addr = alloca i8*, align 8
  %retval = alloca i8*
  %a = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %ptr, i8** %ptr_addr
  %a1 = bitcast i32* %a to i8*, !dbg !71
  call void @klee_make_symbolic(i8* %a1, i64 4, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)), !dbg !71
  %0 = load i32* %a, align 4, !dbg !74
  %1 = icmp sgt i32 %0, 5, !dbg !74
  br i1 %1, label %bb, label %bb2, !dbg !74

bb:                                               ; preds = %entry
  %2 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)), !dbg !75
  br label %return, !dbg !75

bb2:                                              ; preds = %entry
  %3 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0)), !dbg !76
  br label %return, !dbg !76

return:                                           ; preds = %bb, %bb2
  %retval4 = load i8** %retval, !dbg !77
  ret i8* %retval4, !dbg !77
}

define i32 @_Z10my_isloweri(i32 %x) nounwind {
entry:
  %x_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %x, i32* %x_addr
  %1 = load i32* %x_addr, align 4, !dbg !78
  %2 = icmp sle i32 %1, 96, !dbg !78
  %3 = load i32* %x_addr, align 4, !dbg !78
  %4 = icmp sgt i32 %3, 122, !dbg !78
  %or.cond = or i1 %2, %4
  br i1 %or.cond, label %bb2, label %bb1, !dbg !78

bb1:                                              ; preds = %entry
  store i32 1, i32* %0, align 4, !dbg !80
  br label %bb3, !dbg !80

bb2:                                              ; preds = %entry
  store i32 0, i32* %0, align 4, !dbg !81
  br label %bb3, !dbg !81

bb3:                                              ; preds = %bb2, %bb1
  %5 = load i32* %0, align 4, !dbg !80
  store i32 %5, i32* %retval, align 4, !dbg !80
  %retval4 = load i32* %retval, !dbg !80
  ret i32 %retval4, !dbg !80
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @klee_make_symbolic(i8*, i64, i8*)

declare i32 @printf(i8* noalias, ...)

define i32 @main(i32 %argc, i8** %argv) {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %retval = alloca i32
  %0 = alloca i32
  %c = alloca i32
  %name = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  %c1 = bitcast i32* %c to i8*, !dbg !82
  %1 = call i8* @_Z2hiPv(i8* %c1), !dbg !82
  store i32 0, i32* %0, align 4, !dbg !82
  %2 = load i32* %0, align 4, !dbg !82
  store i32 %2, i32* %retval, align 4, !dbg !82
  %retval2 = load i32* %retval, !dbg !82
  ret i32 %retval2, !dbg !82
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !6, !10, !16, !25, !34}
!llvm.dbg.lv.memcpy = !{!44, !45, !46, !47, !51}
!llvm.dbg.lv.memmove = !{!54, !55, !56, !57, !61}
!llvm.dbg.lv.memset = !{!64, !65, !66, !67}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"my_islower", metadata !"my_islower", metadata !"_Z10my_isloweri", metadata !1, i32 23, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32)* @_Z10my_isloweri} ; [ DW_
!1 = metadata !{i32 524329, metadata !"ceshizhizhen.c", metadata !"/home/kain/Documents/bishe/klee/examples/islower/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 4, metadata !"ceshizhizhen.c", metadata !"/home/kain/Documents/bishe/klee/examples/islower/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compi
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5}
!5 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524334, i32 0, metadata !1, metadata !"hi", metadata !"hi", metadata !"_Z2hiPv", metadata !1, i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*)* @_Z2hiPv} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 524334, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 29, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
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
!71 = metadata !{i32 16, i32 0, metadata !72, null}
!72 = metadata !{i32 524299, metadata !73, i32 12, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 524299, metadata !6, i32 12, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!74 = metadata !{i32 17, i32 0, metadata !72, null}
!75 = metadata !{i32 18, i32 0, metadata !72, null}
!76 = metadata !{i32 20, i32 0, metadata !72, null}
!77 = metadata !{i32 21, i32 0, metadata !72, null}
!78 = metadata !{i32 24, i32 0, metadata !79, null}
!79 = metadata !{i32 524299, metadata !0, i32 23, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 25, i32 0, metadata !79, null}
!81 = metadata !{i32 26, i32 0, metadata !79, null}
!82 = metadata !{i32 34, i32 0, metadata !83, null}
!83 = metadata !{i32 524299, metadata !84, i32 29, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!84 = metadata !{i32 524299, metadata !10, i32 29, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
