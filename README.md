## QYSearchDemo
* 一个支持数字、拼音、中文模糊的简单搜索示例

## 撰写原因
* 最近接手公司一个BMS客户端项目，其中需求一个功能就是可以搜索自己的客户，需要展示客户姓名、手机号、以及该客户的信息是否完善。
* 起初设计的是输入手机号然后点搜索展示结果就行了，由于个人原因我增加了拼音搜索，和中文模糊搜索功能，主要是通过iOS中谓词来实现的。

## 解决问题
* 我先创建了一用户类`UserClass`,在这里面定义了客户姓名、手机号、以及一个标识客户信息是否完善的bool字段，同时还增加了一个将姓名转换成拼音的方法，当初始化UserClass对象的时候就赋值了客户姓名，手机号，以及信息是否完善，同时还有该用户的拼音名。将中文转换为拼音使用的技术是：
* ``` objc
NSMutableString *ms = [[NSMutableString alloc] initWithString:name];
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
            
        }
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
            self.pinyinName = ms;
        }
```

* 在Controller中用谓词的特点进行搜索：
* ``` objc 
NSString *predicateString = [NSString stringWithFormat:@"phone like '%@*' || name like '*%@*' || pinyinName like[cd] '%@*'",textField.text,textField.text,textField.text];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
```