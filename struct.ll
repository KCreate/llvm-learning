; ModuleID = 'struct.ll'

@.formatstring = private unnamed_addr constant [13 x i8] c"%c\0A%ld\0A%lld\0A\00"

%box = type { i8, i32, i64 }

declare i32 @printf(i8* noalias nocapture, ...)

define i32 @main() {
alloca:
  %mybox = alloca %box

  br label %entry

entry:
  %format = getelementptr [13 x i8], [13 x i8]* @.formatstring, i64 0, i64 0
  %0 = getelementptr inbounds %box, %box* %mybox, i64 0, i32 0
  %1 = getelementptr inbounds %box, %box* %mybox, i64 0, i32 1
  %2 = getelementptr inbounds %box, %box* %mybox, i64 0, i32 2

  store i8  65,       i8*  %0
  store i32 200,      i32* %1
  store i64 9999999,  i64* %2

  %f8 = load i8, i8* %0
  %f32 = load i32, i32* %1
  %f64 = load i64, i64* %2

  call i32 (i8*, ...) @printf(i8* %format, i8 %f8, i32 %f32, i64 %f64)

  ret i32 0
}
