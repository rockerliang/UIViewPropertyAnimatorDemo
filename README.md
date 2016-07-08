# UIViewPropertyAnimatorDemo


## 一. UIViewPropertyAnimator的介绍   
###UIViewPropertyAnimator 可以称为属性动画器，是iOS10中新增的一个执行View动画的类，它主要具有一下的特点：

####1. 可中断性 ####2. 可擦除 ####3. 可反转性 ####4. 丰富的动画时间控制功能

以前我们执行view的动画，基本上都是不可以中断的，这次出了UIViewPropertyAnimator后，我们可以任意中断动画和反转继续动画，提高了动画的可操作性。####UIViewPropertyAnimator是遵循UIViewImplicitlyAnimating协议####UIViewImplicitlyAnimating遵循UIViewAnimating协议

##二. 代码实现
###1.我们首先添加要进行一些动画操作的view：
	self.testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];    self.testView.backgroundColor = [UIColor redColor];    [self.view addSubview:self.testView];
   
###2.接下来我们可以初始化属性动画器了：
	@property (strong, nonatomic) UIViewPropertyAnimator *viewProperty;   
    //初始化属性动画器
    self.viewProperty = [[UIViewPropertyAnimator alloc] initWithDuration:4.f curve:UIViewAnimationCurveLinear animations:^{        self.testView.frame = CGRectMake(200, 200, 200, 200);    }];在初始化属性动画器中，我们让testview由初始位置CGRectMake(100, 100, 100, 100)移动到CGRectMake(200, 200, 200, 200)，当然这样只是初始化，testview并不会真正的移动，如果想让view移动起来，我们需要：
		
		[self.viewProperty startAnimation];
这段代码就可以了，同样，我们可以让view做一些其他的动画：     暂停view动画：			
 		
	[self.viewProperty pauseAnimation];
	
停止view动画：
		
		[self.viewProperty stopAnimation:true]; 
其中stopAnimation:后跟了一个BOOL值，它的含义是 是否在动画执行结束后才停止动画。

继续动画：
		
	UISpringTimingParameters *param = [[UISpringTimingParameters alloc] initWithDampingRatio:0.1];    [self.viewProperty continueAnimationWithTimingParameters:param durationFactor:1];其中continueAnimationWithTimingParameters后面需要一个UITimingCurveProvider的参数，这个参数的含义就是接下来的动画，我们想要以什么样的形式执行下去，这里我选择了spring的形式，也就是弹簧的形式，durationFactor后面的参数意思是继续执行下去的动画效果在整个动画中的时间，我选择了1s。
#####这些基本上就是UIViewPropertyAnimator的基本使用方法。只是一些基础的介绍，在项目中暂时还没怎么用到，以后具体用到了再补充！
