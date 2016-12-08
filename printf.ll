; ModuleID = 'printf.ll'
@.helloworld = private unnamed_addr constant [12 x i8] c"hello world\00"
@.newline = private unnamed_addr constant [2 x i8] c"\0A\00"
@.whatsup = private unnamed_addr constant [9 x i8] c"whats up\00"

declare i32 @puts(i8* nocapture) nounwind

define i32 @main() {
entry:
  %0 = getelementptr [12 x i8], [12 x i8]* @.helloworld, i64 0, i64 0
  %1 = getelementptr [2 x i8], [2 x i8]* @.newline, i64 0, i64 0
  %2 = getelementptr [9 x i8], [9 x i8]* @.whatsup, i64 0, i64 0

  call i32 @puts(i8* %0)
  call i32 @puts(i8* %1)
  call i32 @puts(i8* %2)
  ret i32 0
}
