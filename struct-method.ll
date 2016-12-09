; ModuleID = 'struct-method.ll'

@.formatstring = private unnamed_addr constant [13 x i8] c"%c\0A%ld\0A%lld\0A\00"

%box = type { i8, i32, i64 }

declare i32 @printf(i8* noalias nocapture, ...)

define i32 @set_prop_32(%box** %arg, i32 %value) {
entry:
  %argd = load %box*, %box** %arg
  %0 = getelementptr inbounds %box, %box* %argd, i32 0, i32 1
  store i32 %value, i32* %0

  ret i32 0
}

define i32 @main() {
alloca:
  %mybox = alloca %box
  br label %entry

entry:
  %format = getelementptr [13 x i8], [13 x i8]* @.formatstring, i32 0, i32 0
  %0 = getelementptr inbounds %box, %box* %mybox, i32 0, i32 0
  %1 = getelementptr inbounds %box, %box* %mybox, i32 0, i32 1
  %2 = getelementptr inbounds %box, %box* %mybox, i32 0, i32 2

  store i8  65,       i8*  %0
  store i32 200,      i32* %1
  store i64 9999999,  i64* %2

  %3 = load i8, i8* %0
  %4 = load i32, i32* %1
  %5 = load i64, i64* %2

  ; Create a pointer to the struct
  %mybox_pointer = alloca %box*
  store %box* %mybox, %box** %mybox_pointer

  call i32 (i8*, ...) @printf(i8* %format, i8 %3, i32 %4, i64 %5)

  call i32 (%box**, i32) @set_prop_32(%box** %mybox_pointer, i32 4)

  %8 = load i8, i8* %0
  %9 = load i32, i32* %1
  %10 = load i64, i64* %2

  call i32 (i8*, ...) @printf(i8* %format, i8 %8, i32 %9, i64 %10)

  ret i32 0
}
