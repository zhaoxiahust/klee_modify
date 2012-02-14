; ModuleID = 'fd_init.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.exe_disk_file_t = type { i32, i8*, %struct.stat64* }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }
%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_sym_env_t = type { [32 x %struct.exe_file_t], i32, i32, i32 }
%struct.stat64 = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@__exe_env = global %struct.exe_sym_env_t { [32 x %struct.exe_file_t] [%struct.exe_file_t { i32 0, i32 5, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t { i32 1, i32 9, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t { i32 2, i32 9, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer], i32 18, i32 0, i32 0 }, align 32
@.str = private constant [6 x i8] c"-stat\00", align 1
@.str1 = private constant [5 x i8] c"size\00", align 1
@.str2 = private constant [10 x i8] c"fd_init.c\00", align 1
@__PRETTY_FUNCTION__.4418 = internal constant [19 x i8] c"__create_new_dfile\00", align 16
@.str4 = private constant [2 x i8] c".\00", align 1
@__exe_fs = common global %struct.exe_file_system_t zeroinitializer, align 32
@.str5 = private constant [6 x i8] c"stdin\00", align 1
@.str6 = private constant [10 x i8] c"read_fail\00", align 1
@.str7 = private constant [11 x i8] c"write_fail\00", align 1
@.str8 = private constant [11 x i8] c"close_fail\00", align 1
@.str9 = private constant [15 x i8] c"ftruncate_fail\00", align 1
@.str10 = private constant [12 x i8] c"getcwd_fail\00", align 1
@.str11 = private constant [7 x i8] c"stdout\00", align 1
@.str12 = private constant [14 x i8] c"model_version\00", align 1

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @klee_make_symbolic(i8*, i64, i8*)

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare i32 @__xstat64(i32, i8*, %struct.stat64*) nounwind

define internal fastcc void @__create_new_dfile(%struct.exe_disk_file_t* nocapture %dfile, i32 %size, i8* %name, %struct.stat64* nocapture %defaults) nounwind {
entry:
  %sname = alloca [64 x i8], align 1
  call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %dfile}, i64 0, metadata !74), !dbg !137
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !75), !dbg !137
  call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !76), !dbg !138
  call void @llvm.dbg.value(metadata !{%struct.stat64* %defaults}, i64 0, metadata !77), !dbg !138
  call void @llvm.dbg.declare(metadata !{[64 x i8]* %sname}, metadata !81), !dbg !139
  %0 = call noalias i8* @malloc(i64 144) nounwind, !dbg !140
  %1 = bitcast i8* %0 to %struct.stat64*, !dbg !140
  call void @llvm.dbg.value(metadata !{%struct.stat64* %1}, i64 0, metadata !78), !dbg !140
  call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !80), !dbg !141
  %2 = load i8* %name, align 1, !dbg !141
  %3 = icmp eq i8 %2, 0, !dbg !141
  br i1 %3, label %bb2, label %bb, !dbg !141

bb:                                               ; preds = %entry, %bb.bb_crit_edge
  %4 = phi i8 [ %7, %bb.bb_crit_edge ], [ %2, %entry ]
  %indvar = phi i64 [ %phitmp, %bb.bb_crit_edge ], [ 1, %entry ]
  %5 = phi i64 [ %indvar, %bb.bb_crit_edge ], [ 0, %entry ]
  %6 = getelementptr inbounds [64 x i8]* %sname, i64 0, i64 %5, !dbg !142
  store i8 %4, i8* %6, align 1, !dbg !142
  %scevgep = getelementptr i8* %name, i64 %indvar
  %7 = load i8* %scevgep, align 1, !dbg !141
  %8 = icmp eq i8 %7, 0, !dbg !141
  br i1 %8, label %bb2, label %bb.bb_crit_edge, !dbg !141

bb.bb_crit_edge:                                  ; preds = %bb
  %phitmp = add i64 %indvar, 1
  br label %bb

bb2:                                              ; preds = %bb, %entry
  %.lcssa = phi i64 [ 0, %entry ], [ %indvar, %bb ]
  %9 = getelementptr inbounds [64 x i8]* %sname, i64 0, i64 %.lcssa, !dbg !143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), i64 6, i32 1, i1 false), !dbg !143
  %10 = icmp eq i32 %size, 0, !dbg !144
  br i1 %10, label %bb3, label %bb4, !dbg !144

bb3:                                              ; preds = %bb2
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 55, i8* getelementptr inbounds ([19 x i8]* @__PRETTY_FUNCTION__.4418, i64 0, i64 0)) noreturn nounwind, !dbg !144
  unreachable, !dbg !144

bb4:                                              ; preds = %bb2
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 0, !dbg !145
  store i32 %size, i32* %11, align 8, !dbg !145
  %12 = zext i32 %size to i64, !dbg !146
  %13 = call noalias i8* @malloc(i64 %12) nounwind, !dbg !146
  %14 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 1, !dbg !146
  store i8* %13, i8** %14, align 8, !dbg !146
  call void @klee_make_symbolic(i8* %13, i64 %12, i8* %name) nounwind, !dbg !147
  %sname5 = getelementptr inbounds [64 x i8]* %sname, i64 0, i64 0
  call void @klee_make_symbolic(i8* %0, i64 144, i8* %sname5) nounwind, !dbg !148
  %15 = getelementptr inbounds i8* %0, i64 8
  %16 = bitcast i8* %15 to i64*
  %17 = load i64* %16, align 8, !dbg !149
  %18 = call i32 @klee_is_symbolic(i64 %17) nounwind, !dbg !149
  %19 = icmp eq i32 %18, 0, !dbg !149
  %20 = load i64* %16, align 8, !dbg !149
  br i1 %19, label %bb6, label %bb8, !dbg !149

bb6:                                              ; preds = %bb4
  %21 = and i64 %20, 2147483647, !dbg !149
  %22 = icmp eq i64 %21, 0, !dbg !149
  br i1 %22, label %bb7, label %bb8, !dbg !149

bb7:                                              ; preds = %bb6
  %23 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 1, !dbg !150
  %24 = load i64* %23, align 8, !dbg !150
  store i64 %24, i64* %16, align 8, !dbg !150
  br label %bb8, !dbg !150

bb8:                                              ; preds = %bb4, %bb7, %bb6
  %25 = phi i64 [ %24, %bb7 ], [ %20, %bb6 ], [ %20, %bb4 ]
  %26 = and i64 %25, 2147483647, !dbg !151
  %27 = icmp ne i64 %26, 0, !dbg !151
  %28 = zext i1 %27 to i64, !dbg !151
  call void @klee_assume(i64 %28) nounwind, !dbg !151
  %29 = getelementptr inbounds i8* %0, i64 56
  %30 = bitcast i8* %29 to i64*
  %31 = load i64* %30, align 8, !dbg !152
  %32 = icmp ult i64 %31, 65536
  %33 = zext i1 %32 to i64, !dbg !152
  call void @klee_assume(i64 %33) nounwind, !dbg !152
  %34 = getelementptr inbounds i8* %0, i64 24
  %35 = bitcast i8* %34 to i32*
  %36 = load i32* %35, align 8, !dbg !153
  %37 = and i32 %36, -61952, !dbg !153
  %38 = icmp eq i32 %37, 0, !dbg !153
  %39 = zext i1 %38 to i64, !dbg !153
  call void @klee_prefer_cex(i8* %0, i64 %39) nounwind, !dbg !153
  %40 = bitcast i8* %0 to i64*
  %41 = load i64* %40, align 8, !dbg !154
  %42 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 0, !dbg !154
  %43 = load i64* %42, align 8, !dbg !154
  %44 = icmp eq i64 %41, %43, !dbg !154
  %45 = zext i1 %44 to i64, !dbg !154
  call void @klee_prefer_cex(i8* %0, i64 %45) nounwind, !dbg !154
  %46 = getelementptr inbounds i8* %0, i64 40
  %47 = bitcast i8* %46 to i64*
  %48 = load i64* %47, align 8, !dbg !155
  %49 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 7, !dbg !155
  %50 = load i64* %49, align 8, !dbg !155
  %51 = icmp eq i64 %48, %50, !dbg !155
  %52 = zext i1 %51 to i64, !dbg !155
  call void @klee_prefer_cex(i8* %0, i64 %52) nounwind, !dbg !155
  %53 = load i32* %35, align 8, !dbg !156
  %54 = and i32 %53, 448, !dbg !156
  %55 = icmp eq i32 %54, 384, !dbg !156
  %56 = zext i1 %55 to i64, !dbg !156
  call void @klee_prefer_cex(i8* %0, i64 %56) nounwind, !dbg !156
  %57 = load i32* %35, align 8, !dbg !157
  %58 = and i32 %57, 56, !dbg !157
  %59 = icmp eq i32 %58, 16, !dbg !157
  %60 = zext i1 %59 to i64, !dbg !157
  call void @klee_prefer_cex(i8* %0, i64 %60) nounwind, !dbg !157
  %61 = load i32* %35, align 8, !dbg !158
  %62 = and i32 %61, 7, !dbg !158
  %63 = icmp eq i32 %62, 2, !dbg !158
  %64 = zext i1 %63 to i64, !dbg !158
  call void @klee_prefer_cex(i8* %0, i64 %64) nounwind, !dbg !158
  %65 = load i32* %35, align 8, !dbg !159
  %66 = and i32 %65, 61440, !dbg !159
  %67 = icmp eq i32 %66, 32768, !dbg !159
  %68 = zext i1 %67 to i64, !dbg !159
  call void @klee_prefer_cex(i8* %0, i64 %68) nounwind, !dbg !159
  %69 = getelementptr inbounds i8* %0, i64 16
  %70 = bitcast i8* %69 to i64*
  %71 = load i64* %70, align 8, !dbg !160
  %72 = icmp eq i64 %71, 1, !dbg !160
  %73 = zext i1 %72 to i64, !dbg !160
  call void @klee_prefer_cex(i8* %0, i64 %73) nounwind, !dbg !160
  %74 = getelementptr inbounds i8* %0, i64 28
  %75 = bitcast i8* %74 to i32*
  %76 = load i32* %75, align 4, !dbg !161
  %77 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 4, !dbg !161
  %78 = load i32* %77, align 4, !dbg !161
  %79 = icmp eq i32 %76, %78, !dbg !161
  %80 = zext i1 %79 to i64, !dbg !161
  call void @klee_prefer_cex(i8* %0, i64 %80) nounwind, !dbg !161
  %81 = getelementptr inbounds i8* %0, i64 32
  %82 = bitcast i8* %81 to i32*
  %83 = load i32* %82, align 8, !dbg !162
  %84 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 5, !dbg !162
  %85 = load i32* %84, align 8, !dbg !162
  %86 = icmp eq i32 %83, %85, !dbg !162
  %87 = zext i1 %86 to i64, !dbg !162
  call void @klee_prefer_cex(i8* %0, i64 %87) nounwind, !dbg !162
  %88 = load i64* %30, align 8, !dbg !163
  %89 = icmp eq i64 %88, 4096, !dbg !163
  %90 = zext i1 %89 to i64, !dbg !163
  call void @klee_prefer_cex(i8* %0, i64 %90) nounwind, !dbg !163
  %91 = getelementptr inbounds i8* %0, i64 72
  %92 = bitcast i8* %91 to i64*
  %93 = load i64* %92, align 8, !dbg !164
  %94 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 11, i32 0
  %95 = load i64* %94, align 8, !dbg !164
  %96 = icmp eq i64 %93, %95, !dbg !164
  %97 = zext i1 %96 to i64, !dbg !164
  call void @klee_prefer_cex(i8* %0, i64 %97) nounwind, !dbg !164
  %98 = getelementptr inbounds i8* %0, i64 88
  %99 = bitcast i8* %98 to i64*
  %100 = load i64* %99, align 8, !dbg !165
  %101 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 12, i32 0
  %102 = load i64* %101, align 8, !dbg !165
  %103 = icmp eq i64 %100, %102, !dbg !165
  %104 = zext i1 %103 to i64, !dbg !165
  call void @klee_prefer_cex(i8* %0, i64 %104) nounwind, !dbg !165
  %105 = getelementptr inbounds i8* %0, i64 104
  %106 = bitcast i8* %105 to i64*
  %107 = load i64* %106, align 8, !dbg !166
  %108 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 13, i32 0
  %109 = load i64* %108, align 8, !dbg !166
  %110 = icmp eq i64 %107, %109, !dbg !166
  %111 = zext i1 %110 to i64, !dbg !166
  call void @klee_prefer_cex(i8* %0, i64 %111) nounwind, !dbg !166
  %112 = load i32* %11, align 8, !dbg !167
  %113 = zext i32 %112 to i64, !dbg !167
  %114 = getelementptr inbounds i8* %0, i64 48
  %115 = bitcast i8* %114 to i64*
  store i64 %113, i64* %115, align 8, !dbg !167
  %116 = getelementptr inbounds i8* %0, i64 64
  %117 = bitcast i8* %116 to i64*
  store i64 8, i64* %117, align 8, !dbg !168
  %118 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 2, !dbg !169
  store %struct.stat64* %1, %struct.stat64** %118, align 8, !dbg !169
  ret void, !dbg !170
}

declare noalias i8* @malloc(i64) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

declare i32 @klee_is_symbolic(i64)

declare void @klee_assume(i64)

declare void @klee_prefer_cex(i8*, i64)

define void @klee_init_fds(i32 %n_files, i32 %file_length, i32 %sym_stdout_flag, i32 %save_all_writes_flag, i32 %max_failures) nounwind {
entry:
  %x.i = alloca i32, align 4
  %name = alloca [7 x i8], align 1
  %s = alloca %struct.stat64, align 8
  call void @llvm.dbg.value(metadata !{i32 %n_files}, i64 0, metadata !85), !dbg !171
  call void @llvm.dbg.value(metadata !{i32 %file_length}, i64 0, metadata !86), !dbg !171
  call void @llvm.dbg.value(metadata !{i32 %sym_stdout_flag}, i64 0, metadata !87), !dbg !172
  call void @llvm.dbg.value(metadata !{i32 %save_all_writes_flag}, i64 0, metadata !88), !dbg !172
  call void @llvm.dbg.value(metadata !{i32 %max_failures}, i64 0, metadata !89), !dbg !173
  call void @llvm.dbg.declare(metadata !{[7 x i8]* %name}, metadata !92), !dbg !174
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %s}, metadata !96), !dbg !175
  %0 = getelementptr inbounds [7 x i8]* %name, i64 0, i64 0, !dbg !174
  store i8 63, i8* %0, align 1, !dbg !174
  %1 = getelementptr inbounds [7 x i8]* %name, i64 0, i64 1, !dbg !174
  store i8 45, i8* %1, align 1, !dbg !174
  %2 = getelementptr inbounds [7 x i8]* %name, i64 0, i64 2, !dbg !174
  store i8 100, i8* %2, align 1, !dbg !174
  %3 = getelementptr inbounds [7 x i8]* %name, i64 0, i64 3, !dbg !174
  store i8 97, i8* %3, align 1, !dbg !174
  %4 = getelementptr inbounds [7 x i8]* %name, i64 0, i64 4, !dbg !174
  store i8 116, i8* %4, align 1, !dbg !174
  %5 = getelementptr inbounds [7 x i8]* %name, i64 0, i64 5, !dbg !174
  store i8 97, i8* %5, align 1, !dbg !174
  %6 = getelementptr inbounds [7 x i8]* %name, i64 0, i64 6, !dbg !174
  store i8 0, i8* %6, align 1, !dbg !174
  call void @llvm.dbg.value(metadata !176, i64 0, metadata !72) nounwind, !dbg !177
  call void @llvm.dbg.value(metadata !{%struct.stat64* %s}, i64 0, metadata !73) nounwind, !dbg !177
  %7 = call i32 @__xstat64(i32 1, i8* getelementptr inbounds ([2 x i8]* @.str4, i64 0, i64 0), %struct.stat64* %s) nounwind, !dbg !179
  store i32 %n_files, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 32, !dbg !181
  %8 = zext i32 %n_files to i64, !dbg !182
  %9 = mul i64 %8, 24, !dbg !182
  %10 = call noalias i8* @malloc(i64 %9) nounwind, !dbg !182
  %11 = bitcast i8* %10 to %struct.exe_disk_file_t*, !dbg !182
  store %struct.exe_disk_file_t* %11, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 32, !dbg !182
  call void @llvm.dbg.value(metadata !183, i64 0, metadata !90), !dbg !184
  %12 = icmp eq i32 %n_files, 0
  br i1 %12, label %bb3, label %bb, !dbg !184

bb:                                               ; preds = %entry, %bb.bb_crit_edge
  %13 = phi %struct.exe_disk_file_t* [ %.pre, %bb.bb_crit_edge ], [ %11, %entry ]
  %indvar = phi i64 [ %indvar.next, %bb.bb_crit_edge ], [ 0, %entry ]
  %tmp13 = add i64 %indvar, 65
  %tmp14 = trunc i64 %tmp13 to i8
  store i8 %tmp14, i8* %0, align 1, !dbg !185
  %scevgep = getelementptr %struct.exe_disk_file_t* %13, i64 %indvar
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %scevgep, i32 %file_length, i8* %0, %struct.stat64* %s) nounwind, !dbg !186
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %8
  br i1 %exitcond, label %bb3, label %bb.bb_crit_edge, !dbg !184

bb.bb_crit_edge:                                  ; preds = %bb
  %.pre = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 32
  br label %bb

bb3:                                              ; preds = %bb, %entry
  %14 = icmp eq i32 %file_length, 0, !dbg !187
  br i1 %14, label %bb5, label %bb4, !dbg !187

bb4:                                              ; preds = %bb3
  %15 = call noalias i8* @malloc(i64 24) nounwind, !dbg !188
  %16 = bitcast i8* %15 to %struct.exe_disk_file_t*, !dbg !188
  store %struct.exe_disk_file_t* %16, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !188
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %16, i32 %file_length, i8* getelementptr inbounds ([6 x i8]* @.str5, i64 0, i64 0), %struct.stat64* %s) nounwind, !dbg !189
  %17 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !190
  store %struct.exe_disk_file_t* %17, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 0, i32 3), align 16, !dbg !190
  br label %bb6, !dbg !190

bb5:                                              ; preds = %bb3
  store %struct.exe_disk_file_t* null, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !191
  br label %bb6, !dbg !191

bb6:                                              ; preds = %bb5, %bb4
  store i32 %max_failures, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !192
  %18 = icmp eq i32 %max_failures, 0, !dbg !193
  br i1 %18, label %bb8, label %bb7, !dbg !193

bb7:                                              ; preds = %bb6
  %19 = call noalias i8* @malloc(i64 4) nounwind, !dbg !194
  %20 = bitcast i8* %19 to i32*, !dbg !194
  store i32* %20, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 6), align 16, !dbg !194
  %21 = call noalias i8* @malloc(i64 4) nounwind, !dbg !195
  %22 = bitcast i8* %21 to i32*, !dbg !195
  store i32* %22, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !195
  %23 = call noalias i8* @malloc(i64 4) nounwind, !dbg !196
  %24 = bitcast i8* %23 to i32*, !dbg !196
  store i32* %24, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 32, !dbg !196
  %25 = call noalias i8* @malloc(i64 4) nounwind, !dbg !197
  %26 = bitcast i8* %25 to i32*, !dbg !197
  store i32* %26, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !197
  %27 = call noalias i8* @malloc(i64 4) nounwind, !dbg !198
  %28 = bitcast i8* %27 to i32*, !dbg !198
  store i32* %28, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 16, !dbg !198
  call void @klee_make_symbolic(i8* %19, i64 4, i8* getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0)) nounwind, !dbg !199
  %29 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !200
  %30 = bitcast i32* %29 to i8*, !dbg !200
  call void @klee_make_symbolic(i8* %30, i64 4, i8* getelementptr inbounds ([11 x i8]* @.str7, i64 0, i64 0)) nounwind, !dbg !200
  %31 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 32, !dbg !201
  %32 = bitcast i32* %31 to i8*, !dbg !201
  call void @klee_make_symbolic(i8* %32, i64 4, i8* getelementptr inbounds ([11 x i8]* @.str8, i64 0, i64 0)) nounwind, !dbg !201
  %33 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !202
  %34 = bitcast i32* %33 to i8*, !dbg !202
  call void @klee_make_symbolic(i8* %34, i64 4, i8* getelementptr inbounds ([15 x i8]* @.str9, i64 0, i64 0)) nounwind, !dbg !202
  %35 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 16, !dbg !203
  %36 = bitcast i32* %35 to i8*, !dbg !203
  call void @klee_make_symbolic(i8* %36, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str10, i64 0, i64 0)) nounwind, !dbg !203
  br label %bb8, !dbg !203

bb8:                                              ; preds = %bb6, %bb7
  %37 = icmp eq i32 %sym_stdout_flag, 0, !dbg !204
  br i1 %37, label %bb10, label %bb9, !dbg !204

bb9:                                              ; preds = %bb8
  %38 = call noalias i8* @malloc(i64 24) nounwind, !dbg !205
  %39 = bitcast i8* %38 to %struct.exe_disk_file_t*, !dbg !205
  store %struct.exe_disk_file_t* %39, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 16, !dbg !205
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %39, i32 1024, i8* getelementptr inbounds ([7 x i8]* @.str11, i64 0, i64 0), %struct.stat64* %s) nounwind, !dbg !206
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 16, !dbg !207
  store %struct.exe_disk_file_t* %40, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 1, i32 3), align 8, !dbg !207
  store i32 0, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !208
  br label %bb11, !dbg !208

bb10:                                             ; preds = %bb8
  store %struct.exe_disk_file_t* null, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 16, !dbg !209
  br label %bb11, !dbg !209

bb11:                                             ; preds = %bb10, %bb9
  store i32 %save_all_writes_flag, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 3), align 8, !dbg !210
  call void @llvm.dbg.value(metadata !211, i64 0, metadata !69) nounwind, !dbg !212
  call void @llvm.dbg.declare(metadata !{i32* %x.i}, metadata !70) nounwind, !dbg !214
  %x1.i = bitcast i32* %x.i to i8*, !dbg !215
  call void @klee_make_symbolic(i8* %x1.i, i64 4, i8* getelementptr inbounds ([14 x i8]* @.str12, i64 0, i64 0)) nounwind, !dbg !215
  %41 = load i32* %x.i, align 4, !dbg !216
  store i32 %41, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 2), align 4, !dbg !213
  %42 = icmp eq i32 %41, 1, !dbg !217
  %43 = zext i1 %42 to i64, !dbg !217
  call void @klee_assume(i64 %43) nounwind, !dbg !217
  ret void, !dbg !218
}

!llvm.dbg.sp = !{!0, !9, !55, !66}
!llvm.dbg.lv.__sym_uint32 = !{!69, !70}
!llvm.dbg.lv.stat64 = !{!72, !73}
!llvm.dbg.lv.__create_new_dfile = !{!74, !75, !76, !77, !78, !80, !81}
!llvm.dbg.lv.klee_init_fds = !{!85, !86, !87, !88, !89, !90, !92, !96}
!llvm.dbg.gv = !{!97, !119}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__sym_uint32", metadata !"__sym_uint32", metadata !"", metadata !1, i32 97, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"fd_init.c", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"fd_init.c", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !6}
!5 = metadata !{i32 524324, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 524326, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ]
!8 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 524334, i32 0, metadata !1, metadata !"stat64", metadata !"stat64", metadata !"stat64", metadata !10, i32 505, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!10 = metadata !{i32 524329, metadata !"stat.h", metadata !"/usr/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!11 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null} ; [ DW_TAG_subroutine_type ]
!12 = metadata !{metadata !13, metadata !6, metadata !14}
!13 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!14 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ]
!15 = metadata !{i32 524307, metadata !1, metadata !"stat64", metadata !16, i32 23, i64 1152, i64 64, i64 0, i32 0, null, metadata !17, i32 0, null} ; [ DW_TAG_structure_type ]
!16 = metadata !{i32 524329, metadata !"fd.h", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!17 = metadata !{metadata !18, metadata !23, metadata !25, metadata !27, metadata !29, metadata !31, metadata !33, metadata !34, metadata !35, metadata !38, metadata !40, metadata !42, metadata !49, metadata !50, metadata !51}
!18 = metadata !{i32 524301, metadata !15, metadata !"st_dev", metadata !19, i32 121, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ]
!19 = metadata !{i32 524329, metadata !"stat.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!20 = metadata !{i32 524310, metadata !21, metadata !"__dev_t", metadata !21, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_typedef ]
!21 = metadata !{i32 524329, metadata !"types.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!22 = metadata !{i32 524324, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!23 = metadata !{i32 524301, metadata !15, metadata !"st_ino", metadata !19, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !24} ; [ DW_TAG_member ]
!24 = metadata !{i32 524310, metadata !21, metadata !"__ino64_t", metadata !21, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_typedef ]
!25 = metadata !{i32 524301, metadata !15, metadata !"st_nlink", metadata !19, i32 124, i64 64, i64 64, i64 128, i32 0, metadata !26} ; [ DW_TAG_member ]
!26 = metadata !{i32 524310, metadata !21, metadata !"__nlink_t", metadata !21, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_typedef ]
!27 = metadata !{i32 524301, metadata !15, metadata !"st_mode", metadata !19, i32 125, i64 32, i64 32, i64 192, i32 0, metadata !28} ; [ DW_TAG_member ]
!28 = metadata !{i32 524310, metadata !21, metadata !"__mode_t", metadata !21, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !5} ; [ DW_TAG_typedef ]
!29 = metadata !{i32 524301, metadata !15, metadata !"st_uid", metadata !19, i32 132, i64 32, i64 32, i64 224, i32 0, metadata !30} ; [ DW_TAG_member ]
!30 = metadata !{i32 524310, metadata !21, metadata !"__uid_t", metadata !21, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !5} ; [ DW_TAG_typedef ]
!31 = metadata !{i32 524301, metadata !15, metadata !"st_gid", metadata !19, i32 133, i64 32, i64 32, i64 256, i32 0, metadata !32} ; [ DW_TAG_member ]
!32 = metadata !{i32 524310, metadata !21, metadata !"__gid_t", metadata !21, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !5} ; [ DW_TAG_typedef ]
!33 = metadata !{i32 524301, metadata !15, metadata !"__pad0", metadata !19, i32 135, i64 32, i64 32, i64 288, i32 0, metadata !13} ; [ DW_TAG_member ]
!34 = metadata !{i32 524301, metadata !15, metadata !"st_rdev", metadata !19, i32 136, i64 64, i64 64, i64 320, i32 0, metadata !20} ; [ DW_TAG_member ]
!35 = metadata !{i32 524301, metadata !15, metadata !"st_size", metadata !19, i32 137, i64 64, i64 64, i64 384, i32 0, metadata !36} ; [ DW_TAG_member ]
!36 = metadata !{i32 524310, metadata !21, metadata !"__off_t", metadata !21, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_typedef ]
!37 = metadata !{i32 524324, metadata !1, metadata !"long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!38 = metadata !{i32 524301, metadata !15, metadata !"st_blksize", metadata !19, i32 143, i64 64, i64 64, i64 448, i32 0, metadata !39} ; [ DW_TAG_member ]
!39 = metadata !{i32 524310, metadata !21, metadata !"__blksize_t", metadata !21, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_typedef ]
!40 = metadata !{i32 524301, metadata !15, metadata !"st_blocks", metadata !19, i32 144, i64 64, i64 64, i64 512, i32 0, metadata !41} ; [ DW_TAG_member ]
!41 = metadata !{i32 524310, metadata !21, metadata !"__blkcnt64_t", metadata !21, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_typedef ]
!42 = metadata !{i32 524301, metadata !15, metadata !"st_atim", metadata !19, i32 152, i64 128, i64 64, i64 576, i32 0, metadata !43} ; [ DW_TAG_member ]
!43 = metadata !{i32 524307, metadata !1, metadata !"timespec", metadata !44, i32 121, i64 128, i64 64, i64 0, i32 0, null, metadata !45, i32 0, null} ; [ DW_TAG_structure_type ]
!44 = metadata !{i32 524329, metadata !"time.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!45 = metadata !{metadata !46, metadata !48}
!46 = metadata !{i32 524301, metadata !43, metadata !"tv_sec", metadata !44, i32 122, i64 64, i64 64, i64 0, i32 0, metadata !47} ; [ DW_TAG_member ]
!47 = metadata !{i32 524310, metadata !21, metadata !"__time_t", metadata !21, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_typedef ]
!48 = metadata !{i32 524301, metadata !43, metadata !"tv_nsec", metadata !44, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !37} ; [ DW_TAG_member ]
!49 = metadata !{i32 524301, metadata !15, metadata !"st_mtim", metadata !19, i32 153, i64 128, i64 64, i64 704, i32 0, metadata !43} ; [ DW_TAG_member ]
!50 = metadata !{i32 524301, metadata !15, metadata !"st_ctim", metadata !19, i32 154, i64 128, i64 64, i64 832, i32 0, metadata !43} ; [ DW_TAG_member ]
!51 = metadata !{i32 524301, metadata !15, metadata !"__unused", metadata !19, i32 167, i64 192, i64 64, i64 960, i32 0, metadata !52} ; [ DW_TAG_member ]
!52 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 192, i64 64, i64 0, i32 0, metadata !37, metadata !53, i32 0, null} ; [ DW_TAG_array_type ]
!53 = metadata !{metadata !54}
!54 = metadata !{i32 524321, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!55 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__create_new_dfile", metadata !"__create_new_dfile", metadata !"", metadata !1, i32 47, metadata !56, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, void (%struct.exe_disk_file_t*, i32, i8*, %struct.stat64*)* @__create_new_dfile} ; [ DW_TAG_subprogram ]
!56 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !57, i32 0, null} ; [ DW_TAG_subroutine_type ]
!57 = metadata !{null, metadata !58, metadata !5, metadata !6, metadata !14}
!58 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ]
!59 = metadata !{i32 524310, metadata !16, metadata !"exe_disk_file_t", metadata !16, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ]
!60 = metadata !{i32 524307, metadata !1, metadata !"", metadata !16, i32 20, i64 192, i64 64, i64 0, i32 0, null, metadata !61, i32 0, null} ; [ DW_TAG_structure_type ]
!61 = metadata !{metadata !62, metadata !63, metadata !65}
!62 = metadata !{i32 524301, metadata !60, metadata !"size", metadata !16, i32 21, i64 32, i64 32, i64 0, i32 0, metadata !5} ; [ DW_TAG_member ]
!63 = metadata !{i32 524301, metadata !60, metadata !"contents", metadata !16, i32 22, i64 64, i64 64, i64 64, i32 0, metadata !64} ; [ DW_TAG_member ]
!64 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!65 = metadata !{i32 524301, metadata !60, metadata !"stat", metadata !16, i32 23, i64 64, i64 64, i64 128, i32 0, metadata !14} ; [ DW_TAG_member ]
!66 = metadata !{i32 524334, i32 0, metadata !1, metadata !"klee_init_fds", metadata !"klee_init_fds", metadata !"klee_init_fds", metadata !1, i32 112, metadata !67, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, void (i32, i32, i32, i32, i32)* @klee_init_fds} ; [ DW_TAG_subprogram ]
!67 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !68, i32 0, null} ; [ DW_TAG_subroutine_type ]
!68 = metadata !{null, metadata !5, metadata !5, metadata !13, metadata !13, metadata !5}
!69 = metadata !{i32 524545, metadata !0, metadata !"name", metadata !1, i32 97, metadata !6} ; [ DW_TAG_arg_variable ]
!70 = metadata !{i32 524544, metadata !71, metadata !"x", metadata !1, i32 98, metadata !5} ; [ DW_TAG_auto_variable ]
!71 = metadata !{i32 524299, metadata !0, i32 97, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!72 = metadata !{i32 524545, metadata !9, metadata !"__path", metadata !10, i32 504, metadata !6} ; [ DW_TAG_arg_variable ]
!73 = metadata !{i32 524545, metadata !9, metadata !"__statbuf", metadata !10, i32 504, metadata !14} ; [ DW_TAG_arg_variable ]
!74 = metadata !{i32 524545, metadata !55, metadata !"dfile", metadata !1, i32 46, metadata !58} ; [ DW_TAG_arg_variable ]
!75 = metadata !{i32 524545, metadata !55, metadata !"size", metadata !1, i32 46, metadata !5} ; [ DW_TAG_arg_variable ]
!76 = metadata !{i32 524545, metadata !55, metadata !"name", metadata !1, i32 47, metadata !6} ; [ DW_TAG_arg_variable ]
!77 = metadata !{i32 524545, metadata !55, metadata !"defaults", metadata !1, i32 47, metadata !14} ; [ DW_TAG_arg_variable ]
!78 = metadata !{i32 524544, metadata !79, metadata !"s", metadata !1, i32 48, metadata !14} ; [ DW_TAG_auto_variable ]
!79 = metadata !{i32 524299, metadata !55, i32 47, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 524544, metadata !79, metadata !"sp", metadata !1, i32 49, metadata !6} ; [ DW_TAG_auto_variable ]
!81 = metadata !{i32 524544, metadata !79, metadata !"sname", metadata !1, i32 50, metadata !82} ; [ DW_TAG_auto_variable ]
!82 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 512, i64 8, i64 0, i32 0, metadata !8, metadata !83, i32 0, null} ; [ DW_TAG_array_type ]
!83 = metadata !{metadata !84}
!84 = metadata !{i32 524321, i64 0, i64 63}       ; [ DW_TAG_subrange_type ]
!85 = metadata !{i32 524545, metadata !66, metadata !"n_files", metadata !1, i32 110, metadata !5} ; [ DW_TAG_arg_variable ]
!86 = metadata !{i32 524545, metadata !66, metadata !"file_length", metadata !1, i32 110, metadata !5} ; [ DW_TAG_arg_variable ]
!87 = metadata !{i32 524545, metadata !66, metadata !"sym_stdout_flag", metadata !1, i32 111, metadata !13} ; [ DW_TAG_arg_variable ]
!88 = metadata !{i32 524545, metadata !66, metadata !"save_all_writes_flag", metadata !1, i32 111, metadata !13} ; [ DW_TAG_arg_variable ]
!89 = metadata !{i32 524545, metadata !66, metadata !"max_failures", metadata !1, i32 112, metadata !5} ; [ DW_TAG_arg_variable ]
!90 = metadata !{i32 524544, metadata !91, metadata !"k", metadata !1, i32 113, metadata !5} ; [ DW_TAG_auto_variable ]
!91 = metadata !{i32 524299, metadata !66, i32 112, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!92 = metadata !{i32 524544, metadata !91, metadata !"name", metadata !1, i32 114, metadata !93} ; [ DW_TAG_auto_variable ]
!93 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 56, i64 8, i64 0, i32 0, metadata !8, metadata !94, i32 0, null} ; [ DW_TAG_array_type ]
!94 = metadata !{metadata !95}
!95 = metadata !{i32 524321, i64 0, i64 6}        ; [ DW_TAG_subrange_type ]
!96 = metadata !{i32 524544, metadata !91, metadata !"s", metadata !1, i32 115, metadata !15} ; [ DW_TAG_auto_variable ]
!97 = metadata !{i32 524340, i32 0, metadata !1, metadata !"__exe_env", metadata !"__exe_env", metadata !"", metadata !1, i32 37, metadata !98, i1 false, i1 true, %struct.exe_sym_env_t* @__exe_env} ; [ DW_TAG_variable ]
!98 = metadata !{i32 524310, metadata !99, metadata !"exe_sym_env_t", metadata !99, i32 49, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_typedef ]
!99 = metadata !{i32 524329, metadata !"stdint.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!100 = metadata !{i32 524307, metadata !1, metadata !"", metadata !16, i32 61, i64 6272, i64 64, i64 0, i32 0, null, metadata !101, i32 0, null} ; [ DW_TAG_structure_type ]
!101 = metadata !{metadata !102, metadata !115, metadata !117, metadata !118}
!102 = metadata !{i32 524301, metadata !100, metadata !"fds", metadata !16, i32 62, i64 6144, i64 64, i64 0, i32 0, metadata !103} ; [ DW_TAG_member ]
!103 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 6144, i64 64, i64 0, i32 0, metadata !104, metadata !113, i32 0, null} ; [ DW_TAG_array_type ]
!104 = metadata !{i32 524310, metadata !16, metadata !"exe_file_t", metadata !16, i32 42, i64 0, i64 0, i64 0, i32 0, metadata !105} ; [ DW_TAG_typedef ]
!105 = metadata !{i32 524307, metadata !1, metadata !"", metadata !16, i32 33, i64 192, i64 64, i64 0, i32 0, null, metadata !106, i32 0, null} ; [ DW_TAG_structure_type ]
!106 = metadata !{metadata !107, metadata !108, metadata !109, metadata !112}
!107 = metadata !{i32 524301, metadata !105, metadata !"fd", metadata !16, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ]
!108 = metadata !{i32 524301, metadata !105, metadata !"flags", metadata !16, i32 35, i64 32, i64 32, i64 32, i32 0, metadata !5} ; [ DW_TAG_member ]
!109 = metadata !{i32 524301, metadata !105, metadata !"off", metadata !16, i32 38, i64 64, i64 64, i64 64, i32 0, metadata !110} ; [ DW_TAG_member ]
!110 = metadata !{i32 524310, metadata !111, metadata !"off64_t", metadata !111, i32 99, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_typedef ]
!111 = metadata !{i32 524329, metadata !"types.h", metadata !"/usr/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!112 = metadata !{i32 524301, metadata !105, metadata !"dfile", metadata !16, i32 39, i64 64, i64 64, i64 128, i32 0, metadata !58} ; [ DW_TAG_member ]
!113 = metadata !{metadata !114}
!114 = metadata !{i32 524321, i64 0, i64 31}      ; [ DW_TAG_subrange_type ]
!115 = metadata !{i32 524301, metadata !100, metadata !"umask", metadata !16, i32 63, i64 32, i64 32, i64 6144, i32 0, metadata !116} ; [ DW_TAG_member ]
!116 = metadata !{i32 524310, metadata !111, metadata !"mode_t", metadata !111, i32 76, i64 0, i64 0, i64 0, i32 0, metadata !5} ; [ DW_TAG_typedef ]
!117 = metadata !{i32 524301, metadata !100, metadata !"version", metadata !16, i32 64, i64 32, i64 32, i64 6176, i32 0, metadata !5} ; [ DW_TAG_member ]
!118 = metadata !{i32 524301, metadata !100, metadata !"save_all_writes", metadata !16, i32 68, i64 32, i64 32, i64 6208, i32 0, metadata !13} ; [ DW_TAG_member ]
!119 = metadata !{i32 524340, i32 0, metadata !1, metadata !"__exe_fs", metadata !"__exe_fs", metadata !"", metadata !1, i32 24, metadata !120, i1 false, i1 true, %struct.exe_file_system_t* @__exe_fs} ; [ DW_TAG_variable ]
!120 = metadata !{i32 524310, metadata !16, metadata !"exe_file_system_t", metadata !16, i32 61, i64 0, i64 0, i64 0, i32 0, metadata !121} ; [ DW_TAG_typedef ]
!121 = metadata !{i32 524307, metadata !1, metadata !"", metadata !16, i32 42, i64 832, i64 64, i64 0, i32 0, null, metadata !122, i32 0, null} ; [ DW_TAG_structure_type ]
!122 = metadata !{metadata !123, metadata !124, metadata !125, metadata !126, metadata !127, metadata !128, metadata !129, metadata !131, metadata !132, metadata !133, metadata !134, metadata !135, metadata !136}
!123 = metadata !{i32 524301, metadata !121, metadata !"n_sym_files", metadata !16, i32 43, i64 32, i64 32, i64 0, i32 0, metadata !5} ; [ DW_TAG_member ]
!124 = metadata !{i32 524301, metadata !121, metadata !"sym_stdin", metadata !16, i32 44, i64 64, i64 64, i64 64, i32 0, metadata !58} ; [ DW_TAG_member ]
!125 = metadata !{i32 524301, metadata !121, metadata !"sym_stdout", metadata !16, i32 44, i64 64, i64 64, i64 128, i32 0, metadata !58} ; [ DW_TAG_member ]
!126 = metadata !{i32 524301, metadata !121, metadata !"stdout_writes", metadata !16, i32 45, i64 32, i64 32, i64 192, i32 0, metadata !5} ; [ DW_TAG_member ]
!127 = metadata !{i32 524301, metadata !121, metadata !"sym_files", metadata !16, i32 46, i64 64, i64 64, i64 256, i32 0, metadata !58} ; [ DW_TAG_member ]
!128 = metadata !{i32 524301, metadata !121, metadata !"max_failures", metadata !16, i32 49, i64 32, i64 32, i64 320, i32 0, metadata !5} ; [ DW_TAG_member ]
!129 = metadata !{i32 524301, metadata !121, metadata !"read_fail", metadata !16, i32 52, i64 64, i64 64, i64 384, i32 0, metadata !130} ; [ DW_TAG_member ]
!130 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ]
!131 = metadata !{i32 524301, metadata !121, metadata !"write_fail", metadata !16, i32 52, i64 64, i64 64, i64 448, i32 0, metadata !130} ; [ DW_TAG_member ]
!132 = metadata !{i32 524301, metadata !121, metadata !"close_fail", metadata !16, i32 52, i64 64, i64 64, i64 512, i32 0, metadata !130} ; [ DW_TAG_member ]
!133 = metadata !{i32 524301, metadata !121, metadata !"ftruncate_fail", metadata !16, i32 52, i64 64, i64 64, i64 576, i32 0, metadata !130} ; [ DW_TAG_member ]
!134 = metadata !{i32 524301, metadata !121, metadata !"getcwd_fail", metadata !16, i32 52, i64 64, i64 64, i64 640, i32 0, metadata !130} ; [ DW_TAG_member ]
!135 = metadata !{i32 524301, metadata !121, metadata !"chmod_fail", metadata !16, i32 53, i64 64, i64 64, i64 704, i32 0, metadata !130} ; [ DW_TAG_member ]
!136 = metadata !{i32 524301, metadata !121, metadata !"fchmod_fail", metadata !16, i32 53, i64 64, i64 64, i64 768, i32 0, metadata !130} ; [ DW_TAG_member ]
!137 = metadata !{i32 46, i32 0, metadata !55, null}
!138 = metadata !{i32 47, i32 0, metadata !55, null}
!139 = metadata !{i32 50, i32 0, metadata !79, null}
!140 = metadata !{i32 48, i32 0, metadata !79, null}
!141 = metadata !{i32 51, i32 0, metadata !79, null}
!142 = metadata !{i32 52, i32 0, metadata !79, null}
!143 = metadata !{i32 53, i32 0, metadata !79, null}
!144 = metadata !{i32 55, i32 0, metadata !79, null}
!145 = metadata !{i32 57, i32 0, metadata !79, null}
!146 = metadata !{i32 58, i32 0, metadata !79, null}
!147 = metadata !{i32 59, i32 0, metadata !79, null}
!148 = metadata !{i32 61, i32 0, metadata !79, null}
!149 = metadata !{i32 64, i32 0, metadata !79, null}
!150 = metadata !{i32 66, i32 0, metadata !79, null}
!151 = metadata !{i32 71, i32 0, metadata !79, null}
!152 = metadata !{i32 75, i32 0, metadata !79, null}
!153 = metadata !{i32 77, i32 0, metadata !79, null}
!154 = metadata !{i32 78, i32 0, metadata !79, null}
!155 = metadata !{i32 79, i32 0, metadata !79, null}
!156 = metadata !{i32 80, i32 0, metadata !79, null}
!157 = metadata !{i32 81, i32 0, metadata !79, null}
!158 = metadata !{i32 82, i32 0, metadata !79, null}
!159 = metadata !{i32 83, i32 0, metadata !79, null}
!160 = metadata !{i32 84, i32 0, metadata !79, null}
!161 = metadata !{i32 85, i32 0, metadata !79, null}
!162 = metadata !{i32 86, i32 0, metadata !79, null}
!163 = metadata !{i32 87, i32 0, metadata !79, null}
!164 = metadata !{i32 88, i32 0, metadata !79, null}
!165 = metadata !{i32 89, i32 0, metadata !79, null}
!166 = metadata !{i32 90, i32 0, metadata !79, null}
!167 = metadata !{i32 92, i32 0, metadata !79, null}
!168 = metadata !{i32 93, i32 0, metadata !79, null}
!169 = metadata !{i32 94, i32 0, metadata !79, null}
!170 = metadata !{i32 95, i32 0, metadata !79, null}
!171 = metadata !{i32 110, i32 0, metadata !66, null}
!172 = metadata !{i32 111, i32 0, metadata !66, null}
!173 = metadata !{i32 112, i32 0, metadata !66, null}
!174 = metadata !{i32 114, i32 0, metadata !91, null}
!175 = metadata !{i32 115, i32 0, metadata !91, null}
!176 = metadata !{i8* getelementptr inbounds ([2 x i8]* @.str4, i64 0, i64 0)}
!177 = metadata !{i32 504, i32 0, metadata !9, metadata !178}
!178 = metadata !{i32 117, i32 0, metadata !91, null}
!179 = metadata !{i32 506, i32 0, metadata !180, metadata !178}
!180 = metadata !{i32 524299, metadata !9, i32 505, i32 0, metadata !10, i32 1} ; [ DW_TAG_lexical_block ]
!181 = metadata !{i32 119, i32 0, metadata !91, null}
!182 = metadata !{i32 120, i32 0, metadata !91, null}
!183 = metadata !{i32 0}
!184 = metadata !{i32 121, i32 0, metadata !91, null}
!185 = metadata !{i32 122, i32 0, metadata !91, null}
!186 = metadata !{i32 123, i32 0, metadata !91, null}
!187 = metadata !{i32 127, i32 0, metadata !91, null}
!188 = metadata !{i32 128, i32 0, metadata !91, null}
!189 = metadata !{i32 129, i32 0, metadata !91, null}
!190 = metadata !{i32 130, i32 0, metadata !91, null}
!191 = metadata !{i32 132, i32 0, metadata !91, null}
!192 = metadata !{i32 134, i32 0, metadata !91, null}
!193 = metadata !{i32 135, i32 0, metadata !91, null}
!194 = metadata !{i32 136, i32 0, metadata !91, null}
!195 = metadata !{i32 137, i32 0, metadata !91, null}
!196 = metadata !{i32 138, i32 0, metadata !91, null}
!197 = metadata !{i32 139, i32 0, metadata !91, null}
!198 = metadata !{i32 140, i32 0, metadata !91, null}
!199 = metadata !{i32 142, i32 0, metadata !91, null}
!200 = metadata !{i32 143, i32 0, metadata !91, null}
!201 = metadata !{i32 144, i32 0, metadata !91, null}
!202 = metadata !{i32 145, i32 0, metadata !91, null}
!203 = metadata !{i32 146, i32 0, metadata !91, null}
!204 = metadata !{i32 150, i32 0, metadata !91, null}
!205 = metadata !{i32 151, i32 0, metadata !91, null}
!206 = metadata !{i32 152, i32 0, metadata !91, null}
!207 = metadata !{i32 153, i32 0, metadata !91, null}
!208 = metadata !{i32 154, i32 0, metadata !91, null}
!209 = metadata !{i32 156, i32 0, metadata !91, null}
!210 = metadata !{i32 158, i32 0, metadata !91, null}
!211 = metadata !{i8* getelementptr inbounds ([14 x i8]* @.str12, i64 0, i64 0)}
!212 = metadata !{i32 97, i32 0, metadata !0, metadata !213}
!213 = metadata !{i32 159, i32 0, metadata !91, null}
!214 = metadata !{i32 98, i32 0, metadata !71, metadata !213}
!215 = metadata !{i32 99, i32 0, metadata !71, metadata !213}
!216 = metadata !{i32 100, i32 0, metadata !71, metadata !213}
!217 = metadata !{i32 160, i32 0, metadata !91, null}
!218 = metadata !{i32 161, i32 0, metadata !91, null}
