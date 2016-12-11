; ModuleID = 'switch.ll'

define i32 @main() {
entry:
  %0 = alloca i32
  store i32 -200, i32* %0
  %cond = load i32, i32* %0

  switch i32 %cond, label %default [
    i32 1, label %cond1
    i32 2, label %cond2
    i32 3, label %cond3
  ]

default:
  ret i32 0
cond1:
  ret i32 1
cond2:
  ret i32 2
cond3:
  ret i32 3
}
