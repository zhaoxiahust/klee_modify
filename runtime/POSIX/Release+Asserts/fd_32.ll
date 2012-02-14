; ModuleID = 'fd_32.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__fsid_t = type { [2 x i32] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, [5 x i64] }
%struct.timespec = type { i64, i64 }

@__getdents = alias i64 (i32, %struct.dirent*, i64)* @getdents

define i32 @open(i8* %pathname, i32 %flags, ...) nounwind {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 8
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !224), !dbg !254
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !225), !dbg !254
  call void @llvm.dbg.value(metadata !255, i64 0, metadata !226), !dbg !256
  %0 = and i32 %flags, 64, !dbg !257
  %1 = icmp eq i32 %0, 0, !dbg !257
  br i1 %1, label %bb8, label %bb, !dbg !257

bb:                                               ; preds = %entry
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !228), !dbg !258
  %ap12 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !259
  call void @llvm.va_start(i8* %ap12), !dbg !259
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %3 = load i32* %2, align 8, !dbg !260
  %4 = icmp ugt i32 %3, 47
  br i1 %4, label %bb4, label %bb3, !dbg !260

bb3:                                              ; preds = %bb
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %6 = load i8** %5, align 8, !dbg !260
  %tmp = zext i32 %3 to i64
  %7 = ptrtoint i8* %6 to i64, !dbg !260
  %8 = add i64 %tmp, %7, !dbg !260
  %9 = inttoptr i64 %8 to i8*, !dbg !260
  %10 = add i32 %3, 8, !dbg !260
  store i32 %10, i32* %2, align 8, !dbg !260
  br label %bb5, !dbg !260

bb4:                                              ; preds = %bb
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %12 = load i8** %11, align 8, !dbg !260
  %13 = getelementptr inbounds i8* %12, i64 8, !dbg !260
  store i8* %13, i8** %11, align 8, !dbg !260
  br label %bb5, !dbg !260

bb5:                                              ; preds = %bb4, %bb3
  %addr.24.0 = phi i8* [ %12, %bb4 ], [ %9, %bb3 ]
  %14 = bitcast i8* %addr.24.0 to i32*, !dbg !260
  %15 = load i32* %14, align 4, !dbg !260
  call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !226), !dbg !260
  call void @llvm.va_end(i8* %ap12), !dbg !261
  br label %bb8, !dbg !261

bb8:                                              ; preds = %entry, %bb5
  %mode.0 = phi i32 [ %15, %bb5 ], [ 0, %entry ]
  %16 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) nounwind, !dbg !262
  ret i32 %16, !dbg !262
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak i32 @fstat64(i32 %fd, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !159), !dbg !263
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !160), !dbg !263
  %0 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat* %buf) nounwind, !dbg !264
  ret i32 %0, !dbg !264
}

declare i32 @__fd_fstat(i32, %struct.stat*)

define i32 @fstat(i32 %fd, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !161), !dbg !266
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !162), !dbg !266
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !163), !dbg !267
  %0 = call i32 @__fd_fstat(i32 %fd, %struct.stat* %tmp) nounwind, !dbg !268
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !165), !dbg !268
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !157), !dbg !269
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !158), !dbg !269
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !271
  %2 = load i64* %1, align 8, !dbg !271
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !271
  store i64 %2, i64* %3, align 8, !dbg !271
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !273
  %5 = load i64* %4, align 8, !dbg !273
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !273
  store i64 %5, i64* %6, align 8, !dbg !273
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !274
  %8 = load i32* %7, align 8, !dbg !274
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !274
  store i32 %8, i32* %9, align 8, !dbg !274
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !275
  %11 = load i64* %10, align 8, !dbg !275
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !275
  store i64 %11, i64* %12, align 8, !dbg !275
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !276
  %14 = load i32* %13, align 4, !dbg !276
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !276
  store i32 %14, i32* %15, align 4, !dbg !276
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !277
  %17 = load i32* %16, align 8, !dbg !277
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !277
  store i32 %17, i32* %18, align 8, !dbg !277
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !278
  %20 = load i64* %19, align 8, !dbg !278
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !278
  store i64 %20, i64* %21, align 8, !dbg !278
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !279
  %23 = load i64* %22, align 8, !dbg !279
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !279
  store i64 %23, i64* %24, align 8, !dbg !279
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0
  %26 = load i64* %25, align 8, !dbg !280
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0
  store i64 %26, i64* %27, align 8, !dbg !280
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0
  %29 = load i64* %28, align 8, !dbg !281
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0
  store i64 %29, i64* %30, align 8, !dbg !281
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0
  %32 = load i64* %31, align 8, !dbg !282
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0
  store i64 %32, i64* %33, align 8, !dbg !282
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !283
  %35 = load i64* %34, align 8, !dbg !283
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !283
  store i64 %35, i64* %36, align 8, !dbg !283
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !284
  %38 = load i64* %37, align 8, !dbg !284
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !284
  store i64 %38, i64* %39, align 8, !dbg !284
  ret i32 %0, !dbg !285
}

define i32 @__fxstat(i32 %vers, i32 %fd, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !166), !dbg !286
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !167), !dbg !286
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !168), !dbg !286
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !169), !dbg !287
  %0 = call i32 @__fd_fstat(i32 %fd, %struct.stat* %tmp) nounwind, !dbg !288
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !171), !dbg !288
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !157), !dbg !289
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !158), !dbg !289
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !291
  %2 = load i64* %1, align 8, !dbg !291
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !291
  store i64 %2, i64* %3, align 8, !dbg !291
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !292
  %5 = load i64* %4, align 8, !dbg !292
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !292
  store i64 %5, i64* %6, align 8, !dbg !292
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !293
  %8 = load i32* %7, align 8, !dbg !293
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !293
  store i32 %8, i32* %9, align 8, !dbg !293
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !294
  %11 = load i64* %10, align 8, !dbg !294
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !294
  store i64 %11, i64* %12, align 8, !dbg !294
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !295
  %14 = load i32* %13, align 4, !dbg !295
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !295
  store i32 %14, i32* %15, align 4, !dbg !295
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !296
  %17 = load i32* %16, align 8, !dbg !296
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !296
  store i32 %17, i32* %18, align 8, !dbg !296
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !297
  %20 = load i64* %19, align 8, !dbg !297
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !297
  store i64 %20, i64* %21, align 8, !dbg !297
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !298
  %23 = load i64* %22, align 8, !dbg !298
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !298
  store i64 %23, i64* %24, align 8, !dbg !298
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0
  %26 = load i64* %25, align 8, !dbg !299
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0
  store i64 %26, i64* %27, align 8, !dbg !299
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0
  %29 = load i64* %28, align 8, !dbg !300
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0
  store i64 %29, i64* %30, align 8, !dbg !300
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0
  %32 = load i64* %31, align 8, !dbg !301
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0
  store i64 %32, i64* %33, align 8, !dbg !301
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !302
  %35 = load i64* %34, align 8, !dbg !302
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !302
  store i64 %35, i64* %36, align 8, !dbg !302
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !303
  %38 = load i64* %37, align 8, !dbg !303
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !303
  store i64 %38, i64* %39, align 8, !dbg !303
  ret i32 %0, !dbg !304
}

define weak i32 @lstat64(i8* %path, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !172), !dbg !305
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !173), !dbg !305
  %0 = tail call i32 @__fd_lstat(i8* %path, %struct.stat* %buf) nounwind, !dbg !306
  ret i32 %0, !dbg !306
}

declare i32 @__fd_lstat(i8*, %struct.stat*)

define i32 @lstat(i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !174), !dbg !308
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !175), !dbg !308
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !176), !dbg !309
  %0 = call i32 @__fd_lstat(i8* %path, %struct.stat* %tmp) nounwind, !dbg !310
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !178), !dbg !310
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !157), !dbg !311
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !158), !dbg !311
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !313
  %2 = load i64* %1, align 8, !dbg !313
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !313
  store i64 %2, i64* %3, align 8, !dbg !313
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !314
  %5 = load i64* %4, align 8, !dbg !314
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !314
  store i64 %5, i64* %6, align 8, !dbg !314
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !315
  %8 = load i32* %7, align 8, !dbg !315
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !315
  store i32 %8, i32* %9, align 8, !dbg !315
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !316
  %11 = load i64* %10, align 8, !dbg !316
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !316
  store i64 %11, i64* %12, align 8, !dbg !316
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !317
  %14 = load i32* %13, align 4, !dbg !317
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !317
  store i32 %14, i32* %15, align 4, !dbg !317
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !318
  %17 = load i32* %16, align 8, !dbg !318
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !318
  store i32 %17, i32* %18, align 8, !dbg !318
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !319
  %20 = load i64* %19, align 8, !dbg !319
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !319
  store i64 %20, i64* %21, align 8, !dbg !319
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !320
  %23 = load i64* %22, align 8, !dbg !320
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !320
  store i64 %23, i64* %24, align 8, !dbg !320
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0
  %26 = load i64* %25, align 8, !dbg !321
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0
  store i64 %26, i64* %27, align 8, !dbg !321
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0
  %29 = load i64* %28, align 8, !dbg !322
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0
  store i64 %29, i64* %30, align 8, !dbg !322
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0
  %32 = load i64* %31, align 8, !dbg !323
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0
  store i64 %32, i64* %33, align 8, !dbg !323
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !324
  %35 = load i64* %34, align 8, !dbg !324
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !324
  store i64 %35, i64* %36, align 8, !dbg !324
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !325
  %38 = load i64* %37, align 8, !dbg !325
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !325
  store i64 %38, i64* %39, align 8, !dbg !325
  ret i32 %0, !dbg !326
}

define i32 @__lxstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !179), !dbg !327
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !180), !dbg !327
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !181), !dbg !327
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !182), !dbg !328
  %0 = call i32 @__fd_lstat(i8* %path, %struct.stat* %tmp) nounwind, !dbg !329
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !184), !dbg !329
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !157), !dbg !330
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !158), !dbg !330
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !332
  %2 = load i64* %1, align 8, !dbg !332
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !332
  store i64 %2, i64* %3, align 8, !dbg !332
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !333
  %5 = load i64* %4, align 8, !dbg !333
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !333
  store i64 %5, i64* %6, align 8, !dbg !333
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !334
  %8 = load i32* %7, align 8, !dbg !334
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !334
  store i32 %8, i32* %9, align 8, !dbg !334
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !335
  %11 = load i64* %10, align 8, !dbg !335
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !335
  store i64 %11, i64* %12, align 8, !dbg !335
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !336
  %14 = load i32* %13, align 4, !dbg !336
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !336
  store i32 %14, i32* %15, align 4, !dbg !336
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !337
  %17 = load i32* %16, align 8, !dbg !337
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !337
  store i32 %17, i32* %18, align 8, !dbg !337
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !338
  %20 = load i64* %19, align 8, !dbg !338
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !338
  store i64 %20, i64* %21, align 8, !dbg !338
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !339
  %23 = load i64* %22, align 8, !dbg !339
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !339
  store i64 %23, i64* %24, align 8, !dbg !339
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0
  %26 = load i64* %25, align 8, !dbg !340
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0
  store i64 %26, i64* %27, align 8, !dbg !340
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0
  %29 = load i64* %28, align 8, !dbg !341
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0
  store i64 %29, i64* %30, align 8, !dbg !341
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0
  %32 = load i64* %31, align 8, !dbg !342
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0
  store i64 %32, i64* %33, align 8, !dbg !342
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !343
  %35 = load i64* %34, align 8, !dbg !343
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !343
  store i64 %35, i64* %36, align 8, !dbg !343
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !344
  %38 = load i64* %37, align 8, !dbg !344
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !344
  store i64 %38, i64* %39, align 8, !dbg !344
  ret i32 %0, !dbg !345
}

define weak i32 @stat64(i8* %path, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !185), !dbg !346
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !186), !dbg !346
  %0 = tail call i32 @__fd_stat(i8* %path, %struct.stat* %buf) nounwind, !dbg !347
  ret i32 %0, !dbg !347
}

declare i32 @__fd_stat(i8*, %struct.stat*)

define i32 @stat(i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !187), !dbg !349
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !188), !dbg !349
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !189), !dbg !350
  %0 = call i32 @__fd_stat(i8* %path, %struct.stat* %tmp) nounwind, !dbg !351
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !191), !dbg !351
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !157), !dbg !352
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !158), !dbg !352
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !354
  %2 = load i64* %1, align 8, !dbg !354
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !354
  store i64 %2, i64* %3, align 8, !dbg !354
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !355
  %5 = load i64* %4, align 8, !dbg !355
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !355
  store i64 %5, i64* %6, align 8, !dbg !355
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !356
  %8 = load i32* %7, align 8, !dbg !356
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !356
  store i32 %8, i32* %9, align 8, !dbg !356
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !357
  %11 = load i64* %10, align 8, !dbg !357
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !357
  store i64 %11, i64* %12, align 8, !dbg !357
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !358
  %14 = load i32* %13, align 4, !dbg !358
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !358
  store i32 %14, i32* %15, align 4, !dbg !358
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !359
  %17 = load i32* %16, align 8, !dbg !359
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !359
  store i32 %17, i32* %18, align 8, !dbg !359
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !360
  %20 = load i64* %19, align 8, !dbg !360
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !360
  store i64 %20, i64* %21, align 8, !dbg !360
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !361
  %23 = load i64* %22, align 8, !dbg !361
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !361
  store i64 %23, i64* %24, align 8, !dbg !361
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0
  %26 = load i64* %25, align 8, !dbg !362
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0
  store i64 %26, i64* %27, align 8, !dbg !362
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0
  %29 = load i64* %28, align 8, !dbg !363
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0
  store i64 %29, i64* %30, align 8, !dbg !363
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0
  %32 = load i64* %31, align 8, !dbg !364
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0
  store i64 %32, i64* %33, align 8, !dbg !364
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !365
  %35 = load i64* %34, align 8, !dbg !365
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !365
  store i64 %35, i64* %36, align 8, !dbg !365
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !366
  %38 = load i64* %37, align 8, !dbg !366
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !366
  store i64 %38, i64* %39, align 8, !dbg !366
  ret i32 %0, !dbg !367
}

define i32 @__xstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !192), !dbg !368
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !193), !dbg !368
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !194), !dbg !368
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tmp}, metadata !195), !dbg !369
  %0 = call i32 @__fd_stat(i8* %path, %struct.stat* %tmp) nounwind, !dbg !370
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !197), !dbg !370
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %tmp}, i64 0, metadata !157), !dbg !371
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !158), !dbg !371
  %1 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 0, !dbg !373
  %2 = load i64* %1, align 8, !dbg !373
  %3 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 0, !dbg !373
  store i64 %2, i64* %3, align 8, !dbg !373
  %4 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 1, !dbg !374
  %5 = load i64* %4, align 8, !dbg !374
  %6 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 1, !dbg !374
  store i64 %5, i64* %6, align 8, !dbg !374
  %7 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 3, !dbg !375
  %8 = load i32* %7, align 8, !dbg !375
  %9 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !375
  store i32 %8, i32* %9, align 8, !dbg !375
  %10 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 2, !dbg !376
  %11 = load i64* %10, align 8, !dbg !376
  %12 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !376
  store i64 %11, i64* %12, align 8, !dbg !376
  %13 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 4, !dbg !377
  %14 = load i32* %13, align 4, !dbg !377
  %15 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !377
  store i32 %14, i32* %15, align 4, !dbg !377
  %16 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 5, !dbg !378
  %17 = load i32* %16, align 8, !dbg !378
  %18 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !378
  store i32 %17, i32* %18, align 8, !dbg !378
  %19 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 7, !dbg !379
  %20 = load i64* %19, align 8, !dbg !379
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !379
  store i64 %20, i64* %21, align 8, !dbg !379
  %22 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 8, !dbg !380
  %23 = load i64* %22, align 8, !dbg !380
  %24 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 8, !dbg !380
  store i64 %23, i64* %24, align 8, !dbg !380
  %25 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 11, i32 0
  %26 = load i64* %25, align 8, !dbg !381
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0
  store i64 %26, i64* %27, align 8, !dbg !381
  %28 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 12, i32 0
  %29 = load i64* %28, align 8, !dbg !382
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0
  store i64 %29, i64* %30, align 8, !dbg !382
  %31 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 13, i32 0
  %32 = load i64* %31, align 8, !dbg !383
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0
  store i64 %32, i64* %33, align 8, !dbg !383
  %34 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 9, !dbg !384
  %35 = load i64* %34, align 8, !dbg !384
  %36 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !384
  store i64 %35, i64* %36, align 8, !dbg !384
  %37 = getelementptr inbounds %struct.stat* %tmp, i64 0, i32 10, !dbg !385
  %38 = load i64* %37, align 8, !dbg !385
  %39 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 10, !dbg !385
  store i64 %38, i64* %39, align 8, !dbg !385
  ret i32 %0, !dbg !386
}

define weak i64 @lseek64(i32 %fd, i64 %off, i32 %whence) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !198), !dbg !387
  tail call void @llvm.dbg.value(metadata !{i64 %off}, i64 0, metadata !199), !dbg !387
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !200), !dbg !387
  %0 = tail call i64 @__fd_lseek(i32 %fd, i64 %off, i32 %whence) nounwind, !dbg !388
  ret i64 %0, !dbg !388
}

declare i64 @__fd_lseek(i32, i64, i32)

define i64 @lseek(i32 %fd, i64 %off, i32 %whence) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !201), !dbg !390
  tail call void @llvm.dbg.value(metadata !{i64 %off}, i64 0, metadata !202), !dbg !390
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !203), !dbg !390
  %0 = tail call i64 @__fd_lseek(i32 %fd, i64 %off, i32 %whence) nounwind, !dbg !391
  ret i64 %0, !dbg !391
}

define weak i32 @open64(i8* %pathname, i32 %flags, ...) nounwind {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 8
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !204), !dbg !393
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !205), !dbg !393
  call void @llvm.dbg.value(metadata !255, i64 0, metadata !206), !dbg !394
  %0 = and i32 %flags, 64, !dbg !395
  %1 = icmp eq i32 %0, 0, !dbg !395
  br i1 %1, label %bb8, label %bb, !dbg !395

bb:                                               ; preds = %entry
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !209), !dbg !396
  %ap12 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !397
  call void @llvm.va_start(i8* %ap12), !dbg !397
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %3 = load i32* %2, align 8, !dbg !398
  %4 = icmp ugt i32 %3, 47
  br i1 %4, label %bb4, label %bb3, !dbg !398

bb3:                                              ; preds = %bb
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %6 = load i8** %5, align 8, !dbg !398
  %tmp = zext i32 %3 to i64
  %7 = ptrtoint i8* %6 to i64, !dbg !398
  %8 = add i64 %tmp, %7, !dbg !398
  %9 = inttoptr i64 %8 to i8*, !dbg !398
  %10 = add i32 %3, 8, !dbg !398
  store i32 %10, i32* %2, align 8, !dbg !398
  br label %bb5, !dbg !398

bb4:                                              ; preds = %bb
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %12 = load i8** %11, align 8, !dbg !398
  %13 = getelementptr inbounds i8* %12, i64 8, !dbg !398
  store i8* %13, i8** %11, align 8, !dbg !398
  br label %bb5, !dbg !398

bb5:                                              ; preds = %bb4, %bb3
  %addr.29.0 = phi i8* [ %12, %bb4 ], [ %9, %bb3 ]
  %14 = bitcast i8* %addr.29.0 to i32*, !dbg !398
  %15 = load i32* %14, align 4, !dbg !398
  call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !206), !dbg !398
  call void @llvm.va_end(i8* %ap12), !dbg !399
  br label %bb8, !dbg !399

bb8:                                              ; preds = %entry, %bb5
  %mode.0 = phi i32 [ %15, %bb5 ], [ 0, %entry ]
  %16 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) nounwind, !dbg !400
  ret i32 %16, !dbg !400
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @__fd_open(i8*, i32, i32)

define i64 @getdents(i32 %fd, %struct.dirent* %dirp, i64 %nbytes) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !230), !dbg !401
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %dirp}, i64 0, metadata !231), !dbg !401
  tail call void @llvm.dbg.value(metadata !{i64 %nbytes}, i64 0, metadata !232), !dbg !401
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %dirp}, i64 0, metadata !233), !dbg !402
  %0 = trunc i64 %nbytes to i32, !dbg !403
  %1 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent* %dirp, i32 %0) nounwind, !dbg !403
  %2 = sext i32 %1 to i64, !dbg !403
  tail call void @llvm.dbg.value(metadata !{i64 %2}, i64 0, metadata !244), !dbg !403
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %bb, label %bb3, !dbg !404

bb:                                               ; preds = %entry
  %4 = bitcast %struct.dirent* %dirp to i8*, !dbg !405
  %5 = getelementptr inbounds i8* %4, i64 %2, !dbg !405
  %6 = bitcast i8* %5 to %struct.dirent*, !dbg !405
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %6}, i64 0, metadata !245), !dbg !405
  %7 = icmp ugt %struct.dirent* %6, %dirp, !dbg !406
  br i1 %7, label %bb1, label %bb3, !dbg !406

bb1:                                              ; preds = %bb, %bb1
  %dp64.05 = phi %struct.dirent* [ %13, %bb1 ], [ %dirp, %bb ]
  %8 = getelementptr inbounds %struct.dirent* %dp64.05, i64 0, i32 2, !dbg !407
  %9 = load i16* %8, align 8, !dbg !407
  %10 = zext i16 %9 to i64, !dbg !407
  %11 = bitcast %struct.dirent* %dp64.05 to i8*, !dbg !408
  %12 = getelementptr inbounds i8* %11, i64 %10, !dbg !408
  %13 = bitcast i8* %12 to %struct.dirent*, !dbg !408
  %14 = icmp ult i8* %12, %5
  br i1 %14, label %bb1, label %bb3, !dbg !406

bb3:                                              ; preds = %bb, %bb1, %entry
  ret i64 %2, !dbg !409
}

declare i32 @__fd_getdents(i32, %struct.dirent*, i32)

define i32 @statfs(i8* %path, %struct.statfs* %buf32) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !250), !dbg !410
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf32}, i64 0, metadata !251), !dbg !410
  %0 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf32) nounwind, !dbg !411
  ret i32 %0, !dbg !411
}

declare i32 @__fd_statfs(i8*, %struct.statfs*)

define i32 @ftruncate(i32 %fd, i64 %length) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !252), !dbg !413
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !253), !dbg !413
  %0 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %length) nounwind, !dbg !414
  ret i32 %0, !dbg !414
}

declare i32 @__fd_ftruncate(i32, i64)

!llvm.dbg.sp = !{!0, !68, !71, !74, !77, !83, !86, !89, !90, !91, !92, !97, !101, !104, !105, !124, !154}
!llvm.dbg.lv.__stat64_to_stat = !{!157, !158}
!llvm.dbg.lv.fstat64 = !{!159, !160}
!llvm.dbg.lv.fstat = !{!161, !162, !163, !165}
!llvm.dbg.lv.__fxstat = !{!166, !167, !168, !169, !171}
!llvm.dbg.lv.lstat64 = !{!172, !173}
!llvm.dbg.lv.lstat = !{!174, !175, !176, !178}
!llvm.dbg.lv.__lxstat = !{!179, !180, !181, !182, !184}
!llvm.dbg.lv.stat64 = !{!185, !186}
!llvm.dbg.lv.stat = !{!187, !188, !189, !191}
!llvm.dbg.lv.__xstat = !{!192, !193, !194, !195, !197}
!llvm.dbg.lv.lseek64 = !{!198, !199, !200}
!llvm.dbg.lv.lseek = !{!201, !202, !203}
!llvm.dbg.lv.open64 = !{!204, !205, !206, !209}
!llvm.dbg.lv.open = !{!224, !225, !226, !228}
!llvm.dbg.lv.getdents = !{!230, !231, !232, !233, !244, !245, !247, !249}
!llvm.dbg.lv.statfs = !{!250, !251}
!llvm.dbg.lv.ftruncate = !{!252, !253}

!0 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__stat64_to_stat", metadata !"__stat64_to_stat", metadata !"", metadata !1, i32 30, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i1 false, i1 true, null} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 524329, metadata !"fd_32.c", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 524305, i32 0, i32 1, metadata !"fd_32.c", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{null, metadata !5, metadata !48}
!5 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 524307, metadata !1, metadata !"stat64", metadata !7, i32 23, i64 1152, i64 64, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_structure_type ]
!7 = metadata !{i32 524329, metadata !"fd.h", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!8 = metadata !{metadata !9, metadata !14, metadata !16, metadata !18, metadata !21, metadata !23, metadata !25, metadata !27, metadata !28, metadata !31, metadata !33, metadata !35, metadata !42, metadata !43, metadata !44}
!9 = metadata !{i32 524301, metadata !6, metadata !"st_dev", metadata !10, i32 121, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!10 = metadata !{i32 524329, metadata !"stat.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!11 = metadata !{i32 524310, metadata !12, metadata !"__dev_t", metadata !12, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!12 = metadata !{i32 524329, metadata !"types.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!13 = metadata !{i32 524324, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!14 = metadata !{i32 524301, metadata !6, metadata !"st_ino", metadata !10, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !15} ; [ DW_TAG_member ]
!15 = metadata !{i32 524310, metadata !12, metadata !"__ino64_t", metadata !12, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!16 = metadata !{i32 524301, metadata !6, metadata !"st_nlink", metadata !10, i32 124, i64 64, i64 64, i64 128, i32 0, metadata !17} ; [ DW_TAG_member ]
!17 = metadata !{i32 524310, metadata !12, metadata !"__nlink_t", metadata !12, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!18 = metadata !{i32 524301, metadata !6, metadata !"st_mode", metadata !10, i32 125, i64 32, i64 32, i64 192, i32 0, metadata !19} ; [ DW_TAG_member ]
!19 = metadata !{i32 524310, metadata !12, metadata !"__mode_t", metadata !12, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!20 = metadata !{i32 524324, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!21 = metadata !{i32 524301, metadata !6, metadata !"st_uid", metadata !10, i32 132, i64 32, i64 32, i64 224, i32 0, metadata !22} ; [ DW_TAG_member ]
!22 = metadata !{i32 524310, metadata !12, metadata !"__uid_t", metadata !12, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!23 = metadata !{i32 524301, metadata !6, metadata !"st_gid", metadata !10, i32 133, i64 32, i64 32, i64 256, i32 0, metadata !24} ; [ DW_TAG_member ]
!24 = metadata !{i32 524310, metadata !12, metadata !"__gid_t", metadata !12, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!25 = metadata !{i32 524301, metadata !6, metadata !"__pad0", metadata !10, i32 135, i64 32, i64 32, i64 288, i32 0, metadata !26} ; [ DW_TAG_member ]
!26 = metadata !{i32 524324, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!27 = metadata !{i32 524301, metadata !6, metadata !"st_rdev", metadata !10, i32 136, i64 64, i64 64, i64 320, i32 0, metadata !11} ; [ DW_TAG_member ]
!28 = metadata !{i32 524301, metadata !6, metadata !"st_size", metadata !10, i32 137, i64 64, i64 64, i64 384, i32 0, metadata !29} ; [ DW_TAG_member ]
!29 = metadata !{i32 524310, metadata !12, metadata !"__off_t", metadata !12, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!30 = metadata !{i32 524324, metadata !1, metadata !"long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!31 = metadata !{i32 524301, metadata !6, metadata !"st_blksize", metadata !10, i32 143, i64 64, i64 64, i64 448, i32 0, metadata !32} ; [ DW_TAG_member ]
!32 = metadata !{i32 524310, metadata !12, metadata !"__blksize_t", metadata !12, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!33 = metadata !{i32 524301, metadata !6, metadata !"st_blocks", metadata !10, i32 144, i64 64, i64 64, i64 512, i32 0, metadata !34} ; [ DW_TAG_member ]
!34 = metadata !{i32 524310, metadata !12, metadata !"__blkcnt64_t", metadata !12, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!35 = metadata !{i32 524301, metadata !6, metadata !"st_atim", metadata !10, i32 152, i64 128, i64 64, i64 576, i32 0, metadata !36} ; [ DW_TAG_member ]
!36 = metadata !{i32 524307, metadata !1, metadata !"timespec", metadata !37, i32 121, i64 128, i64 64, i64 0, i32 0, null, metadata !38, i32 0, null} ; [ DW_TAG_structure_type ]
!37 = metadata !{i32 524329, metadata !"time.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!38 = metadata !{metadata !39, metadata !41}
!39 = metadata !{i32 524301, metadata !36, metadata !"tv_sec", metadata !37, i32 122, i64 64, i64 64, i64 0, i32 0, metadata !40} ; [ DW_TAG_member ]
!40 = metadata !{i32 524310, metadata !12, metadata !"__time_t", metadata !12, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!41 = metadata !{i32 524301, metadata !36, metadata !"tv_nsec", metadata !37, i32 123, i64 64, i64 64, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ]
!42 = metadata !{i32 524301, metadata !6, metadata !"st_mtim", metadata !10, i32 153, i64 128, i64 64, i64 704, i32 0, metadata !36} ; [ DW_TAG_member ]
!43 = metadata !{i32 524301, metadata !6, metadata !"st_ctim", metadata !10, i32 154, i64 128, i64 64, i64 832, i32 0, metadata !36} ; [ DW_TAG_member ]
!44 = metadata !{i32 524301, metadata !6, metadata !"__unused", metadata !10, i32 167, i64 192, i64 64, i64 960, i32 0, metadata !45} ; [ DW_TAG_member ]
!45 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 192, i64 64, i64 0, i32 0, metadata !30, metadata !46, i32 0, null} ; [ DW_TAG_array_type ]
!46 = metadata !{metadata !47}
!47 = metadata !{i32 524321, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!48 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ]
!49 = metadata !{i32 524307, metadata !1, metadata !"stat", metadata !10, i32 47, i64 1152, i64 64, i64 0, i32 0, null, metadata !50, i32 0, null} ; [ DW_TAG_structure_type ]
!50 = metadata !{metadata !51, metadata !52, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61, metadata !62, metadata !64, metadata !65, metadata !66, metadata !67}
!51 = metadata !{i32 524301, metadata !49, metadata !"st_dev", metadata !10, i32 48, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!52 = metadata !{i32 524301, metadata !49, metadata !"st_ino", metadata !10, i32 53, i64 64, i64 64, i64 64, i32 0, metadata !53} ; [ DW_TAG_member ]
!53 = metadata !{i32 524310, metadata !12, metadata !"__ino_t", metadata !12, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!54 = metadata !{i32 524301, metadata !49, metadata !"st_nlink", metadata !10, i32 61, i64 64, i64 64, i64 128, i32 0, metadata !17} ; [ DW_TAG_member ]
!55 = metadata !{i32 524301, metadata !49, metadata !"st_mode", metadata !10, i32 62, i64 32, i64 32, i64 192, i32 0, metadata !19} ; [ DW_TAG_member ]
!56 = metadata !{i32 524301, metadata !49, metadata !"st_uid", metadata !10, i32 64, i64 32, i64 32, i64 224, i32 0, metadata !22} ; [ DW_TAG_member ]
!57 = metadata !{i32 524301, metadata !49, metadata !"st_gid", metadata !10, i32 65, i64 32, i64 32, i64 256, i32 0, metadata !24} ; [ DW_TAG_member ]
!58 = metadata !{i32 524301, metadata !49, metadata !"__pad0", metadata !10, i32 67, i64 32, i64 32, i64 288, i32 0, metadata !26} ; [ DW_TAG_member ]
!59 = metadata !{i32 524301, metadata !49, metadata !"st_rdev", metadata !10, i32 69, i64 64, i64 64, i64 320, i32 0, metadata !11} ; [ DW_TAG_member ]
!60 = metadata !{i32 524301, metadata !49, metadata !"st_size", metadata !10, i32 74, i64 64, i64 64, i64 384, i32 0, metadata !29} ; [ DW_TAG_member ]
!61 = metadata !{i32 524301, metadata !49, metadata !"st_blksize", metadata !10, i32 78, i64 64, i64 64, i64 448, i32 0, metadata !32} ; [ DW_TAG_member ]
!62 = metadata !{i32 524301, metadata !49, metadata !"st_blocks", metadata !10, i32 80, i64 64, i64 64, i64 512, i32 0, metadata !63} ; [ DW_TAG_member ]
!63 = metadata !{i32 524310, metadata !12, metadata !"__blkcnt_t", metadata !12, i32 170, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!64 = metadata !{i32 524301, metadata !49, metadata !"st_atim", metadata !10, i32 91, i64 128, i64 64, i64 576, i32 0, metadata !36} ; [ DW_TAG_member ]
!65 = metadata !{i32 524301, metadata !49, metadata !"st_mtim", metadata !10, i32 92, i64 128, i64 64, i64 704, i32 0, metadata !36} ; [ DW_TAG_member ]
!66 = metadata !{i32 524301, metadata !49, metadata !"st_ctim", metadata !10, i32 93, i64 128, i64 64, i64 832, i32 0, metadata !36} ; [ DW_TAG_member ]
!67 = metadata !{i32 524301, metadata !49, metadata !"__unused", metadata !10, i32 106, i64 192, i64 64, i64 960, i32 0, metadata !45} ; [ DW_TAG_member ]
!68 = metadata !{i32 524334, i32 0, metadata !1, metadata !"fstat64", metadata !"fstat64", metadata !"fstat64", metadata !1, i32 194, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, %struct.stat*)* @fstat64} ; [ DW_TAG_subprogram ]
!69 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, null} ; [ DW_TAG_subroutine_type ]
!70 = metadata !{metadata !26, metadata !26, metadata !5}
!71 = metadata !{i32 524334, i32 0, metadata !1, metadata !"fstat", metadata !"fstat", metadata !"fstat", metadata !1, i32 101, metadata !72, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, %struct.stat*)* @fstat} ; [ DW_TAG_subprogram ]
!72 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !73, i32 0, null} ; [ DW_TAG_subroutine_type ]
!73 = metadata !{metadata !26, metadata !26, metadata !48}
!74 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__fxstat", metadata !"__fxstat", metadata !"__fxstat", metadata !1, i32 94, metadata !75, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i32, %struct.stat*)* @__fxstat} ; [ DW_TAG_subprogram ]
!75 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, null} ; [ DW_TAG_subroutine_type ]
!76 = metadata !{metadata !26, metadata !26, metadata !26, metadata !48}
!77 = metadata !{i32 524334, i32 0, metadata !1, metadata !"lstat64", metadata !"lstat64", metadata !"lstat64", metadata !1, i32 189, metadata !78, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, %struct.stat*)* @lstat64} ; [ DW_TAG_subprogram ]
!78 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !79, i32 0, null} ; [ DW_TAG_subroutine_type ]
!79 = metadata !{metadata !26, metadata !80, metadata !5}
!80 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !81} ; [ DW_TAG_pointer_type ]
!81 = metadata !{i32 524326, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !82} ; [ DW_TAG_const_type ]
!82 = metadata !{i32 524324, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!83 = metadata !{i32 524334, i32 0, metadata !1, metadata !"lstat", metadata !"lstat", metadata !"lstat", metadata !1, i32 87, metadata !84, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, %struct.stat*)* @lstat} ; [ DW_TAG_subprogram ]
!84 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !85, i32 0, null} ; [ DW_TAG_subroutine_type ]
!85 = metadata !{metadata !26, metadata !80, metadata !48}
!86 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__lxstat", metadata !"__lxstat", metadata !"__lxstat", metadata !1, i32 80, metadata !87, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i8*, %struct.stat*)* @__lxstat} ; [ DW_TAG_subprogram ]
!87 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !88, i32 0, null} ; [ DW_TAG_subroutine_type ]
!88 = metadata !{metadata !26, metadata !26, metadata !80, metadata !48}
!89 = metadata !{i32 524334, i32 0, metadata !1, metadata !"stat64", metadata !"stat64", metadata !"stat64", metadata !1, i32 184, metadata !78, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, %struct.stat*)* @stat64} ; [ DW_TAG_subprogram ]
!90 = metadata !{i32 524334, i32 0, metadata !1, metadata !"stat", metadata !"stat", metadata !"stat", metadata !1, i32 73, metadata !84, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, %struct.stat*)* @stat} ; [ DW_TAG_subprogram ]
!91 = metadata !{i32 524334, i32 0, metadata !1, metadata !"__xstat", metadata !"__xstat", metadata !"__xstat", metadata !1, i32 66, metadata !87, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i8*, %struct.stat*)* @__xstat} ; [ DW_TAG_subprogram ]
!92 = metadata !{i32 524334, i32 0, metadata !1, metadata !"lseek64", metadata !"lseek64", metadata !"lseek64", metadata !1, i32 179, metadata !93, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i64 (i32, i64, i32)* @lseek64} ; [ DW_TAG_subprogram ]
!93 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, null} ; [ DW_TAG_subroutine_type ]
!94 = metadata !{metadata !95, metadata !26, metadata !95, metadata !26}
!95 = metadata !{i32 524310, metadata !96, metadata !"off64_t", metadata !96, i32 99, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!96 = metadata !{i32 524329, metadata !"types.h", metadata !"/usr/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!97 = metadata !{i32 524334, i32 0, metadata !1, metadata !"lseek", metadata !"lseek", metadata !"lseek", metadata !1, i32 62, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i64 (i32, i64, i32)* @lseek} ; [ DW_TAG_subprogram ]
!98 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, null} ; [ DW_TAG_subroutine_type ]
!99 = metadata !{metadata !100, metadata !26, metadata !100, metadata !26}
!100 = metadata !{i32 524310, metadata !96, metadata !"off_t", metadata !96, i32 94, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!101 = metadata !{i32 524334, i32 0, metadata !1, metadata !"open64", metadata !"open64", metadata !"open64", metadata !1, i32 164, metadata !102, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, i32, ...)* @open64} ; [ DW_TAG_subprogram ]
!102 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !103, i32 0, null} ; [ DW_TAG_subroutine_type ]
!103 = metadata !{metadata !26, metadata !80, metadata !26}
!104 = metadata !{i32 524334, i32 0, metadata !1, metadata !"open", metadata !"open", metadata !"open", metadata !1, i32 48, metadata !102, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, i32, ...)* @open} ; [ DW_TAG_subprogram ]
!105 = metadata !{i32 524334, i32 0, metadata !1, metadata !"getdents", metadata !"getdents", metadata !"getdents", metadata !1, i32 137, metadata !106, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i64 (i32, %struct.dirent*, i64)* @getdents} ; [ DW_TAG_subprogram ]
!106 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !107, i32 0, null} ; [ DW_TAG_subroutine_type ]
!107 = metadata !{metadata !108, metadata !26, metadata !109, metadata !123}
!108 = metadata !{i32 524310, metadata !96, metadata !"ssize_t", metadata !96, i32 116, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!109 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_pointer_type ]
!110 = metadata !{i32 524307, metadata !1, metadata !"dirent", metadata !111, i32 24, i64 2240, i64 64, i64 0, i32 0, null, metadata !112, i32 0, null} ; [ DW_TAG_structure_type ]
!111 = metadata !{i32 524329, metadata !"dirent.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!112 = metadata !{metadata !113, metadata !114, metadata !115, metadata !117, metadata !119}
!113 = metadata !{i32 524301, metadata !110, metadata !"d_ino", metadata !111, i32 26, i64 64, i64 64, i64 0, i32 0, metadata !53} ; [ DW_TAG_member ]
!114 = metadata !{i32 524301, metadata !110, metadata !"d_off", metadata !111, i32 27, i64 64, i64 64, i64 64, i32 0, metadata !29} ; [ DW_TAG_member ]
!115 = metadata !{i32 524301, metadata !110, metadata !"d_reclen", metadata !111, i32 32, i64 16, i64 16, i64 128, i32 0, metadata !116} ; [ DW_TAG_member ]
!116 = metadata !{i32 524324, metadata !1, metadata !"short unsigned int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!117 = metadata !{i32 524301, metadata !110, metadata !"d_type", metadata !111, i32 33, i64 8, i64 8, i64 144, i32 0, metadata !118} ; [ DW_TAG_member ]
!118 = metadata !{i32 524324, metadata !1, metadata !"unsigned char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!119 = metadata !{i32 524301, metadata !110, metadata !"d_name", metadata !111, i32 34, i64 2048, i64 8, i64 152, i32 0, metadata !120} ; [ DW_TAG_member ]
!120 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 2048, i64 8, i64 0, i32 0, metadata !82, metadata !121, i32 0, null} ; [ DW_TAG_array_type ]
!121 = metadata !{metadata !122}
!122 = metadata !{i32 524321, i64 0, i64 255}     ; [ DW_TAG_subrange_type ]
!123 = metadata !{i32 524310, metadata !96, metadata !"size_t", metadata !96, i32 151, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!124 = metadata !{i32 524334, i32 0, metadata !1, metadata !"statfs", metadata !"statfs", metadata !"statfs", metadata !1, i32 112, metadata !125, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i8*, %struct.statfs*)* @statfs} ; [ DW_TAG_subprogram ]
!125 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !126, i32 0, null} ; [ DW_TAG_subroutine_type ]
!126 = metadata !{metadata !26, metadata !80, metadata !127}
!127 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !128} ; [ DW_TAG_pointer_type ]
!128 = metadata !{i32 524307, metadata !1, metadata !"statfs", metadata !129, i32 26, i64 960, i64 64, i64 0, i32 0, null, metadata !130, i32 0, null} ; [ DW_TAG_structure_type ]
!129 = metadata !{i32 524329, metadata !"statfs.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!130 = metadata !{metadata !131, metadata !132, metadata !133, metadata !135, metadata !136, metadata !137, metadata !139, metadata !140, metadata !148, metadata !149, metadata !150}
!131 = metadata !{i32 524301, metadata !128, metadata !"f_type", metadata !129, i32 27, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_member ]
!132 = metadata !{i32 524301, metadata !128, metadata !"f_bsize", metadata !129, i32 28, i64 64, i64 64, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ]
!133 = metadata !{i32 524301, metadata !128, metadata !"f_blocks", metadata !129, i32 30, i64 64, i64 64, i64 128, i32 0, metadata !134} ; [ DW_TAG_member ]
!134 = metadata !{i32 524310, metadata !12, metadata !"__fsblkcnt_t", metadata !12, i32 174, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!135 = metadata !{i32 524301, metadata !128, metadata !"f_bfree", metadata !129, i32 31, i64 64, i64 64, i64 192, i32 0, metadata !134} ; [ DW_TAG_member ]
!136 = metadata !{i32 524301, metadata !128, metadata !"f_bavail", metadata !129, i32 32, i64 64, i64 64, i64 256, i32 0, metadata !134} ; [ DW_TAG_member ]
!137 = metadata !{i32 524301, metadata !128, metadata !"f_files", metadata !129, i32 33, i64 64, i64 64, i64 320, i32 0, metadata !138} ; [ DW_TAG_member ]
!138 = metadata !{i32 524310, metadata !12, metadata !"__fsfilcnt_t", metadata !12, i32 178, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!139 = metadata !{i32 524301, metadata !128, metadata !"f_ffree", metadata !129, i32 34, i64 64, i64 64, i64 384, i32 0, metadata !138} ; [ DW_TAG_member ]
!140 = metadata !{i32 524301, metadata !128, metadata !"f_fsid", metadata !129, i32 42, i64 64, i64 32, i64 448, i32 0, metadata !141} ; [ DW_TAG_member ]
!141 = metadata !{i32 524310, metadata !12, metadata !"__fsid_t", metadata !12, i32 145, i64 0, i64 0, i64 0, i32 0, metadata !142} ; [ DW_TAG_typedef ]
!142 = metadata !{i32 524307, metadata !1, metadata !"", metadata !12, i32 144, i64 64, i64 32, i64 0, i32 0, null, metadata !143, i32 0, null} ; [ DW_TAG_structure_type ]
!143 = metadata !{metadata !144}
!144 = metadata !{i32 524301, metadata !142, metadata !"__val", metadata !12, i32 144, i64 64, i64 32, i64 0, i32 0, metadata !145} ; [ DW_TAG_member ]
!145 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !26, metadata !146, i32 0, null} ; [ DW_TAG_array_type ]
!146 = metadata !{metadata !147}
!147 = metadata !{i32 524321, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!148 = metadata !{i32 524301, metadata !128, metadata !"f_namelen", metadata !129, i32 43, i64 64, i64 64, i64 512, i32 0, metadata !30} ; [ DW_TAG_member ]
!149 = metadata !{i32 524301, metadata !128, metadata !"f_frsize", metadata !129, i32 44, i64 64, i64 64, i64 576, i32 0, metadata !30} ; [ DW_TAG_member ]
!150 = metadata !{i32 524301, metadata !128, metadata !"f_spare", metadata !129, i32 45, i64 320, i64 64, i64 640, i32 0, metadata !151} ; [ DW_TAG_member ]
!151 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 320, i64 64, i64 0, i32 0, metadata !30, metadata !152, i32 0, null} ; [ DW_TAG_array_type ]
!152 = metadata !{metadata !153}
!153 = metadata !{i32 524321, i64 0, i64 4}       ; [ DW_TAG_subrange_type ]
!154 = metadata !{i32 524334, i32 0, metadata !1, metadata !"ftruncate", metadata !"ftruncate", metadata !"ftruncate", metadata !1, i32 108, metadata !155, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32, i64)* @ftruncate} ; [ DW_TAG_subprogram ]
!155 = metadata !{i32 524309, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !156, i32 0, null} ; [ DW_TAG_subroutine_type ]
!156 = metadata !{metadata !26, metadata !26, metadata !100}
!157 = metadata !{i32 524545, metadata !0, metadata !"a", metadata !1, i32 30, metadata !5} ; [ DW_TAG_arg_variable ]
!158 = metadata !{i32 524545, metadata !0, metadata !"b", metadata !1, i32 30, metadata !48} ; [ DW_TAG_arg_variable ]
!159 = metadata !{i32 524545, metadata !68, metadata !"fd", metadata !1, i32 194, metadata !26} ; [ DW_TAG_arg_variable ]
!160 = metadata !{i32 524545, metadata !68, metadata !"buf", metadata !1, i32 194, metadata !5} ; [ DW_TAG_arg_variable ]
!161 = metadata !{i32 524545, metadata !71, metadata !"fd", metadata !1, i32 101, metadata !26} ; [ DW_TAG_arg_variable ]
!162 = metadata !{i32 524545, metadata !71, metadata !"buf", metadata !1, i32 101, metadata !48} ; [ DW_TAG_arg_variable ]
!163 = metadata !{i32 524544, metadata !164, metadata !"tmp", metadata !1, i32 102, metadata !6} ; [ DW_TAG_auto_variable ]
!164 = metadata !{i32 524299, metadata !71, i32 101, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!165 = metadata !{i32 524544, metadata !164, metadata !"res", metadata !1, i32 103, metadata !26} ; [ DW_TAG_auto_variable ]
!166 = metadata !{i32 524545, metadata !74, metadata !"vers", metadata !1, i32 94, metadata !26} ; [ DW_TAG_arg_variable ]
!167 = metadata !{i32 524545, metadata !74, metadata !"fd", metadata !1, i32 94, metadata !26} ; [ DW_TAG_arg_variable ]
!168 = metadata !{i32 524545, metadata !74, metadata !"buf", metadata !1, i32 94, metadata !48} ; [ DW_TAG_arg_variable ]
!169 = metadata !{i32 524544, metadata !170, metadata !"tmp", metadata !1, i32 95, metadata !6} ; [ DW_TAG_auto_variable ]
!170 = metadata !{i32 524299, metadata !74, i32 94, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!171 = metadata !{i32 524544, metadata !170, metadata !"res", metadata !1, i32 96, metadata !26} ; [ DW_TAG_auto_variable ]
!172 = metadata !{i32 524545, metadata !77, metadata !"path", metadata !1, i32 189, metadata !80} ; [ DW_TAG_arg_variable ]
!173 = metadata !{i32 524545, metadata !77, metadata !"buf", metadata !1, i32 189, metadata !5} ; [ DW_TAG_arg_variable ]
!174 = metadata !{i32 524545, metadata !83, metadata !"path", metadata !1, i32 87, metadata !80} ; [ DW_TAG_arg_variable ]
!175 = metadata !{i32 524545, metadata !83, metadata !"buf", metadata !1, i32 87, metadata !48} ; [ DW_TAG_arg_variable ]
!176 = metadata !{i32 524544, metadata !177, metadata !"tmp", metadata !1, i32 88, metadata !6} ; [ DW_TAG_auto_variable ]
!177 = metadata !{i32 524299, metadata !83, i32 87, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!178 = metadata !{i32 524544, metadata !177, metadata !"res", metadata !1, i32 89, metadata !26} ; [ DW_TAG_auto_variable ]
!179 = metadata !{i32 524545, metadata !86, metadata !"vers", metadata !1, i32 80, metadata !26} ; [ DW_TAG_arg_variable ]
!180 = metadata !{i32 524545, metadata !86, metadata !"path", metadata !1, i32 80, metadata !80} ; [ DW_TAG_arg_variable ]
!181 = metadata !{i32 524545, metadata !86, metadata !"buf", metadata !1, i32 80, metadata !48} ; [ DW_TAG_arg_variable ]
!182 = metadata !{i32 524544, metadata !183, metadata !"tmp", metadata !1, i32 81, metadata !6} ; [ DW_TAG_auto_variable ]
!183 = metadata !{i32 524299, metadata !86, i32 80, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!184 = metadata !{i32 524544, metadata !183, metadata !"res", metadata !1, i32 82, metadata !26} ; [ DW_TAG_auto_variable ]
!185 = metadata !{i32 524545, metadata !89, metadata !"path", metadata !1, i32 184, metadata !80} ; [ DW_TAG_arg_variable ]
!186 = metadata !{i32 524545, metadata !89, metadata !"buf", metadata !1, i32 184, metadata !5} ; [ DW_TAG_arg_variable ]
!187 = metadata !{i32 524545, metadata !90, metadata !"path", metadata !1, i32 73, metadata !80} ; [ DW_TAG_arg_variable ]
!188 = metadata !{i32 524545, metadata !90, metadata !"buf", metadata !1, i32 73, metadata !48} ; [ DW_TAG_arg_variable ]
!189 = metadata !{i32 524544, metadata !190, metadata !"tmp", metadata !1, i32 74, metadata !6} ; [ DW_TAG_auto_variable ]
!190 = metadata !{i32 524299, metadata !90, i32 73, i32 0, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!191 = metadata !{i32 524544, metadata !190, metadata !"res", metadata !1, i32 75, metadata !26} ; [ DW_TAG_auto_variable ]
!192 = metadata !{i32 524545, metadata !91, metadata !"vers", metadata !1, i32 66, metadata !26} ; [ DW_TAG_arg_variable ]
!193 = metadata !{i32 524545, metadata !91, metadata !"path", metadata !1, i32 66, metadata !80} ; [ DW_TAG_arg_variable ]
!194 = metadata !{i32 524545, metadata !91, metadata !"buf", metadata !1, i32 66, metadata !48} ; [ DW_TAG_arg_variable ]
!195 = metadata !{i32 524544, metadata !196, metadata !"tmp", metadata !1, i32 67, metadata !6} ; [ DW_TAG_auto_variable ]
!196 = metadata !{i32 524299, metadata !91, i32 66, i32 0, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
!197 = metadata !{i32 524544, metadata !196, metadata !"res", metadata !1, i32 68, metadata !26} ; [ DW_TAG_auto_variable ]
!198 = metadata !{i32 524545, metadata !92, metadata !"fd", metadata !1, i32 179, metadata !26} ; [ DW_TAG_arg_variable ]
!199 = metadata !{i32 524545, metadata !92, metadata !"off", metadata !1, i32 179, metadata !95} ; [ DW_TAG_arg_variable ]
!200 = metadata !{i32 524545, metadata !92, metadata !"whence", metadata !1, i32 179, metadata !26} ; [ DW_TAG_arg_variable ]
!201 = metadata !{i32 524545, metadata !97, metadata !"fd", metadata !1, i32 62, metadata !26} ; [ DW_TAG_arg_variable ]
!202 = metadata !{i32 524545, metadata !97, metadata !"off", metadata !1, i32 62, metadata !100} ; [ DW_TAG_arg_variable ]
!203 = metadata !{i32 524545, metadata !97, metadata !"whence", metadata !1, i32 62, metadata !26} ; [ DW_TAG_arg_variable ]
!204 = metadata !{i32 524545, metadata !101, metadata !"pathname", metadata !1, i32 164, metadata !80} ; [ DW_TAG_arg_variable ]
!205 = metadata !{i32 524545, metadata !101, metadata !"flags", metadata !1, i32 164, metadata !26} ; [ DW_TAG_arg_variable ]
!206 = metadata !{i32 524544, metadata !207, metadata !"mode", metadata !1, i32 165, metadata !208} ; [ DW_TAG_auto_variable ]
!207 = metadata !{i32 524299, metadata !101, i32 164, i32 0, metadata !1, i32 12} ; [ DW_TAG_lexical_block ]
!208 = metadata !{i32 524310, metadata !96, metadata !"mode_t", metadata !96, i32 76, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!209 = metadata !{i32 524544, metadata !210, metadata !"ap", metadata !1, i32 169, metadata !211} ; [ DW_TAG_auto_variable ]
!210 = metadata !{i32 524299, metadata !207, i32 170, i32 0, metadata !1, i32 13} ; [ DW_TAG_lexical_block ]
!211 = metadata !{i32 524310, metadata !212, metadata !"va_list", metadata !212, i32 111, i64 0, i64 0, i64 0, i32 0, metadata !213} ; [ DW_TAG_typedef ]
!212 = metadata !{i32 524329, metadata !"stdio.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!213 = metadata !{i32 524289, metadata !1, metadata !"", metadata !1, i32 0, i64 192, i64 64, i64 0, i32 0, metadata !214, metadata !222, i32 0, null} ; [ DW_TAG_array_type ]
!214 = metadata !{i32 524307, metadata !1, metadata !"__va_list_tag", metadata !215, i32 0, i64 192, i64 64, i64 0, i32 0, null, metadata !216, i32 0, null} ; [ DW_TAG_structure_type ]
!215 = metadata !{i32 524329, metadata !"<built-in>", metadata !"/home/kain/Documents/bishe/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!216 = metadata !{metadata !217, metadata !218, metadata !219, metadata !221}
!217 = metadata !{i32 524301, metadata !214, metadata !"gp_offset", metadata !215, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ]
!218 = metadata !{i32 524301, metadata !214, metadata !"fp_offset", metadata !215, i32 0, i64 32, i64 32, i64 32, i32 0, metadata !20} ; [ DW_TAG_member ]
!219 = metadata !{i32 524301, metadata !214, metadata !"overflow_arg_area", metadata !215, i32 0, i64 64, i64 64, i64 64, i32 0, metadata !220} ; [ DW_TAG_member ]
!220 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!221 = metadata !{i32 524301, metadata !214, metadata !"reg_save_area", metadata !215, i32 0, i64 64, i64 64, i64 128, i32 0, metadata !220} ; [ DW_TAG_member ]
!222 = metadata !{metadata !223}
!223 = metadata !{i32 524321, i64 0, i64 0}       ; [ DW_TAG_subrange_type ]
!224 = metadata !{i32 524545, metadata !104, metadata !"pathname", metadata !1, i32 48, metadata !80} ; [ DW_TAG_arg_variable ]
!225 = metadata !{i32 524545, metadata !104, metadata !"flags", metadata !1, i32 48, metadata !26} ; [ DW_TAG_arg_variable ]
!226 = metadata !{i32 524544, metadata !227, metadata !"mode", metadata !1, i32 49, metadata !208} ; [ DW_TAG_auto_variable ]
!227 = metadata !{i32 524299, metadata !104, i32 48, i32 0, metadata !1, i32 14} ; [ DW_TAG_lexical_block ]
!228 = metadata !{i32 524544, metadata !229, metadata !"ap", metadata !1, i32 53, metadata !211} ; [ DW_TAG_auto_variable ]
!229 = metadata !{i32 524299, metadata !227, i32 54, i32 0, metadata !1, i32 15} ; [ DW_TAG_lexical_block ]
!230 = metadata !{i32 524545, metadata !105, metadata !"fd", metadata !1, i32 137, metadata !26} ; [ DW_TAG_arg_variable ]
!231 = metadata !{i32 524545, metadata !105, metadata !"dirp", metadata !1, i32 137, metadata !109} ; [ DW_TAG_arg_variable ]
!232 = metadata !{i32 524545, metadata !105, metadata !"nbytes", metadata !1, i32 137, metadata !123} ; [ DW_TAG_arg_variable ]
!233 = metadata !{i32 524544, metadata !234, metadata !"dp64", metadata !1, i32 138, metadata !235} ; [ DW_TAG_auto_variable ]
!234 = metadata !{i32 524299, metadata !105, i32 137, i32 0, metadata !1, i32 16} ; [ DW_TAG_lexical_block ]
!235 = metadata !{i32 524303, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !236} ; [ DW_TAG_pointer_type ]
!236 = metadata !{i32 524307, metadata !1, metadata !"dirent64", metadata !111, i32 39, i64 2240, i64 64, i64 0, i32 0, null, metadata !237, i32 0, null} ; [ DW_TAG_structure_type ]
!237 = metadata !{metadata !238, metadata !239, metadata !241, metadata !242, metadata !243}
!238 = metadata !{i32 524301, metadata !236, metadata !"d_ino", metadata !111, i32 40, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ]
!239 = metadata !{i32 524301, metadata !236, metadata !"d_off", metadata !111, i32 41, i64 64, i64 64, i64 64, i32 0, metadata !240} ; [ DW_TAG_member ]
!240 = metadata !{i32 524310, metadata !12, metadata !"__off64_t", metadata !12, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!241 = metadata !{i32 524301, metadata !236, metadata !"d_reclen", metadata !111, i32 42, i64 16, i64 16, i64 128, i32 0, metadata !116} ; [ DW_TAG_member ]
!242 = metadata !{i32 524301, metadata !236, metadata !"d_type", metadata !111, i32 43, i64 8, i64 8, i64 144, i32 0, metadata !118} ; [ DW_TAG_member ]
!243 = metadata !{i32 524301, metadata !236, metadata !"d_name", metadata !111, i32 44, i64 2048, i64 8, i64 152, i32 0, metadata !120} ; [ DW_TAG_member ]
!244 = metadata !{i32 524544, metadata !234, metadata !"res", metadata !1, i32 139, metadata !108} ; [ DW_TAG_auto_variable ]
!245 = metadata !{i32 524544, metadata !246, metadata !"end", metadata !1, i32 142, metadata !235} ; [ DW_TAG_auto_variable ]
!246 = metadata !{i32 524299, metadata !234, i32 142, i32 0, metadata !1, i32 17} ; [ DW_TAG_lexical_block ]
!247 = metadata !{i32 524544, metadata !248, metadata !"dp", metadata !1, i32 144, metadata !109} ; [ DW_TAG_auto_variable ]
!248 = metadata !{i32 524299, metadata !246, i32 144, i32 0, metadata !1, i32 18} ; [ DW_TAG_lexical_block ]
!249 = metadata !{i32 524544, metadata !248, metadata !"name_len", metadata !1, i32 145, metadata !123} ; [ DW_TAG_auto_variable ]
!250 = metadata !{i32 524545, metadata !124, metadata !"path", metadata !1, i32 112, metadata !80} ; [ DW_TAG_arg_variable ]
!251 = metadata !{i32 524545, metadata !124, metadata !"buf32", metadata !1, i32 112, metadata !127} ; [ DW_TAG_arg_variable ]
!252 = metadata !{i32 524545, metadata !154, metadata !"fd", metadata !1, i32 108, metadata !26} ; [ DW_TAG_arg_variable ]
!253 = metadata !{i32 524545, metadata !154, metadata !"length", metadata !1, i32 108, metadata !100} ; [ DW_TAG_arg_variable ]
!254 = metadata !{i32 48, i32 0, metadata !104, null}
!255 = metadata !{i32 0}
!256 = metadata !{i32 49, i32 0, metadata !227, null}
!257 = metadata !{i32 51, i32 0, metadata !227, null}
!258 = metadata !{i32 53, i32 0, metadata !229, null}
!259 = metadata !{i32 54, i32 0, metadata !229, null}
!260 = metadata !{i32 55, i32 0, metadata !229, null}
!261 = metadata !{i32 56, i32 0, metadata !229, null}
!262 = metadata !{i32 59, i32 0, metadata !227, null}
!263 = metadata !{i32 194, i32 0, metadata !68, null}
!264 = metadata !{i32 195, i32 0, metadata !265, null}
!265 = metadata !{i32 524299, metadata !68, i32 194, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!266 = metadata !{i32 101, i32 0, metadata !71, null}
!267 = metadata !{i32 102, i32 0, metadata !164, null}
!268 = metadata !{i32 103, i32 0, metadata !164, null}
!269 = metadata !{i32 30, i32 0, metadata !0, metadata !270}
!270 = metadata !{i32 104, i32 0, metadata !164, null}
!271 = metadata !{i32 31, i32 0, metadata !272, metadata !270}
!272 = metadata !{i32 524299, metadata !0, i32 30, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!273 = metadata !{i32 32, i32 0, metadata !272, metadata !270}
!274 = metadata !{i32 33, i32 0, metadata !272, metadata !270}
!275 = metadata !{i32 34, i32 0, metadata !272, metadata !270}
!276 = metadata !{i32 35, i32 0, metadata !272, metadata !270}
!277 = metadata !{i32 36, i32 0, metadata !272, metadata !270}
!278 = metadata !{i32 37, i32 0, metadata !272, metadata !270}
!279 = metadata !{i32 38, i32 0, metadata !272, metadata !270}
!280 = metadata !{i32 39, i32 0, metadata !272, metadata !270}
!281 = metadata !{i32 40, i32 0, metadata !272, metadata !270}
!282 = metadata !{i32 41, i32 0, metadata !272, metadata !270}
!283 = metadata !{i32 42, i32 0, metadata !272, metadata !270}
!284 = metadata !{i32 43, i32 0, metadata !272, metadata !270}
!285 = metadata !{i32 105, i32 0, metadata !164, null}
!286 = metadata !{i32 94, i32 0, metadata !74, null}
!287 = metadata !{i32 95, i32 0, metadata !170, null}
!288 = metadata !{i32 96, i32 0, metadata !170, null}
!289 = metadata !{i32 30, i32 0, metadata !0, metadata !290}
!290 = metadata !{i32 97, i32 0, metadata !170, null}
!291 = metadata !{i32 31, i32 0, metadata !272, metadata !290}
!292 = metadata !{i32 32, i32 0, metadata !272, metadata !290}
!293 = metadata !{i32 33, i32 0, metadata !272, metadata !290}
!294 = metadata !{i32 34, i32 0, metadata !272, metadata !290}
!295 = metadata !{i32 35, i32 0, metadata !272, metadata !290}
!296 = metadata !{i32 36, i32 0, metadata !272, metadata !290}
!297 = metadata !{i32 37, i32 0, metadata !272, metadata !290}
!298 = metadata !{i32 38, i32 0, metadata !272, metadata !290}
!299 = metadata !{i32 39, i32 0, metadata !272, metadata !290}
!300 = metadata !{i32 40, i32 0, metadata !272, metadata !290}
!301 = metadata !{i32 41, i32 0, metadata !272, metadata !290}
!302 = metadata !{i32 42, i32 0, metadata !272, metadata !290}
!303 = metadata !{i32 43, i32 0, metadata !272, metadata !290}
!304 = metadata !{i32 98, i32 0, metadata !170, null}
!305 = metadata !{i32 189, i32 0, metadata !77, null}
!306 = metadata !{i32 190, i32 0, metadata !307, null}
!307 = metadata !{i32 524299, metadata !77, i32 189, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!308 = metadata !{i32 87, i32 0, metadata !83, null}
!309 = metadata !{i32 88, i32 0, metadata !177, null}
!310 = metadata !{i32 89, i32 0, metadata !177, null}
!311 = metadata !{i32 30, i32 0, metadata !0, metadata !312}
!312 = metadata !{i32 90, i32 0, metadata !177, null}
!313 = metadata !{i32 31, i32 0, metadata !272, metadata !312}
!314 = metadata !{i32 32, i32 0, metadata !272, metadata !312}
!315 = metadata !{i32 33, i32 0, metadata !272, metadata !312}
!316 = metadata !{i32 34, i32 0, metadata !272, metadata !312}
!317 = metadata !{i32 35, i32 0, metadata !272, metadata !312}
!318 = metadata !{i32 36, i32 0, metadata !272, metadata !312}
!319 = metadata !{i32 37, i32 0, metadata !272, metadata !312}
!320 = metadata !{i32 38, i32 0, metadata !272, metadata !312}
!321 = metadata !{i32 39, i32 0, metadata !272, metadata !312}
!322 = metadata !{i32 40, i32 0, metadata !272, metadata !312}
!323 = metadata !{i32 41, i32 0, metadata !272, metadata !312}
!324 = metadata !{i32 42, i32 0, metadata !272, metadata !312}
!325 = metadata !{i32 43, i32 0, metadata !272, metadata !312}
!326 = metadata !{i32 91, i32 0, metadata !177, null}
!327 = metadata !{i32 80, i32 0, metadata !86, null}
!328 = metadata !{i32 81, i32 0, metadata !183, null}
!329 = metadata !{i32 82, i32 0, metadata !183, null}
!330 = metadata !{i32 30, i32 0, metadata !0, metadata !331}
!331 = metadata !{i32 83, i32 0, metadata !183, null}
!332 = metadata !{i32 31, i32 0, metadata !272, metadata !331}
!333 = metadata !{i32 32, i32 0, metadata !272, metadata !331}
!334 = metadata !{i32 33, i32 0, metadata !272, metadata !331}
!335 = metadata !{i32 34, i32 0, metadata !272, metadata !331}
!336 = metadata !{i32 35, i32 0, metadata !272, metadata !331}
!337 = metadata !{i32 36, i32 0, metadata !272, metadata !331}
!338 = metadata !{i32 37, i32 0, metadata !272, metadata !331}
!339 = metadata !{i32 38, i32 0, metadata !272, metadata !331}
!340 = metadata !{i32 39, i32 0, metadata !272, metadata !331}
!341 = metadata !{i32 40, i32 0, metadata !272, metadata !331}
!342 = metadata !{i32 41, i32 0, metadata !272, metadata !331}
!343 = metadata !{i32 42, i32 0, metadata !272, metadata !331}
!344 = metadata !{i32 43, i32 0, metadata !272, metadata !331}
!345 = metadata !{i32 84, i32 0, metadata !183, null}
!346 = metadata !{i32 184, i32 0, metadata !89, null}
!347 = metadata !{i32 185, i32 0, metadata !348, null}
!348 = metadata !{i32 524299, metadata !89, i32 184, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!349 = metadata !{i32 73, i32 0, metadata !90, null}
!350 = metadata !{i32 74, i32 0, metadata !190, null}
!351 = metadata !{i32 75, i32 0, metadata !190, null}
!352 = metadata !{i32 30, i32 0, metadata !0, metadata !353}
!353 = metadata !{i32 76, i32 0, metadata !190, null}
!354 = metadata !{i32 31, i32 0, metadata !272, metadata !353}
!355 = metadata !{i32 32, i32 0, metadata !272, metadata !353}
!356 = metadata !{i32 33, i32 0, metadata !272, metadata !353}
!357 = metadata !{i32 34, i32 0, metadata !272, metadata !353}
!358 = metadata !{i32 35, i32 0, metadata !272, metadata !353}
!359 = metadata !{i32 36, i32 0, metadata !272, metadata !353}
!360 = metadata !{i32 37, i32 0, metadata !272, metadata !353}
!361 = metadata !{i32 38, i32 0, metadata !272, metadata !353}
!362 = metadata !{i32 39, i32 0, metadata !272, metadata !353}
!363 = metadata !{i32 40, i32 0, metadata !272, metadata !353}
!364 = metadata !{i32 41, i32 0, metadata !272, metadata !353}
!365 = metadata !{i32 42, i32 0, metadata !272, metadata !353}
!366 = metadata !{i32 43, i32 0, metadata !272, metadata !353}
!367 = metadata !{i32 77, i32 0, metadata !190, null}
!368 = metadata !{i32 66, i32 0, metadata !91, null}
!369 = metadata !{i32 67, i32 0, metadata !196, null}
!370 = metadata !{i32 68, i32 0, metadata !196, null}
!371 = metadata !{i32 30, i32 0, metadata !0, metadata !372}
!372 = metadata !{i32 69, i32 0, metadata !196, null}
!373 = metadata !{i32 31, i32 0, metadata !272, metadata !372}
!374 = metadata !{i32 32, i32 0, metadata !272, metadata !372}
!375 = metadata !{i32 33, i32 0, metadata !272, metadata !372}
!376 = metadata !{i32 34, i32 0, metadata !272, metadata !372}
!377 = metadata !{i32 35, i32 0, metadata !272, metadata !372}
!378 = metadata !{i32 36, i32 0, metadata !272, metadata !372}
!379 = metadata !{i32 37, i32 0, metadata !272, metadata !372}
!380 = metadata !{i32 38, i32 0, metadata !272, metadata !372}
!381 = metadata !{i32 39, i32 0, metadata !272, metadata !372}
!382 = metadata !{i32 40, i32 0, metadata !272, metadata !372}
!383 = metadata !{i32 41, i32 0, metadata !272, metadata !372}
!384 = metadata !{i32 42, i32 0, metadata !272, metadata !372}
!385 = metadata !{i32 43, i32 0, metadata !272, metadata !372}
!386 = metadata !{i32 70, i32 0, metadata !196, null}
!387 = metadata !{i32 179, i32 0, metadata !92, null}
!388 = metadata !{i32 180, i32 0, metadata !389, null}
!389 = metadata !{i32 524299, metadata !92, i32 179, i32 0, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
!390 = metadata !{i32 62, i32 0, metadata !97, null}
!391 = metadata !{i32 63, i32 0, metadata !392, null}
!392 = metadata !{i32 524299, metadata !97, i32 62, i32 0, metadata !1, i32 11} ; [ DW_TAG_lexical_block ]
!393 = metadata !{i32 164, i32 0, metadata !101, null}
!394 = metadata !{i32 165, i32 0, metadata !207, null}
!395 = metadata !{i32 167, i32 0, metadata !207, null}
!396 = metadata !{i32 169, i32 0, metadata !210, null}
!397 = metadata !{i32 170, i32 0, metadata !210, null}
!398 = metadata !{i32 171, i32 0, metadata !210, null}
!399 = metadata !{i32 172, i32 0, metadata !210, null}
!400 = metadata !{i32 175, i32 0, metadata !207, null}
!401 = metadata !{i32 137, i32 0, metadata !105, null}
!402 = metadata !{i32 138, i32 0, metadata !234, null}
!403 = metadata !{i32 139, i32 0, metadata !234, null}
!404 = metadata !{i32 141, i32 0, metadata !234, null}
!405 = metadata !{i32 142, i32 0, metadata !246, null}
!406 = metadata !{i32 143, i32 0, metadata !246, null}
!407 = metadata !{i32 146, i32 0, metadata !248, null}
!408 = metadata !{i32 152, i32 0, metadata !248, null}
!409 = metadata !{i32 156, i32 0, metadata !234, null}
!410 = metadata !{i32 112, i32 0, metadata !124, null}
!411 = metadata !{i32 131, i32 0, metadata !412, null}
!412 = metadata !{i32 524299, metadata !124, i32 112, i32 0, metadata !1, i32 19} ; [ DW_TAG_lexical_block ]
!413 = metadata !{i32 108, i32 0, metadata !154, null}
!414 = metadata !{i32 109, i32 0, metadata !415, null}
!415 = metadata !{i32 524299, metadata !154, i32 108, i32 0, metadata !1, i32 20} ; [ DW_TAG_lexical_block ]
