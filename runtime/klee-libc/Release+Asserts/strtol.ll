; ModuleID = 'strtol.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i64 @strtol(i8* %nptr, i8** %endptr, i32 %base) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %nptr}, i64 0, metadata !12), !dbg !24
  tail call void @llvm.dbg.value(metadata !{i8** %endptr}, i64 0, metadata !13), !dbg !24
  tail call void @llvm.dbg.value(metadata !{i32 %base}, i64 0, metadata !14), !dbg !24
  tail call void @llvm.dbg.value(metadata !{i8* %nptr}, i64 0, metadata !15), !dbg !25
  %0 = tail call i16** @__ctype_b_loc() nounwind readnone, !dbg !26
  %1 = load i16** %0, align 8, !dbg !26
  br label %bb, !dbg !25

bb:                                               ; preds = %bb, %entry
  %indvar63 = phi i64 [ %tmp65, %bb ], [ 0, %entry ]
  %s.0 = getelementptr i8* %nptr, i64 %indvar63
  %tmp65 = add i64 %indvar63, 1
  %scevgep = getelementptr i8* %nptr, i64 %tmp65
  %2 = load i8* %s.0, align 1, !dbg !27
  %3 = zext i8 %2 to i64
  %4 = getelementptr inbounds i16* %1, i64 %3, !dbg !26
  %5 = load i16* %4, align 2, !dbg !26
  %6 = zext i16 %5 to i32, !dbg !26
  %7 = and i32 %6, 8192, !dbg !26
  %8 = icmp eq i32 %7, 0, !dbg !26
  br i1 %8, label %bb1, label %bb, !dbg !26

bb1:                                              ; preds = %bb
  tail call void @llvm.dbg.value(metadata !{i8 %2}, i64 0, metadata !19), !dbg !27
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !15), !dbg !27
  switch i8 %2, label %bb5 [
    i8 45, label %bb2
    i8 43, label %bb4
  ]

bb2:                                              ; preds = %bb1
  tail call void @llvm.dbg.value(metadata !28, i64 0, metadata !21), !dbg !29
  %9 = load i8* %scevgep, align 1, !dbg !30
  tail call void @llvm.dbg.value(metadata !{i8 %9}, i64 0, metadata !19), !dbg !30
  %s.0.sum66 = add i64 %indvar63, 2
  %10 = getelementptr inbounds i8* %nptr, i64 %s.0.sum66, !dbg !30
  tail call void @llvm.dbg.value(metadata !{i8* %10}, i64 0, metadata !15), !dbg !30
  br label %bb5, !dbg !30

bb4:                                              ; preds = %bb1
  %11 = load i8* %scevgep, align 1, !dbg !31
  tail call void @llvm.dbg.value(metadata !{i8 %11}, i64 0, metadata !19), !dbg !31
  %s.0.sum = add i64 %indvar63, 2
  %12 = getelementptr inbounds i8* %nptr, i64 %s.0.sum, !dbg !31
  tail call void @llvm.dbg.value(metadata !{i8* %12}, i64 0, metadata !15), !dbg !31
  br label %bb5, !dbg !31

bb5:                                              ; preds = %bb1, %bb4, %bb2
  %s.1 = phi i8* [ %10, %bb2 ], [ %12, %bb4 ], [ %scevgep, %bb1 ]
  %c.0 = phi i8 [ %9, %bb2 ], [ %11, %bb4 ], [ %2, %bb1 ]
  %neg.0 = phi i32 [ 1, %bb2 ], [ 0, %bb4 ], [ 0, %bb1 ]
  %13 = icmp eq i32 %base, 0, !dbg !32
  %14 = icmp eq i32 %base, 16, !dbg !32
  %15 = or i1 %13, %14, !dbg !32
  %16 = icmp eq i8 %c.0, 48, !dbg !32
  %or.cond = and i1 %15, %16
  br i1 %or.cond, label %bb9, label %bb14, !dbg !32

bb9:                                              ; preds = %bb5
  %17 = load i8* %s.1, align 1, !dbg !32
  switch i8 %17, label %bb14 [
    i8 88, label %bb19.thread
    i8 120, label %bb19.thread
  ]

bb19.thread:                                      ; preds = %bb9, %bb9
  %18 = getelementptr inbounds i8* %s.1, i64 1, !dbg !33
  %19 = load i8* %18, align 1, !dbg !33
  tail call void @llvm.dbg.value(metadata !{i8 %19}, i64 0, metadata !19), !dbg !33
  %20 = getelementptr inbounds i8* %s.1, i64 2, !dbg !34
  tail call void @llvm.dbg.value(metadata !{i8* %20}, i64 0, metadata !15), !dbg !34
  tail call void @llvm.dbg.value(metadata !35, i64 0, metadata !14), !dbg !36
  tail call void @llvm.dbg.value(metadata !37, i64 0, metadata !22), !dbg !38
  tail call void @llvm.dbg.value(metadata !39, i64 0, metadata !17), !dbg !38
  br label %bb20

bb14:                                             ; preds = %bb9, %bb5
  br i1 %13, label %bb15, label %bb19, !dbg !40

bb15:                                             ; preds = %bb14
  %iftmp.1.0 = select i1 %16, i32 8, i32 10
  tail call void @llvm.dbg.value(metadata !{i32 %iftmp.1.0}, i64 0, metadata !14), !dbg !41
  br label %bb19, !dbg !41

bb19:                                             ; preds = %bb15, %bb14
  %base_addr.1 = phi i32 [ %iftmp.1.0, %bb15 ], [ %base, %bb14 ]
  tail call void @llvm.dbg.value(metadata !37, i64 0, metadata !22), !dbg !38
  tail call void @llvm.dbg.value(metadata !39, i64 0, metadata !17), !dbg !38
  %21 = add i32 %base_addr.1, -2
  %22 = icmp ugt i32 %21, 34, !dbg !42
  br i1 %22, label %noconv, label %bb20, !dbg !42

bb20:                                             ; preds = %bb19.thread, %bb19
  %base_addr.160 = phi i32 [ 16, %bb19.thread ], [ %base_addr.1, %bb19 ]
  %s.25659 = phi i8* [ %20, %bb19.thread ], [ %s.1, %bb19 ]
  %c.15758 = phi i8 [ %19, %bb19.thread ], [ %c.0, %bb19 ]
  %23 = icmp eq i32 %neg.0, 0, !dbg !43
  %iftmp.3.0 = select i1 %23, i64 9223372036854775807, i64 -9223372036854775808
  tail call void @llvm.dbg.value(metadata !{i64 %iftmp.3.0}, i64 0, metadata !20), !dbg !43
  %24 = sext i32 %base_addr.160 to i64, !dbg !44
  %25 = urem i64 %iftmp.3.0, %24, !dbg !44
  %26 = trunc i64 %25 to i32, !dbg !44
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !23), !dbg !44
  %27 = udiv i64 %iftmp.3.0, %24, !dbg !45
  tail call void @llvm.dbg.value(metadata !{i64 %27}, i64 0, metadata !20), !dbg !45
  br label %bb24, !dbg !45

bb24:                                             ; preds = %bb39, %bb20
  %indvar = phi i64 [ %indvar.next, %bb39 ], [ 0, %bb20 ]
  %acc.1 = phi i64 [ %acc.0, %bb39 ], [ 0, %bb20 ]
  %c.3 = phi i8 [ %46, %bb39 ], [ %c.15758, %bb20 ]
  %any.1 = phi i32 [ %any.0, %bb39 ], [ 0, %bb20 ]
  %s.3 = getelementptr i8* %s.25659, i64 %indvar
  %28 = add i8 %c.3, -48
  %29 = icmp ult i8 %28, 10
  br i1 %29, label %bb30, label %bb26, !dbg !46

bb26:                                             ; preds = %bb24
  %30 = add i8 %c.3, -65
  %31 = icmp ult i8 %30, 26
  br i1 %31, label %bb27, label %bb28, !dbg !47

bb27:                                             ; preds = %bb26
  %32 = add i8 %c.3, -55
  br label %bb30, !dbg !48

bb28:                                             ; preds = %bb26
  %33 = add i8 %c.3, -97
  %34 = icmp ult i8 %33, 26
  br i1 %34, label %bb29, label %bb40, !dbg !49

bb29:                                             ; preds = %bb28
  %35 = add i8 %c.3, -87
  br label %bb30, !dbg !50

bb30:                                             ; preds = %bb24, %bb29, %bb27
  %c.2 = phi i8 [ %32, %bb27 ], [ %35, %bb29 ], [ %28, %bb24 ]
  %36 = sext i8 %c.2 to i32, !dbg !51
  %37 = icmp slt i32 %36, %base_addr.160, !dbg !51
  br i1 %37, label %bb31, label %bb40, !dbg !51

bb31:                                             ; preds = %bb30
  %38 = icmp ugt i64 %acc.1, %27, !dbg !52
  %any.1.lobit = lshr i32 %any.1, 31
  %tmp = trunc i32 %any.1.lobit to i8
  %39 = zext i1 %38 to i8
  %40 = or i8 %tmp, %39
  %toBool34 = icmp eq i8 %40, 0, !dbg !52
  br i1 %toBool34, label %bb35, label %bb39, !dbg !52

bb35:                                             ; preds = %bb31
  %41 = icmp eq i64 %acc.1, %27, !dbg !52
  %42 = icmp sgt i32 %36, %26, !dbg !52
  %or.cond67 = and i1 %41, %42
  br i1 %or.cond67, label %bb39, label %bb38, !dbg !52

bb38:                                             ; preds = %bb35
  %43 = mul i64 %acc.1, %24, !dbg !53
  %44 = sext i8 %c.2 to i64, !dbg !54
  %45 = add i64 %44, %43, !dbg !54
  br label %bb39, !dbg !54

bb39:                                             ; preds = %bb35, %bb31, %bb38
  %acc.0 = phi i64 [ %45, %bb38 ], [ %acc.1, %bb31 ], [ %acc.1, %bb35 ]
  %any.0 = phi i32 [ 1, %bb38 ], [ -1, %bb31 ], [ -1, %bb35 ]
  %46 = load i8* %s.3, align 1, !dbg !55
  %indvar.next = add i64 %indvar, 1
  br label %bb24, !dbg !55

bb40:                                             ; preds = %bb30, %bb28
  %47 = icmp slt i32 %any.1, 0, !dbg !56
  br i1 %47, label %bb41, label %bb45, !dbg !56

bb41:                                             ; preds = %bb40
  tail call void @llvm.dbg.value(metadata !{i64 %iftmp.3.0}, i64 0, metadata !17), !dbg !57
  %48 = tail call i32* @__errno_location() nounwind readnone, !dbg !58
  store i32 34, i32* %48, align 4, !dbg !58
  br label %bb48, !dbg !58

bb45:                                             ; preds = %bb40
  %49 = icmp eq i32 %any.1, 0, !dbg !59
  br i1 %49, label %noconv, label %bb46, !dbg !59

noconv:                                           ; preds = %bb45, %bb19
  %acc.2 = phi i64 [ 0, %bb19 ], [ %acc.1, %bb45 ]
  %s.4 = phi i8* [ %s.1, %bb19 ], [ %s.3, %bb45 ]
  %50 = tail call i32* @__errno_location() nounwind readnone, !dbg !60
  store i32 22, i32* %50, align 4, !dbg !60
  br label %bb48, !dbg !60

bb46:                                             ; preds = %bb45
  %51 = sub i64 0, %acc.1, !dbg !61
  %acc.1. = select i1 %23, i64 %acc.1, i64 %51
  br label %bb48, !dbg !62

bb48:                                             ; preds = %bb46, %noconv, %bb41
  %acc.3 = phi i64 [ %acc.2, %noconv ], [ %iftmp.3.0, %bb41 ], [ %acc.1., %bb46 ]
  %s.5 = phi i8* [ %s.4, %noconv ], [ %s.3, %bb41 ], [ %s.3, %bb46 ]
  %any.3 = phi i32 [ 0, %noconv ], [ -1, %bb41 ], [ %any.1, %bb46 ]
  %52 = icmp eq i8** %endptr, null, !dbg !63
  br i1 %52, label %bb53, label %bb49, !dbg !63

bb49:                                             ; preds = %bb48
  %53 = icmp eq i32 %any.3, 0, !dbg !64
  br i1 %53, label %bb52, label %bb50, !dbg !64

bb50:                                             ; preds = %bb49
  %54 = getelementptr inbounds i8* %s.5, i64 -1, !dbg !64
  br label %bb52, !dbg !64

bb52:                                             ; preds = %bb49, %bb50
  %iftmp.11.0 = phi i8* [ %54, %bb50 ], [ %nptr, %bb49 ]
  store i8* %iftmp.11.0, i8** %endptr, align 8, !dbg !64
  ret i64 %acc.3, !dbg !65

bb53:                                             ; preds = %bb48
  ret i64 %acc.3, !dbg !65
}

declare i16** @__ctype_b_loc() nounwind readnone

declare i32* @__errno_location() nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0}
!llvm.dbg.lv.strtol = !{!12, !13, !14, !15, !17, !19, !20, !21, !22, !23}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"strtol", metadata !"strtol", metadata !"strtol", metadata !1, i32 48, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i64 (i8*, i8**, i32)* @strtol} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"strtol.c", metadata !"/home/kain/Documents/bishe/klee/runtime/klee-libc/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"strtol.c", metadata !"/home/kain/Documents/bishe/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !6, metadata !9, metadata !11}
!5 = metadata !{i32 524324, metadata !1, metadata !"long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 524326, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ]
!8 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 524545, metadata !0, metadata !"nptr", metadata !1, i32 47, metadata !6} ; [ DW_TAG_arg_variable ]
!13 = metadata !{i32 524545, metadata !0, metadata !"endptr", metadata !1, i32 47, metadata !9} ; [ DW_TAG_arg_variable ]
!14 = metadata !{i32 524545, metadata !0, metadata !"base", metadata !1, i32 47, metadata !11} ; [ DW_TAG_arg_variable ]
!15 = metadata !{i32 524544, metadata !16, metadata !"s", metadata !1, i32 49, metadata !6} ; [ DW_TAG_auto_variable ]
!16 = metadata !{i32 524299, metadata !0, i32 48, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!17 = metadata !{i32 524544, metadata !16, metadata !"acc", metadata !1, i32 50, metadata !18} ; [ DW_TAG_auto_variable ]
!18 = metadata !{i32 524324, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!19 = metadata !{i32 524544, metadata !16, metadata !"c", metadata !1, i32 51, metadata !8} ; [ DW_TAG_auto_variable ]
!20 = metadata !{i32 524544, metadata !16, metadata !"cutoff", metadata !1, i32 52, metadata !18} ; [ DW_TAG_auto_variable ]
!21 = metadata !{i32 524544, metadata !16, metadata !"neg", metadata !1, i32 53, metadata !11} ; [ DW_TAG_auto_variable ]
!22 = metadata !{i32 524544, metadata !16, metadata !"any", metadata !1, i32 53, metadata !11} ; [ DW_TAG_auto_variable ]
!23 = metadata !{i32 524544, metadata !16, metadata !"cutlim", metadata !1, i32 53, metadata !11} ; [ DW_TAG_auto_variable ]
!24 = metadata !{i32 47, i32 0, metadata !0, null}
!25 = metadata !{i32 60, i32 0, metadata !16, null}
!26 = metadata !{i32 63, i32 0, metadata !16, null}
!27 = metadata !{i32 62, i32 0, metadata !16, null}
!28 = metadata !{i32 1}
!29 = metadata !{i32 65, i32 0, metadata !16, null}
!30 = metadata !{i32 66, i32 0, metadata !16, null}
!31 = metadata !{i32 70, i32 0, metadata !16, null}
!32 = metadata !{i32 72, i32 0, metadata !16, null}
!33 = metadata !{i32 74, i32 0, metadata !16, null}
!34 = metadata !{i32 75, i32 0, metadata !16, null}
!35 = metadata !{i32 16}
!36 = metadata !{i32 76, i32 0, metadata !16, null}
!37 = metadata !{i32 0}
!38 = metadata !{i32 80, i32 0, metadata !16, null}
!39 = metadata !{i64 0}
!40 = metadata !{i32 78, i32 0, metadata !16, null}
!41 = metadata !{i32 79, i32 0, metadata !16, null}
!42 = metadata !{i32 81, i32 0, metadata !16, null}
!43 = metadata !{i32 101, i32 0, metadata !16, null}
!44 = metadata !{i32 103, i32 0, metadata !16, null}
!45 = metadata !{i32 104, i32 0, metadata !16, null}
!46 = metadata !{i32 106, i32 0, metadata !16, null}
!47 = metadata !{i32 108, i32 0, metadata !16, null}
!48 = metadata !{i32 109, i32 0, metadata !16, null}
!49 = metadata !{i32 110, i32 0, metadata !16, null}
!50 = metadata !{i32 111, i32 0, metadata !16, null}
!51 = metadata !{i32 114, i32 0, metadata !16, null}
!52 = metadata !{i32 116, i32 0, metadata !16, null}
!53 = metadata !{i32 120, i32 0, metadata !16, null}
!54 = metadata !{i32 121, i32 0, metadata !16, null}
!55 = metadata !{i32 105, i32 0, metadata !16, null}
!56 = metadata !{i32 124, i32 0, metadata !16, null}
!57 = metadata !{i32 125, i32 0, metadata !16, null}
!58 = metadata !{i32 126, i32 0, metadata !16, null}
!59 = metadata !{i32 127, i32 0, metadata !16, null}
!60 = metadata !{i32 129, i32 0, metadata !16, null}
!61 = metadata !{i32 131, i32 0, metadata !16, null}
!62 = metadata !{i32 130, i32 0, metadata !16, null}
!63 = metadata !{i32 132, i32 0, metadata !16, null}
!64 = metadata !{i32 133, i32 0, metadata !16, null}
!65 = metadata !{i32 134, i32 0, metadata !16, null}
