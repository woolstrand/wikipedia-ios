#import "WMFUnderlineButton.h"
#import "UIFont+WMFStyle.h"

IB_DESIGNABLE
@interface WMFUnderlineButton ()

@property (nonatomic, strong) UIView *underline;
@property (nonatomic) IBInspectable CGFloat underlineHeight;

@end

@implementation WMFUnderlineButton

-(void)awakeFromNib {
    [super awakeFromNib];
    if (self) {
        [self configureStyle];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureStyle];
    }
    return self;
}

- (void)configureStyle {
    self.titleLabel.font = [UIFont wmf_subtitle];
    [self addUnderline];
    [self setTitleColor:self.tintColor forState:UIControlStateSelected];
}

- (void)setTintColor:(UIColor *)tintColor {
    [super setTintColor:tintColor];
    self.underline.backgroundColor = self.tintColor;
    [self setTitleColor:self.tintColor forState:UIControlStateSelected];
}

- (void)addUnderline {
    CGFloat underlineHeight = self.underlineHeight ? self.underlineHeight : 1.0;
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    v.backgroundColor = self.tintColor;
    v.frame = CGRectMake(0, self.bounds.size.height - underlineHeight, self.bounds.size.width, underlineHeight);
    v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:v];
    self.underline = v;
    [self setSelected:self.selected];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.underline.alpha = 1.0;
    } else {
        self.underline.alpha = 0.0;
    }
}

@end
