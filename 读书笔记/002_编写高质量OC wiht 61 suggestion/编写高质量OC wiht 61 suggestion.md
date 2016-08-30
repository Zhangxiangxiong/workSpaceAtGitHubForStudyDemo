![image](./images/61 suggestion.jpg)


### 1.Objective c 是门动态语言,何为动态语言,

意味着Objective-c代码不能直接编译成机器代码,而是类似于Java一样编译成中间代码,并且需要Runtime将中间代码翻译成机器代码,交给机器执行。


***
objc 的一些代码

```
    // some codes
    id obj = self;
    if([obj respondsToSelector:@selector(doSomething:)] )
    {
        
    }
    
    if([obj isKindOfClass:[NSObject class]])
    {
        
    }
    
    [obj doSomething];
```



