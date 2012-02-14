; ModuleID = 'kkkk.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_attr_t = type { i64, [12 x i32] }

@.str = private constant [9 x i8] c"fuck you\00", align 1
@.str1 = private constant [11 x i8] c"inputccccc\00", align 1
@.str2 = private constant [11 x i8] c"inputbbbbb\00", align 1

define i8* @hi(i8* %ptr) nounwind {
entry:
  %ptr_addr = alloca i8*, align 8
  %retval = alloca i8*
  %a = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %ptr, i8** %ptr_addr
  %0 = load i8** %ptr_addr, align 8, !dbg !68
  %1 = bitcast i8* %0 to i32*, !dbg !68
  %2 = load i32* %1, align 4, !dbg !68
  store i32 %2, i32* %a, align 4, !dbg !68
  %3 = call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !70
  %retval1 = load i8** %retval, !dbg !71
  ret i8* %retval1, !dbg !71
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @puts(i8*)

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %retval = alloca i32
  %c = alloca i32
  %b = alloca i32
  %thread1 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  %0 = call i32 (...)* @klee_make_symbolic(i32* %c, i64 4, i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !72
  %1 = call i32 (...)* @klee_make_symbolic(i32* %b, i64 4, i8* getelementptr inbounds ([11 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !74
  %2 = load i32* %c, align 4, !dbg !75
  %3 = icmp sgt i32 %2, 20, !dbg !75
  br i1 %3, label %bb, label %return, !dbg !75

bb:                                               ; preds = %entry
  %b1 = bitcast i32* %b to i8*, !dbg !76
  %4 = call i32 @pthread_create(i64* noalias %thread1, %union.pthread_attr_t* noalias null, i8* (i8*)* @hi, i8* noalias %b1) nounwind, !dbg !76
  br label %return, !dbg !76

return:                                           ; preds = %entry, %bb
  %retval3 = load i32* %retval, !dbg !77
  ret i32 %retval3, !dbg !77
}

declare i32 @klee_make_symbolic(...)

declare i32 @pthread_create(i64* noalias, %union.pthread_attr_t* noalias, i8* (i8*)*, i8* noalias) nounwind

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !6, !13, !22, !31}
!llvm.dbg.lv.memcpy = !{!41, !42, !43, !44, !48}
!llvm.dbg.lv.memmove = !{!51, !52, !53, !54, !58}
!llvm.dbg.lv.memset = !{!61, !62, !63, !64}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"hi", metadata !"hi", metadata !"hi", metadata !1, i32 13, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*)* @hi} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"kkkk.c", metadata !"/home/kain/Documents/bishe/klee/examples/islower/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"kkkk.c", metadata !"/home/kain/Documents/bishe/klee/examples/islower/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit 
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5}
!5 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 524334, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 47, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!13 = metadata !{i32 524334, i32 0, metadata !14, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !14, i32 12, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 524329, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !15} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 524305, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!16 = metadata !{i32 524309, metadata !14, metadata !"", metadata !14, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null} ; [ DW_TAG_subroutine_type ]
!17 = metadata !{metadata !18, metadata !18, metadata !18, metadata !19}
!18 = metadata !{i32 524303, metadata !14, metadata !"", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!19 = metadata !{i32 524310, metadata !20, metadata !"size_t", metadata !20, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ]
!20 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !15} ; [ DW_TAG_file_type ]
!21 = metadata !{i32 524324, metadata !14, metadata !"long unsigned int", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!22 = metadata !{i32 524334, i32 0, metadata !23, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !23, i32 12, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!23 = metadata !{i32 524329, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !24} ; [ DW_TAG_file_type ]
!24 = metadata !{i32 524305, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_u
!25 = metadata !{i32 524309, metadata !23, metadata !"", metadata !23, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null} ; [ DW_TAG_subroutine_type ]
!26 = metadata !{metadata !27, metadata !27, metadata !27, metadata !28}
!27 = metadata !{i32 524303, metadata !23, metadata !"", metadata !23, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!28 = metadata !{i32 524310, metadata !29, metadata !"size_t", metadata !29, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!29 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !24} ; [ DW_TAG_file_type ]
!30 = metadata !{i32 524324, metadata !23, metadata !"long unsigned int", metadata !23, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!31 = metadata !{i32 524334, i32 0, metadata !32, metadata !"memset", metadata !"memset", metadata !"memset", metadata !32, i32 12, metadata !34, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!32 = metadata !{i32 524329, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !33} ; [ DW_TAG_file_type ]
!33 = metadata !{i32 524305, i32 0, i32 1, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!34 = metadata !{i32 524309, metadata !32, metadata !"", metadata !32, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null} ; [ DW_TAG_subroutine_type ]
!35 = metadata !{metadata !36, metadata !36, metadata !37, metadata !38}
!36 = metadata !{i32 524303, metadata !32, metadata !"", metadata !32, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!37 = metadata !{i32 524324, metadata !32, metadata !"int", metadata !32, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!38 = metadata !{i32 524310, metadata !39, metadata !"size_t", metadata !39, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_typedef ]
!39 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !33} ; [ DW_TAG_file_type ]
!40 = metadata !{i32 524324, metadata !32, metadata !"long unsigned int", metadata !32, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!41 = metadata !{i32 524545, metadata !13, metadata !"destaddr", metadata !14, i32 12, metadata !18} ; [ DW_TAG_arg_variable ]
!42 = metadata !{i32 524545, metadata !13, metadata !"srcaddr", metadata !14, i32 12, metadata !18} ; [ DW_TAG_arg_variable ]
!43 = metadata !{i32 524545, metadata !13, metadata !"len", metadata !14, i32 12, metadata !19} ; [ DW_TAG_arg_variable ]
!44 = metadata !{i32 524544, metadata !45, metadata !"dest", metadata !14, i32 13, metadata !46} ; [ DW_TAG_auto_variable ]
!45 = metadata !{i32 524299, metadata !13, i32 12, i32 0, metadata !14, i32 0} ; [ DW_TAG_lexical_block ]
!46 = metadata !{i32 524303, metadata !14, metadata !"", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !47} ; [ DW_TAG_pointer_type ]
!47 = metadata !{i32 524324, metadata !14, metadata !"char", metadata !14, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!48 = metadata !{i32 524544, metadata !45, metadata !"src", metadata !14, i32 14, metadata !49} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 524303, metadata !14, metadata !"", metadata !14, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ]
!50 = metadata !{i32 524326, metadata !14, metadata !"", metadata !14, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !47} ; [ DW_TAG_const_type ]
!51 = metadata !{i32 524545, metadata !22, metadata !"dst", metadata !23, i32 12, metadata !27} ; [ DW_TAG_arg_variable ]
!52 = metadata !{i32 524545, metadata !22, metadata !"src", metadata !23, i32 12, metadata !27} ; [ DW_TAG_arg_variable ]
!53 = metadata !{i32 524545, metadata !22, metadata !"count", metadata !23, i32 12, metadata !28} ; [ DW_TAG_arg_variable ]
!54 = metadata !{i32 524544, metadata !55, metadata !"a", metadata !23, i32 13, metadata !56} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 524299, metadata !22, i32 12, i32 0, metadata !23, i32 0} ; [ DW_TAG_lexical_block ]
!56 = metadata !{i32 524303, metadata !23, metadata !"", metadata !23, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_pointer_type ]
!57 = metadata !{i32 524324, metadata !23, metadata !"char", metadata !23, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!58 = metadata !{i32 524544, metadata !55, metadata !"b", metadata !23, i32 14, metadata !59} ; [ DW_TAG_auto_variable ]
!59 = metadata !{i32 524303, metadata !23, metadata !"", metadata !23, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ]
!60 = metadata !{i32 524326, metadata !23, metadata !"", metadata !23, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !57} ; [ DW_TAG_const_type ]
!61 = metadata !{i32 524545, metadata !31, metadata !"dst", metadata !32, i32 12, metadata !36} ; [ DW_TAG_arg_variable ]
!62 = metadata !{i32 524545, metadata !31, metadata !"s", metadata !32, i32 12, metadata !37} ; [ DW_TAG_arg_variable ]
!63 = metadata !{i32 524545, metadata !31, metadata !"count", metadata !32, i32 12, metadata !38} ; [ DW_TAG_arg_variable ]
!64 = metadata !{i32 524544, metadata !65, metadata !"a", metadata !32, i32 13, metadata !66} ; [ DW_TAG_auto_variable ]
!65 = metadata !{i32 524299, metadata !31, i32 12, i32 0, metadata !32, i32 0} ; [ DW_TAG_lexical_block ]
!66 = metadata !{i32 524303, metadata !32, metadata !"", metadata !32, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !67} ; [ DW_TAG_pointer_type ]
!67 = metadata !{i32 524324, metadata !32, metadata !"char", metadata !32, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!68 = metadata !{i32 15, i32 0, metadata !69, null}
!69 = metadata !{i32 524299, metadata !0, i32 13, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!70 = metadata !{i32 28, i32 0, metadata !69, null}
!71 = metadata !{i32 38, i32 0, metadata !69, null}
!72 = metadata !{i32 52, i32 0, metadata !73, null}
!73 = metadata !{i32 524299, metadata !6, i32 47, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!74 = metadata !{i32 53, i32 0, metadata !73, null}
!75 = metadata !{i32 69, i32 0, metadata !73, null}
!76 = metadata !{i32 71, i32 0, metadata !73, null}
!77 = metadata !{i32 98, i32 0, metadata !73, null}
