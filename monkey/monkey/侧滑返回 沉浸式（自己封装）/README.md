

// 禁用返回手势，需要开启只需要设置 yes 即可。 默认开启

if ([self.navigationController respondsToSelector:@selector(interactivePopFestureRecognize)]) {


        self.navigationController.interactivePopFestureRecognize,enable = NO;

}


//边缘手势
        UIScreenEdgePanGestureRecognizer *screenEdgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
        
        screenEdgePan.edges = UIRectEdgeLeft;