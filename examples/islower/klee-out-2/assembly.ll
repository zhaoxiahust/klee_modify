; ModuleID = 'islower.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_attr_t = type { i64, [12 x i32] }

@.str = private constant [5 x i8] c"hfas\00", align 1
@.str1 = private constant [5 x i8] c"hell\00", align 1
@.str2 = private constant [4 x i8] c"cry\00", align 1
@.str3 = private constant [6 x i8] c"input\00", align 1

define i8* @hii(i8* %ptr) nounwind {
entry:
  %ptr_addr = alloca i8*, align 8
  %retval = alloca i8*
  %a = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %ptr, i8** %ptr_addr
  %0 = load i32* %a, align 4, !dbg !72
  %1 = icmp sgt i32 %0, 100, !dbg !72
  br i1 %1, label %bb, label %bb1, !dbg !72

bb:                                               ; preds = %entry
  %2 = call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !74
  br label %bb1, !dbg !74

bb1:                                              ; preds = %bb, %entry
  %3 = call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !75
  %retval2 = load i8** %retval, !dbg !76
  ret i8* %retval2, !dbg !76
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @puts(i8*)

define i32 @aa(i32 %b) nounwind {
entry:
  %b_addr = alloca i32, align 4
  %retval = alloca i32
  %thread1 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store i32 %b, i32* %b_addr
  %0 = call i32 @pthread_create(i64* noalias %thread1, %union.pthread_attr_t* noalias null, i8* (i8*)* @hii, i8* noalias inttoptr (i64 8 to i8*)) nounwind, !dbg !77
  %retval1 = load i32* %retval, !dbg !79
  ret i32 %retval1, !dbg !79
}

declare i32 @pthread_create(i64* noalias, %union.pthread_attr_t* noalias, i8* (i8*)*, i8* noalias) nounwind

define i8* @hi(i8* %ptr) nounwind {
entry:
  %ptr_addr = alloca i8*, align 8
  %retval = alloca i8*
  %a = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %ptr, i8** %ptr_addr
  %0 = load i8** %ptr_addr, align 8, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !80
  %2 = load i32* %1, align 4, !dbg !80
  store i32 %2, i32* %a, align 4, !dbg !80
  %3 = load i32* %a, align 4, !dbg !82
  %4 = icmp sgt i32 %3, 5, !dbg !82
  br i1 %4, label %bb, label %bb1, !dbg !82

bb:                                               ; preds = %entry
  %5 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !83
  br label %return, !dbg !83

bb1:                                              ; preds = %entry
  %6 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !84
  br label %return, !dbg !84

return:                                           ; preds = %bb, %bb1
  %retval3 = load i8** %retval, !dbg !85
  ret i8* %retval3, !dbg !85
}

declare i32 @printf(i8* noalias, ...) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %retval = alloca i32
  %c = alloca i32
  %thread1 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  %0 = call i32 (...)* @klee_make_symbolic(i32* %c, i64 4, i8* getelementptr inbounds ([6 x i8]* @.str3, i64 0, i64 0)) nounwind, !dbg !86
  %c1 = bitcast i32* %c to i8*, !dbg !88
  %1 = call i32 @pthread_create(i64* noalias %thread1, %union.pthread_attr_t* noalias null, i8* (i8*)* @hi, i8* noalias %c1) nounwind, !dbg !88
  %retval2 = load i32* %retval, !dbg !89
  ret i32 %retval2, !dbg !89
}

declare i32 @klee_make_symbolic(...)

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !6, !10, !11, !17, !26, !35}
!llvm.dbg.lv.memcpy = !{!45, !46, !47, !48, !52}
!llvm.dbg.lv.memmove = !{!55, !56, !57, !58, !62}
!llvm.dbg.lv.memset = !{!65, !66, !67, !68}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"hii", metadata !"hii", metadata !"hii", metadata !1, i32 12, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*)* @hii} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"islower.c", metadata !"/home/kain/Documents/bishe/klee/examples/islower/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"islower.c", metadata !"/home/kain/Documents/bishe/klee/examples/islower/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_un
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5}
!5 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 524334, i32 0, metadata !1, metadata !"aa", metadata !"aa", metadata !"aa", metadata !1, i32 20, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32)* @aa} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 524334, i32 0, metadata !1, metadata !"hi", metadata !"hi", metadata !"hi", metadata !1, i32 27, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*)* @hi} ; [ DW_TAG_subprogram ]
!11 = metadata !{i32 524334, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 60, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!12 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null} ; [ DW_TAG_subroutine_type ]
!13 = metadata !{metadata !9, metadata !9, metadata !14}
!14 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ]
!15 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ]
!16 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!17 = metadata !{i32 524334, i32 0, metadata !18, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !18, i32 12, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 524329, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !19} ; [ DW_TAG_file_type ]
!19 = metadata !{i32 524305, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!20 = metadata !{i32 524309, metadata !18, metadata !"", metadata !18, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null} ; [ DW_TAG_subroutine_type ]
!21 = metadata !{metadata !22, metadata !22, metadata !22, metadata !23}
!22 = metadata !{i32 524303, metadata !18, metadata !"", metadata !18, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!23 = metadata !{i32 524310, metadata !24, metadata !"size_t", metadata !24, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !25} ; [ DW_TAG_typedef ]
!24 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !19} ; [ DW_TAG_file_type ]
!25 = metadata !{i32 524324, metadata !18, metadata !"long unsigned int", metadata !18, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!26 = metadata !{i32 524334, i32 0, metadata !27, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !27, i32 12, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!27 = metadata !{i32 524329, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !28} ; [ DW_TAG_file_type ]
!28 = metadata !{i32 524305, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_u
!29 = metadata !{i32 524309, metadata !27, metadata !"", metadata !27, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{metadata !31, metadata !31, metadata !31, metadata !32}
!31 = metadata !{i32 524303, metadata !27, metadata !"", metadata !27, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!32 = metadata !{i32 524310, metadata !33, metadata !"size_t", metadata !33, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_typedef ]
!33 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !28} ; [ DW_TAG_file_type ]
!34 = metadata !{i32 524324, metadata !27, metadata !"long unsigned int", metadata !27, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!35 = metadata !{i32 524334, i32 0, metadata !36, metadata !"memset", metadata !"memset", metadata !"memset", metadata !36, i32 12, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!36 = metadata !{i32 524329, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !37} ; [ DW_TAG_file_type ]
!37 = metadata !{i32 524305, i32 0, i32 1, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!38 = metadata !{i32 524309, metadata !36, metadata !"", metadata !36, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null} ; [ DW_TAG_subroutine_type ]
!39 = metadata !{metadata !40, metadata !40, metadata !41, metadata !42}
!40 = metadata !{i32 524303, metadata !36, metadata !"", metadata !36, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!41 = metadata !{i32 524324, metadata !36, metadata !"int", metadata !36, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!42 = metadata !{i32 524310, metadata !43, metadata !"size_t", metadata !43, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_typedef ]
!43 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !37} ; [ DW_TAG_file_type ]
!44 = metadata !{i32 524324, metadata !36, metadata !"long unsigned int", metadata !36, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!45 = metadata !{i32 524545, metadata !17, metadata !"destaddr", metadata !18, i32 12, metadata !22} ; [ DW_TAG_arg_variable ]
!46 = metadata !{i32 524545, metadata !17, metadata !"srcaddr", metadata !18, i32 12, metadata !22} ; [ DW_TAG_arg_variable ]
!47 = metadata !{i32 524545, metadata !17, metadata !"len", metadata !18, i32 12, metadata !23} ; [ DW_TAG_arg_variable ]
!48 = metadata !{i32 524544, metadata !49, metadata !"dest", metadata !18, i32 13, metadata !50} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 524299, metadata !17, i32 12, i32 0, metadata !18, i32 0} ; [ DW_TAG_lexical_block ]
!50 = metadata !{i32 524303, metadata !18, metadata !"", metadata !18, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ]
!51 = metadata !{i32 524324, metadata !18, metadata !"char", metadata !18, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!52 = metadata !{i32 524544, metadata !49, metadata !"src", metadata !18, i32 14, metadata !53} ; [ DW_TAG_auto_variable ]
!53 = metadata !{i32 524303, metadata !18, metadata !"", metadata !18, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !54} ; [ DW_TAG_pointer_type ]
!54 = metadata !{i32 524326, metadata !18, metadata !"", metadata !18, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !51} ; [ DW_TAG_const_type ]
!55 = metadata !{i32 524545, metadata !26, metadata !"dst", metadata !27, i32 12, metadata !31} ; [ DW_TAG_arg_variable ]
!56 = metadata !{i32 524545, metadata !26, metadata !"src", metadata !27, i32 12, metadata !31} ; [ DW_TAG_arg_variable ]
!57 = metadata !{i32 524545, metadata !26, metadata !"count", metadata !27, i32 12, metadata !32} ; [ DW_TAG_arg_variable ]
!58 = metadata !{i32 524544, metadata !59, metadata !"a", metadata !27, i32 13, metadata !60} ; [ DW_TAG_auto_variable ]
!59 = metadata !{i32 524299, metadata !26, i32 12, i32 0, metadata !27, i32 0} ; [ DW_TAG_lexical_block ]
!60 = metadata !{i32 524303, metadata !27, metadata !"", metadata !27, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ]
!61 = metadata !{i32 524324, metadata !27, metadata !"char", metadata !27, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!62 = metadata !{i32 524544, metadata !59, metadata !"b", metadata !27, i32 14, metadata !63} ; [ DW_TAG_auto_variable ]
!63 = metadata !{i32 524303, metadata !27, metadata !"", metadata !27, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !64} ; [ DW_TAG_pointer_type ]
!64 = metadata !{i32 524326, metadata !27, metadata !"", metadata !27, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !61} ; [ DW_TAG_const_type ]
!65 = metadata !{i32 524545, metadata !35, metadata !"dst", metadata !36, i32 12, metadata !40} ; [ DW_TAG_arg_variable ]
!66 = metadata !{i32 524545, metadata !35, metadata !"s", metadata !36, i32 12, metadata !41} ; [ DW_TAG_arg_variable ]
!67 = metadata !{i32 524545, metadata !35, metadata !"count", metadata !36, i32 12, metadata !42} ; [ DW_TAG_arg_variable ]
!68 = metadata !{i32 524544, metadata !69, metadata !"a", metadata !36, i32 13, metadata !70} ; [ DW_TAG_auto_variable ]
!69 = metadata !{i32 524299, metadata !35, i32 12, i32 0, metadata !36, i32 0} ; [ DW_TAG_lexical_block ]
!70 = metadata !{i32 524303, metadata !36, metadata !"", metadata !36, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !71} ; [ DW_TAG_pointer_type ]
!71 = metadata !{i32 524324, metadata !36, metadata !"char", metadata !36, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!72 = metadata !{i32 15, i32 0, metadata !73, null}
!73 = metadata !{i32 524299, metadata !0, i32 12, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!74 = metadata !{i32 16, i32 0, metadata !73, null}
!75 = metadata !{i32 17, i32 0, metadata !73, null}
!76 = metadata !{i32 18, i32 0, metadata !73, null}
!77 = metadata !{i32 22, i32 0, metadata !78, null}
!78 = metadata !{i32 524299, metadata !6, i32 20, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!79 = metadata !{i32 24, i32 0, metadata !78, null}
!80 = metadata !{i32 29, i32 0, metadata !81, null}
!81 = metadata !{i32 524299, metadata !10, i32 27, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!82 = metadata !{i32 43, i32 0, metadata !81, null}
!83 = metadata !{i32 44, i32 0, metadata !81, null}
!84 = metadata !{i32 46, i32 0, metadata !81, null}
!85 = metadata !{i32 51, i32 0, metadata !81, null}
!86 = metadata !{i32 64, i32 0, metadata !87, null}
!87 = metadata !{i32 524299, metadata !11, i32 60, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 80, i32 0, metadata !87, null}
!89 = metadata !{i32 108, i32 0, metadata !87, null}
