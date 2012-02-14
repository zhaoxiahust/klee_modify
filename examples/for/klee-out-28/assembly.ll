; ModuleID = 'ifqiantao_thread.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_attr_t = type { i64, [12 x i32] }

@.str = private constant [6 x i8] c"hello\00", align 1
@.str1 = private constant [4 x i8] c"not\00", align 1
@.str2 = private constant [3 x i8] c"mm\00", align 1

define i8* @func(i8* %a) nounwind {
entry:
  %a_addr = alloca i8*, align 8
  %retval = alloca i8*
  %m = alloca i32
  %hi = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %a, i8** %a_addr
  %0 = load i8** %a_addr, align 8, !dbg !78
  %1 = bitcast i8* %0 to i32*, !dbg !78
  %2 = load i32* %1, align 4, !dbg !78
  store i32 %2, i32* %m, align 4, !dbg !78
  store i32 0, i32* %hi, align 4, !dbg !80
  br label %bb4, !dbg !80

bb:                                               ; preds = %bb4
  %3 = load i32* %m, align 4, !dbg !81
  %4 = icmp sgt i32 %3, 80, !dbg !81
  br i1 %4, label %bb1, label %bb2, !dbg !81

bb1:                                              ; preds = %bb
  %5 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !82
  br label %bb3, !dbg !82

bb2:                                              ; preds = %bb
  %6 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !83
  br label %bb3, !dbg !83

bb3:                                              ; preds = %bb2, %bb1
  %7 = load i32* %hi, align 4, !dbg !80
  %8 = add nsw i32 %7, 1, !dbg !80
  store i32 %8, i32* %hi, align 4, !dbg !80
  br label %bb4, !dbg !80

bb4:                                              ; preds = %bb3, %entry
  %9 = load i32* %hi, align 4, !dbg !80
  %10 = icmp sgt i32 %9, 10, !dbg !80
  br i1 %10, label %bb, label %return, !dbg !80

return:                                           ; preds = %bb4
  %retval6 = load i8** %retval, !dbg !84
  ret i8* %retval6, !dbg !84
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @printf(i8* noalias, ...) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %retval = alloca i32
  %m = alloca i32
  %mm = alloca i32
  %flag = alloca i32
  %thread = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  %0 = call i32 (...)* @klee_make_symbolic(i32* %m, i64 4, i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !85
  %1 = load i32* %mm, align 4, !dbg !87
  %2 = icmp eq i32 %1, 77, !dbg !87
  br i1 %2, label %bb, label %return, !dbg !87

bb:                                               ; preds = %entry
  %3 = load i32* %m, align 4, !dbg !88
  %4 = sext i32 %3 to i64, !dbg !88
  %5 = inttoptr i64 %4 to i8*, !dbg !88
  %6 = call i32 @pthread_create(i64* noalias %thread, %union.pthread_attr_t* noalias null, i8* (i8*)* @func, i8* noalias %5) nounwind, !dbg !88
  %7 = call i32 @putchar(i32 104) nounwind, !dbg !89
  br label %return, !dbg !89

return:                                           ; preds = %entry, %bb
  %retval2 = load i32* %retval, !dbg !90
  ret i32 %retval2, !dbg !90
}

declare i32 @klee_make_symbolic(...)

declare i32 @pthread_create(i64* noalias, %union.pthread_attr_t* noalias, i8* (i8*)*, i8* noalias) nounwind

define i32 @putchar(i32 %c) nounwind {
entry:
  %x = alloca i8, align 1
  %0 = trunc i32 %c to i8, !dbg !91
  store i8 %0, i8* %x, align 1, !dbg !91
  %1 = call i64 @write(i32 1, i8* %x, i64 1) nounwind, !dbg !92
  ret i32 1, !dbg !93
}

declare i64 @write(i32, i8* nocapture, i64)

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !6, !13, !19, !28, !37}
!llvm.dbg.lv.putchar = !{!47, !48}
!llvm.dbg.lv.memcpy = !{!51, !52, !53, !54, !58}
!llvm.dbg.lv.memmove = !{!61, !62, !63, !64, !68}
!llvm.dbg.lv.memset = !{!71, !72, !73, !74}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"func", metadata !"func", metadata !"func", metadata !1, i32 6, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i8* (i8*)* @func} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"thread.c", metadata !"/home/kain/Documents/bishe/klee/examples/for/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"thread.c", metadata !"/home/kain/Documents/bishe/klee/examples/for/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5}
!5 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 524334, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 18, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!13 = metadata !{i32 524334, i32 0, metadata !14, metadata !"putchar", metadata !"putchar", metadata !"putchar", metadata !14, i32 16, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32)* @putchar} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 524329, metadata !"putchar.c", metadata !"/home/kain/Documents/bishe/klee/runtime/klee-libc/", metadata !15} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 524305, i32 0, i32 1, metadata !"putchar.c", metadata !"/home/kain/Documents/bishe/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_u
!16 = metadata !{i32 524309, metadata !14, metadata !"", metadata !14, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null} ; [ DW_TAG_subroutine_type ]
!17 = metadata !{metadata !18, metadata !18}
!18 = metadata !{i32 524324, metadata !14, metadata !"int", metadata !14, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!19 = metadata !{i32 524334, i32 0, metadata !20, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !20, i32 12, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!20 = metadata !{i32 524329, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !21} ; [ DW_TAG_file_type ]
!21 = metadata !{i32 524305, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!22 = metadata !{i32 524309, metadata !20, metadata !"", metadata !20, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null} ; [ DW_TAG_subroutine_type ]
!23 = metadata !{metadata !24, metadata !24, metadata !24, metadata !25}
!24 = metadata !{i32 524303, metadata !20, metadata !"", metadata !20, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!25 = metadata !{i32 524310, metadata !26, metadata !"size_t", metadata !26, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ]
!26 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !21} ; [ DW_TAG_file_type ]
!27 = metadata !{i32 524324, metadata !20, metadata !"long unsigned int", metadata !20, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!28 = metadata !{i32 524334, i32 0, metadata !29, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !29, i32 12, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 524329, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !30} ; [ DW_TAG_file_type ]
!30 = metadata !{i32 524305, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_u
!31 = metadata !{i32 524309, metadata !29, metadata !"", metadata !29, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null} ; [ DW_TAG_subroutine_type ]
!32 = metadata !{metadata !33, metadata !33, metadata !33, metadata !34}
!33 = metadata !{i32 524303, metadata !29, metadata !"", metadata !29, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!34 = metadata !{i32 524310, metadata !35, metadata !"size_t", metadata !35, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_typedef ]
!35 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !30} ; [ DW_TAG_file_type ]
!36 = metadata !{i32 524324, metadata !29, metadata !"long unsigned int", metadata !29, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!37 = metadata !{i32 524334, i32 0, metadata !38, metadata !"memset", metadata !"memset", metadata !"memset", metadata !38, i32 12, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!38 = metadata !{i32 524329, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !39} ; [ DW_TAG_file_type ]
!39 = metadata !{i32 524305, i32 0, i32 1, metadata !"memset.c", metadata !"/home/kain/Documents/bishe/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_un
!40 = metadata !{i32 524309, metadata !38, metadata !"", metadata !38, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, null} ; [ DW_TAG_subroutine_type ]
!41 = metadata !{metadata !42, metadata !42, metadata !43, metadata !44}
!42 = metadata !{i32 524303, metadata !38, metadata !"", metadata !38, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!43 = metadata !{i32 524324, metadata !38, metadata !"int", metadata !38, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!44 = metadata !{i32 524310, metadata !45, metadata !"size_t", metadata !45, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_typedef ]
!45 = metadata !{i32 524329, metadata !"stddef.h", metadata !"/home/kain/Documents/bishe/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !39} ; [ DW_TAG_file_type ]
!46 = metadata !{i32 524324, metadata !38, metadata !"long unsigned int", metadata !38, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!47 = metadata !{i32 524545, metadata !13, metadata !"c", metadata !14, i32 16, metadata !18} ; [ DW_TAG_arg_variable ]
!48 = metadata !{i32 524544, metadata !49, metadata !"x", metadata !14, i32 17, metadata !50} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 524299, metadata !13, i32 16, i32 0, metadata !14, i32 0} ; [ DW_TAG_lexical_block ]
!50 = metadata !{i32 524324, metadata !14, metadata !"char", metadata !14, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!51 = metadata !{i32 524545, metadata !19, metadata !"destaddr", metadata !20, i32 12, metadata !24} ; [ DW_TAG_arg_variable ]
!52 = metadata !{i32 524545, metadata !19, metadata !"srcaddr", metadata !20, i32 12, metadata !24} ; [ DW_TAG_arg_variable ]
!53 = metadata !{i32 524545, metadata !19, metadata !"len", metadata !20, i32 12, metadata !25} ; [ DW_TAG_arg_variable ]
!54 = metadata !{i32 524544, metadata !55, metadata !"dest", metadata !20, i32 13, metadata !56} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 524299, metadata !19, i32 12, i32 0, metadata !20, i32 0} ; [ DW_TAG_lexical_block ]
!56 = metadata !{i32 524303, metadata !20, metadata !"", metadata !20, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_pointer_type ]
!57 = metadata !{i32 524324, metadata !20, metadata !"char", metadata !20, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!58 = metadata !{i32 524544, metadata !55, metadata !"src", metadata !20, i32 14, metadata !59} ; [ DW_TAG_auto_variable ]
!59 = metadata !{i32 524303, metadata !20, metadata !"", metadata !20, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ]
!60 = metadata !{i32 524326, metadata !20, metadata !"", metadata !20, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !57} ; [ DW_TAG_const_type ]
!61 = metadata !{i32 524545, metadata !28, metadata !"dst", metadata !29, i32 12, metadata !33} ; [ DW_TAG_arg_variable ]
!62 = metadata !{i32 524545, metadata !28, metadata !"src", metadata !29, i32 12, metadata !33} ; [ DW_TAG_arg_variable ]
!63 = metadata !{i32 524545, metadata !28, metadata !"count", metadata !29, i32 12, metadata !34} ; [ DW_TAG_arg_variable ]
!64 = metadata !{i32 524544, metadata !65, metadata !"a", metadata !29, i32 13, metadata !66} ; [ DW_TAG_auto_variable ]
!65 = metadata !{i32 524299, metadata !28, i32 12, i32 0, metadata !29, i32 0} ; [ DW_TAG_lexical_block ]
!66 = metadata !{i32 524303, metadata !29, metadata !"", metadata !29, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !67} ; [ DW_TAG_pointer_type ]
!67 = metadata !{i32 524324, metadata !29, metadata !"char", metadata !29, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!68 = metadata !{i32 524544, metadata !65, metadata !"b", metadata !29, i32 14, metadata !69} ; [ DW_TAG_auto_variable ]
!69 = metadata !{i32 524303, metadata !29, metadata !"", metadata !29, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !70} ; [ DW_TAG_pointer_type ]
!70 = metadata !{i32 524326, metadata !29, metadata !"", metadata !29, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !67} ; [ DW_TAG_const_type ]
!71 = metadata !{i32 524545, metadata !37, metadata !"dst", metadata !38, i32 12, metadata !42} ; [ DW_TAG_arg_variable ]
!72 = metadata !{i32 524545, metadata !37, metadata !"s", metadata !38, i32 12, metadata !43} ; [ DW_TAG_arg_variable ]
!73 = metadata !{i32 524545, metadata !37, metadata !"count", metadata !38, i32 12, metadata !44} ; [ DW_TAG_arg_variable ]
!74 = metadata !{i32 524544, metadata !75, metadata !"a", metadata !38, i32 13, metadata !76} ; [ DW_TAG_auto_variable ]
!75 = metadata !{i32 524299, metadata !37, i32 12, i32 0, metadata !38, i32 0} ; [ DW_TAG_lexical_block ]
!76 = metadata !{i32 524303, metadata !38, metadata !"", metadata !38, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !77} ; [ DW_TAG_pointer_type ]
!77 = metadata !{i32 524324, metadata !38, metadata !"char", metadata !38, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!78 = metadata !{i32 7, i32 0, metadata !79, null}
!79 = metadata !{i32 524299, metadata !0, i32 6, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 10, i32 0, metadata !79, null}
!81 = metadata !{i32 11, i32 0, metadata !79, null}
!82 = metadata !{i32 12, i32 0, metadata !79, null}
!83 = metadata !{i32 14, i32 0, metadata !79, null}
!84 = metadata !{i32 15, i32 0, metadata !79, null}
!85 = metadata !{i32 24, i32 0, metadata !86, null}
!86 = metadata !{i32 524299, metadata !6, i32 18, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!87 = metadata !{i32 26, i32 0, metadata !86, null}
!88 = metadata !{i32 29, i32 0, metadata !86, null}
!89 = metadata !{i32 30, i32 0, metadata !86, null}
!90 = metadata !{i32 34, i32 0, metadata !86, null}
!91 = metadata !{i32 17, i32 0, metadata !49, null}
!92 = metadata !{i32 18, i32 0, metadata !49, null}
!93 = metadata !{i32 19, i32 0, metadata !49, null}
