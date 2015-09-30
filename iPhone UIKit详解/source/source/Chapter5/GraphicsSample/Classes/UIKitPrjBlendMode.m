//
//  UIKitPrjBlendMode.m
//
//  Created by wang on 2011-09-24.
//

#import "UIKitPrjBlendMode.h"

@implementation BlendModeTest

@synthesize blendMode = blendMode_;

- (void)dealloc {
  [frontImage_ release];  
  [backImage_ release];  
  [super dealloc];
}

- (id)init {
  if ( (self = [super init]) ) {
    backImage_ = [UIImage imageNamed:@"back.png"];
    frontImage_ = [UIImage imageNamed:@"dog.jpg"];
    CGRect newFrame = self.frame;
    newFrame.size = frontImage_.size;
    self.frame = newFrame;
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  [backImage_ drawInRect:rect];
  [frontImage_ drawInRect:rect blendMode:blendMode_ alpha:1.0];
}

- (void)changeMode {
  if ( kCGBlendModeLuminosity < ++blendMode_ ) {
    blendMode_ = kCGBlendModeNormal;
  } 
}

@end

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjBlendMode ()
- (void)changeLabel;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjBlendMode

- (void)dealloc {
  [test_ release];
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  test_ = [[BlendModeTest alloc] init];
  test_.center = self.view.center;
  test_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                           UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:test_];

  label_ = [[UILabel alloc] init];
  label_.frame =
    CGRectMake( 0, self.view.bounds.size.height - 100, self.view.bounds.size.width, 20 );
  label_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  label_.textAlignment = UITextAlignmentCenter;
  [self.view addSubview:label_];
  [self changeLabel];

  UIImage* imageBack = [UIImage imageNamed:@"back.png"];
  UIImageView* imageViewBack = [[[UIImageView alloc] initWithImage:imageBack] autorelease];
  imageViewBack.frame = CGRectMake( 0, 0, 90, 83 );
  imageViewBack.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin |
                                    UIViewAutoresizingFlexibleRightMargin |
                                    UIViewAutoresizingFlexibleTopMargin |
                                    UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:imageViewBack];
  UIImage* imageFront = [UIImage imageNamed:@"dog.jpg"];
  UIImageView* imageViewFront = [[[UIImageView alloc] initWithImage:imageFront] autorelease];
  imageViewFront.frame = CGRectMake( 320 - 90, 0, 90, 83 );
  imageViewFront.autoresizingMask = imageViewFront.autoresizingMask;
  [self.view addSubview:imageViewFront];
}

#pragma mark ----- Private Methods -----

- (void)changeLabel {
  switch ( test_.blendMode ) {
    case kCGBlendModeMultiply: label_.text = @"kCGBlendModeMultiply"; break;
    case kCGBlendModeScreen: label_.text = @"kCGBlendModeScreen"; break;
    case kCGBlendModeOverlay: label_.text = @"kCGBlendModeOverlay"; break;
    case kCGBlendModeDarken: label_.text = @"kCGBlendModeDarken"; break;
    case kCGBlendModeLighten: label_.text = @"kCGBlendModeLighten"; break;
    case kCGBlendModeColorDodge: label_.text = @"kCGBlendModeColorDodge"; break;
    case kCGBlendModeColorBurn: label_.text = @"kCGBlendModeColorBurn"; break;
    case kCGBlendModeSoftLight: label_.text = @"kCGBlendModeSoftLight"; break;
    case kCGBlendModeHardLight: label_.text = @"kCGBlendModeHardLight"; break;
    case kCGBlendModeDifference: label_.text = @"kCGBlendModeDifference"; break;
    case kCGBlendModeExclusion: label_.text = @"kCGBlendModeExclusion"; break;
    case kCGBlendModeHue: label_.text = @"kCGBlendModeHue"; break;
    case kCGBlendModeSaturation: label_.text = @"kCGBlendModeSaturation"; break;
    case kCGBlendModeColor: label_.text = @"kCGBlendModeColor"; break;
    case kCGBlendModeLuminosity: label_.text = @"kCGBlendModeLuminosity"; break;
    case kCGBlendModeClear: label_.text = @"kCGBlendModeClear"; break;
    case kCGBlendModeCopy: label_.text = @"kCGBlendModeCopy"; break;
    case kCGBlendModeSourceIn: label_.text = @"kCGBlendModeSourceIn"; break;
    case kCGBlendModeSourceOut: label_.text = @"kCGBlendModeSourceOut"; break;
    case kCGBlendModeSourceAtop: label_.text = @"kCGBlendModeSourceAtop"; break;
    case kCGBlendModeDestinationOver: label_.text = @"kCGBlendModeDestinationOver"; break;
    case kCGBlendModeDestinationIn: label_.text = @"kCGBlendModeDestinationIn"; break;
    case kCGBlendModeDestinationOut: label_.text = @"kCGBlendModeDestinationOut"; break;
    case kCGBlendModeDestinationAtop: label_.text = @"kCGBlendModeDestinationAtop"; break;
    case kCGBlendModeXOR: label_.text = @"kCGBlendModeXOR"; break;
    case kCGBlendModePlusDarker: label_.text = @"kCGBlendModePlusDarker"; break;
    case kCGBlendModePlusLighter: label_.text = @"kCGBlendModePlusLighter"; break;
    default: label_.text = @"kCGBlendModeNormal"; break;
  }
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [test_ changeMode];
  [self changeLabel];
  [test_ setNeedsDisplay];
}

@end
