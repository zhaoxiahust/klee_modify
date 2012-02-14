; ModuleID = 'fun.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @badAbs(i32 %x) nounwind {
entry:
  %x_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{i32* %x_addr}, metadata !6), !dbg !7
  store i32 %x, i32* %x_addr
  %1 = load i32* %x_addr, align 4, !dbg !8
  %2 = icmp slt i32 %1, 0, !dbg !8
  br i1 %2, label %bb, label %bb1, !dbg !8

bb:                                               ; preds = %entry
  %3 = load i32* %x_addr, align 4, !dbg !10
  %4 = sub nsw i32 0, %3, !dbg !10
  store i32 %4, i32* %0, align 4, !dbg !10
  br label %bb4, !dbg !10

bb1:                                              ; preds = %entry
  %5 = load i32* %x_addr, align 4, !dbg !11
  %6 = icmp eq i32 %5, 1234, !dbg !11
  br i1 %6, label %bb2, label %bb3, !dbg !11

bb2:                                              ; preds = %bb1
  %7 = load i32* %x_addr, align 4, !dbg !12
  %8 = sub nsw i32 0, %7, !dbg !12
  store i32 %8, i32* %0, align 4, !dbg !12
  br label %bb4, !dbg !12

bb3:                                              ; preds = %bb1
  %9 = load i32* %x_addr, align 4, !dbg !13
  store i32 %9, i32* %0, align 4, !dbg !13
  br label %bb4, !dbg !13

bb4:                                              ; preds = %bb3, %bb2, %bb
  %10 = load i32* %0, align 4, !dbg !10
  store i32 %10, i32* %retval, align 4, !dbg !10
  br label %return, !dbg !10

return:                                           ; preds = %bb4
  %retval5 = load i32* %retval, !dbg !10
  ret i32 %retval5, !dbg !10
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

!llvm.dbg.sp = !{!0}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"badAbs", metadata !"badAbs", metadata !"badAbs", metadata !1, i32 7, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 false, i32 (i32)* @badAbs} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"fun.c", metadata !"/home/kain/Documents/bishe/klee/examples/get_sign/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"fun.c", metadata !"/home/kain/Documents/bishe/klee/examples/get_sign/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5}
!5 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524545, metadata !0, metadata !"x", metadata !1, i32 6, metadata !5} ; [ DW_TAG_arg_variable ]
!7 = metadata !{i32 6, i32 0, metadata !0, null}
!8 = metadata !{i32 8, i32 0, metadata !9, null}
!9 = metadata !{i32 524299, metadata !0, i32 7, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!10 = metadata !{i32 9, i32 0, metadata !9, null}
!11 = metadata !{i32 10, i32 0, metadata !9, null}
!12 = metadata !{i32 11, i32 0, metadata !9, null}
!13 = metadata !{i32 13, i32 0, metadata !9, null}
