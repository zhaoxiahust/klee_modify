; ModuleID = 'klee_init_env.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [16 x i8] c"klee_init_env.c\00", align 1
@.str1 = private constant [9 x i8] c"user.err\00", align 1
@.str2 = private constant [37 x i8] c"too many arguments for klee_init_env\00", align 8
@.str4 = private constant [7 x i8] c"--help\00", align 1
@.str5 = private constant [593 x i8] c"klee_init_env\0A\0Ausage: (klee_init_env) [options] [program arguments]\0A  -sym-arg <N>              - Replace by a symbolic argument with length N\0A  -sym-args <MIN> <MAX> <N> - Replace by at least MIN arguments and at most\0A                              MAX arguments, each with maximum length N\0A  -sym-files <NUM> <N>      - Make stdin and up to NUM symbolic files, each\0A                              with maximum size N.\0A  -sym-stdout               - Make stdout symbolic.\0A  -max-fail <N>             - Allow up to <N> injected failures\0A  -fd-fail                  - Shortcut for '-max-fail 1'\0A\0A\00", align 8
@.str6 = private constant [10 x i8] c"--sym-arg\00", align 1
@.str7 = private constant [9 x i8] c"-sym-arg\00", align 1
@.str8 = private constant [48 x i8] c"--sym-arg expects an integer argument <max-len>\00", align 8
@.str9 = private constant [11 x i8] c"--sym-args\00", align 1
@.str10 = private constant [10 x i8] c"-sym-args\00", align 1
@.str11 = private constant [77 x i8] c"--sym-args expects three integer arguments <min-argvs> <max-argvs> <max-len>\00", align 8
@.str12 = private constant [7 x i8] c"n_args\00", align 1
@.str13 = private constant [12 x i8] c"--sym-files\00", align 1
@.str14 = private constant [11 x i8] c"-sym-files\00", align 1
@.str15 = private constant [72 x i8] c"--sym-files expects two integer arguments <no-sym-files> <sym-file-len>\00", align 8
@.str16 = private constant [13 x i8] c"--sym-stdout\00", align 1
@.str17 = private constant [12 x i8] c"-sym-stdout\00", align 1
@.str18 = private constant [18 x i8] c"--save-all-writes\00", align 1
@.str19 = private constant [17 x i8] c"-save-all-writes\00", align 1
@.str20 = private constant [10 x i8] c"--fd-fail\00", align 1
@.str21 = private constant [9 x i8] c"-fd-fail\00", align 1
@.str22 = private constant [11 x i8] c"--max-fail\00", align 1
@.str23 = private constant [10 x i8] c"-max-fail\00", align 1
@.str24 = private constant [54 x i8] c"--max-fail expects an integer argument <max-failures>\00", align 8

define void @klee_init_env(i32* nocapture %argcPtr, i8*** nocapture %argvPtr) nounwind {
entry:
  %new_argv = alloca [1024 x i8*], align 8
  %sym_arg_name = alloca [5 x i8], align 1
  call void @llvm.dbg.value(metadata !{i32* %argcPtr}, i64 0, metadata !50), !dbg !86
  call void @llvm.dbg.value(metadata !{i8*** %argvPtr}, i64 0, metadata !51), !dbg !86
  call void @llvm.dbg.declare(metadata !{[1024 x i8*]* %new_argv}, metadata !57), !dbg !87
  call void @llvm.dbg.declare(metadata !{[5 x i8]* %sym_arg_name}, metadata !71), !dbg !88
  %0 = load i32* %argcPtr, align 4, !dbg !89
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !52), !dbg !89
  %1 = load i8*** %argvPtr, align 8, !dbg !90
  call void @llvm.dbg.value(metadata !{i8** %1}, i64 0, metadata !54), !dbg !90
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !55), !dbg !92
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !65), !dbg !93
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !66), !dbg !93
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !67), !dbg !94
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !68), !dbg !95
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !69), !dbg !96
  %2 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 0, !dbg !88
  store i8 97, i8* %2, align 1, !dbg !88
  %3 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 1, !dbg !88
  store i8 114, i8* %3, align 1, !dbg !88
  %4 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 2, !dbg !88
  store i8 103, i8* %4, align 1, !dbg !88
  %5 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 3, !dbg !88
  store i8 0, i8* %5, align 1, !dbg !88
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !75), !dbg !97
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !76), !dbg !98
  %6 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 4, !dbg !99
  store i8 0, i8* %6, align 1, !dbg !99
  %7 = icmp eq i32 %0, 2, !dbg !100
  br i1 %7, label %bb, label %bb42, !dbg !100

bb:                                               ; preds = %entry
  %8 = getelementptr inbounds i8** %1, i64 1, !dbg !100
  %9 = load i8** %8, align 8, !dbg !100
  tail call void @llvm.dbg.value(metadata !{i8* %9}, i64 0, metadata !33), !dbg !101
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !34), !dbg !101
  br label %bb3.i, !dbg !103

bb.i:                                             ; preds = %bb3.i
  %10 = icmp eq i8 %11, 0, !dbg !105
  br i1 %10, label %bb1, label %bb2.i, !dbg !105

bb2.i:                                            ; preds = %bb.i
  %indvar.next.i = add i64 %indvar.i, 1
  br label %bb3.i, !dbg !106

bb3.i:                                            ; preds = %bb2.i, %bb
  %indvar.i = phi i64 [ %indvar.next.i, %bb2.i ], [ 0, %bb ]
  %b_addr.0.i = getelementptr [7 x i8]* @.str4, i64 0, i64 %indvar.i
  %a_addr.0.i = getelementptr i8* %9, i64 %indvar.i
  %11 = load i8* %a_addr.0.i, align 1, !dbg !103
  %12 = load i8* %b_addr.0.i, align 1, !dbg !103
  %13 = icmp eq i8 %11, %12, !dbg !103
  br i1 %13, label %bb.i, label %bb42, !dbg !103

bb1:                                              ; preds = %bb.i
  call void @llvm.dbg.value(metadata !107, i64 0, metadata !40) nounwind, !dbg !108
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([593 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !110
  unreachable, !dbg !110

bb2:                                              ; preds = %bb42
  %14 = sext i32 %k.0 to i64, !dbg !112
  %15 = getelementptr inbounds i8** %1, i64 %14, !dbg !112
  %16 = load i8** %15, align 8, !dbg !112
  br label %bb3.i53, !dbg !113

bb.i47:                                           ; preds = %bb3.i53
  %17 = icmp eq i8 %18, 0, !dbg !114
  br i1 %17, label %bb4, label %bb2.i49, !dbg !114

bb2.i49:                                          ; preds = %bb.i47
  %indvar.next.i48 = add i64 %indvar.i50, 1
  br label %bb3.i53, !dbg !115

bb3.i53:                                          ; preds = %bb2.i49, %bb2
  %indvar.i50 = phi i64 [ %indvar.next.i48, %bb2.i49 ], [ 0, %bb2 ]
  %b_addr.0.i51 = getelementptr [10 x i8]* @.str6, i64 0, i64 %indvar.i50
  %a_addr.0.i52 = getelementptr i8* %16, i64 %indvar.i50
  %18 = load i8* %a_addr.0.i52, align 1, !dbg !113
  %19 = load i8* %b_addr.0.i51, align 1, !dbg !113
  %20 = icmp eq i8 %18, %19, !dbg !113
  br i1 %20, label %bb.i47, label %bb3.i67, !dbg !113

bb.i61:                                           ; preds = %bb3.i67
  %21 = icmp eq i8 %22, 0, !dbg !114
  br i1 %21, label %bb4, label %bb2.i63, !dbg !114

bb2.i63:                                          ; preds = %bb.i61
  %indvar.next.i62 = add i64 %indvar.i64, 1
  br label %bb3.i67, !dbg !115

bb3.i67:                                          ; preds = %bb3.i53, %bb2.i63
  %indvar.i64 = phi i64 [ %indvar.next.i62, %bb2.i63 ], [ 0, %bb3.i53 ]
  %b_addr.0.i65 = getelementptr [9 x i8]* @.str7, i64 0, i64 %indvar.i64
  %a_addr.0.i66 = getelementptr i8* %16, i64 %indvar.i64
  %22 = load i8* %a_addr.0.i66, align 1, !dbg !113
  %23 = load i8* %b_addr.0.i65, align 1, !dbg !113
  %24 = icmp eq i8 %22, %23, !dbg !113
  br i1 %24, label %bb.i61, label %bb3.i91, !dbg !113

bb4:                                              ; preds = %bb.i47, %bb.i61
  %25 = add nsw i32 %k.0, 1, !dbg !116
  %26 = icmp eq i32 %25, %0, !dbg !116
  br i1 %26, label %bb5, label %bb6, !dbg !116

bb5:                                              ; preds = %bb4
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  call void @llvm.dbg.value(metadata !119, i64 0, metadata !78), !dbg !120
  call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !76), !dbg !116
  call void @llvm.dbg.value(metadata !119, i64 0, metadata !40) nounwind, !dbg !121
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([48 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !123
  unreachable, !dbg !123

bb6:                                              ; preds = %bb4
  %27 = sext i32 %25 to i64, !dbg !124
  %28 = getelementptr inbounds i8** %1, i64 %27, !dbg !124
  %29 = load i8** %28, align 8, !dbg !124
  %30 = add nsw i32 %k.0, 2, !dbg !124
  %31 = load i8* %29, align 1, !dbg !125
  %32 = icmp eq i8 %31, 0, !dbg !125
  br i1 %32, label %bb.i72, label %bb5.i81, !dbg !125

bb.i72:                                           ; preds = %bb6
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  call void @llvm.dbg.value(metadata !119, i64 0, metadata !78), !dbg !120
  call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !76), !dbg !116
  call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !76), !dbg !124
  call void @llvm.dbg.value(metadata !{i8* %29}, i64 0, metadata !41) nounwind, !dbg !126
  call void @llvm.dbg.value(metadata !119, i64 0, metadata !42) nounwind, !dbg !126
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !128
  call void @llvm.dbg.value(metadata !119, i64 0, metadata !40) nounwind, !dbg !129
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([48 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !130
  unreachable, !dbg !130

bb2.i73:                                          ; preds = %bb5.i81
  %33 = add i8 %39, -48
  %34 = icmp ult i8 %33, 10
  br i1 %34, label %bb3.i77, label %bb4.i78, !dbg !131

bb3.i77:                                          ; preds = %bb2.i73
  %35 = mul nsw i64 %res.0.i80, 10, !dbg !132
  %36 = sext i8 %39 to i64
  %37 = add i64 %36, -48
  %38 = add nsw i64 %37, %35, !dbg !132
  %.pre.i76 = load i8* %s_addr.0.phi.trans.insert.i75, align 1
  %phitmp579 = add i64 %indvar.i79, 1
  br label %bb5.i81, !dbg !132

bb4.i78:                                          ; preds = %bb2.i73
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  call void @llvm.dbg.value(metadata !119, i64 0, metadata !78), !dbg !120
  call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !76), !dbg !116
  call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !76), !dbg !124
  call void @llvm.dbg.value(metadata !{i8* %29}, i64 0, metadata !41) nounwind, !dbg !126
  call void @llvm.dbg.value(metadata !119, i64 0, metadata !42) nounwind, !dbg !126
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !128
  call void @llvm.dbg.value(metadata !{i8 %39}, i64 0, metadata !45) nounwind, !dbg !133
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !133
  call void @llvm.dbg.value(metadata !119, i64 0, metadata !40) nounwind, !dbg !134
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([48 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !136
  unreachable, !dbg !136

bb5.i81:                                          ; preds = %bb6, %bb3.i77
  %39 = phi i8 [ %.pre.i76, %bb3.i77 ], [ %31, %bb6 ]
  %indvar.i79 = phi i64 [ %phitmp579, %bb3.i77 ], [ 1, %bb6 ]
  %res.0.i80 = phi i64 [ %38, %bb3.i77 ], [ 0, %bb6 ]
  %s_addr.0.phi.trans.insert.i75 = getelementptr i8* %29, i64 %indvar.i79
  %40 = icmp eq i8 %39, 0, !dbg !133
  br i1 %40, label %__str_to_int.exit82, label %bb2.i73, !dbg !133

__str_to_int.exit82:                              ; preds = %bb5.i81
  %41 = trunc i64 %res.0.i80 to i32, !dbg !124
  %42 = trunc i32 %sym_arg_num.0 to i8, !dbg !137
  %43 = add i8 %42, 48, !dbg !137
  store i8 %43, i8* %5, align 1, !dbg !137
  %44 = call fastcc i8* @__get_sym_str(i32 %41, i8* %2) nounwind, !dbg !138
  %45 = icmp eq i32 %new_argc.0, 1024, !dbg !139
  br i1 %45, label %bb.i83, label %__add_arg.exit84, !dbg !139

bb.i83:                                           ; preds = %__str_to_int.exit82
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  call void @llvm.dbg.value(metadata !119, i64 0, metadata !78), !dbg !120
  call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !76), !dbg !116
  call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !76), !dbg !124
  call void @llvm.dbg.value(metadata !{i8* %29}, i64 0, metadata !41) nounwind, !dbg !126
  call void @llvm.dbg.value(metadata !119, i64 0, metadata !42) nounwind, !dbg !126
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !128
  call void @llvm.dbg.value(metadata !{i8 %39}, i64 0, metadata !45) nounwind, !dbg !133
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !133
  call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !61), !dbg !124
  call void @llvm.dbg.value(metadata !{i32 %46}, i64 0, metadata !75), !dbg !137
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !46) nounwind, !dbg !141
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !47) nounwind, !dbg !141
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !48) nounwind, !dbg !141
  call void @llvm.dbg.value(metadata !142, i64 0, metadata !49) nounwind, !dbg !141
  call void @llvm.dbg.value(metadata !143, i64 0, metadata !40) nounwind, !dbg !144
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([37 x i8]* @.str2, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !146
  unreachable, !dbg !146

__add_arg.exit84:                                 ; preds = %__str_to_int.exit82
  %46 = add i32 %sym_arg_num.0, 1, !dbg !137
  %47 = sext i32 %new_argc.0 to i64, !dbg !147
  %48 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %47
  store i8* %44, i8** %48, align 8, !dbg !147
  %49 = add nsw i32 %new_argc.0, 1, !dbg !148
  br label %bb42, !dbg !138

bb.i85:                                           ; preds = %bb3.i91
  %50 = icmp eq i8 %51, 0, !dbg !149
  br i1 %50, label %bb11, label %bb2.i87, !dbg !149

bb2.i87:                                          ; preds = %bb.i85
  %indvar.next.i86 = add i64 %indvar.i88, 1
  br label %bb3.i91, !dbg !151

bb3.i91:                                          ; preds = %bb3.i67, %bb2.i87
  %indvar.i88 = phi i64 [ %indvar.next.i86, %bb2.i87 ], [ 0, %bb3.i67 ]
  %b_addr.0.i89 = getelementptr [11 x i8]* @.str9, i64 0, i64 %indvar.i88
  %a_addr.0.i90 = getelementptr i8* %16, i64 %indvar.i88
  %51 = load i8* %a_addr.0.i90, align 1, !dbg !152
  %52 = load i8* %b_addr.0.i89, align 1, !dbg !152
  %53 = icmp eq i8 %51, %52, !dbg !152
  br i1 %53, label %bb.i85, label %bb3.i101, !dbg !152

bb.i95:                                           ; preds = %bb3.i101
  %54 = icmp eq i8 %55, 0, !dbg !149
  br i1 %54, label %bb11, label %bb2.i97, !dbg !149

bb2.i97:                                          ; preds = %bb.i95
  %indvar.next.i96 = add i64 %indvar.i98, 1
  br label %bb3.i101, !dbg !151

bb3.i101:                                         ; preds = %bb3.i91, %bb2.i97
  %indvar.i98 = phi i64 [ %indvar.next.i96, %bb2.i97 ], [ 0, %bb3.i91 ]
  %b_addr.0.i99 = getelementptr [10 x i8]* @.str10, i64 0, i64 %indvar.i98
  %a_addr.0.i100 = getelementptr i8* %16, i64 %indvar.i98
  %55 = load i8* %a_addr.0.i100, align 1, !dbg !152
  %56 = load i8* %b_addr.0.i99, align 1, !dbg !152
  %57 = icmp eq i8 %55, %56, !dbg !152
  br i1 %57, label %bb.i95, label %bb3.i148, !dbg !152

bb11:                                             ; preds = %bb.i85, %bb.i95
  %58 = add nsw i32 %k.0, 3, !dbg !153
  %59 = icmp slt i32 %58, %0, !dbg !153
  br i1 %59, label %bb14, label %bb13, !dbg !153

bb13:                                             ; preds = %bb11
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !80), !dbg !158
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !40) nounwind, !dbg !159
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([77 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !161
  unreachable, !dbg !161

bb14:                                             ; preds = %bb11
  %60 = add nsw i32 %k.0, 1, !dbg !162
  %61 = sext i32 %60 to i64, !dbg !163
  %62 = getelementptr inbounds i8** %1, i64 %61, !dbg !163
  %63 = load i8** %62, align 8, !dbg !163
  %64 = add nsw i32 %k.0, 2, !dbg !163
  %65 = load i8* %63, align 1, !dbg !164
  %66 = icmp eq i8 %65, 0, !dbg !164
  br i1 %66, label %bb.i107, label %bb5.i116, !dbg !164

bb.i107:                                          ; preds = %bb14
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !80), !dbg !158
  call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !76), !dbg !162
  call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !76), !dbg !163
  call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !41) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !166
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !40) nounwind, !dbg !167
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([77 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !168
  unreachable, !dbg !168

bb2.i108:                                         ; preds = %bb5.i116
  %67 = add i8 %73, -48
  %68 = icmp ult i8 %67, 10
  br i1 %68, label %bb3.i112, label %bb4.i113, !dbg !169

bb3.i112:                                         ; preds = %bb2.i108
  %69 = mul nsw i64 %res.0.i115, 10, !dbg !170
  %70 = sext i8 %73 to i64
  %71 = add i64 %70, -48
  %72 = add nsw i64 %71, %69, !dbg !170
  %.pre.i111 = load i8* %s_addr.0.phi.trans.insert.i110, align 1
  %phitmp576 = add i64 %indvar.i114, 1
  br label %bb5.i116, !dbg !170

bb4.i113:                                         ; preds = %bb2.i108
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !80), !dbg !158
  call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !76), !dbg !162
  call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !76), !dbg !163
  call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !41) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !166
  call void @llvm.dbg.value(metadata !{i8 %73}, i64 0, metadata !45) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !40) nounwind, !dbg !172
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([77 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !174
  unreachable, !dbg !174

bb5.i116:                                         ; preds = %bb14, %bb3.i112
  %73 = phi i8 [ %.pre.i111, %bb3.i112 ], [ %65, %bb14 ]
  %indvar.i114 = phi i64 [ %phitmp576, %bb3.i112 ], [ 1, %bb14 ]
  %res.0.i115 = phi i64 [ %72, %bb3.i112 ], [ 0, %bb14 ]
  %s_addr.0.phi.trans.insert.i110 = getelementptr i8* %63, i64 %indvar.i114
  %74 = icmp eq i8 %73, 0, !dbg !171
  br i1 %74, label %__str_to_int.exit117, label %bb2.i108, !dbg !171

__str_to_int.exit117:                             ; preds = %bb5.i116
  %75 = trunc i64 %res.0.i115 to i32, !dbg !163
  %76 = sext i32 %64 to i64, !dbg !175
  %77 = getelementptr inbounds i8** %1, i64 %76, !dbg !175
  %78 = load i8** %77, align 8, !dbg !175
  %79 = load i8* %78, align 1, !dbg !176
  %80 = icmp eq i8 %79, 0, !dbg !176
  br i1 %80, label %bb.i118, label %bb5.i127, !dbg !176

bb.i118:                                          ; preds = %__str_to_int.exit117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !80), !dbg !158
  call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !76), !dbg !162
  call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !76), !dbg !163
  call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !41) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !166
  call void @llvm.dbg.value(metadata !{i8 %73}, i64 0, metadata !45) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{i32 %75}, i64 0, metadata !63), !dbg !163
  call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !76), !dbg !175
  call void @llvm.dbg.value(metadata !{i8* %78}, i64 0, metadata !41) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !178
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !40) nounwind, !dbg !179
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([77 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !180
  unreachable, !dbg !180

bb2.i119:                                         ; preds = %bb5.i127
  %81 = add i8 %87, -48
  %82 = icmp ult i8 %81, 10
  br i1 %82, label %bb3.i123, label %bb4.i124, !dbg !181

bb3.i123:                                         ; preds = %bb2.i119
  %83 = mul nsw i64 %res.0.i126, 10, !dbg !182
  %84 = sext i8 %87 to i64
  %85 = add i64 %84, -48
  %86 = add nsw i64 %85, %83, !dbg !182
  %.pre.i122 = load i8* %s_addr.0.phi.trans.insert.i121, align 1
  %phitmp577 = add i64 %indvar.i125, 1
  br label %bb5.i127, !dbg !182

bb4.i124:                                         ; preds = %bb2.i119
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !80), !dbg !158
  call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !76), !dbg !162
  call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !76), !dbg !163
  call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !41) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !166
  call void @llvm.dbg.value(metadata !{i8 %73}, i64 0, metadata !45) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{i32 %75}, i64 0, metadata !63), !dbg !163
  call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !76), !dbg !175
  call void @llvm.dbg.value(metadata !{i8* %78}, i64 0, metadata !41) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !178
  call void @llvm.dbg.value(metadata !{i8 %87}, i64 0, metadata !45) nounwind, !dbg !183
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !183
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !40) nounwind, !dbg !184
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([77 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !186
  unreachable, !dbg !186

bb5.i127:                                         ; preds = %__str_to_int.exit117, %bb3.i123
  %87 = phi i8 [ %.pre.i122, %bb3.i123 ], [ %79, %__str_to_int.exit117 ]
  %indvar.i125 = phi i64 [ %phitmp577, %bb3.i123 ], [ 1, %__str_to_int.exit117 ]
  %res.0.i126 = phi i64 [ %86, %bb3.i123 ], [ 0, %__str_to_int.exit117 ]
  %s_addr.0.phi.trans.insert.i121 = getelementptr i8* %78, i64 %indvar.i125
  %88 = icmp eq i8 %87, 0, !dbg !183
  br i1 %88, label %__str_to_int.exit128, label %bb2.i119, !dbg !183

__str_to_int.exit128:                             ; preds = %bb5.i127
  %89 = trunc i64 %res.0.i126 to i32, !dbg !175
  %90 = sext i32 %58 to i64, !dbg !187
  %91 = getelementptr inbounds i8** %1, i64 %90, !dbg !187
  %92 = load i8** %91, align 8, !dbg !187
  %93 = add nsw i32 %k.0, 4, !dbg !187
  %94 = load i8* %92, align 1, !dbg !188
  %95 = icmp eq i8 %94, 0, !dbg !188
  br i1 %95, label %bb.i129, label %bb5.i138, !dbg !188

bb.i129:                                          ; preds = %__str_to_int.exit128
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !80), !dbg !158
  call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !76), !dbg !162
  call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !76), !dbg !163
  call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !41) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !166
  call void @llvm.dbg.value(metadata !{i8 %73}, i64 0, metadata !45) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{i32 %75}, i64 0, metadata !63), !dbg !163
  call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !76), !dbg !175
  call void @llvm.dbg.value(metadata !{i8* %78}, i64 0, metadata !41) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !178
  call void @llvm.dbg.value(metadata !{i8 %87}, i64 0, metadata !45) nounwind, !dbg !183
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !183
  call void @llvm.dbg.value(metadata !{i32 %89}, i64 0, metadata !64), !dbg !175
  call void @llvm.dbg.value(metadata !{i32 %93}, i64 0, metadata !76), !dbg !187
  call void @llvm.dbg.value(metadata !{i8* %92}, i64 0, metadata !41) nounwind, !dbg !189
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !189
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !190
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !40) nounwind, !dbg !191
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([77 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !192
  unreachable, !dbg !192

bb2.i130:                                         ; preds = %bb5.i138
  %96 = add i8 %102, -48
  %97 = icmp ult i8 %96, 10
  br i1 %97, label %bb3.i134, label %bb4.i135, !dbg !193

bb3.i134:                                         ; preds = %bb2.i130
  %98 = mul nsw i64 %res.0.i137, 10, !dbg !194
  %99 = sext i8 %102 to i64
  %100 = add i64 %99, -48
  %101 = add nsw i64 %100, %98, !dbg !194
  %.pre.i133 = load i8* %s_addr.0.phi.trans.insert.i132, align 1
  %phitmp578 = add i64 %indvar.i136, 1
  br label %bb5.i138, !dbg !194

bb4.i135:                                         ; preds = %bb2.i130
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !80), !dbg !158
  call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !76), !dbg !162
  call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !76), !dbg !163
  call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !41) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !166
  call void @llvm.dbg.value(metadata !{i8 %73}, i64 0, metadata !45) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{i32 %75}, i64 0, metadata !63), !dbg !163
  call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !76), !dbg !175
  call void @llvm.dbg.value(metadata !{i8* %78}, i64 0, metadata !41) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !178
  call void @llvm.dbg.value(metadata !{i8 %87}, i64 0, metadata !45) nounwind, !dbg !183
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !183
  call void @llvm.dbg.value(metadata !{i32 %89}, i64 0, metadata !64), !dbg !175
  call void @llvm.dbg.value(metadata !{i32 %93}, i64 0, metadata !76), !dbg !187
  call void @llvm.dbg.value(metadata !{i8* %92}, i64 0, metadata !41) nounwind, !dbg !189
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !189
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !190
  call void @llvm.dbg.value(metadata !{i8 %102}, i64 0, metadata !45) nounwind, !dbg !195
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !195
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !40) nounwind, !dbg !196
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([77 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !198
  unreachable, !dbg !198

bb5.i138:                                         ; preds = %__str_to_int.exit128, %bb3.i134
  %102 = phi i8 [ %.pre.i133, %bb3.i134 ], [ %94, %__str_to_int.exit128 ]
  %indvar.i136 = phi i64 [ %phitmp578, %bb3.i134 ], [ 1, %__str_to_int.exit128 ]
  %res.0.i137 = phi i64 [ %101, %bb3.i134 ], [ 0, %__str_to_int.exit128 ]
  %s_addr.0.phi.trans.insert.i132 = getelementptr i8* %92, i64 %indvar.i136
  %103 = icmp eq i8 %102, 0, !dbg !195
  br i1 %103, label %__str_to_int.exit139, label %bb2.i130, !dbg !195

__str_to_int.exit139:                             ; preds = %bb5.i138
  %104 = trunc i64 %res.0.i137 to i32, !dbg !187
  %105 = add i32 %89, 1, !dbg !199
  %106 = call i32 @klee_range(i32 %75, i32 %105, i8* getelementptr inbounds ([7 x i8]* @.str12, i64 0, i64 0)) nounwind, !dbg !199
  %tmp420 = add i32 %sym_arg_num.0, -1
  %tmp421 = icmp sgt i32 %106, 0
  %.op = xor i32 %106, -1
  %tmp422 = select i1 %tmp421, i32 %.op, i32 -1
  %tmp423 = add i32 %new_argc.0, -1025
  %tmp424 = icmp ugt i32 %tmp422, %tmp423
  %umax = select i1 %tmp424, i32 %tmp422, i32 %tmp423
  %sym_arg_num.1 = sub i32 %tmp420, %umax
  %tmp426 = add i32 %new_argc.0, -1
  %new_argc.1 = sub i32 %tmp426, %umax
  %tmp428 = zext i32 %new_argc.0 to i64
  %tmp431 = sext i32 %new_argc.0 to i64
  %tmp433 = zext i32 %sym_arg_num.0 to i64
  %tmp434 = add i64 %tmp433, 48
  br label %bb18, !dbg !200

bb15:                                             ; preds = %bb18
  %tmp436 = add i64 %tmp434, %indvar
  %tmp429 = add i64 %tmp428, %indvar
  %tmp437 = trunc i64 %tmp436 to i8
  %tmp430 = trunc i64 %tmp429 to i32
  store i8 %tmp437, i8* %5, align 1, !dbg !201
  %107 = call fastcc i8* @__get_sym_str(i32 %104, i8* %2) nounwind, !dbg !202
  %108 = icmp eq i32 %tmp430, 1024, !dbg !203
  br i1 %108, label %bb.i140, label %__add_arg.exit141, !dbg !203

bb.i140:                                          ; preds = %bb15
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !80), !dbg !158
  call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !76), !dbg !162
  call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !76), !dbg !163
  call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !41) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !165
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !166
  call void @llvm.dbg.value(metadata !{i8 %73}, i64 0, metadata !45) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !171
  call void @llvm.dbg.value(metadata !{i32 %75}, i64 0, metadata !63), !dbg !163
  call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !76), !dbg !175
  call void @llvm.dbg.value(metadata !{i8* %78}, i64 0, metadata !41) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !178
  call void @llvm.dbg.value(metadata !{i8 %87}, i64 0, metadata !45) nounwind, !dbg !183
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !183
  call void @llvm.dbg.value(metadata !{i32 %89}, i64 0, metadata !64), !dbg !175
  call void @llvm.dbg.value(metadata !{i32 %93}, i64 0, metadata !76), !dbg !187
  call void @llvm.dbg.value(metadata !{i8* %92}, i64 0, metadata !41) nounwind, !dbg !189
  call void @llvm.dbg.value(metadata !157, i64 0, metadata !42) nounwind, !dbg !189
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !190
  call void @llvm.dbg.value(metadata !{i8 %102}, i64 0, metadata !45) nounwind, !dbg !195
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !195
  call void @llvm.dbg.value(metadata !{i32 %104}, i64 0, metadata !61), !dbg !187
  call void @llvm.dbg.value(metadata !{i32 %106}, i64 0, metadata !56), !dbg !199
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !77), !dbg !200
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !75), !dbg !201
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !46) nounwind, !dbg !204
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !47) nounwind, !dbg !204
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !48) nounwind, !dbg !204
  call void @llvm.dbg.value(metadata !142, i64 0, metadata !49) nounwind, !dbg !204
  call void @llvm.dbg.value(metadata !143, i64 0, metadata !40) nounwind, !dbg !205
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([37 x i8]* @.str2, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !207
  unreachable, !dbg !207

__add_arg.exit141:                                ; preds = %bb15
  store i8* %107, i8** %scevgep, align 8, !dbg !208
  %indvar.next = add i64 %indvar, 1
  br label %bb18, !dbg !200

bb18:                                             ; preds = %__add_arg.exit141, %__str_to_int.exit139
  %indvar = phi i64 [ %indvar.next, %__add_arg.exit141 ], [ 0, %__str_to_int.exit139 ]
  %tmp432 = add i64 %tmp431, %indvar
  %scevgep = getelementptr [1024 x i8*]* %new_argv, i64 0, i64 %tmp432
  %i.0 = trunc i64 %indvar to i32
  %109 = icmp slt i32 %i.0, %106, !dbg !200
  br i1 %109, label %bb15, label %bb42, !dbg !200

bb.i142:                                          ; preds = %bb3.i148
  %110 = icmp eq i8 %111, 0, !dbg !209
  br i1 %110, label %bb21, label %bb2.i144, !dbg !209

bb2.i144:                                         ; preds = %bb.i142
  %indvar.next.i143 = add i64 %indvar.i145, 1
  br label %bb3.i148, !dbg !211

bb3.i148:                                         ; preds = %bb3.i101, %bb2.i144
  %indvar.i145 = phi i64 [ %indvar.next.i143, %bb2.i144 ], [ 0, %bb3.i101 ]
  %b_addr.0.i146 = getelementptr [12 x i8]* @.str13, i64 0, i64 %indvar.i145
  %a_addr.0.i147 = getelementptr i8* %16, i64 %indvar.i145
  %111 = load i8* %a_addr.0.i147, align 1, !dbg !212
  %112 = load i8* %b_addr.0.i146, align 1, !dbg !212
  %113 = icmp eq i8 %111, %112, !dbg !212
  br i1 %113, label %bb.i142, label %bb3.i158, !dbg !212

bb.i152:                                          ; preds = %bb3.i158
  %114 = icmp eq i8 %115, 0, !dbg !209
  br i1 %114, label %bb21, label %bb2.i154, !dbg !209

bb2.i154:                                         ; preds = %bb.i152
  %indvar.next.i153 = add i64 %indvar.i155, 1
  br label %bb3.i158, !dbg !211

bb3.i158:                                         ; preds = %bb3.i148, %bb2.i154
  %indvar.i155 = phi i64 [ %indvar.next.i153, %bb2.i154 ], [ 0, %bb3.i148 ]
  %b_addr.0.i156 = getelementptr [11 x i8]* @.str14, i64 0, i64 %indvar.i155
  %a_addr.0.i157 = getelementptr i8* %16, i64 %indvar.i155
  %115 = load i8* %a_addr.0.i157, align 1, !dbg !212
  %116 = load i8* %b_addr.0.i156, align 1, !dbg !212
  %117 = icmp eq i8 %115, %116, !dbg !212
  br i1 %117, label %bb.i152, label %bb3.i191, !dbg !212

bb21:                                             ; preds = %bb.i142, %bb.i152
  %118 = add nsw i32 %k.0, 2, !dbg !213
  %119 = icmp slt i32 %118, %0, !dbg !213
  br i1 %119, label %bb24, label %bb23, !dbg !213

bb23:                                             ; preds = %bb21
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !214, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !34), !dbg !215
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !82), !dbg !218
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !40) nounwind, !dbg !219
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([72 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !221
  unreachable, !dbg !221

bb24:                                             ; preds = %bb21
  %120 = add nsw i32 %k.0, 1, !dbg !222
  %121 = sext i32 %120 to i64, !dbg !223
  %122 = getelementptr inbounds i8** %1, i64 %121, !dbg !223
  %123 = load i8** %122, align 8, !dbg !223
  %124 = load i8* %123, align 1, !dbg !224
  %125 = icmp eq i8 %124, 0, !dbg !224
  br i1 %125, label %bb.i163, label %bb5.i172, !dbg !224

bb.i163:                                          ; preds = %bb24
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !214, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !34), !dbg !215
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !82), !dbg !218
  call void @llvm.dbg.value(metadata !{i32 %120}, i64 0, metadata !76), !dbg !222
  call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !76), !dbg !223
  call void @llvm.dbg.value(metadata !{i8* %123}, i64 0, metadata !41) nounwind, !dbg !225
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !42) nounwind, !dbg !225
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !226
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !40) nounwind, !dbg !227
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([72 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !228
  unreachable, !dbg !228

bb2.i164:                                         ; preds = %bb5.i172
  %126 = add i8 %132, -48
  %127 = icmp ult i8 %126, 10
  br i1 %127, label %bb3.i168, label %bb4.i169, !dbg !229

bb3.i168:                                         ; preds = %bb2.i164
  %128 = mul nsw i64 %res.0.i171, 10, !dbg !230
  %129 = sext i8 %132 to i64
  %130 = add i64 %129, -48
  %131 = add nsw i64 %130, %128, !dbg !230
  %.pre.i167 = load i8* %s_addr.0.phi.trans.insert.i166, align 1
  %phitmp574 = add i64 %indvar.i170, 1
  br label %bb5.i172, !dbg !230

bb4.i169:                                         ; preds = %bb2.i164
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !214, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !34), !dbg !215
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !82), !dbg !218
  call void @llvm.dbg.value(metadata !{i32 %120}, i64 0, metadata !76), !dbg !222
  call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !76), !dbg !223
  call void @llvm.dbg.value(metadata !{i8* %123}, i64 0, metadata !41) nounwind, !dbg !225
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !42) nounwind, !dbg !225
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !226
  call void @llvm.dbg.value(metadata !{i8 %132}, i64 0, metadata !45) nounwind, !dbg !231
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !231
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !40) nounwind, !dbg !232
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([72 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !234
  unreachable, !dbg !234

bb5.i172:                                         ; preds = %bb24, %bb3.i168
  %132 = phi i8 [ %.pre.i167, %bb3.i168 ], [ %124, %bb24 ]
  %indvar.i170 = phi i64 [ %phitmp574, %bb3.i168 ], [ 1, %bb24 ]
  %res.0.i171 = phi i64 [ %131, %bb3.i168 ], [ 0, %bb24 ]
  %s_addr.0.phi.trans.insert.i166 = getelementptr i8* %123, i64 %indvar.i170
  %133 = icmp eq i8 %132, 0, !dbg !231
  br i1 %133, label %__str_to_int.exit173, label %bb2.i164, !dbg !231

__str_to_int.exit173:                             ; preds = %bb5.i172
  %134 = trunc i64 %res.0.i171 to i32, !dbg !223
  %135 = sext i32 %118 to i64, !dbg !235
  %136 = getelementptr inbounds i8** %1, i64 %135, !dbg !235
  %137 = load i8** %136, align 8, !dbg !235
  %138 = add nsw i32 %k.0, 3, !dbg !235
  %139 = load i8* %137, align 1, !dbg !236
  %140 = icmp eq i8 %139, 0, !dbg !236
  br i1 %140, label %bb.i174, label %bb5.i183, !dbg !236

bb.i174:                                          ; preds = %__str_to_int.exit173
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !214, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !34), !dbg !215
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !82), !dbg !218
  call void @llvm.dbg.value(metadata !{i32 %120}, i64 0, metadata !76), !dbg !222
  call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !76), !dbg !223
  call void @llvm.dbg.value(metadata !{i8* %123}, i64 0, metadata !41) nounwind, !dbg !225
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !42) nounwind, !dbg !225
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !226
  call void @llvm.dbg.value(metadata !{i8 %132}, i64 0, metadata !45) nounwind, !dbg !231
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !231
  call void @llvm.dbg.value(metadata !{i32 %134}, i64 0, metadata !65), !dbg !223
  call void @llvm.dbg.value(metadata !{i32 %138}, i64 0, metadata !76), !dbg !235
  call void @llvm.dbg.value(metadata !{i8* %137}, i64 0, metadata !41) nounwind, !dbg !237
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !42) nounwind, !dbg !237
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !238
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !40) nounwind, !dbg !239
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([72 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !240
  unreachable, !dbg !240

bb2.i175:                                         ; preds = %bb5.i183
  %141 = add i8 %147, -48
  %142 = icmp ult i8 %141, 10
  br i1 %142, label %bb3.i179, label %bb4.i180, !dbg !241

bb3.i179:                                         ; preds = %bb2.i175
  %143 = mul nsw i64 %res.0.i182, 10, !dbg !242
  %144 = sext i8 %147 to i64
  %145 = add i64 %144, -48
  %146 = add nsw i64 %145, %143, !dbg !242
  %.pre.i178 = load i8* %s_addr.0.phi.trans.insert.i177, align 1
  %phitmp575 = add i64 %indvar.i181, 1
  br label %bb5.i183, !dbg !242

bb4.i180:                                         ; preds = %bb2.i175
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !214, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !34), !dbg !215
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !82), !dbg !218
  call void @llvm.dbg.value(metadata !{i32 %120}, i64 0, metadata !76), !dbg !222
  call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !76), !dbg !223
  call void @llvm.dbg.value(metadata !{i8* %123}, i64 0, metadata !41) nounwind, !dbg !225
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !42) nounwind, !dbg !225
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !226
  call void @llvm.dbg.value(metadata !{i8 %132}, i64 0, metadata !45) nounwind, !dbg !231
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !231
  call void @llvm.dbg.value(metadata !{i32 %134}, i64 0, metadata !65), !dbg !223
  call void @llvm.dbg.value(metadata !{i32 %138}, i64 0, metadata !76), !dbg !235
  call void @llvm.dbg.value(metadata !{i8* %137}, i64 0, metadata !41) nounwind, !dbg !237
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !42) nounwind, !dbg !237
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !238
  call void @llvm.dbg.value(metadata !{i8 %147}, i64 0, metadata !45) nounwind, !dbg !243
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !243
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !40) nounwind, !dbg !244
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([72 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !246
  unreachable, !dbg !246

bb5.i183:                                         ; preds = %__str_to_int.exit173, %bb3.i179
  %147 = phi i8 [ %.pre.i178, %bb3.i179 ], [ %139, %__str_to_int.exit173 ]
  %indvar.i181 = phi i64 [ %phitmp575, %bb3.i179 ], [ 1, %__str_to_int.exit173 ]
  %res.0.i182 = phi i64 [ %146, %bb3.i179 ], [ 0, %__str_to_int.exit173 ]
  %s_addr.0.phi.trans.insert.i177 = getelementptr i8* %137, i64 %indvar.i181
  %148 = icmp eq i8 %147, 0, !dbg !243
  br i1 %148, label %__str_to_int.exit184, label %bb2.i175, !dbg !243

__str_to_int.exit184:                             ; preds = %bb5.i183
  %149 = trunc i64 %res.0.i182 to i32, !dbg !235
  br label %bb42, !dbg !235

bb.i185:                                          ; preds = %bb3.i191
  %150 = icmp eq i8 %151, 0, !dbg !247
  br i1 %150, label %bb27, label %bb2.i187, !dbg !247

bb2.i187:                                         ; preds = %bb.i185
  %indvar.next.i186 = add i64 %indvar.i188, 1
  br label %bb3.i191, !dbg !249

bb3.i191:                                         ; preds = %bb3.i158, %bb2.i187
  %indvar.i188 = phi i64 [ %indvar.next.i186, %bb2.i187 ], [ 0, %bb3.i158 ]
  %b_addr.0.i189 = getelementptr [13 x i8]* @.str16, i64 0, i64 %indvar.i188
  %a_addr.0.i190 = getelementptr i8* %16, i64 %indvar.i188
  %151 = load i8* %a_addr.0.i190, align 1, !dbg !250
  %152 = load i8* %b_addr.0.i189, align 1, !dbg !250
  %153 = icmp eq i8 %151, %152, !dbg !250
  br i1 %153, label %bb.i185, label %bb3.i201, !dbg !250

bb.i195:                                          ; preds = %bb3.i201
  %154 = icmp eq i8 %155, 0, !dbg !247
  br i1 %154, label %bb27, label %bb2.i197, !dbg !247

bb2.i197:                                         ; preds = %bb.i195
  %indvar.next.i196 = add i64 %indvar.i198, 1
  br label %bb3.i201, !dbg !249

bb3.i201:                                         ; preds = %bb3.i191, %bb2.i197
  %indvar.i198 = phi i64 [ %indvar.next.i196, %bb2.i197 ], [ 0, %bb3.i191 ]
  %b_addr.0.i199 = getelementptr [12 x i8]* @.str17, i64 0, i64 %indvar.i198
  %a_addr.0.i200 = getelementptr i8* %16, i64 %indvar.i198
  %155 = load i8* %a_addr.0.i200, align 1, !dbg !250
  %156 = load i8* %b_addr.0.i199, align 1, !dbg !250
  %157 = icmp eq i8 %155, %156, !dbg !250
  br i1 %157, label %bb.i195, label %bb3.i211, !dbg !250

bb27:                                             ; preds = %bb.i185, %bb.i195
  %158 = add nsw i32 %k.0, 1, !dbg !251
  br label %bb42, !dbg !251

bb.i205:                                          ; preds = %bb3.i211
  %159 = icmp eq i8 %160, 0, !dbg !252
  br i1 %159, label %bb30, label %bb2.i207, !dbg !252

bb2.i207:                                         ; preds = %bb.i205
  %indvar.next.i206 = add i64 %indvar.i208, 1
  br label %bb3.i211, !dbg !254

bb3.i211:                                         ; preds = %bb3.i201, %bb2.i207
  %indvar.i208 = phi i64 [ %indvar.next.i206, %bb2.i207 ], [ 0, %bb3.i201 ]
  %b_addr.0.i209 = getelementptr [18 x i8]* @.str18, i64 0, i64 %indvar.i208
  %a_addr.0.i210 = getelementptr i8* %16, i64 %indvar.i208
  %160 = load i8* %a_addr.0.i210, align 1, !dbg !255
  %161 = load i8* %b_addr.0.i209, align 1, !dbg !255
  %162 = icmp eq i8 %160, %161, !dbg !255
  br i1 %162, label %bb.i205, label %bb3.i221, !dbg !255

bb.i215:                                          ; preds = %bb3.i221
  %163 = icmp eq i8 %164, 0, !dbg !252
  br i1 %163, label %bb30, label %bb2.i217, !dbg !252

bb2.i217:                                         ; preds = %bb.i215
  %indvar.next.i216 = add i64 %indvar.i218, 1
  br label %bb3.i221, !dbg !254

bb3.i221:                                         ; preds = %bb3.i211, %bb2.i217
  %indvar.i218 = phi i64 [ %indvar.next.i216, %bb2.i217 ], [ 0, %bb3.i211 ]
  %b_addr.0.i219 = getelementptr [17 x i8]* @.str19, i64 0, i64 %indvar.i218
  %a_addr.0.i220 = getelementptr i8* %16, i64 %indvar.i218
  %164 = load i8* %a_addr.0.i220, align 1, !dbg !255
  %165 = load i8* %b_addr.0.i219, align 1, !dbg !255
  %166 = icmp eq i8 %164, %165, !dbg !255
  br i1 %166, label %bb.i215, label %bb3.i261, !dbg !255

bb30:                                             ; preds = %bb.i205, %bb.i215
  %167 = add nsw i32 %k.0, 1, !dbg !256
  br label %bb42, !dbg !256

bb.i255:                                          ; preds = %bb3.i261
  %168 = icmp eq i8 %169, 0, !dbg !257
  br i1 %168, label %bb33, label %bb2.i257, !dbg !257

bb2.i257:                                         ; preds = %bb.i255
  %indvar.next.i256 = add i64 %indvar.i258, 1
  br label %bb3.i261, !dbg !259

bb3.i261:                                         ; preds = %bb3.i221, %bb2.i257
  %indvar.i258 = phi i64 [ %indvar.next.i256, %bb2.i257 ], [ 0, %bb3.i221 ]
  %b_addr.0.i259 = getelementptr [10 x i8]* @.str20, i64 0, i64 %indvar.i258
  %a_addr.0.i260 = getelementptr i8* %16, i64 %indvar.i258
  %169 = load i8* %a_addr.0.i260, align 1, !dbg !260
  %170 = load i8* %b_addr.0.i259, align 1, !dbg !260
  %171 = icmp eq i8 %169, %170, !dbg !260
  br i1 %171, label %bb.i255, label %bb3.i251, !dbg !260

bb.i245:                                          ; preds = %bb3.i251
  %172 = icmp eq i8 %173, 0, !dbg !257
  br i1 %172, label %bb33, label %bb2.i247, !dbg !257

bb2.i247:                                         ; preds = %bb.i245
  %indvar.next.i246 = add i64 %indvar.i248, 1
  br label %bb3.i251, !dbg !259

bb3.i251:                                         ; preds = %bb3.i261, %bb2.i247
  %indvar.i248 = phi i64 [ %indvar.next.i246, %bb2.i247 ], [ 0, %bb3.i261 ]
  %b_addr.0.i249 = getelementptr [9 x i8]* @.str21, i64 0, i64 %indvar.i248
  %a_addr.0.i250 = getelementptr i8* %16, i64 %indvar.i248
  %173 = load i8* %a_addr.0.i250, align 1, !dbg !260
  %174 = load i8* %b_addr.0.i249, align 1, !dbg !260
  %175 = icmp eq i8 %173, %174, !dbg !260
  br i1 %175, label %bb.i245, label %bb3.i241, !dbg !260

bb33:                                             ; preds = %bb.i255, %bb.i245
  %176 = add nsw i32 %k.0, 1, !dbg !261
  br label %bb42, !dbg !261

bb.i235:                                          ; preds = %bb3.i241
  %177 = icmp eq i8 %178, 0, !dbg !262
  br i1 %177, label %bb36, label %bb2.i237, !dbg !262

bb2.i237:                                         ; preds = %bb.i235
  %indvar.next.i236 = add i64 %indvar.i238, 1
  br label %bb3.i241, !dbg !264

bb3.i241:                                         ; preds = %bb3.i251, %bb2.i237
  %indvar.i238 = phi i64 [ %indvar.next.i236, %bb2.i237 ], [ 0, %bb3.i251 ]
  %b_addr.0.i239 = getelementptr [11 x i8]* @.str22, i64 0, i64 %indvar.i238
  %a_addr.0.i240 = getelementptr i8* %16, i64 %indvar.i238
  %178 = load i8* %a_addr.0.i240, align 1, !dbg !265
  %179 = load i8* %b_addr.0.i239, align 1, !dbg !265
  %180 = icmp eq i8 %178, %179, !dbg !265
  br i1 %180, label %bb.i235, label %bb3.i231, !dbg !265

bb.i225:                                          ; preds = %bb3.i231
  %181 = icmp eq i8 %182, 0, !dbg !262
  br i1 %181, label %bb36, label %bb2.i227, !dbg !262

bb2.i227:                                         ; preds = %bb.i225
  %indvar.next.i226 = add i64 %indvar.i228, 1
  br label %bb3.i231, !dbg !264

bb3.i231:                                         ; preds = %bb3.i241, %bb2.i227
  %indvar.i228 = phi i64 [ %indvar.next.i226, %bb2.i227 ], [ 0, %bb3.i241 ]
  %b_addr.0.i229 = getelementptr [10 x i8]* @.str23, i64 0, i64 %indvar.i228
  %a_addr.0.i230 = getelementptr i8* %16, i64 %indvar.i228
  %182 = load i8* %a_addr.0.i230, align 1, !dbg !265
  %183 = load i8* %b_addr.0.i229, align 1, !dbg !265
  %184 = icmp eq i8 %182, %183, !dbg !265
  br i1 %184, label %bb.i225, label %bb40, !dbg !265

bb36:                                             ; preds = %bb.i235, %bb.i225
  %185 = add nsw i32 %k.0, 1, !dbg !266
  %186 = icmp eq i32 %185, %0, !dbg !266
  br i1 %186, label %bb38, label %bb39, !dbg !266

bb38:                                             ; preds = %bb36
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !214, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !34), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !34), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !268
  tail call void @llvm.dbg.value(metadata !269, i64 0, metadata !34), !dbg !268
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !268
  tail call void @llvm.dbg.value(metadata !270, i64 0, metadata !34), !dbg !268
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !271
  tail call void @llvm.dbg.value(metadata !272, i64 0, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !271
  tail call void @llvm.dbg.value(metadata !273, i64 0, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !274
  tail call void @llvm.dbg.value(metadata !275, i64 0, metadata !34), !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !274
  tail call void @llvm.dbg.value(metadata !276, i64 0, metadata !34), !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !277
  tail call void @llvm.dbg.value(metadata !278, i64 0, metadata !34), !dbg !277
  call void @llvm.dbg.value(metadata !279, i64 0, metadata !84), !dbg !280
  call void @llvm.dbg.value(metadata !{i32 %185}, i64 0, metadata !76), !dbg !266
  call void @llvm.dbg.value(metadata !279, i64 0, metadata !40) nounwind, !dbg !281
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([54 x i8]* @.str24, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !283
  unreachable, !dbg !283

bb39:                                             ; preds = %bb36
  %187 = sext i32 %185 to i64, !dbg !284
  %188 = getelementptr inbounds i8** %1, i64 %187, !dbg !284
  %189 = load i8** %188, align 8, !dbg !284
  %190 = add nsw i32 %k.0, 2, !dbg !284
  %191 = load i8* %189, align 1, !dbg !285
  %192 = icmp eq i8 %191, 0, !dbg !285
  br i1 %192, label %bb.i56, label %bb5.i, !dbg !285

bb.i56:                                           ; preds = %bb39
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !214, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !34), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !34), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !268
  tail call void @llvm.dbg.value(metadata !269, i64 0, metadata !34), !dbg !268
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !268
  tail call void @llvm.dbg.value(metadata !270, i64 0, metadata !34), !dbg !268
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !271
  tail call void @llvm.dbg.value(metadata !272, i64 0, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !271
  tail call void @llvm.dbg.value(metadata !273, i64 0, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !274
  tail call void @llvm.dbg.value(metadata !275, i64 0, metadata !34), !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !274
  tail call void @llvm.dbg.value(metadata !276, i64 0, metadata !34), !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !277
  tail call void @llvm.dbg.value(metadata !278, i64 0, metadata !34), !dbg !277
  call void @llvm.dbg.value(metadata !279, i64 0, metadata !84), !dbg !280
  call void @llvm.dbg.value(metadata !{i32 %185}, i64 0, metadata !76), !dbg !266
  call void @llvm.dbg.value(metadata !{i32 %190}, i64 0, metadata !76), !dbg !284
  call void @llvm.dbg.value(metadata !{i8* %189}, i64 0, metadata !41) nounwind, !dbg !286
  call void @llvm.dbg.value(metadata !279, i64 0, metadata !42) nounwind, !dbg !286
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !287
  call void @llvm.dbg.value(metadata !279, i64 0, metadata !40) nounwind, !dbg !288
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([54 x i8]* @.str24, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !289
  unreachable, !dbg !289

bb2.i57:                                          ; preds = %bb5.i
  %193 = add i8 %199, -48
  %194 = icmp ult i8 %193, 10
  br i1 %194, label %bb3.i59, label %bb4.i, !dbg !290

bb3.i59:                                          ; preds = %bb2.i57
  %195 = mul nsw i64 %res.0.i, 10, !dbg !291
  %196 = sext i8 %199 to i64
  %197 = add i64 %196, -48
  %198 = add nsw i64 %197, %195, !dbg !291
  %.pre.i = load i8* %s_addr.0.phi.trans.insert.i, align 1
  %phitmp = add i64 %indvar.i60, 1
  br label %bb5.i, !dbg !291

bb4.i:                                            ; preds = %bb2.i57
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !214, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !34), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !34), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !268
  tail call void @llvm.dbg.value(metadata !269, i64 0, metadata !34), !dbg !268
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !268
  tail call void @llvm.dbg.value(metadata !270, i64 0, metadata !34), !dbg !268
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !271
  tail call void @llvm.dbg.value(metadata !272, i64 0, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !271
  tail call void @llvm.dbg.value(metadata !273, i64 0, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !274
  tail call void @llvm.dbg.value(metadata !275, i64 0, metadata !34), !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !274
  tail call void @llvm.dbg.value(metadata !276, i64 0, metadata !34), !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !277
  tail call void @llvm.dbg.value(metadata !278, i64 0, metadata !34), !dbg !277
  call void @llvm.dbg.value(metadata !279, i64 0, metadata !84), !dbg !280
  call void @llvm.dbg.value(metadata !{i32 %185}, i64 0, metadata !76), !dbg !266
  call void @llvm.dbg.value(metadata !{i32 %190}, i64 0, metadata !76), !dbg !284
  call void @llvm.dbg.value(metadata !{i8* %189}, i64 0, metadata !41) nounwind, !dbg !286
  call void @llvm.dbg.value(metadata !279, i64 0, metadata !42) nounwind, !dbg !286
  call void @llvm.dbg.value(metadata !127, i64 0, metadata !43) nounwind, !dbg !287
  call void @llvm.dbg.value(metadata !{i8 %199}, i64 0, metadata !45) nounwind, !dbg !292
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !41) nounwind, !dbg !292
  call void @llvm.dbg.value(metadata !279, i64 0, metadata !40) nounwind, !dbg !293
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([54 x i8]* @.str24, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !295
  unreachable, !dbg !295

bb5.i:                                            ; preds = %bb39, %bb3.i59
  %199 = phi i8 [ %.pre.i, %bb3.i59 ], [ %191, %bb39 ]
  %indvar.i60 = phi i64 [ %phitmp, %bb3.i59 ], [ 1, %bb39 ]
  %res.0.i = phi i64 [ %198, %bb3.i59 ], [ 0, %bb39 ]
  %s_addr.0.phi.trans.insert.i = getelementptr i8* %189, i64 %indvar.i60
  %200 = icmp eq i8 %199, 0, !dbg !292
  br i1 %200, label %__str_to_int.exit, label %bb2.i57, !dbg !292

__str_to_int.exit:                                ; preds = %bb5.i
  %201 = trunc i64 %res.0.i to i32, !dbg !284
  br label %bb42, !dbg !284

bb40:                                             ; preds = %bb3.i231
  %202 = icmp eq i32 %new_argc.0, 1024, !dbg !296
  br i1 %202, label %bb.i46, label %__add_arg.exit, !dbg !296

bb.i46:                                           ; preds = %bb40
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !118, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !117
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !34), !dbg !117
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !155
  tail call void @llvm.dbg.value(metadata !214, i64 0, metadata !34), !dbg !155
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !34), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !215
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !34), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !268
  tail call void @llvm.dbg.value(metadata !269, i64 0, metadata !34), !dbg !268
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !268
  tail call void @llvm.dbg.value(metadata !270, i64 0, metadata !34), !dbg !268
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !271
  tail call void @llvm.dbg.value(metadata !272, i64 0, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !271
  tail call void @llvm.dbg.value(metadata !273, i64 0, metadata !34), !dbg !271
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !274
  tail call void @llvm.dbg.value(metadata !275, i64 0, metadata !34), !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !274
  tail call void @llvm.dbg.value(metadata !276, i64 0, metadata !34), !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !277
  tail call void @llvm.dbg.value(metadata !278, i64 0, metadata !34), !dbg !277
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !33), !dbg !277
  tail call void @llvm.dbg.value(metadata !298, i64 0, metadata !34), !dbg !277
  call void @llvm.dbg.value(metadata !{i32 %203}, i64 0, metadata !76), !dbg !297
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !46) nounwind, !dbg !299
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !47) nounwind, !dbg !299
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !48) nounwind, !dbg !299
  call void @llvm.dbg.value(metadata !142, i64 0, metadata !49) nounwind, !dbg !299
  call void @llvm.dbg.value(metadata !143, i64 0, metadata !40) nounwind, !dbg !300
  call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([37 x i8]* @.str2, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) noreturn nounwind, !dbg !302
  unreachable, !dbg !302

__add_arg.exit:                                   ; preds = %bb40
  %203 = add nsw i32 %k.0, 1, !dbg !297
  %204 = sext i32 %new_argc.0 to i64, !dbg !303
  %205 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %204
  store i8* %16, i8** %205, align 8, !dbg !303
  %206 = add nsw i32 %new_argc.0, 1, !dbg !304
  br label %bb42, !dbg !297

bb42:                                             ; preds = %bb18, %__add_arg.exit, %__str_to_int.exit, %bb33, %bb30, %bb27, %__str_to_int.exit184, %__add_arg.exit84, %entry, %bb3.i
  %new_argc.0 = phi i32 [ 0, %bb3.i ], [ 0, %entry ], [ %206, %__add_arg.exit ], [ %new_argc.0, %__str_to_int.exit ], [ %new_argc.0, %bb33 ], [ %new_argc.0, %bb30 ], [ %new_argc.0, %bb27 ], [ %new_argc.0, %__str_to_int.exit184 ], [ %49, %__add_arg.exit84 ], [ %new_argc.1, %bb18 ]
  %sym_files.0 = phi i32 [ 0, %bb3.i ], [ 0, %entry ], [ %sym_files.0, %__add_arg.exit ], [ %sym_files.0, %__str_to_int.exit ], [ %sym_files.0, %bb33 ], [ %sym_files.0, %bb30 ], [ %sym_files.0, %bb27 ], [ %134, %__str_to_int.exit184 ], [ %sym_files.0, %__add_arg.exit84 ], [ %sym_files.0, %bb18 ]
  %sym_file_len.0 = phi i32 [ 0, %bb3.i ], [ 0, %entry ], [ %sym_file_len.0, %__add_arg.exit ], [ %sym_file_len.0, %__str_to_int.exit ], [ %sym_file_len.0, %bb33 ], [ %sym_file_len.0, %bb30 ], [ %sym_file_len.0, %bb27 ], [ %149, %__str_to_int.exit184 ], [ %sym_file_len.0, %__add_arg.exit84 ], [ %sym_file_len.0, %bb18 ]
  %sym_stdout_flag.0 = phi i32 [ 0, %bb3.i ], [ 0, %entry ], [ %sym_stdout_flag.0, %__add_arg.exit ], [ %sym_stdout_flag.0, %__str_to_int.exit ], [ %sym_stdout_flag.0, %bb33 ], [ %sym_stdout_flag.0, %bb30 ], [ 1, %bb27 ], [ %sym_stdout_flag.0, %__str_to_int.exit184 ], [ %sym_stdout_flag.0, %__add_arg.exit84 ], [ %sym_stdout_flag.0, %bb18 ]
  %save_all_writes_flag.0 = phi i32 [ 0, %bb3.i ], [ 0, %entry ], [ %save_all_writes_flag.0, %__add_arg.exit ], [ %save_all_writes_flag.0, %__str_to_int.exit ], [ %save_all_writes_flag.0, %bb33 ], [ 1, %bb30 ], [ %save_all_writes_flag.0, %bb27 ], [ %save_all_writes_flag.0, %__str_to_int.exit184 ], [ %save_all_writes_flag.0, %__add_arg.exit84 ], [ %save_all_writes_flag.0, %bb18 ]
  %fd_fail.0 = phi i32 [ 0, %bb3.i ], [ 0, %entry ], [ %fd_fail.0, %__add_arg.exit ], [ %201, %__str_to_int.exit ], [ 1, %bb33 ], [ %fd_fail.0, %bb30 ], [ %fd_fail.0, %bb27 ], [ %fd_fail.0, %__str_to_int.exit184 ], [ %fd_fail.0, %__add_arg.exit84 ], [ %fd_fail.0, %bb18 ]
  %sym_arg_num.0 = phi i32 [ 0, %bb3.i ], [ 0, %entry ], [ %sym_arg_num.0, %__add_arg.exit ], [ %sym_arg_num.0, %__str_to_int.exit ], [ %sym_arg_num.0, %bb33 ], [ %sym_arg_num.0, %bb30 ], [ %sym_arg_num.0, %bb27 ], [ %sym_arg_num.0, %__str_to_int.exit184 ], [ %46, %__add_arg.exit84 ], [ %sym_arg_num.1, %bb18 ]
  %k.0 = phi i32 [ 0, %bb3.i ], [ 0, %entry ], [ %203, %__add_arg.exit ], [ %190, %__str_to_int.exit ], [ %176, %bb33 ], [ %167, %bb30 ], [ %158, %bb27 ], [ %138, %__str_to_int.exit184 ], [ %30, %__add_arg.exit84 ], [ %93, %bb18 ]
  %207 = icmp slt i32 %k.0, %0, !dbg !305
  br i1 %207, label %bb2, label %bb43, !dbg !305

bb43:                                             ; preds = %bb42
  %208 = add nsw i32 %new_argc.0, 1, !dbg !306
  %209 = sext i32 %208 to i64, !dbg !306
  %210 = shl i64 %209, 3
  %211 = call noalias i8* @malloc(i64 %210) nounwind, !dbg !306
  %212 = bitcast i8* %211 to i8**, !dbg !306
  call void @llvm.dbg.value(metadata !{i8** %212}, i64 0, metadata !70), !dbg !306
  call void @klee_mark_global(i8* %211) nounwind, !dbg !307
  %213 = sext i32 %new_argc.0 to i64, !dbg !308
  %214 = shl i64 %213, 3
  %new_argv4445 = bitcast [1024 x i8*]* %new_argv to i8*, !dbg !308
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %211, i8* %new_argv4445, i64 %214, i32 8, i1 false), !dbg !308
  %215 = getelementptr inbounds i8** %212, i64 %213, !dbg !309
  store i8* null, i8** %215, align 8, !dbg !309
  store i32 %new_argc.0, i32* %argcPtr, align 4, !dbg !310
  store i8** %212, i8*** %argvPtr, align 8, !dbg !311
  call void @klee_init_fds(i32 %sym_files.0, i32 %sym_file_len.0, i32 %sym_stdout_flag.0, i32 %save_all_writes_flag.0, i32 %fd_fail.0) nounwind, !dbg !312
  ret void, !dbg !313
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define internal fastcc i8* @__get_sym_str(i32 %numChars, i8* %name) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %numChars}, i64 0, metadata !35), !dbg !314
  tail call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !36), !dbg !314
  %0 = add nsw i32 %numChars, 1, !dbg !315
  %1 = sext i32 %0 to i64, !dbg !315
  %2 = tail call noalias i8* @malloc(i64 %1) nounwind, !dbg !315
  tail call void @llvm.dbg.value(metadata !{i8* %2}, i64 0, metadata !39), !dbg !315
  tail call void @klee_mark_global(i8* %2) nounwind, !dbg !316
  tail call void @klee_make_symbolic(i8* %2, i64 %1, i8* %name) nounwind, !dbg !317
  tail call void @llvm.dbg.value(metadata !91, i64 0, metadata !37), !dbg !318
  %3 = icmp sgt i32 %numChars, 0, !dbg !318
  br i1 %3, label %bb.nph, label %bb2, !dbg !318

bb.nph:                                           ; preds = %entry
  %tmp = zext i32 %numChars to i64
  br label %bb

bb:                                               ; preds = %bb, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %bb ]
  %scevgep = getelementptr i8* %2, i64 %indvar
  %4 = load i8* %scevgep, align 1, !dbg !319
  %5 = add i8 %4, -32
  %6 = icmp ult i8 %5, 95
  %7 = zext i1 %6 to i64
  tail call void @klee_prefer_cex(i8* %2, i64 %7) nounwind, !dbg !319
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp
  br i1 %exitcond, label %bb2, label %bb, !dbg !318

bb2:                                              ; preds = %bb, %entry
  %8 = sext i32 %numChars to i64, !dbg !320
  %9 = getelementptr inbounds i8* %2, i64 %8, !dbg !320
  store i8 0, i8* %9, align 1, !dbg !320
  ret i8* %2, !dbg !321
}

declare noalias i8* @malloc(i64) nounwind

declare void @klee_mark_global(i8*)

declare void @klee_make_symbolic(i8*, i64, i8*)

declare void @klee_prefer_cex(i8*, i64)

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

declare i32 @klee_range(i32, i32, i8*)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @klee_init_fds(i32, i32, i32, i32, i32)

!llvm.dbg.sp = !{!0, !8, !12, !16, !19, !23, !28}
!llvm.dbg.lv.__isprint = !{!32}
!llvm.dbg.lv.__streq = !{!33, !34}
!llvm.dbg.lv.__get_sym_str = !{!35, !36, !37, !39}
!llvm.dbg.lv.__emit_error = !{!40}
!llvm.dbg.lv.__str_to_int = !{!41, !42, !43, !45}
!llvm.dbg.lv.__add_arg = !{!46, !47, !48, !49}
!llvm.dbg.lv.klee_init_env = !{!50, !51, !52, !54, !55, !56, !57, !61, !63, !64, !65, !66, !67, !68, !69, !70, !71, !75, !76, !77, !78, !80, !82, !84}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__isprint", metadata !"__isprint", metadata !"", metadata !1, i32 48, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"klee_init_env.c", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"klee_init_env.c", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !6}
!5 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524326, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !7} ; [ DW_TAG_const_type ]
!7 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!8 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__streq", metadata !"__streq", metadata !"", metadata !1, i32 53, metadata !9, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!9 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_subroutine_type ]
!10 = metadata !{metadata !5, metadata !11, metadata !11}
!11 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__get_sym_str", metadata !"__get_sym_str", metadata !"", metadata !1, i32 63, metadata !13, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, i8* (i32, i8*)* @__get_sym_str} ; [ DW_TAG_subprogram ]
!13 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null} ; [ DW_TAG_subroutine_type ]
!14 = metadata !{metadata !15, metadata !5, metadata !15}
!15 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!16 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__emit_error", metadata !"__emit_error", metadata !"", metadata !1, i32 23, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{null, metadata !11}
!19 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__str_to_int", metadata !"__str_to_int", metadata !"", metadata !1, i32 30, metadata !20, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!20 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null} ; [ DW_TAG_subroutine_type ]
!21 = metadata !{metadata !22, metadata !15, metadata !11}
!22 = metadata !{i32 524324, metadata !1, metadata !"long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!23 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__add_arg", metadata !"__add_arg", metadata !"", metadata !1, i32 76, metadata !24, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!24 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null} ; [ DW_TAG_subroutine_type ]
!25 = metadata !{null, metadata !26, metadata !27, metadata !15, metadata !5}
!26 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !5} ; [ DW_TAG_pointer_type ]
!27 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ]
!28 = metadata !{i32 524334, i32 0, metadata !1, metadata !"klee_init_env", metadata !"klee_init_env", metadata !"klee_init_env", metadata !1, i32 85, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, void (i32*, i8***)* @klee_init_env} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{null, metadata !26, metadata !31}
!31 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ]
!32 = metadata !{i32 524545, metadata !0, metadata !"c", metadata !1, i32 48, metadata !6} ; [ DW_TAG_arg_variable ]
!33 = metadata !{i32 524545, metadata !8, metadata !"a", metadata !1, i32 53, metadata !11} ; [ DW_TAG_arg_variable ]
!34 = metadata !{i32 524545, metadata !8, metadata !"b", metadata !1, i32 53, metadata !11} ; [ DW_TAG_arg_variable ]
!35 = metadata !{i32 524545, metadata !12, metadata !"numChars", metadata !1, i32 63, metadata !5} ; [ DW_TAG_arg_variable ]
!36 = metadata !{i32 524545, metadata !12, metadata !"name", metadata !1, i32 63, metadata !15} ; [ DW_TAG_arg_variable ]
!37 = metadata !{i32 524544, metadata !38, metadata !"i", metadata !1, i32 64, metadata !5} ; [ DW_TAG_auto_variable ]
!38 = metadata !{i32 524299, metadata !12, i32 63, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!39 = metadata !{i32 524544, metadata !38, metadata !"s", metadata !1, i32 65, metadata !15} ; [ DW_TAG_auto_variable ]
!40 = metadata !{i32 524545, metadata !16, metadata !"msg", metadata !1, i32 23, metadata !11} ; [ DW_TAG_arg_variable ]
!41 = metadata !{i32 524545, metadata !19, metadata !"s", metadata !1, i32 30, metadata !15} ; [ DW_TAG_arg_variable ]
!42 = metadata !{i32 524545, metadata !19, metadata !"error_msg", metadata !1, i32 30, metadata !11} ; [ DW_TAG_arg_variable ]
!43 = metadata !{i32 524544, metadata !44, metadata !"res", metadata !1, i32 31, metadata !22} ; [ DW_TAG_auto_variable ]
!44 = metadata !{i32 524299, metadata !19, i32 30, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!45 = metadata !{i32 524544, metadata !44, metadata !"c", metadata !1, i32 32, metadata !7} ; [ DW_TAG_auto_variable ]
!46 = metadata !{i32 524545, metadata !23, metadata !"argc", metadata !1, i32 76, metadata !26} ; [ DW_TAG_arg_variable ]
!47 = metadata !{i32 524545, metadata !23, metadata !"argv", metadata !1, i32 76, metadata !27} ; [ DW_TAG_arg_variable ]
!48 = metadata !{i32 524545, metadata !23, metadata !"arg", metadata !1, i32 76, metadata !15} ; [ DW_TAG_arg_variable ]
!49 = metadata !{i32 524545, metadata !23, metadata !"argcMax", metadata !1, i32 76, metadata !5} ; [ DW_TAG_arg_variable ]
!50 = metadata !{i32 524545, metadata !28, metadata !"argcPtr", metadata !1, i32 85, metadata !26} ; [ DW_TAG_arg_variable ]
!51 = metadata !{i32 524545, metadata !28, metadata !"argvPtr", metadata !1, i32 85, metadata !31} ; [ DW_TAG_arg_variable ]
!52 = metadata !{i32 524544, metadata !53, metadata !"argc", metadata !1, i32 86, metadata !5} ; [ DW_TAG_auto_variable ]
!53 = metadata !{i32 524299, metadata !28, i32 85, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!54 = metadata !{i32 524544, metadata !53, metadata !"argv", metadata !1, i32 87, metadata !27} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 524544, metadata !53, metadata !"new_argc", metadata !1, i32 89, metadata !5} ; [ DW_TAG_auto_variable ]
!56 = metadata !{i32 524544, metadata !53, metadata !"n_args", metadata !1, i32 89, metadata !5} ; [ DW_TAG_auto_variable ]
!57 = metadata !{i32 524544, metadata !53, metadata !"new_argv", metadata !1, i32 90, metadata !58} ; [ DW_TAG_auto_variable ]
!58 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 65536, i64 64, i64 0, i32 0, metadata !15, metadata !59, i32 0, null} ; [ DW_TAG_array_type ]
!59 = metadata !{metadata !60}
!60 = metadata !{i32 524321, i64 0, i64 1023}     ; [ DW_TAG_subrange_type ]
!61 = metadata !{i32 524544, metadata !53, metadata !"max_len", metadata !1, i32 91, metadata !62} ; [ DW_TAG_auto_variable ]
!62 = metadata !{i32 524324, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!63 = metadata !{i32 524544, metadata !53, metadata !"min_argvs", metadata !1, i32 91, metadata !62} ; [ DW_TAG_auto_variable ]
!64 = metadata !{i32 524544, metadata !53, metadata !"max_argvs", metadata !1, i32 91, metadata !62} ; [ DW_TAG_auto_variable ]
!65 = metadata !{i32 524544, metadata !53, metadata !"sym_files", metadata !1, i32 92, metadata !62} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 524544, metadata !53, metadata !"sym_file_len", metadata !1, i32 92, metadata !62} ; [ DW_TAG_auto_variable ]
!67 = metadata !{i32 524544, metadata !53, metadata !"sym_stdout_flag", metadata !1, i32 93, metadata !5} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 524544, metadata !53, metadata !"save_all_writes_flag", metadata !1, i32 94, metadata !5} ; [ DW_TAG_auto_variable ]
!69 = metadata !{i32 524544, metadata !53, metadata !"fd_fail", metadata !1, i32 95, metadata !5} ; [ DW_TAG_auto_variable ]
!70 = metadata !{i32 524544, metadata !53, metadata !"final_argv", metadata !1, i32 96, metadata !27} ; [ DW_TAG_auto_variable ]
!71 = metadata !{i32 524544, metadata !53, metadata !"sym_arg_name", metadata !1, i32 97, metadata !72} ; [ DW_TAG_auto_variable ]
!72 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 40, i64 8, i64 0, i32 0, metadata !7, metadata !73, i32 0, null} ; [ DW_TAG_array_type ]
!73 = metadata !{metadata !74}
!74 = metadata !{i32 524321, i64 0, i64 4}        ; [ DW_TAG_subrange_type ]
!75 = metadata !{i32 524544, metadata !53, metadata !"sym_arg_num", metadata !1, i32 98, metadata !62} ; [ DW_TAG_auto_variable ]
!76 = metadata !{i32 524544, metadata !53, metadata !"k", metadata !1, i32 99, metadata !5} ; [ DW_TAG_auto_variable ]
!77 = metadata !{i32 524544, metadata !53, metadata !"i", metadata !1, i32 99, metadata !5} ; [ DW_TAG_auto_variable ]
!78 = metadata !{i32 524544, metadata !79, metadata !"msg", metadata !1, i32 119, metadata !11} ; [ DW_TAG_auto_variable ]
!79 = metadata !{i32 524299, metadata !53, i32 119, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 524544, metadata !81, metadata !"msg", metadata !1, i32 130, metadata !11} ; [ DW_TAG_auto_variable ]
!81 = metadata !{i32 524299, metadata !53, i32 131, i32 0, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!82 = metadata !{i32 524544, metadata !83, metadata !"msg", metadata !1, i32 150, metadata !11} ; [ DW_TAG_auto_variable ]
!83 = metadata !{i32 524299, metadata !53, i32 150, i32 0, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
!84 = metadata !{i32 524544, metadata !85, metadata !"msg", metadata !1, i32 173, metadata !11} ; [ DW_TAG_auto_variable ]
!85 = metadata !{i32 524299, metadata !53, i32 173, i32 0, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
!86 = metadata !{i32 85, i32 0, metadata !28, null}
!87 = metadata !{i32 90, i32 0, metadata !53, null}
!88 = metadata !{i32 97, i32 0, metadata !53, null}
!89 = metadata !{i32 86, i32 0, metadata !53, null}
!90 = metadata !{i32 87, i32 0, metadata !53, null}
!91 = metadata !{i32 0}
!92 = metadata !{i32 89, i32 0, metadata !53, null}
!93 = metadata !{i32 92, i32 0, metadata !53, null}
!94 = metadata !{i32 93, i32 0, metadata !53, null}
!95 = metadata !{i32 94, i32 0, metadata !53, null}
!96 = metadata !{i32 95, i32 0, metadata !53, null}
!97 = metadata !{i32 98, i32 0, metadata !53, null}
!98 = metadata !{i32 99, i32 0, metadata !53, null}
!99 = metadata !{i32 101, i32 0, metadata !53, null}
!100 = metadata !{i32 104, i32 0, metadata !53, null}
!101 = metadata !{i32 53, i32 0, metadata !8, metadata !100}
!102 = metadata !{null}
!103 = metadata !{i32 54, i32 0, metadata !104, metadata !100}
!104 = metadata !{i32 524299, metadata !8, i32 53, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!105 = metadata !{i32 55, i32 0, metadata !104, metadata !100}
!106 = metadata !{i32 58, i32 0, metadata !104, metadata !100}
!107 = metadata !{i8* getelementptr inbounds ([593 x i8]* @.str5, i64 0, i64 0)}
!108 = metadata !{i32 23, i32 0, metadata !16, metadata !109}
!109 = metadata !{i32 105, i32 0, metadata !53, null}
!110 = metadata !{i32 24, i32 0, metadata !111, metadata !109}
!111 = metadata !{i32 524299, metadata !16, i32 23, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!112 = metadata !{i32 118, i32 0, metadata !53, null}
!113 = metadata !{i32 54, i32 0, metadata !104, metadata !112}
!114 = metadata !{i32 55, i32 0, metadata !104, metadata !112}
!115 = metadata !{i32 58, i32 0, metadata !104, metadata !112}
!116 = metadata !{i32 120, i32 0, metadata !79, null}
!117 = metadata !{i32 53, i32 0, metadata !8, metadata !112}
!118 = metadata !{null}
!119 = metadata !{i8* getelementptr inbounds ([48 x i8]* @.str8, i64 0, i64 0)}
!120 = metadata !{i32 119, i32 0, metadata !79, null}
!121 = metadata !{i32 23, i32 0, metadata !16, metadata !122}
!122 = metadata !{i32 121, i32 0, metadata !79, null}
!123 = metadata !{i32 24, i32 0, metadata !111, metadata !122}
!124 = metadata !{i32 123, i32 0, metadata !79, null}
!125 = metadata !{i32 34, i32 0, metadata !44, metadata !124}
!126 = metadata !{i32 30, i32 0, metadata !19, metadata !124}
!127 = metadata !{i64 0}
!128 = metadata !{i32 31, i32 0, metadata !44, metadata !124}
!129 = metadata !{i32 23, i32 0, metadata !16, metadata !125}
!130 = metadata !{i32 24, i32 0, metadata !111, metadata !125}
!131 = metadata !{i32 39, i32 0, metadata !44, metadata !124}
!132 = metadata !{i32 40, i32 0, metadata !44, metadata !124}
!133 = metadata !{i32 36, i32 0, metadata !44, metadata !124}
!134 = metadata !{i32 23, i32 0, metadata !16, metadata !135}
!135 = metadata !{i32 42, i32 0, metadata !44, metadata !124}
!136 = metadata !{i32 24, i32 0, metadata !111, metadata !135}
!137 = metadata !{i32 124, i32 0, metadata !79, null}
!138 = metadata !{i32 125, i32 0, metadata !79, null}
!139 = metadata !{i32 77, i32 0, metadata !140, metadata !138}
!140 = metadata !{i32 524299, metadata !23, i32 76, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!141 = metadata !{i32 76, i32 0, metadata !23, metadata !138}
!142 = metadata !{i32 1024}
!143 = metadata !{i8* getelementptr inbounds ([37 x i8]* @.str2, i64 0, i64 0)}
!144 = metadata !{i32 23, i32 0, metadata !16, metadata !145}
!145 = metadata !{i32 78, i32 0, metadata !140, metadata !138}
!146 = metadata !{i32 24, i32 0, metadata !111, metadata !145}
!147 = metadata !{i32 80, i32 0, metadata !140, metadata !138}
!148 = metadata !{i32 81, i32 0, metadata !140, metadata !138}
!149 = metadata !{i32 55, i32 0, metadata !104, metadata !150}
!150 = metadata !{i32 129, i32 0, metadata !53, null}
!151 = metadata !{i32 58, i32 0, metadata !104, metadata !150}
!152 = metadata !{i32 54, i32 0, metadata !104, metadata !150}
!153 = metadata !{i32 133, i32 0, metadata !81, null}
!154 = metadata !{null}
!155 = metadata !{i32 53, i32 0, metadata !8, metadata !150}
!156 = metadata !{null}
!157 = metadata !{i8* getelementptr inbounds ([77 x i8]* @.str11, i64 0, i64 0)}
!158 = metadata !{i32 131, i32 0, metadata !81, null}
!159 = metadata !{i32 23, i32 0, metadata !16, metadata !160}
!160 = metadata !{i32 134, i32 0, metadata !81, null}
!161 = metadata !{i32 24, i32 0, metadata !111, metadata !160}
!162 = metadata !{i32 136, i32 0, metadata !81, null}
!163 = metadata !{i32 137, i32 0, metadata !81, null}
!164 = metadata !{i32 34, i32 0, metadata !44, metadata !163}
!165 = metadata !{i32 30, i32 0, metadata !19, metadata !163}
!166 = metadata !{i32 31, i32 0, metadata !44, metadata !163}
!167 = metadata !{i32 23, i32 0, metadata !16, metadata !164}
!168 = metadata !{i32 24, i32 0, metadata !111, metadata !164}
!169 = metadata !{i32 39, i32 0, metadata !44, metadata !163}
!170 = metadata !{i32 40, i32 0, metadata !44, metadata !163}
!171 = metadata !{i32 36, i32 0, metadata !44, metadata !163}
!172 = metadata !{i32 23, i32 0, metadata !16, metadata !173}
!173 = metadata !{i32 42, i32 0, metadata !44, metadata !163}
!174 = metadata !{i32 24, i32 0, metadata !111, metadata !173}
!175 = metadata !{i32 138, i32 0, metadata !81, null}
!176 = metadata !{i32 34, i32 0, metadata !44, metadata !175}
!177 = metadata !{i32 30, i32 0, metadata !19, metadata !175}
!178 = metadata !{i32 31, i32 0, metadata !44, metadata !175}
!179 = metadata !{i32 23, i32 0, metadata !16, metadata !176}
!180 = metadata !{i32 24, i32 0, metadata !111, metadata !176}
!181 = metadata !{i32 39, i32 0, metadata !44, metadata !175}
!182 = metadata !{i32 40, i32 0, metadata !44, metadata !175}
!183 = metadata !{i32 36, i32 0, metadata !44, metadata !175}
!184 = metadata !{i32 23, i32 0, metadata !16, metadata !185}
!185 = metadata !{i32 42, i32 0, metadata !44, metadata !175}
!186 = metadata !{i32 24, i32 0, metadata !111, metadata !185}
!187 = metadata !{i32 139, i32 0, metadata !81, null}
!188 = metadata !{i32 34, i32 0, metadata !44, metadata !187}
!189 = metadata !{i32 30, i32 0, metadata !19, metadata !187}
!190 = metadata !{i32 31, i32 0, metadata !44, metadata !187}
!191 = metadata !{i32 23, i32 0, metadata !16, metadata !188}
!192 = metadata !{i32 24, i32 0, metadata !111, metadata !188}
!193 = metadata !{i32 39, i32 0, metadata !44, metadata !187}
!194 = metadata !{i32 40, i32 0, metadata !44, metadata !187}
!195 = metadata !{i32 36, i32 0, metadata !44, metadata !187}
!196 = metadata !{i32 23, i32 0, metadata !16, metadata !197}
!197 = metadata !{i32 42, i32 0, metadata !44, metadata !187}
!198 = metadata !{i32 24, i32 0, metadata !111, metadata !197}
!199 = metadata !{i32 141, i32 0, metadata !81, null}
!200 = metadata !{i32 142, i32 0, metadata !81, null}
!201 = metadata !{i32 143, i32 0, metadata !81, null}
!202 = metadata !{i32 144, i32 0, metadata !81, null}
!203 = metadata !{i32 77, i32 0, metadata !140, metadata !202}
!204 = metadata !{i32 76, i32 0, metadata !23, metadata !202}
!205 = metadata !{i32 23, i32 0, metadata !16, metadata !206}
!206 = metadata !{i32 78, i32 0, metadata !140, metadata !202}
!207 = metadata !{i32 24, i32 0, metadata !111, metadata !206}
!208 = metadata !{i32 80, i32 0, metadata !140, metadata !202}
!209 = metadata !{i32 55, i32 0, metadata !104, metadata !210}
!210 = metadata !{i32 149, i32 0, metadata !53, null}
!211 = metadata !{i32 58, i32 0, metadata !104, metadata !210}
!212 = metadata !{i32 54, i32 0, metadata !104, metadata !210}
!213 = metadata !{i32 152, i32 0, metadata !83, null}
!214 = metadata !{null}
!215 = metadata !{i32 53, i32 0, metadata !8, metadata !210}
!216 = metadata !{null}
!217 = metadata !{i8* getelementptr inbounds ([72 x i8]* @.str15, i64 0, i64 0)}
!218 = metadata !{i32 150, i32 0, metadata !83, null}
!219 = metadata !{i32 23, i32 0, metadata !16, metadata !220}
!220 = metadata !{i32 153, i32 0, metadata !83, null}
!221 = metadata !{i32 24, i32 0, metadata !111, metadata !220}
!222 = metadata !{i32 155, i32 0, metadata !83, null}
!223 = metadata !{i32 156, i32 0, metadata !83, null}
!224 = metadata !{i32 34, i32 0, metadata !44, metadata !223}
!225 = metadata !{i32 30, i32 0, metadata !19, metadata !223}
!226 = metadata !{i32 31, i32 0, metadata !44, metadata !223}
!227 = metadata !{i32 23, i32 0, metadata !16, metadata !224}
!228 = metadata !{i32 24, i32 0, metadata !111, metadata !224}
!229 = metadata !{i32 39, i32 0, metadata !44, metadata !223}
!230 = metadata !{i32 40, i32 0, metadata !44, metadata !223}
!231 = metadata !{i32 36, i32 0, metadata !44, metadata !223}
!232 = metadata !{i32 23, i32 0, metadata !16, metadata !233}
!233 = metadata !{i32 42, i32 0, metadata !44, metadata !223}
!234 = metadata !{i32 24, i32 0, metadata !111, metadata !233}
!235 = metadata !{i32 157, i32 0, metadata !83, null}
!236 = metadata !{i32 34, i32 0, metadata !44, metadata !235}
!237 = metadata !{i32 30, i32 0, metadata !19, metadata !235}
!238 = metadata !{i32 31, i32 0, metadata !44, metadata !235}
!239 = metadata !{i32 23, i32 0, metadata !16, metadata !236}
!240 = metadata !{i32 24, i32 0, metadata !111, metadata !236}
!241 = metadata !{i32 39, i32 0, metadata !44, metadata !235}
!242 = metadata !{i32 40, i32 0, metadata !44, metadata !235}
!243 = metadata !{i32 36, i32 0, metadata !44, metadata !235}
!244 = metadata !{i32 23, i32 0, metadata !16, metadata !245}
!245 = metadata !{i32 42, i32 0, metadata !44, metadata !235}
!246 = metadata !{i32 24, i32 0, metadata !111, metadata !245}
!247 = metadata !{i32 55, i32 0, metadata !104, metadata !248}
!248 = metadata !{i32 160, i32 0, metadata !53, null}
!249 = metadata !{i32 58, i32 0, metadata !104, metadata !248}
!250 = metadata !{i32 54, i32 0, metadata !104, metadata !248}
!251 = metadata !{i32 162, i32 0, metadata !53, null}
!252 = metadata !{i32 55, i32 0, metadata !104, metadata !253}
!253 = metadata !{i32 164, i32 0, metadata !53, null}
!254 = metadata !{i32 58, i32 0, metadata !104, metadata !253}
!255 = metadata !{i32 54, i32 0, metadata !104, metadata !253}
!256 = metadata !{i32 166, i32 0, metadata !53, null}
!257 = metadata !{i32 55, i32 0, metadata !104, metadata !258}
!258 = metadata !{i32 168, i32 0, metadata !53, null}
!259 = metadata !{i32 58, i32 0, metadata !104, metadata !258}
!260 = metadata !{i32 54, i32 0, metadata !104, metadata !258}
!261 = metadata !{i32 170, i32 0, metadata !53, null}
!262 = metadata !{i32 55, i32 0, metadata !104, metadata !263}
!263 = metadata !{i32 172, i32 0, metadata !53, null}
!264 = metadata !{i32 58, i32 0, metadata !104, metadata !263}
!265 = metadata !{i32 54, i32 0, metadata !104, metadata !263}
!266 = metadata !{i32 174, i32 0, metadata !85, null}
!267 = metadata !{null}
!268 = metadata !{i32 53, i32 0, metadata !8, metadata !248}
!269 = metadata !{null}
!270 = metadata !{null}
!271 = metadata !{i32 53, i32 0, metadata !8, metadata !253}
!272 = metadata !{null}
!273 = metadata !{null}
!274 = metadata !{i32 53, i32 0, metadata !8, metadata !258}
!275 = metadata !{null}
!276 = metadata !{null}
!277 = metadata !{i32 53, i32 0, metadata !8, metadata !263}
!278 = metadata !{null}
!279 = metadata !{i8* getelementptr inbounds ([54 x i8]* @.str24, i64 0, i64 0)}
!280 = metadata !{i32 173, i32 0, metadata !85, null}
!281 = metadata !{i32 23, i32 0, metadata !16, metadata !282}
!282 = metadata !{i32 175, i32 0, metadata !85, null}
!283 = metadata !{i32 24, i32 0, metadata !111, metadata !282}
!284 = metadata !{i32 177, i32 0, metadata !85, null}
!285 = metadata !{i32 34, i32 0, metadata !44, metadata !284}
!286 = metadata !{i32 30, i32 0, metadata !19, metadata !284}
!287 = metadata !{i32 31, i32 0, metadata !44, metadata !284}
!288 = metadata !{i32 23, i32 0, metadata !16, metadata !285}
!289 = metadata !{i32 24, i32 0, metadata !111, metadata !285}
!290 = metadata !{i32 39, i32 0, metadata !44, metadata !284}
!291 = metadata !{i32 40, i32 0, metadata !44, metadata !284}
!292 = metadata !{i32 36, i32 0, metadata !44, metadata !284}
!293 = metadata !{i32 23, i32 0, metadata !16, metadata !294}
!294 = metadata !{i32 42, i32 0, metadata !44, metadata !284}
!295 = metadata !{i32 24, i32 0, metadata !111, metadata !294}
!296 = metadata !{i32 77, i32 0, metadata !140, metadata !297}
!297 = metadata !{i32 181, i32 0, metadata !53, null}
!298 = metadata !{null}
!299 = metadata !{i32 76, i32 0, metadata !23, metadata !297}
!300 = metadata !{i32 23, i32 0, metadata !16, metadata !301}
!301 = metadata !{i32 78, i32 0, metadata !140, metadata !297}
!302 = metadata !{i32 24, i32 0, metadata !111, metadata !301}
!303 = metadata !{i32 80, i32 0, metadata !140, metadata !297}
!304 = metadata !{i32 81, i32 0, metadata !140, metadata !297}
!305 = metadata !{i32 117, i32 0, metadata !53, null}
!306 = metadata !{i32 185, i32 0, metadata !53, null}
!307 = metadata !{i32 186, i32 0, metadata !53, null}
!308 = metadata !{i32 187, i32 0, metadata !53, null}
!309 = metadata !{i32 188, i32 0, metadata !53, null}
!310 = metadata !{i32 190, i32 0, metadata !53, null}
!311 = metadata !{i32 191, i32 0, metadata !53, null}
!312 = metadata !{i32 193, i32 0, metadata !53, null}
!313 = metadata !{i32 196, i32 0, metadata !53, null}
!314 = metadata !{i32 63, i32 0, metadata !12, null}
!315 = metadata !{i32 65, i32 0, metadata !38, null}
!316 = metadata !{i32 66, i32 0, metadata !38, null}
!317 = metadata !{i32 67, i32 0, metadata !38, null}
!318 = metadata !{i32 69, i32 0, metadata !38, null}
!319 = metadata !{i32 70, i32 0, metadata !38, null}
!320 = metadata !{i32 72, i32 0, metadata !38, null}
!321 = metadata !{i32 73, i32 0, metadata !38, null}
