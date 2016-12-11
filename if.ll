; ModuleID = 'if.ll'

define i32 @main() {
alloca:
  %left = alloca i32
  %right = alloca i32
  %result = alloca i32
  br label %entry

entry:
  store i32 20, i32* %left
  store i32 20, i32* %right

  %0 = load i32, i32* %left
  %1 = load i32, i32* %right

  %cond = icmp eq i32 %0, %1
  br i1 %cond, label %then, label %else

then:
  store i32 100, i32* %result
  br label %exit

else:
  store i32 200, i32* %result
  br label %exit

exit:
  %return_value = load i32, i32* %result
  ret i32 %return_value
}
