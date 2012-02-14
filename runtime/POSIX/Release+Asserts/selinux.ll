; ModuleID = 'selinux.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@exe_selinux = global i32 1
@create_con = global i8* null

define i32 @is_selinux_enabled() nounwind readonly {
entry:
  %0 = load i32* @exe_selinux, align 4, !dbg !44
  ret i32 %0, !dbg !44
}

define i32 @getfscreatecon(i8** nocapture %context) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8** %context}, i64 0, metadata !34), !dbg !46
  %0 = load i8** @create_con, align 8, !dbg !47
  store i8* %0, i8** %context, align 8, !dbg !47
  ret i32 0, !dbg !49
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @freecon(i8* nocapture %con) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %con}, i64 0, metadata !35), !dbg !50
  ret void, !dbg !51
}

define void @freeconary(i8** nocapture %con) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{i8** %con}, i64 0, metadata !36), !dbg !53
  ret void, !dbg !54
}

define i32 @setfilecon(i8* nocapture %path, i8* %con) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !37), !dbg !56
  tail call void @llvm.dbg.value(metadata !{i8* %con}, i64 0, metadata !38), !dbg !56
  %0 = icmp eq i8* %con, null, !dbg !57
  br i1 %0, label %bb1, label %bb2, !dbg !57

bb1:                                              ; preds = %entry
  %1 = tail call i32* @__errno_location() nounwind readnone, !dbg !59
  store i32 28, i32* %1, align 4, !dbg !59
  ret i32 -1, !dbg !60

bb2:                                              ; preds = %entry
  ret i32 0, !dbg !60
}

declare i32* @__errno_location() nounwind readnone

define i32 @fsetfilecon(i32 %fd, i8* %con) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !39), !dbg !61
  tail call void @llvm.dbg.value(metadata !{i8* %con}, i64 0, metadata !40), !dbg !61
  tail call void @llvm.dbg.value(metadata !62, i64 0, metadata !37) nounwind, !dbg !63
  tail call void @llvm.dbg.value(metadata !{i8* %con}, i64 0, metadata !38) nounwind, !dbg !63
  %0 = icmp eq i8* %con, null, !dbg !66
  br i1 %0, label %bb1.i, label %setfilecon.exit, !dbg !66

bb1.i:                                            ; preds = %entry
  %1 = tail call i32* @__errno_location() nounwind readnone, !dbg !67
  store i32 28, i32* %1, align 4, !dbg !67
  ret i32 -1, !dbg !64

setfilecon.exit:                                  ; preds = %entry
  ret i32 0, !dbg !64
}

define i32 @lsetfilecon(i8* nocapture %path, i8* %con) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !41), !dbg !68
  tail call void @llvm.dbg.value(metadata !{i8* %con}, i64 0, metadata !42), !dbg !68
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !37) nounwind, !dbg !69
  tail call void @llvm.dbg.value(metadata !{i8* %con}, i64 0, metadata !38) nounwind, !dbg !69
  %0 = icmp eq i8* %con, null, !dbg !72
  br i1 %0, label %bb1.i, label %setfilecon.exit, !dbg !72

bb1.i:                                            ; preds = %entry
  %1 = tail call i32* @__errno_location() nounwind readnone, !dbg !73
  store i32 28, i32* %1, align 4, !dbg !73
  ret i32 -1, !dbg !70

setfilecon.exit:                                  ; preds = %entry
  ret i32 0, !dbg !70
}

define i32 @setfscreatecon(i8* %context) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %context}, i64 0, metadata !43), !dbg !74
  %0 = icmp eq i8* %context, null, !dbg !75
  br i1 %0, label %bb, label %bb1, !dbg !75

bb:                                               ; preds = %entry
  store i8* %context, i8** @create_con, align 8, !dbg !77
  ret i32 0, !dbg !78

bb1:                                              ; preds = %entry
  %1 = load i8* %context, align 1, !dbg !79
  %2 = icmp eq i8 %1, 0, !dbg !79
  br i1 %2, label %bb5, label %bb2, !dbg !79

bb2:                                              ; preds = %bb1
  %3 = getelementptr inbounds i8* %context, i64 1, !dbg !79
  %4 = load i8* %3, align 1, !dbg !79
  %5 = icmp eq i8 %4, 0, !dbg !79
  br i1 %5, label %bb3, label %bb5, !dbg !79

bb3:                                              ; preds = %bb2
  tail call void @klee_silent_exit(i32 1) noreturn nounwind, !dbg !80
  unreachable, !dbg !80

bb5:                                              ; preds = %bb2, %bb1
  ret i32 -1, !dbg !78
}

declare void @klee_silent_exit(i32) noreturn

!llvm.dbg.sp = !{!0, !6, !14, !17, !20, !25, !28, !29}
!llvm.dbg.gv = !{!32, !33}
!llvm.dbg.lv.getfscreatecon = !{!34}
!llvm.dbg.lv.freecon = !{!35}
!llvm.dbg.lv.freeconary = !{!36}
!llvm.dbg.lv.setfilecon = !{!37, !38}
!llvm.dbg.lv.fsetfilecon = !{!39, !40}
!llvm.dbg.lv.lsetfilecon = !{!41, !42}
!llvm.dbg.lv.setfscreatecon = !{!43}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"is_selinux_enabled", metadata !"is_selinux_enabled", metadata !"is_selinux_enabled", metadata !1, i32 29, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 ()* @is_selinux_enabled} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"selinux.c", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"selinux.c", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524334, i32 0, metadata !1, metadata !"getfscreatecon", metadata !"getfscreatecon", metadata !"getfscreatecon", metadata !1, i32 36, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8**)* @getfscreatecon} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !5, metadata !9}
!9 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 524310, metadata !11, metadata !"security_context_t", metadata !11, i32 124, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ]
!11 = metadata !{i32 524329, metadata !"selinux.h", metadata !"/usr/include/selinux", metadata !2} ; [ DW_TAG_file_type ]
!12 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!14 = metadata !{i32 524334, i32 0, metadata !1, metadata !"freecon", metadata !"freecon", metadata !"freecon", metadata !1, i32 77, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, void (i8*)* @freecon} ; [ DW_TAG_subprogram ]
!15 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null} ; [ DW_TAG_subroutine_type ]
!16 = metadata !{null, metadata !10}
!17 = metadata !{i32 524334, i32 0, metadata !1, metadata !"freeconary", metadata !"freeconary", metadata !"freeconary", metadata !1, i32 78, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, void (i8**)* @freeconary} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{null, metadata !9}
!20 = metadata !{i32 524334, i32 0, metadata !1, metadata !"setfilecon", metadata !"setfilecon", metadata !"setfilecon", metadata !1, i32 59, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, i8*)* @setfilecon} ; [ DW_TAG_subprogram ]
!21 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{metadata !5, metadata !23, metadata !10}
!23 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ]
!24 = metadata !{i32 524326, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !13} ; [ DW_TAG_const_type ]
!25 = metadata !{i32 524334, i32 0, metadata !1, metadata !"fsetfilecon", metadata !"fsetfilecon", metadata !"fsetfilecon", metadata !1, i32 71, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i8*)* @fsetfilecon} ; [ DW_TAG_subprogram ]
!26 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null} ; [ DW_TAG_subroutine_type ]
!27 = metadata !{metadata !5, metadata !5, metadata !10}
!28 = metadata !{i32 524334, i32 0, metadata !1, metadata !"lsetfilecon", metadata !"lsetfilecon", metadata !"lsetfilecon", metadata !1, i32 67, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, i8*)* @lsetfilecon} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 524334, i32 0, metadata !1, metadata !"setfscreatecon", metadata !"setfscreatecon", metadata !"setfscreatecon", metadata !1, i32 42, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*)* @setfscreatecon} ; [ DW_TAG_subprogram ]
!30 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null} ; [ DW_TAG_subroutine_type ]
!31 = metadata !{metadata !5, metadata !10}
!32 = metadata !{i32 524340, i32 0, metadata !1, metadata !"exe_selinux", metadata !"exe_selinux", metadata !"", metadata !1, i32 23, metadata !5, i1 false, i1 true, i32* @exe_selinux} ; [ DW_TAG_variable ]
!33 = metadata !{i32 524340, i32 0, metadata !1, metadata !"create_con", metadata !"create_con", metadata !"", metadata !1, i32 26, metadata !10, i1 false, i1 true, i8** @create_con} ; [ DW_TAG_variable ]
!34 = metadata !{i32 524545, metadata !6, metadata !"context", metadata !1, i32 36, metadata !9} ; [ DW_TAG_arg_variable ]
!35 = metadata !{i32 524545, metadata !14, metadata !"con", metadata !1, i32 77, metadata !10} ; [ DW_TAG_arg_variable ]
!36 = metadata !{i32 524545, metadata !17, metadata !"con", metadata !1, i32 78, metadata !9} ; [ DW_TAG_arg_variable ]
!37 = metadata !{i32 524545, metadata !20, metadata !"path", metadata !1, i32 59, metadata !23} ; [ DW_TAG_arg_variable ]
!38 = metadata !{i32 524545, metadata !20, metadata !"con", metadata !1, i32 59, metadata !10} ; [ DW_TAG_arg_variable ]
!39 = metadata !{i32 524545, metadata !25, metadata !"fd", metadata !1, i32 71, metadata !5} ; [ DW_TAG_arg_variable ]
!40 = metadata !{i32 524545, metadata !25, metadata !"con", metadata !1, i32 71, metadata !10} ; [ DW_TAG_arg_variable ]
!41 = metadata !{i32 524545, metadata !28, metadata !"path", metadata !1, i32 67, metadata !23} ; [ DW_TAG_arg_variable ]
!42 = metadata !{i32 524545, metadata !28, metadata !"con", metadata !1, i32 67, metadata !10} ; [ DW_TAG_arg_variable ]
!43 = metadata !{i32 524545, metadata !29, metadata !"context", metadata !1, i32 42, metadata !10} ; [ DW_TAG_arg_variable ]
!44 = metadata !{i32 30, i32 0, metadata !45, null}
!45 = metadata !{i32 524299, metadata !0, i32 29, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!46 = metadata !{i32 36, i32 0, metadata !6, null}
!47 = metadata !{i32 37, i32 0, metadata !48, null}
!48 = metadata !{i32 524299, metadata !6, i32 36, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!49 = metadata !{i32 38, i32 0, metadata !48, null}
!50 = metadata !{i32 77, i32 0, metadata !14, null}
!51 = metadata !{i32 77, i32 0, metadata !52, null}
!52 = metadata !{i32 524299, metadata !14, i32 77, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 78, i32 0, metadata !17, null}
!54 = metadata !{i32 78, i32 0, metadata !55, null}
!55 = metadata !{i32 524299, metadata !17, i32 78, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!56 = metadata !{i32 59, i32 0, metadata !20, null}
!57 = metadata !{i32 60, i32 0, metadata !58, null}
!58 = metadata !{i32 524299, metadata !20, i32 59, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!59 = metadata !{i32 63, i32 0, metadata !58, null}
!60 = metadata !{i32 61, i32 0, metadata !58, null}
!61 = metadata !{i32 71, i32 0, metadata !25, null}
!62 = metadata !{null}
!63 = metadata !{i32 59, i32 0, metadata !20, metadata !64}
!64 = metadata !{i32 72, i32 0, metadata !65, null}
!65 = metadata !{i32 524299, metadata !25, i32 71, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!66 = metadata !{i32 60, i32 0, metadata !58, metadata !64}
!67 = metadata !{i32 63, i32 0, metadata !58, metadata !64}
!68 = metadata !{i32 67, i32 0, metadata !28, null}
!69 = metadata !{i32 59, i32 0, metadata !20, metadata !70}
!70 = metadata !{i32 68, i32 0, metadata !71, null}
!71 = metadata !{i32 524299, metadata !28, i32 67, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!72 = metadata !{i32 60, i32 0, metadata !58, metadata !70}
!73 = metadata !{i32 63, i32 0, metadata !58, metadata !70}
!74 = metadata !{i32 42, i32 0, metadata !29, null}
!75 = metadata !{i32 43, i32 0, metadata !76, null}
!76 = metadata !{i32 524299, metadata !29, i32 42, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!77 = metadata !{i32 44, i32 0, metadata !76, null}
!78 = metadata !{i32 45, i32 0, metadata !76, null}
!79 = metadata !{i32 51, i32 0, metadata !76, null}
!80 = metadata !{i32 52, i32 0, metadata !76, null}
