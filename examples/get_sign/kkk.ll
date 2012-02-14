; ModuleID = 'kkk.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @badAbs(i8 signext %x) nounwind {
entry:
  %x_addr = alloca i8, align 1
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8 %x, i8* %x_addr
  %1 = load i8* %x_addr, align 1
  %2 = icmp slt i8 %1, 0
  br i1 %2, label %bb, label %bb1

bb:                                               ; preds = %entry
  %3 = load i8* %x_addr, align 1
  %4 = sext i8 %3 to i32
  %5 = sub nsw i32 0, %4
  store i32 %5, i32* %0, align 4
  br label %bb4

bb1:                                              ; preds = %entry
  %6 = load i8* %x_addr, align 1
  %7 = icmp eq i8 %6, 75
  br i1 %7, label %bb2, label %bb3

bb2:                                              ; preds = %bb1
  %8 = load i8* %x_addr, align 1
  %9 = sext i8 %8 to i32
  %10 = sub nsw i32 0, %9
  store i32 %10, i32* %0, align 4
  br label %bb4

bb3:                                              ; preds = %bb1
  %11 = load i8* %x_addr, align 1
  %12 = sext i8 %11 to i32
  store i32 %12, i32* %0, align 4
  br label %bb4

bb4:                                              ; preds = %bb3, %bb2, %bb
  %13 = load i32* %0, align 4
  store i32 %13, i32* %retval, align 4
  br label %return

return:                                           ; preds = %bb4
  %retval5 = load i32* %retval
  ret i32 %retval5
}

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %retval = alloca i32
  %x = alloca i8
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  %0 = load i8*** %argv_addr, align 8
  %1 = getelementptr inbounds i8** %0, i64 1
  %2 = load i8** %1, align 1
  %3 = getelementptr inbounds i8* %2, i64 0
  %4 = load i8* %3, align 1
  store i8 %4, i8* %x, align 1
  %5 = load i8* %x, align 1
  %6 = sext i8 %5 to i32
  %7 = trunc i32 %6 to i8
  %8 = call i32 @badAbs(i8 signext %7) nounwind
  br label %return

return:                                           ; preds = %entry
  %retval1 = load i32* %retval
  ret i32 %retval1
}
