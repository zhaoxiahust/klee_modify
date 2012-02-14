; ModuleID = 'thread.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__pthread_list_t = type { %struct.__pthread_list_t*, %struct.__pthread_list_t* }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i32, %struct.__pthread_list_t }
%struct.anon = type { i32, i32, i64, i64, i64, i8*, i32, i32 }
%struct.sigset_t = type { [16 x i64] }
%struct.timespec = type { i64, i64 }
%union.pthread_attr_t = type { i64, [12 x i32] }
%union.pthread_cond_t = type { %struct.anon }
%union.pthread_condattr_t = type { i32 }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }

define i32 @pthread_join(i64 %a, i8** nocapture %b) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{i64 %a}, i64 0, metadata !142), !dbg !167
  tail call void @llvm.dbg.value(metadata !{i8** %b}, i64 0, metadata !143), !dbg !167
  ret i32 undef, !dbg !168
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @pthread_kill(i64 %a, i32 %sig) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{i64 %a}, i64 0, metadata !144), !dbg !170
  tail call void @llvm.dbg.value(metadata !{i32 %sig}, i64 0, metadata !145), !dbg !170
  ret i32 undef, !dbg !171
}

define i32 @pthread_mutex_lock(%union.pthread_mutex_t* nocapture %mutex) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_mutex_t* %mutex}, i64 0, metadata !146), !dbg !173
  ret i32 undef, !dbg !174
}

define i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nocapture %mutex) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_mutex_t* %mutex}, i64 0, metadata !147), !dbg !176
  ret i32 undef, !dbg !177
}

define i32 @pthread_cond_signal(%union.pthread_cond_t* nocapture %cond) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_cond_t* %cond}, i64 0, metadata !148), !dbg !179
  ret i32 undef, !dbg !180
}

define i32 @pthread_cond_broadcast(%union.pthread_cond_t* nocapture %cond) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_cond_t* %cond}, i64 0, metadata !149), !dbg !182
  ret i32 undef, !dbg !183
}

define i32 @pthread_cond_wait(%union.pthread_cond_t* nocapture %cond, %union.pthread_mutex_t* nocapture %mutex) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_cond_t* %cond}, i64 0, metadata !150), !dbg !185
  tail call void @llvm.dbg.value(metadata !{%union.pthread_mutex_t* %mutex}, i64 0, metadata !151), !dbg !185
  ret i32 undef, !dbg !186
}

define i32 @pthread_cond_timedwait(%union.pthread_cond_t* nocapture %cond, %union.pthread_mutex_t* nocapture %mutex, %struct.timespec* nocapture %a) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_cond_t* %cond}, i64 0, metadata !152), !dbg !188
  tail call void @llvm.dbg.value(metadata !{%union.pthread_mutex_t* %mutex}, i64 0, metadata !153), !dbg !188
  tail call void @llvm.dbg.value(metadata !{%struct.timespec* %a}, i64 0, metadata !154), !dbg !188
  ret i32 undef, !dbg !189
}

define i32 @pthread_sigmask(i32 %how, %struct.sigset_t* nocapture %set, %struct.sigset_t* nocapture %oldset) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %how}, i64 0, metadata !155), !dbg !191
  tail call void @llvm.dbg.value(metadata !{%struct.sigset_t* %set}, i64 0, metadata !156), !dbg !191
  tail call void @llvm.dbg.value(metadata !{%struct.sigset_t* %oldset}, i64 0, metadata !157), !dbg !191
  ret i32 undef, !dbg !192
}

define i32 @pthread_attr_init(%union.pthread_attr_t* nocapture %attr) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_attr_t* %attr}, i64 0, metadata !158), !dbg !194
  ret i32 undef, !dbg !195
}

define i32 @pthread_attr_setstacksize(%union.pthread_attr_t* nocapture %attr, i64 %stacksize) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_attr_t* %attr}, i64 0, metadata !159), !dbg !197
  tail call void @llvm.dbg.value(metadata !{i64 %stacksize}, i64 0, metadata !160), !dbg !197
  ret i32 undef, !dbg !198
}

define i32 @pthread_mutex_init(%union.pthread_mutex_t* nocapture %mutex, %union.pthread_condattr_t* nocapture %attr) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_mutex_t* %mutex}, i64 0, metadata !161), !dbg !200
  tail call void @llvm.dbg.value(metadata !{%union.pthread_condattr_t* %attr}, i64 0, metadata !162), !dbg !200
  ret i32 undef, !dbg !201
}

define i32 @pthread_mutex_destroy(%union.pthread_mutex_t* nocapture %mutex) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_mutex_t* %mutex}, i64 0, metadata !163), !dbg !203
  ret i32 undef, !dbg !204
}

define i32 @pthread_cond_init(%union.pthread_cond_t* nocapture %cond, %union.pthread_condattr_t* nocapture %attr) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_cond_t* %cond}, i64 0, metadata !164), !dbg !206
  tail call void @llvm.dbg.value(metadata !{%union.pthread_condattr_t* %attr}, i64 0, metadata !165), !dbg !206
  ret i32 undef, !dbg !207
}

define i32 @pthread_cond_destroy(%union.pthread_cond_t* nocapture %cond) nounwind readnone {
entry:
  tail call void @llvm.dbg.value(metadata !{%union.pthread_cond_t* %cond}, i64 0, metadata !166), !dbg !209
  ret i32 undef, !dbg !210
}

define i32 @kain() nounwind readnone {
entry:
  ret i32 undef, !dbg !212
}

!llvm.dbg.sp = !{!0, !11, !14, !45, !46, !71, !72, !75, !87, !100, !112, !116, !128, !129, !138, !139}
!llvm.dbg.lv.pthread_join = !{!142, !143}
!llvm.dbg.lv.pthread_kill = !{!144, !145}
!llvm.dbg.lv.pthread_mutex_lock = !{!146}
!llvm.dbg.lv.pthread_mutex_unlock = !{!147}
!llvm.dbg.lv.pthread_cond_signal = !{!148}
!llvm.dbg.lv.pthread_cond_broadcast = !{!149}
!llvm.dbg.lv.pthread_cond_wait = !{!150, !151}
!llvm.dbg.lv.pthread_cond_timedwait = !{!152, !153, !154}
!llvm.dbg.lv.pthread_sigmask = !{!155, !156, !157}
!llvm.dbg.lv.pthread_attr_init = !{!158}
!llvm.dbg.lv.pthread_attr_setstacksize = !{!159, !160}
!llvm.dbg.lv.pthread_mutex_init = !{!161, !162}
!llvm.dbg.lv.pthread_mutex_destroy = !{!163}
!llvm.dbg.lv.pthread_cond_init = !{!164, !165}
!llvm.dbg.lv.pthread_cond_destroy = !{!166}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_join", metadata !"pthread_join", metadata !"pthread_join", metadata !1, i32 6, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i64, i8**)* @pthread_join} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"thread.c", metadata !"/home/kain/Documents/bishe/klee/runtime/klee-libc/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"thread.c", metadata !"/home/kain/Documents/bishe/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !6, metadata !9}
!5 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524310, metadata !7, metadata !"pthread_t", metadata !7, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!7 = metadata !{i32 524329, metadata !"pthreadtypes.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!8 = metadata !{i32 524324, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_kill", metadata !"pthread_kill", metadata !"pthread_kill", metadata !1, i32 10, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i64, i32)* @pthread_kill} ; [ DW_TAG_subprogram ]
!12 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null} ; [ DW_TAG_subroutine_type ]
!13 = metadata !{metadata !5, metadata !6, metadata !5}
!14 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_mutex_lock", metadata !"pthread_mutex_lock", metadata !"pthread_mutex_lock", metadata !1, i32 14, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_mutex_t*)* @pthread_mutex_lock} ; [ DW_TAG_subprogram ]
!15 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null} ; [ DW_TAG_subroutine_type ]
!16 = metadata !{metadata !5, metadata !17}
!17 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ]
!18 = metadata !{i32 524310, metadata !7, metadata !"pthread_mutex_t", metadata !7, i32 107, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ]
!19 = metadata !{i32 524311, metadata !1, metadata !"", metadata !7, i32 77, i64 320, i64 64, i64 0, i32 0, null, metadata !20, i32 0, null} ; [ DW_TAG_union_type ]
!20 = metadata !{metadata !21, metadata !38, metadata !43}
!21 = metadata !{i32 524301, metadata !19, metadata !"__data", metadata !7, i32 101, i64 320, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_member ]
!22 = metadata !{i32 524307, metadata !1, metadata !"__pthread_mutex_s", metadata !7, i32 79, i64 320, i64 64, i64 0, i32 0, null, metadata !23, i32 0, null} ; [ DW_TAG_structure_type ]
!23 = metadata !{metadata !24, metadata !25, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31}
!24 = metadata !{i32 524301, metadata !22, metadata !"__lock", metadata !7, i32 80, i64 32, i64 32, i64 0, i32 0, metadata !5} ; [ DW_TAG_member ]
!25 = metadata !{i32 524301, metadata !22, metadata !"__count", metadata !7, i32 81, i64 32, i64 32, i64 32, i32 0, metadata !26} ; [ DW_TAG_member ]
!26 = metadata !{i32 524324, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!27 = metadata !{i32 524301, metadata !22, metadata !"__owner", metadata !7, i32 82, i64 32, i64 32, i64 64, i32 0, metadata !5} ; [ DW_TAG_member ]
!28 = metadata !{i32 524301, metadata !22, metadata !"__nusers", metadata !7, i32 84, i64 32, i64 32, i64 96, i32 0, metadata !26} ; [ DW_TAG_member ]
!29 = metadata !{i32 524301, metadata !22, metadata !"__kind", metadata !7, i32 88, i64 32, i64 32, i64 128, i32 0, metadata !5} ; [ DW_TAG_member ]
!30 = metadata !{i32 524301, metadata !22, metadata !"__spins", metadata !7, i32 90, i64 32, i64 32, i64 160, i32 0, metadata !5} ; [ DW_TAG_member ]
!31 = metadata !{i32 524301, metadata !22, metadata !"__list", metadata !7, i32 91, i64 128, i64 64, i64 192, i32 0, metadata !32} ; [ DW_TAG_member ]
!32 = metadata !{i32 524310, metadata !7, metadata !"__pthread_list_t", metadata !7, i32 77, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!33 = metadata !{i32 524307, metadata !1, metadata !"__pthread_internal_list", metadata !7, i32 62, i64 128, i64 64, i64 0, i32 0, null, metadata !34, i32 0, null} ; [ DW_TAG_structure_type ]
!34 = metadata !{metadata !35, metadata !37}
!35 = metadata !{i32 524301, metadata !33, metadata !"__prev", metadata !7, i32 63, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_member ]
!36 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ]
!37 = metadata !{i32 524301, metadata !33, metadata !"__next", metadata !7, i32 64, i64 64, i64 64, i64 64, i32 0, metadata !36} ; [ DW_TAG_member ]
!38 = metadata !{i32 524301, metadata !19, metadata !"__size", metadata !7, i32 102, i64 320, i64 8, i64 0, i32 0, metadata !39} ; [ DW_TAG_member ]
!39 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 320, i64 8, i64 0, i32 0, metadata !40, metadata !41, i32 0, null} ; [ DW_TAG_array_type ]
!40 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!41 = metadata !{metadata !42}
!42 = metadata !{i32 524321, i64 0, i64 39}       ; [ DW_TAG_subrange_type ]
!43 = metadata !{i32 524301, metadata !19, metadata !"__align", metadata !7, i32 103, i64 64, i64 64, i64 0, i32 0, metadata !44} ; [ DW_TAG_member ]
!44 = metadata !{i32 524324, metadata !1, metadata !"long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!45 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_mutex_unlock", metadata !"pthread_mutex_unlock", metadata !"pthread_mutex_unlock", metadata !1, i32 18, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_mutex_t*)* @pthread_mutex_unlock} ; [ DW_TAG_subprogram ]
!46 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_cond_signal", metadata !"pthread_cond_signal", metadata !"pthread_cond_signal", metadata !1, i32 22, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_cond_t*)* @pthread_cond_signal} ; [ DW_TAG_subprogram ]
!47 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, null} ; [ DW_TAG_subroutine_type ]
!48 = metadata !{metadata !5, metadata !49}
!49 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ]
!50 = metadata !{i32 524310, metadata !7, metadata !"pthread_cond_t", metadata !7, i32 133, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ]
!51 = metadata !{i32 524311, metadata !1, metadata !"", metadata !7, i32 116, i64 384, i64 64, i64 0, i32 0, null, metadata !52, i32 0, null} ; [ DW_TAG_union_type ]
!52 = metadata !{metadata !53, metadata !65, metadata !69}
!53 = metadata !{i32 524301, metadata !51, metadata !"__data", metadata !7, i32 127, i64 384, i64 64, i64 0, i32 0, metadata !54} ; [ DW_TAG_member ]
!54 = metadata !{i32 524307, metadata !1, metadata !"", metadata !7, i32 118, i64 384, i64 64, i64 0, i32 0, null, metadata !55, i32 0, null} ; [ DW_TAG_structure_type ]
!55 = metadata !{metadata !56, metadata !57, metadata !58, metadata !60, metadata !61, metadata !62, metadata !63, metadata !64}
!56 = metadata !{i32 524301, metadata !54, metadata !"__lock", metadata !7, i32 119, i64 32, i64 32, i64 0, i32 0, metadata !5} ; [ DW_TAG_member ]
!57 = metadata !{i32 524301, metadata !54, metadata !"__futex", metadata !7, i32 120, i64 32, i64 32, i64 32, i32 0, metadata !26} ; [ DW_TAG_member ]
!58 = metadata !{i32 524301, metadata !54, metadata !"__total_seq", metadata !7, i32 121, i64 64, i64 64, i64 64, i32 0, metadata !59} ; [ DW_TAG_member ]
!59 = metadata !{i32 524324, metadata !1, metadata !"long long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!60 = metadata !{i32 524301, metadata !54, metadata !"__wakeup_seq", metadata !7, i32 122, i64 64, i64 64, i64 128, i32 0, metadata !59} ; [ DW_TAG_member ]
!61 = metadata !{i32 524301, metadata !54, metadata !"__woken_seq", metadata !7, i32 123, i64 64, i64 64, i64 192, i32 0, metadata !59} ; [ DW_TAG_member ]
!62 = metadata !{i32 524301, metadata !54, metadata !"__mutex", metadata !7, i32 124, i64 64, i64 64, i64 256, i32 0, metadata !10} ; [ DW_TAG_member ]
!63 = metadata !{i32 524301, metadata !54, metadata !"__nwaiters", metadata !7, i32 125, i64 32, i64 32, i64 320, i32 0, metadata !26} ; [ DW_TAG_member ]
!64 = metadata !{i32 524301, metadata !54, metadata !"__broadcast_seq", metadata !7, i32 126, i64 32, i64 32, i64 352, i32 0, metadata !26} ; [ DW_TAG_member ]
!65 = metadata !{i32 524301, metadata !51, metadata !"__size", metadata !7, i32 128, i64 384, i64 8, i64 0, i32 0, metadata !66} ; [ DW_TAG_member ]
!66 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 384, i64 8, i64 0, i32 0, metadata !40, metadata !67, i32 0, null} ; [ DW_TAG_array_type ]
!67 = metadata !{metadata !68}
!68 = metadata !{i32 524321, i64 0, i64 47}       ; [ DW_TAG_subrange_type ]
!69 = metadata !{i32 524301, metadata !51, metadata !"__align", metadata !7, i32 129, i64 64, i64 64, i64 0, i32 0, metadata !70} ; [ DW_TAG_member ]
!70 = metadata !{i32 524324, metadata !1, metadata !"long long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!71 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_cond_broadcast", metadata !"pthread_cond_broadcast", metadata !"pthread_cond_broadcast", metadata !1, i32 26, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_cond_t*)* @pthread_cond_broadcast} ; [ DW_TAG_subprogram ]
!72 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_cond_wait", metadata !"pthread_cond_wait", metadata !"pthread_cond_wait", metadata !1, i32 30, metadata !73, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_cond_t*, %union.pthread_mutex_t*)* @pthread_cond_wait} ; [ DW_TAG_subprogram ]
!73 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, null} ; [ DW_TAG_subroutine_type ]
!74 = metadata !{metadata !5, metadata !49, metadata !17}
!75 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_cond_timedwait", metadata !"pthread_cond_timedwait", metadata !"pthread_cond_timedwait", metadata !1, i32 34, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_cond_t*, %union.pthread_mutex_t*, %struct.timespec*)* @pthread_cond_timedwait} ; [ DW_TAG_subprogram ]
!76 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !77, i32 0, null} ; [ DW_TAG_subroutine_type ]
!77 = metadata !{metadata !5, metadata !49, metadata !17, metadata !78}
!78 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !79} ; [ DW_TAG_pointer_type ]
!79 = metadata !{i32 524326, metadata !1, metadata !"", metadata !1, i32 0, i64 128, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_const_type ]
!80 = metadata !{i32 524307, metadata !1, metadata !"timespec", metadata !81, i32 121, i64 128, i64 64, i64 0, i32 0, null, metadata !82, i32 0, null} ; [ DW_TAG_structure_type ]
!81 = metadata !{i32 524329, metadata !"time.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!82 = metadata !{metadata !83, metadata !86}
!83 = metadata !{i32 524301, metadata !80, metadata !"tv_sec", metadata !81, i32 122, i64 64, i64 64, i64 0, i32 0, metadata !84} ; [ DW_TAG_member ]
!84 = metadata !{i32 524310, metadata !85, metadata !"__time_t", metadata !85, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_typedef ]
!85 = metadata !{i32 524329, metadata !"types.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!86 = metadata !{i32 524301, metadata !80, metadata !"tv_nsec", metadata !81, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !44} ; [ DW_TAG_member ]
!87 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_sigmask", metadata !"pthread_sigmask", metadata !"pthread_sigmask", metadata !1, i32 38, metadata !88, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, %struct.sigset_t*, %struct.sigset_t*)* @pthread_sigmask} ; [ DW_TAG_subprogram ]
!88 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !89, i32 0, null} ; [ DW_TAG_subroutine_type ]
!89 = metadata !{metadata !5, metadata !5, metadata !90, metadata !90}
!90 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !91} ; [ DW_TAG_pointer_type ]
!91 = metadata !{i32 524310, metadata !92, metadata !"sigset_t", metadata !92, i32 68, i64 0, i64 0, i64 0, i32 0, metadata !93} ; [ DW_TAG_typedef ]
!92 = metadata !{i32 524329, metadata !"signal.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!93 = metadata !{i32 524307, metadata !1, metadata !"", metadata !94, i32 30, i64 1024, i64 64, i64 0, i32 0, null, metadata !95, i32 0, null} ; [ DW_TAG_structure_type ]
!94 = metadata !{i32 524329, metadata !"sigset.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!95 = metadata !{metadata !96}
!96 = metadata !{i32 524301, metadata !93, metadata !"__val", metadata !94, i32 31, i64 1024, i64 64, i64 0, i32 0, metadata !97} ; [ DW_TAG_member ]
!97 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !8, metadata !98, i32 0, null} ; [ DW_TAG_array_type ]
!98 = metadata !{metadata !99}
!99 = metadata !{i32 524321, i64 0, i64 15}       ; [ DW_TAG_subrange_type ]
!100 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_attr_init", metadata !"pthread_attr_init", metadata !"pthread_attr_init", metadata !1, i32 42, metadata !101, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_attr_t*)* @pthread_attr_init} ; [ DW_TAG_subprogram ]
!101 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !102, i32 0, null} ; [ DW_TAG_subroutine_type ]
!102 = metadata !{metadata !5, metadata !103}
!103 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !104} ; [ DW_TAG_pointer_type ]
!104 = metadata !{i32 524310, metadata !7, metadata !"pthread_attr_t", metadata !7, i32 62, i64 0, i64 0, i64 0, i32 0, metadata !105} ; [ DW_TAG_typedef ]
!105 = metadata !{i32 524311, metadata !1, metadata !"", metadata !7, i32 54, i64 448, i64 64, i64 0, i32 0, null, metadata !106, i32 0, null} ; [ DW_TAG_union_type ]
!106 = metadata !{metadata !107, metadata !111}
!107 = metadata !{i32 524301, metadata !105, metadata !"__size", metadata !7, i32 55, i64 448, i64 8, i64 0, i32 0, metadata !108} ; [ DW_TAG_member ]
!108 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 448, i64 8, i64 0, i32 0, metadata !40, metadata !109, i32 0, null} ; [ DW_TAG_array_type ]
!109 = metadata !{metadata !110}
!110 = metadata !{i32 524321, i64 0, i64 55}      ; [ DW_TAG_subrange_type ]
!111 = metadata !{i32 524301, metadata !105, metadata !"__align", metadata !7, i32 56, i64 64, i64 64, i64 0, i32 0, metadata !44} ; [ DW_TAG_member ]
!112 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_attr_setstacksize", metadata !"pthread_attr_setstacksize", metadata !"pthread_attr_setstacksize", metadata !1, i32 46, metadata !113, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_attr_t*, i64)* @pthread_attr_setstacksize} ; [ DW_TAG_subprogram ]
!113 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !114, i32 0, null} ; [ DW_TAG_subroutine_type ]
!114 = metadata !{metadata !5, metadata !103, metadata !115}
!115 = metadata !{i32 524310, metadata !81, metadata !"size_t", metadata !81, i32 76, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!116 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_mutex_init", metadata !"pthread_mutex_init", metadata !"pthread_mutex_init", metadata !1, i32 50, metadata !117, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_mutex_t*, %union.pthread_condattr_t*)* @pthread_mutex_init} ; [ DW_TAG_subprogram ]
!117 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !118, i32 0, null} ; [ DW_TAG_subroutine_type ]
!118 = metadata !{metadata !5, metadata !17, metadata !119}
!119 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !120} ; [ DW_TAG_pointer_type ]
!120 = metadata !{i32 524310, metadata !7, metadata !"pthread_mutexattr_t", metadata !7, i32 116, i64 0, i64 0, i64 0, i32 0, metadata !121} ; [ DW_TAG_typedef ]
!121 = metadata !{i32 524311, metadata !1, metadata !"", metadata !7, i32 107, i64 32, i64 32, i64 0, i32 0, null, metadata !122, i32 0, null} ; [ DW_TAG_union_type ]
!122 = metadata !{metadata !123, metadata !127}
!123 = metadata !{i32 524301, metadata !121, metadata !"__size", metadata !7, i32 108, i64 32, i64 8, i64 0, i32 0, metadata !124} ; [ DW_TAG_member ]
!124 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 8, i64 0, i32 0, metadata !40, metadata !125, i32 0, null} ; [ DW_TAG_array_type ]
!125 = metadata !{metadata !126}
!126 = metadata !{i32 524321, i64 0, i64 3}       ; [ DW_TAG_subrange_type ]
!127 = metadata !{i32 524301, metadata !121, metadata !"__align", metadata !7, i32 109, i64 32, i64 32, i64 0, i32 0, metadata !5} ; [ DW_TAG_member ]
!128 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_mutex_destroy", metadata !"pthread_mutex_destroy", metadata !"pthread_mutex_destroy", metadata !1, i32 54, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_mutex_t*)* @pthread_mutex_destroy} ; [ DW_TAG_subprogram ]
!129 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_cond_init", metadata !"pthread_cond_init", metadata !"pthread_cond_init", metadata !1, i32 58, metadata !130, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_cond_t*, %union.pthread_condattr_t*)* @pthread_cond_init} ; [ DW_TAG_subprogram ]
!130 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !131, i32 0, null} ; [ DW_TAG_subroutine_type ]
!131 = metadata !{metadata !5, metadata !49, metadata !132}
!132 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !133} ; [ DW_TAG_pointer_type ]
!133 = metadata !{i32 524310, metadata !7, metadata !"pthread_condattr_t", metadata !7, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !134} ; [ DW_TAG_typedef ]
!134 = metadata !{i32 524311, metadata !1, metadata !"", metadata !7, i32 133, i64 32, i64 32, i64 0, i32 0, null, metadata !135, i32 0, null} ; [ DW_TAG_union_type ]
!135 = metadata !{metadata !136, metadata !137}
!136 = metadata !{i32 524301, metadata !134, metadata !"__size", metadata !7, i32 134, i64 32, i64 8, i64 0, i32 0, metadata !124} ; [ DW_TAG_member ]
!137 = metadata !{i32 524301, metadata !134, metadata !"__align", metadata !7, i32 135, i64 32, i64 32, i64 0, i32 0, metadata !5} ; [ DW_TAG_member ]
!138 = metadata !{i32 524334, i32 0, metadata !1, metadata !"pthread_cond_destroy", metadata !"pthread_cond_destroy", metadata !"pthread_cond_destroy", metadata !1, i32 62, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (%union.pthread_cond_t*)* @pthread_cond_destroy} ; [ DW_TAG_subprogram ]
!139 = metadata !{i32 524334, i32 0, metadata !1, metadata !"kain", metadata !"kain", metadata !"kain", metadata !1, i32 69, metadata !140, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 ()* @kain} ; [ DW_TAG_subprogram ]
!140 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !141, i32 0, null} ; [ DW_TAG_subroutine_type ]
!141 = metadata !{metadata !5}
!142 = metadata !{i32 524545, metadata !0, metadata !"a", metadata !1, i32 5, metadata !6} ; [ DW_TAG_arg_variable ]
!143 = metadata !{i32 524545, metadata !0, metadata !"b", metadata !1, i32 5, metadata !9} ; [ DW_TAG_arg_variable ]
!144 = metadata !{i32 524545, metadata !11, metadata !"a", metadata !1, i32 9, metadata !6} ; [ DW_TAG_arg_variable ]
!145 = metadata !{i32 524545, metadata !11, metadata !"sig", metadata !1, i32 9, metadata !5} ; [ DW_TAG_arg_variable ]
!146 = metadata !{i32 524545, metadata !14, metadata !"mutex", metadata !1, i32 13, metadata !17} ; [ DW_TAG_arg_variable ]
!147 = metadata !{i32 524545, metadata !45, metadata !"mutex", metadata !1, i32 17, metadata !17} ; [ DW_TAG_arg_variable ]
!148 = metadata !{i32 524545, metadata !46, metadata !"cond", metadata !1, i32 21, metadata !49} ; [ DW_TAG_arg_variable ]
!149 = metadata !{i32 524545, metadata !71, metadata !"cond", metadata !1, i32 25, metadata !49} ; [ DW_TAG_arg_variable ]
!150 = metadata !{i32 524545, metadata !72, metadata !"cond", metadata !1, i32 29, metadata !49} ; [ DW_TAG_arg_variable ]
!151 = metadata !{i32 524545, metadata !72, metadata !"mutex", metadata !1, i32 29, metadata !17} ; [ DW_TAG_arg_variable ]
!152 = metadata !{i32 524545, metadata !75, metadata !"cond", metadata !1, i32 33, metadata !49} ; [ DW_TAG_arg_variable ]
!153 = metadata !{i32 524545, metadata !75, metadata !"mutex", metadata !1, i32 33, metadata !17} ; [ DW_TAG_arg_variable ]
!154 = metadata !{i32 524545, metadata !75, metadata !"a", metadata !1, i32 33, metadata !78} ; [ DW_TAG_arg_variable ]
!155 = metadata !{i32 524545, metadata !87, metadata !"how", metadata !1, i32 37, metadata !5} ; [ DW_TAG_arg_variable ]
!156 = metadata !{i32 524545, metadata !87, metadata !"set", metadata !1, i32 37, metadata !90} ; [ DW_TAG_arg_variable ]
!157 = metadata !{i32 524545, metadata !87, metadata !"oldset", metadata !1, i32 37, metadata !90} ; [ DW_TAG_arg_variable ]
!158 = metadata !{i32 524545, metadata !100, metadata !"attr", metadata !1, i32 41, metadata !103} ; [ DW_TAG_arg_variable ]
!159 = metadata !{i32 524545, metadata !112, metadata !"attr", metadata !1, i32 45, metadata !103} ; [ DW_TAG_arg_variable ]
!160 = metadata !{i32 524545, metadata !112, metadata !"stacksize", metadata !1, i32 45, metadata !115} ; [ DW_TAG_arg_variable ]
!161 = metadata !{i32 524545, metadata !116, metadata !"mutex", metadata !1, i32 49, metadata !17} ; [ DW_TAG_arg_variable ]
!162 = metadata !{i32 524545, metadata !116, metadata !"attr", metadata !1, i32 49, metadata !119} ; [ DW_TAG_arg_variable ]
!163 = metadata !{i32 524545, metadata !128, metadata !"mutex", metadata !1, i32 53, metadata !17} ; [ DW_TAG_arg_variable ]
!164 = metadata !{i32 524545, metadata !129, metadata !"cond", metadata !1, i32 57, metadata !49} ; [ DW_TAG_arg_variable ]
!165 = metadata !{i32 524545, metadata !129, metadata !"attr", metadata !1, i32 57, metadata !132} ; [ DW_TAG_arg_variable ]
!166 = metadata !{i32 524545, metadata !138, metadata !"cond", metadata !1, i32 61, metadata !49} ; [ DW_TAG_arg_variable ]
!167 = metadata !{i32 5, i32 0, metadata !0, null}
!168 = metadata !{i32 8, i32 0, metadata !169, null}
!169 = metadata !{i32 524299, metadata !0, i32 6, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!170 = metadata !{i32 9, i32 0, metadata !11, null}
!171 = metadata !{i32 12, i32 0, metadata !172, null}
!172 = metadata !{i32 524299, metadata !11, i32 10, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!173 = metadata !{i32 13, i32 0, metadata !14, null}
!174 = metadata !{i32 16, i32 0, metadata !175, null}
!175 = metadata !{i32 524299, metadata !14, i32 14, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!176 = metadata !{i32 17, i32 0, metadata !45, null}
!177 = metadata !{i32 20, i32 0, metadata !178, null}
!178 = metadata !{i32 524299, metadata !45, i32 18, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!179 = metadata !{i32 21, i32 0, metadata !46, null}
!180 = metadata !{i32 24, i32 0, metadata !181, null}
!181 = metadata !{i32 524299, metadata !46, i32 22, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!182 = metadata !{i32 25, i32 0, metadata !71, null}
!183 = metadata !{i32 28, i32 0, metadata !184, null}
!184 = metadata !{i32 524299, metadata !71, i32 26, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!185 = metadata !{i32 29, i32 0, metadata !72, null}
!186 = metadata !{i32 32, i32 0, metadata !187, null}
!187 = metadata !{i32 524299, metadata !72, i32 30, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!188 = metadata !{i32 33, i32 0, metadata !75, null}
!189 = metadata !{i32 36, i32 0, metadata !190, null}
!190 = metadata !{i32 524299, metadata !75, i32 34, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!191 = metadata !{i32 37, i32 0, metadata !87, null}
!192 = metadata !{i32 40, i32 0, metadata !193, null}
!193 = metadata !{i32 524299, metadata !87, i32 38, i32 0, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!194 = metadata !{i32 41, i32 0, metadata !100, null}
!195 = metadata !{i32 44, i32 0, metadata !196, null}
!196 = metadata !{i32 524299, metadata !100, i32 42, i32 0, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
!197 = metadata !{i32 45, i32 0, metadata !112, null}
!198 = metadata !{i32 48, i32 0, metadata !199, null}
!199 = metadata !{i32 524299, metadata !112, i32 46, i32 0, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
!200 = metadata !{i32 49, i32 0, metadata !116, null}
!201 = metadata !{i32 52, i32 0, metadata !202, null}
!202 = metadata !{i32 524299, metadata !116, i32 50, i32 0, metadata !1, i32 11} ; [ DW_TAG_lexical_block ]
!203 = metadata !{i32 53, i32 0, metadata !128, null}
!204 = metadata !{i32 56, i32 0, metadata !205, null}
!205 = metadata !{i32 524299, metadata !128, i32 54, i32 0, metadata !1, i32 12} ; [ DW_TAG_lexical_block ]
!206 = metadata !{i32 57, i32 0, metadata !129, null}
!207 = metadata !{i32 60, i32 0, metadata !208, null}
!208 = metadata !{i32 524299, metadata !129, i32 58, i32 0, metadata !1, i32 13} ; [ DW_TAG_lexical_block ]
!209 = metadata !{i32 61, i32 0, metadata !138, null}
!210 = metadata !{i32 64, i32 0, metadata !211, null}
!211 = metadata !{i32 524299, metadata !138, i32 62, i32 0, metadata !1, i32 14} ; [ DW_TAG_lexical_block ]
!212 = metadata !{i32 71, i32 0, metadata !213, null}
!213 = metadata !{i32 524299, metadata !139, i32 69, i32 0, metadata !1, i32 15} ; [ DW_TAG_lexical_block ]
