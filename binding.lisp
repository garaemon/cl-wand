(in-package :cl-wand)

(eval-when (:compile-toplevel :load-toplevel)
  (cffi:defcenum ChannelType
    :UndefinedChannel
    (:RedChannel #.#x0001)
    (:GrayChannel #.#x0001)
    (:CyanChannel #.#x0001)
    (:GreenChannel #.#x0002)
    (:MagentaChannel #.#x0002)
    (:BlueChannel #.#x0004)
    (:YellowChannel #.#x0004)
    (:AlphaChannel #.#x0008)
    (:OpacityChannel #.#x0008)
    (:MatteChannel #.#x0008)
    (:BlackChannel #.#x0020)
    (:IndexChannel #.#x0020)
    (:TrueAlphaChannel #.#x0040)
    (:RGBChannels #.#x0080)
    (:AllChannels #.#x003F))

  (cffi:defcenum ClassType
    :UndefinedClass
    :DirectClass
    :PseudoClass)

  (cffi:defcenum MagickBooleanType
    (:MagickFalse #.0)
    (:MagickTrue #.1))

  (cffi:defcenum MapMode
    :ReadMode
    :WriteMode
    :IOMode)

  (cffi:defcenum VirtualPixelMethod
    :UndefinedVirtualPixelMethod
    :BackgroundVirtualPixelMethod
    :ConstantVirtualPixelMethod
    :DitherVirtualPixelMethod
    :EdgeVirtualPixelMethod
    :MirrorVirtualPixelMethod
    :RandomVirtualPixelMethod
    :TileVirtualPixelMethod
    :TransparentVirtualPixelMethod
    :MaskVirtualPixelMethod
    :BlackVirtualPixelMethod
    :GrayVirtualPixelMethod
    :WhiteVirtualPixelMethod
    :HorizontalTileVirtualPixelMethod
    :VerticalTileVirtualPixelMethod
    :HorizontalTileEdgeVirtualPixelMethod
    :VerticalTileEdgeVirtualPixelMethod
    :CheckerTileVirtualPixelMethod)

  (cffi:defcenum ComplianceType
    :UndefinedCompliance
    (:NoCompliance #.#x0000)
    (:SVGCompliance #.#x0001)
    (:X11Compliance #.#x0002)
    (:XPMCompliance #.#x0004)
    (:AllCompliance #.#x7fffffff))

  (cffi:defcenum ColorspaceType
    :UndefinedColorspace
    :RGBColorspace
    :GRAYColorspace
    :TransparentColorspace
    :OHTAColorspace
    :LabColorspace
    :XYZColorspace
    :YCbCrColorspace
    :YCCColorspace
    :YIQColorspace
    :YPbPrColorspace
    :YUVColorspace
    :CMYKColorspace
    :sRGBColorspace
    :HSBColorspace
    :HSLColorspace
    :HWBColorspace
    :Rec601LumaColorspace
    :Rec601YCbCrColorspace
    :Rec709LumaColorspace
    :Rec709YCbCrColorspace
    :LogColorspace
    :CMYColorspace)

  (cffi:defcenum MetricType
    :UndefinedMetric
    :AbsoluteErrorMetric
    :MeanAbsoluteErrorMetric
    :MeanErrorPerPixelMetric
    :MeanSquaredErrorMetric
    :PeakAbsoluteErrorMetric
    :PeakSignalToNoiseRatioMetric
    :RootMeanSquaredErrorMetric)

  (cffi:defcenum CompositeOperator
    :UndefinedCompositeOp
    :NoCompositeOp
    :AddCompositeOp
    :AtopCompositeOp
    :BlendCompositeOp
    :BumpmapCompositeOp
    :ChangeMaskCompositeOp
    :ClearCompositeOp
    :ColorBurnCompositeOp
    :ColorDodgeCompositeOp
    :ColorizeCompositeOp
    :CopyBlackCompositeOp
    :CopyBlueCompositeOp
    :CopyCompositeOp
    :CopyCyanCompositeOp
    :CopyGreenCompositeOp
    :CopyMagentaCompositeOp
    :CopyOpacityCompositeOp
    :CopyRedCompositeOp
    :CopyYellowCompositeOp
    :DarkenCompositeOp
    :DstAtopCompositeOp
    :DstCompositeOp
    :DstInCompositeOp
    :DstOutCompositeOp
    :DstOverCompositeOp
    :DifferenceCompositeOp
    :DisplaceCompositeOp
    :DissolveCompositeOp
    :ExclusionCompositeOp
    :HardLightCompositeOp
    :HueCompositeOp
    :InCompositeOp
    :LightenCompositeOp
    :LinearLightCompositeOp
    :LuminizeCompositeOp
    :MinusCompositeOp
    :ModulateCompositeOp
    :MultiplyCompositeOp
    :OutCompositeOp
    :OverCompositeOp
    :OverlayCompositeOp
    :PlusCompositeOp
    :ReplaceCompositeOp
    :SaturateCompositeOp
    :ScreenCompositeOp
    :SoftLightCompositeOp
    :SrcAtopCompositeOp
    :SrcCompositeOp
    :SrcInCompositeOp
    :SrcOutCompositeOp
    :SrcOverCompositeOp
    :SubtractCompositeOp
    :ThresholdCompositeOp
    :XorCompositeOp
    :DivideCompositeOp)

  (cffi:defcenum CompressionType
    :UndefinedCompression
    :NoCompression
    :BZipCompression
    :DXT1Compression
    :DXT3Compression
    :DXT5Compression
    :FaxCompression
    :Group4Compression
    :JPEGCompression
    :JPEG2000Compression
    :LosslessJPEGCompression
    :LZWCompression
    :RLECompression
    :ZipCompression)

  (cffi:defcenum StorageType
    :UndefinedPixel
    :CharPixel
    :DoublePixel
    :FloatPixel
    :IntegerPixel
    :LongPixel
    :QuantumPixel
    :ShortPixel)

  (cffi:defcenum MagickLayerMethod
    :UndefinedMagickLayerMethod)

  (cffi:defcenum DistortImageMethod
    :UndefinedDistortion
    :AffineDistortion
    :AffineProjectionDistortion
    :ScaleRotateTranslateDistortion
    :PerspectiveDistortion
    :PerspectiveProjectionDistortion
    :BilinearDistortion
    :PolynomialDistortion
    :ArcDistortion
    :PolarDistortion
    :DePolarDistortion
    :BarrelDistortion
    :BarrelInverseDistortion
    :ShepardsDistortion
    :SentinelDistortion)

;;   (cffi:defcenum SparseColorMethod
;;     (:UndefinedColorInterpolate
;;      (foreign-enum-value 'DistortImageMethod :UndefinedDistortion))
;;     (:BarycentricColorInterpolate
;;      (foreign-enum-value 'DistortImageMethod :AffineDistortion))
;;     (:BilinearColorInterpolate
;;      (foreign-enum-value 'DistortImageMethod :BilinearDistortion))
;;     (:PolynomialColorInterpolate
;;      (foreign-enum-value 'DistortImageMethod :PolynomialDistortion))
;;     (:ShepardsColorInterpolate
;;      (foreign-enum-value 'DistortImageMethod :ShepardsDistortion))
;;     (:VoronoiColorInterpolate
;;      (foreign-enum-value 'DistortImageMethod :SentinelDistortion)))

  (cffi:defcenum AlignType
    :UndefinedAlign
    :LeftAlign
    :CenterAlign
    :RightAlign)

  (cffi:defcenum ClipPathUnits
    :UndefinedPathUnits
    :UserSpace
    :UserSpaceOnUse
    :ObjectBoundingBox)

  (cffi:defcenum DecorationType
    :UndefinedDecoration
    :NoDecoration
    :UnderlineDecoration
    :OverlineDecoration
    :LineThroughDecoration)

  (cffi:defcenum FillRule
    :UndefinedRule
    :EvenOddRule
    :NonZeroRule)

  (cffi:defcenum GradientType
    :UndefinedGradient
    :LinearGradient
    :RadialGradient)

  (cffi:defcenum LineCap
    :UndefinedCap
    :ButtCap
    :RoundCap
    :SquareCap)

  (cffi:defcenum LineJoin
    :UndefinedJoin
    :MiterJoin
    :RoundJoin
    :BevelJoin)

  (cffi:defcenum PaintMethod
    :UndefinedMethod
    :PointMethod
    :ReplaceMethod
    :FloodfillMethod
    :FillToBorderMethod
    :ResetMethod)

  (cffi:defcenum PrimitiveType
    :UndefinedPrimitive
    :PointPrimitive
    :LinePrimitive
    :RectanglePrimitive
    :RoundRectanglePrimitive
    :ArcPrimitive
    :EllipsePrimitive
    :CirclePrimitive
    :PolylinePrimitive
    :PolygonPrimitive
    :BezierPrimitive
    :ColorPrimitive
    :MattePrimitive
    :TextPrimitive
    :ImagePrimitive
    :PathPrimitive)

  (cffi:defcenum ReferenceType
    :UndefinedReference
    :GradientReference)

  (cffi:defcenum SpreadMethod
    :UndefinedSpread
    :PadSpread
    :ReflectSpread
    :RepeatSpread)

  (cffi:defcenum PreviewType
    :UndefinedPreview
    :RotatePreview
    :ShearPreview
    :RollPreview
    :HuePreview
    :SaturationPreview
    :BrightnessPreview
    :GammaPreview
    :SpiffPreview
    :DullPreview
    :GrayscalePreview
    :QuantizePreview
    :DespecklePreview
    :ReduceNoisePreview
    :AddNoisePreview
    :SharpenPreview
    :BlurPreview
    :ThresholdPreview
    :EdgeDetectPreview
    :SpreadPreview
    :SolarizePreview
    :ShadePreview
    :RaisePreview
    :SegmentPreview
    :SwirlPreview
    :ImplodePreview
    :WavePreview
    :OilPaintPreview
    :CharcoalDrawingPreview
    :JPEGPreview)

  (cffi:defcenum ExceptionType
    :UndefinedException
    (:WarningException #.300)
    (:ResourceLimitWarning #.300)
    (:TypeWarning #.305)
    (:OptionWarning #.310)
    (:DelegateWarning #.315)
    (:MissingDelegateWarning #.320)
    (:CorruptImageWarning #.325)
    (:FileOpenWarning #.330)
    (:BlobWarning #.335)
    (:StreamWarning #.340)
    (:CacheWarning #.345)
    (:CoderWarning #.350)
    (:ModuleWarning #.355)
    (:DrawWarning #.360)
    (:ImageWarning #.365)
    (:WandWarning #.370)
    (:RandomWarning #.375)
    (:XServerWarning #.380)
    (:MonitorWarning #.385)
    (:RegistryWarning #.390)
    (:ConfigureWarning #.395)
    (:ErrorException #.400)
    (:ResourceLimitError #.400)
    (:TypeError #.405)
    (:OptionError #.410)
    (:DelegateError #.415)
    (:MissingDelegateError #.420)
    (:CorruptImageError #.425)
    (:FileOpenError #.430)
    (:BlobError #.435)
    (:StreamError #.440)
    (:CacheError #.445)
    (:CoderError #.450)
    (:ModuleError #.455)
    (:DrawError #.460)
    (:ImageError #.465)
    (:WandError #.470)
    (:RandomError #.475)
    (:XServerError #.480)
    (:MonitorError #.485)
    (:RegistryError #.490)
    (:ConfigureError #.495)
    (:FatalErrorException #.700)
    (:ResourceLimitFatalError #.700)
    (:TypeFatalError #.705)
    (:OptionFatalError #.710)
    (:DelegateFatalError #.715)
    (:MissingDelegateFatalError #.720)
    (:CorruptImageFatalError #.725)
    (:FileOpenFatalError #.730)
    (:BlobFatalError #.735)
    (:StreamFatalError #.740)
    (:CacheFatalError #.745)
    (:CoderFatalError #.750)
    (:ModuleFatalError #.755)
    (:DrawFatalError #.760)
    (:ImageFatalError #.765)
    (:WandFatalError #.770)
    (:RandomFatalError #.775)
    (:XServerFatalError #.780)
    (:MonitorFatalError #.785)
    (:RegistryFatalError #.790)
    (:ConfigureFatalError #.795))

  (cffi:defcenum MagickEvaluateOperator
    :UndefinedEvaluateOperator
    :AddEvaluateOperator
    :AndEvaluateOperator
    :DivideEvaluateOperator
    :LeftShiftEvaluateOperator
    :MaxEvaluateOperator
    :MinEvaluateOperator
    :MultiplyEvaluateOperator
    :OrEvaluateOperator
    :RightShiftEvaluateOperator
    :SetEvaluateOperator
    :SubtractEvaluateOperator
    :XorEvaluateOperator
    :PowEvaluateOperator
    :LogEvaluateOperator
    :ThresholdEvaluateOperator
    :ThresholdBlackEvaluateOperator
    :ThresholdWhiteEvaluateOperator
    :GaussianNoiseEvaluateOperator
    :ImpulseNoiseEvaluateOperator
    :LaplacianNoiseEvaluateOperator
    :MultiplicativeNoiseEvaluateOperator
    :PoissonNoiseEvaluateOperator
    :UniformNoiseEvaluateOperator
    :CosineEvaluateOperator
    :SineEvaluateOperator
    :AddModulusEvaluateOperator)

  (cffi:defcenum MagickFunction
    :UndefinedFunction
    :PolynomialFunction
    :SinusoidFunction)

  (cffi:defcenum NoiseType
    :UndefinedNoise
    :UniformNoise
    :GaussianNoise
    :MultiplicativeGaussianNoise
    :ImpulseNoise
    :LaplacianNoise
    :PoissonNoise
    :RandomNoise)

  (cffi:defcenum GeometryFlags
    (:NoValue #.#x0000)
    (:XValue #.#x0001)
    (:XiValue #.#x0001)
    (:YValue #.#x0002)
    (:PsiValue #.#x0002)
    (:WidthValue #.#x0004)
    (:RhoValue #.#x0004)
    (:HeightValue #.#x0008)
    (:SigmaValue #.#x0008)
    (:ChiValue #.#x0010)
    (:XiNegative #.#x0020)
    (:XNegative #.#x0020)
    (:PsiNegative #.#x0040)
    (:YNegative #.#x0040)
    (:ChiNegative #.#x0080)
    (:PercentValue #.#x1000)
    (:AspectValue #.#x2000)
    (:LessValue #.#x4000)
    (:GreaterValue #.#x8000)
    (:MinimumValue #.#x10000)
    (:AreaValue #.#x20000)
    (:DecimalValue #.#x40000)
    (:AllValues #.#x7fffffff))

  (cffi:defcenum GravityType
    :UndefinedGravity
    (:ForgetGravity #.0)
    (:NorthWestGravity #.1)
    (:NorthGravity #.2)
    (:NorthEastGravity #.3)
    (:WestGravity #.4)
    (:CenterGravity #.5)
    (:EastGravity #.6)
    (:SouthWestGravity #.7)
    (:SouthGravity #.8)
    (:SouthEastGravity #.9)
    (:StaticGravity #.10))

  (cffi:defcenum AlphaChannelType
    :UndefinedAlphaChannel
    :ActivateAlphaChannel
    :CopyAlphaChannel
    :DeactivateAlphaChannel
    :ExtractAlphaChannel
    :OpaqueAlphaChannel
    :ResetAlphaChannel
    :SetAlphaChannel
    :ShapeAlphaChannel
    :TransparentAlphaChannel)

  (cffi:defcenum ImageType
    :UndefinedType
    :BilevelType
    :GrayscaleType
    :GrayscaleMatteType
    :PaletteType
    :PaletteMatteType
    :TrueColorType
    :TrueColorMatteType
    :ColorSeparationType
    :ColorSeparationMatteType
    :OptimizeType
    :PaletteBilevelMatteType)

  (cffi:defcenum InterlaceType
    :UndefinedInterlace
    :NoInterlace
    :LineInterlace
    :PlaneInterlace
    :PartitionInterlace
    :GIFInterlace
    :JPEGInterlace
    :PNGInterlace)

  (cffi:defcenum OrientationType
    :UndefinedOrientation
    :TopLeftOrientation
    :TopRightOrientation
    :BottomRightOrientation
    :BottomLeftOrientation
    :LeftTopOrientation
    :RightTopOrientation
    :RightBottomOrientation
    :LeftBottomOrientation)

  (cffi:defcenum ResolutionType
    :UndefinedResolution
    :PixelsPerInchResolution
    :PixelsPerCentimeterResolution)

  (cffi:defcenum TransmitType
    :UndefinedTransmitType
    :FileTransmitType
    :BlobTransmitType
    :StreamTransmitType
    :ImageTransmitType)

  (cffi:defcenum DisposeType
    :UnrecognizedDispose
    (:UndefinedDispose #.0)
    (:NoneDispose #.1)
    (:BackgroundDispose #.2)
    (:PreviousDispose #.3))

  (cffi:defcenum ImageLayerMethod
    :UndefinedLayer
    :CoalesceLayer
    :CompareAnyLayer
    :CompareClearLayer
    :CompareOverlayLayer
    :DisposeLayer
    :OptimizeLayer
    :OptimizeImageLayer
    :OptimizePlusLayer
    :OptimizeTransLayer
    :RemoveDupsLayer
    :RemoveZeroLayer
    :CompositeLayer
    :MergeLayer
    :FlattenLayer
    :MosaicLayer
    :TrimBoundsLayer)

  (cffi:defcenum LogEventType
    :UndefinedEvents
    (:NoEvents #.#x0000)
    (:TraceEvent #.#x0001)
    (:AnnotateEvent #.#x0002)
    (:BlobEvent #.#x0004)
    (:CacheEvent #.#x0008)
    (:CoderEvent #.#x0010)
    (:ConfigureEvent #.#x0020)
    (:DeprecateEvent #.#x0040)
    (:DrawEvent #.#x0080)
    (:ExceptionEvent #.#x0100)
    (:LocaleEvent #.#x0200)
    (:ModuleEvent #.#x0400)
    (:ResourceEvent #.#x0800)
    (:TransformEvent #.#x1000)
    (:UserEvent #.#x2000)
    (:WandEvent #.#x4000)
    (:X11Event #.#x8000)
    (:AllEvents #.#x7fffffff))

  (cffi:defcenum MagickFormatType
    :UndefinedFormatType
    :ImplicitFormatType
    :ExplicitFormatType)

  (cffi:defcenum MagickThreadSupport
    (:NoThreadSupport #.#x0000)
    (:DecoderThreadSupport #.#x0001)
    (:EncoderThreadSupport #.#x0002))

  (cffi:defcenum MagickModuleType
    :MagickImageCoderModule
    :MagickImageFilterModule)

  (cffi:defcenum MontageMode
    :UndefinedMode
    :FrameMode
    :UnframeMode
    :ConcatenateMode)

  (cffi:defcenum MagickOption
    (:MagickUndefinedOptions #.-1)
    (:MagickAlignOptions #.0)
    :MagickAlphaOptions
    :MagickBooleanOptions
    :MagickChannelOptions
    :MagickClassOptions
    :MagickClipPathOptions
    :MagickCoderOptions
    :MagickColorOptions
    :MagickColorspaceOptions
    :MagickCommandOptions
    :MagickComposeOptions
    :MagickCompressOptions
    :MagickConfigureOptions
    :MagickDataTypeOptions
    :MagickDebugOptions
    :MagickDecorateOptions
    :MagickDelegateOptions
    :MagickDisposeOptions
    :MagickDistortOptions
    :MagickDitherOptions
    :MagickEndianOptions
    :MagickEvaluateOptions
    :MagickFillRuleOptions
    :MagickFilterOptions
    :MagickFontOptions
    :MagickFontsOptions
    :MagickFormatOptions
    :MagickFunctionOptions
    :MagickGravityOptions
    :MagickImageListOptions
    :MagickIntentOptions
    :MagickInterlaceOptions
    :MagickInterpolateOptions
    :MagickLayerOptions
    :MagickLineCapOptions
    :MagickLineJoinOptions
    :MagickListOptions
    :MagickLocaleOptions
    :MagickLogEventOptions
    :MagickLogOptions
    :MagickMagicOptions
    :MagickMethodOptions
    :MagickMetricOptions
    :MagickMimeOptions
    :MagickModeOptions
    :MagickModuleOptions
    :MagickNoiseOptions
    :MagickOrientationOptions
    :MagickPreviewOptions
    :MagickPrimitiveOptions
    :MagickQuantumFormatOptions
    :MagickResolutionOptions
    :MagickResourceOptions
    :MagickSparseColorOptions
    :MagickStorageOptions
    :MagickStretchOptions
    :MagickStyleOptions
    :MagickThresholdOptions
    :MagickTypeOptions
    :MagickVirtualPixelOptions)

  (cffi:defcenum RenderingIntent
    :UndefinedIntent
    :SaturationIntent
    :PerceptualIntent
    :AbsoluteIntent
    :RelativeIntent)

  (cffi:defcenum DitherMethod
    :UndefinedDitherMethod
    :NoDitherMethod
    :RiemersmaDitherMethod
    :FloydSteinbergDitherMethod)

  (cffi:defcenum EndianType
    :UndefinedEndian
    :LSBEndian
    :MSBEndian)

  (cffi:defcenum QuantumAlphaType
    :UndefinedQuantumAlpha
    :AssociatedQuantumAlpha
    :DisassociatedQuantumAlpha)

  (cffi:defcenum QuantumFormatType
    :UndefinedQuantumFormat
    :FloatingPointQuantumFormat
    :SignedQuantumFormat
    :UnsignedQuantumFormat)

  (cffi:defcenum QuantumType
    :UndefinedQuantum
    :AlphaQuantum
    :BlackQuantum
    :BlueQuantum
    :CMYKAQuantum
    :CMYKQuantum
    :CyanQuantum
    :GrayAlphaQuantum
    :GrayQuantum
    :GreenQuantum
    :IndexAlphaQuantum
    :IndexQuantum
    :MagentaQuantum
    :OpacityQuantum
    :RedQuantum
    :RGBAQuantum
    :RGBOQuantum
    :RGBQuantum
    :YellowQuantum
    :GrayPadQuantum
    :RGBPadQuantum
    :CbYCrYQuantum)

  (cffi:defcenum RegistryType
    :UndefinedRegistryType
    :ImageRegistryType
    :ImageInfoRegistryType
    :StringRegistryType)

  (cffi:defcenum FilterTypes
    :UndefinedFilter
    :PointFilter
    :BoxFilter
    :TriangleFilter
    :HermiteFilter
    :HanningFilter
    :HammingFilter
    :BlackmanFilter
    :GaussianFilter
    :QuadraticFilter
    :CubicFilter
    :CatromFilter
    :MitchellFilter
    :LanczosFilter
    :BesselFilter
    :SincFilter
    :KaiserFilter
    :WelshFilter
    :ParzenFilter
    :LagrangeFilter
    :BohmanFilter
    :BartlettFilter
    :SentinelFilter)

  (cffi:defcenum InterpolatePixelMethod
    :UndefinedInterpolatePixel
    :AverageInterpolatePixel
    :BicubicInterpolatePixel
    :BilinearInterpolatePixel
    :FilterInterpolatePixel
    :IntegerInterpolatePixel
    :MeshInterpolatePixel
    :NearestNeighborInterpolatePixel
    :SplineInterpolatePixel)

  (cffi:defcenum ResourceType
    :UndefinedResource
    :AreaResource
    :DiskResource
    :FileResource
    :MapResource
    :MemoryResource)

  (cffi:defcenum TimerState
    :UndefinedTimerState
    :StoppedTimerState
    :RunningTimerState)

  (cffi:defcenum StretchType
    :UndefinedStretch
    :NormalStretch
    :UltraCondensedStretch
    :ExtraCondensedStretch
    :CondensedStretch
    :SemiCondensedStretch
    :SemiExpandedStretch
    :ExpandedStretch
    :ExtraExpandedStretch
    :UltraExpandedStretch
    :AnyStretch)

  (cffi:defcenum StyleType
    :UndefinedStyle
    :NormalStyle
    :ItalicStyle
    :ObliqueStyle
    :AnyStyle)

  (cffi:defcenum PathType
    :UndefinedPath
    :MagickPath
    :RootPath
    :HeadPath
    :TailPath
    :BasePath
    :ExtensionPath
    :SubimagePath
    :CanonicalPath)

  )
(alexandria:define-constant MaxTextExtent 4096)

(alexandria:define-constant MagickSignature #xabacadab)

(alexandria:define-constant MAGICKCORE_QUANTUM_DEPTH 16)

(alexandria:define-constant MagickEpsilon 1.0d-10)

(alexandria:define-constant MagickHuge 1.0d12)

(alexandria:define-constant MaxColormapSize 65536)

(alexandria:define-constant MaxMap 65535)

(alexandria:define-constant QuantumRange 65535)

(alexandria:define-constant QuantumFormat "%u" :test #'string=)

(alexandria:define-constant MaxRGB 65535)

(alexandria:define-constant MagickSizeFormat "%10lu" :test #'string=)


(alexandria:define-constant DefaultChannels
    #.(cl:logand
       (foreign-enum-value 'ChannelType :AllChannels)
       (cl:lognot (foreign-enum-value 'ChannelType :OpacityChannel))))



(cffi:defcfun ("AnimateImages" AnimateImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("FormatMagickCaption" FormatMagickCaption) :long
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("AnnotateImage" AnnotateImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetMultilineTypeMetrics" GetMultilineTypeMetrics) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetTypeMetrics" GetTypeMetrics) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetNextImageArtifact" GetNextImageArtifact) :string
  (arg0 :pointer))

(cffi:defcfun ("RemoveImageArtifact" RemoveImageArtifact) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GetImageArtifact" GetImageArtifact) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("CloneImageArtifacts" CloneImageArtifacts) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DefineImageArtifact" DefineImageArtifact) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DeleteImageArtifact" DeleteImageArtifact) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("SetImageArtifact" SetImageArtifact) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("DestroyImageArtifacts" DestroyImageArtifacts) :void
  (arg0 :pointer))

(cffi:defcfun ("ResetImageArtifactIterator" ResetImageArtifactIterator) :void
  (arg0 :pointer))

(alexandria:define-constant MagickMaxBufferExtent #x3c005)


(cffi:defcfun ("GetBlobFileHandle" GetBlobFileHandle) :pointer
  (arg0 :pointer))

(cffi:defcfun ("BlobToImage" BlobToImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("PingBlob" PingBlob) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("BlobToFile" BlobToFile) MagickBooleanType
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("FileToImage" FileToImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GetBlobError" GetBlobError) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("ImageToFile" ImageToFile) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("InjectImageBlob" InjectImageBlob) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :string)
  (arg4 :pointer))

(cffi:defcfun ("IsBlobExempt" IsBlobExempt) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("IsBlobSeekable" IsBlobSeekable) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("IsBlobTemporary" IsBlobTemporary) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("GetBlobSize" GetBlobSize) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("GetBlobStreamHandler" GetBlobStreamHandler) :pointer
  (arg0 :pointer))

(cffi:defcfun ("FileToBlob" FileToBlob) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("GetBlobStreamData" GetBlobStreamData) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ImageToBlob" ImageToBlob) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("ImagesToBlob" ImagesToBlob) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("DestroyBlob" DestroyBlob) :void
  (arg0 :pointer))

(cffi:defcfun ("SetBlobExempt" SetBlobExempt) :void
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("GetVirtualIndexQueue" GetVirtualIndexQueue) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetVirtualPixels" GetVirtualPixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :pointer))

(cffi:defcfun ("GetVirtualPixelQueue" GetVirtualPixelQueue) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetAuthenticIndexQueue" GetAuthenticIndexQueue) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetPixelCacheThreadId" GetPixelCacheThreadId) :long)

(cffi:defcfun ("GetOneVirtualMagickPixel" GetOneVirtualMagickPixel) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetOneVirtualPixel" GetOneVirtualPixel) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetOneVirtualMethodPixel" GetOneVirtualMethodPixel) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :long)
  (arg3 :long)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("GetOneAuthenticPixel" GetOneAuthenticPixel) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("PersistPixelCache" PersistPixelCache) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 MagickBooleanType)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("SyncAuthenticPixels" SyncAuthenticPixels) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetImageExtent" GetImageExtent) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("GetAuthenticPixels" GetAuthenticPixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :pointer))

(cffi:defcfun ("GetAuthenticPixelQueue" GetAuthenticPixelQueue) :pointer
  (arg0 :pointer))

(cffi:defcfun ("QueueAuthenticPixels" QueueAuthenticPixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :pointer))

(cffi:defcfun ("GetPixelCacheMaximumThreads" GetPixelCacheMaximumThreads) :unsigned-long)

(cffi:defcfun ("GetPixelCacheVirtualMethod" GetPixelCacheVirtualMethod) :pointer
  (arg0 :pointer))

(cffi:defcfun ("SetPixelCacheVirtualMethod" SetPixelCacheVirtualMethod) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DestroyPixelCacheResources" DestroyPixelCacheResources) :void)

(cffi:defcfun ("SetPixelCacheMaximumThreads" SetPixelCacheMaximumThreads) :void
  (arg0 :unsigned-long))


(cffi:defcfun ("GetCacheViewStorageClass" GetCacheViewStorageClass) ClassType
  (arg0 :pointer))

(cffi:defcfun ("GetCacheViewColorspace" GetCacheViewColorspace) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetCacheViewVirtualIndexQueue" GetCacheViewVirtualIndexQueue) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetCacheViewVirtualPixels" GetCacheViewVirtualPixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :pointer))

(cffi:defcfun ("GetCacheViewVirtualPixelQueue" GetCacheViewVirtualPixelQueue) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetCacheViewException" GetCacheViewException) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetCacheViewAuthenticIndexQueue" GetCacheViewAuthenticIndexQueue) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetOneCacheViewVirtualPixel" GetOneCacheViewVirtualPixel) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetOneCacheViewVirtualMethodPixel" GetOneCacheViewVirtualMethodPixel) MagickBooleanType
  (arg0 :pointer)
  (arg1 VirtualPixelMethod)
  (arg2 :long)
  (arg3 :long)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("GetOneCacheViewAuthenticPixel" GetOneCacheViewAuthenticPixel) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("SetCacheViewStorageClass" SetCacheViewStorageClass) MagickBooleanType
  (arg0 :pointer)
  (arg1 ClassType))

(cffi:defcfun ("SetCacheViewVirtualPixelMethod" SetCacheViewVirtualPixelMethod) MagickBooleanType
  (arg0 :pointer)
  (arg1 VirtualPixelMethod))

(cffi:defcfun ("SyncCacheViewAuthenticPixels" SyncCacheViewAuthenticPixels) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetCacheViewExtent" GetCacheViewExtent) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("GetCacheViewAuthenticPixelQueue" GetCacheViewAuthenticPixelQueue) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetCacheViewAuthenticPixels" GetCacheViewAuthenticPixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :pointer))

(cffi:defcfun ("QueueCacheViewAuthenticPixels" QueueCacheViewAuthenticPixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :pointer))

(cffi:defcfun ("AcquireCacheView" AcquireCacheView) :pointer
  (arg0 :pointer))

(cffi:defcfun ("CloneCacheView" CloneCacheView) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DestroyCacheView" DestroyCacheView) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DecipherImage" DecipherImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("EncipherImage" EncipherImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("PasskeyDecipherImage" PasskeyDecipherImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("PasskeyEncipherImage" PasskeyEncipherImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetClientPath" GetClientPath) :string)

(cffi:defcfun ("GetClientName" GetClientName) :string)

(cffi:defcfun ("SetClientName" SetClientName) :string
  (arg0 :string))

(cffi:defcfun ("SetClientPath" SetClientPath) :string
  (arg0 :string))

(cffi:defcstruct CoderInfo
  (path :string)
  (magick :string)
  (name :string)
  (stealth MagickBooleanType)
  (previous :pointer)
  (next :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("GetCoderList" GetCoderList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetCoderInfo" GetCoderInfo) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetCoderInfoList" GetCoderInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("ListCoderInfo" ListCoderInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DestroyCoderList" DestroyCoderList) :void)

(cffi:defcstruct ColorInfo
  (path :string)
  (name :string)
  (compliance ComplianceType)
  (color :pointer)
  (stealth MagickBooleanType)
  (previous :pointer)
  (next :pointer)
  (signature :unsigned-long))

(cffi:defcstruct ColorPacket
  (pixel :pointer)
  (index :unsigned-short)
  (count :unsigned-long))

(cffi:defcstruct ErrorInfo
  (mean_error_per_pixel :double)
  (normalized_mean_error :double)
  (normalized_maximum_error :double))

(cffi:defcfun ("GetColorList" GetColorList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetColorInfo" GetColorInfo) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetColorInfoList" GetColorInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetImageHistogram" GetImageHistogram) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("UniqueImageColors" UniqueImageColors) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("IsColorSimilar" IsColorSimilar) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("IsGrayImage" IsGrayImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("IsHistogramImage" IsHistogramImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("IsImageSimilar" IsImageSimilar) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (x :pointer)
  (y :pointer)
  (arg4 :pointer))

(cffi:defcfun ("IsMagickColorSimilar" IsMagickColorSimilar) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("IsMonochromeImage" IsMonochromeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("IsOpacitySimilar" IsOpacitySimilar) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("IsOpaqueImage" IsOpaqueImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("IsPaletteImage" IsPaletteImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ListColorInfo" ListColorInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("QueryColorDatabase" QueryColorDatabase) MagickBooleanType
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("QueryColorname" QueryColorname) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 ComplianceType)
  (arg3 :string)
  (arg4 :pointer))

(cffi:defcfun ("QueryMagickColor" QueryMagickColor) MagickBooleanType
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("QueryMagickColorname" QueryMagickColorname) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 ComplianceType)
  (arg3 :string)
  (arg4 :pointer))

(cffi:defcfun ("GetNumberColors" GetNumberColors) :unsigned-long
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("ConcatenateColorComponent" ConcatenateColorComponent) :void
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 ComplianceType)
  (arg3 :string))

(cffi:defcfun ("DestroyColorList" DestroyColorList) :void)

(cffi:defcfun ("GetColorTuple" GetColorTuple) :void
  (arg0 :pointer)
  (arg1 MagickBooleanType)
  (arg2 :string))


(cffi:defcfun ("RGBTransformImage" RGBTransformImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 ColorspaceType))

(cffi:defcfun ("SetImageColorspace" SetImageColorspace) MagickBooleanType
  (arg0 :pointer)
  (arg1 ColorspaceType))

(cffi:defcfun ("TransformRGBImage" TransformRGBImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 ColorspaceType))

(cffi:defcfun ("GetImageChannelDistortions" GetImageChannelDistortions) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MetricType)
  (arg3 :pointer))

(cffi:defcfun ("CompareImageChannels" CompareImageChannels) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 ChannelType)
  (arg3 MetricType)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("CompareImages" CompareImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MetricType)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetImageChannelDistortion" GetImageChannelDistortion) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 ChannelType)
  (arg3 MetricType)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("GetImageDistortion" GetImageDistortion) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MetricType)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("IsImagesEqual" IsImagesEqual) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CompositeImage" CompositeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 CompositeOperator)
  (arg2 :pointer)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("CompositeImageChannel" CompositeImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 CompositeOperator)
  (arg3 :pointer)
  (arg4 :long)
  (arg5 :long))

(cffi:defcfun ("HuffmanDecodeImage" HuffmanDecodeImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("HuffmanEncodeImage" HuffmanEncodeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("Huffman2DEncodeImage" Huffman2DEncodeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("LZWEncodeImage" LZWEncodeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("PackbitsEncodeImage" PackbitsEncodeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("ZLIBEncodeImage" ZLIBEncodeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("Ascii85Encode" Ascii85Encode) :void
  (arg0 :pointer)
  (arg1 :unsigned-char))

(cffi:defcfun ("Ascii85Flush" Ascii85Flush) :void
  (arg0 :pointer))

(cffi:defcfun ("Ascii85Initialize" Ascii85Initialize) :void
  (arg0 :pointer))

(cffi:defcstruct ConfigureInfo
  (path :string)
  (name :string)
  (value :string)
  (stealth MagickBooleanType)
  (previous :pointer)
  (next :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("GetConfigureList" GetConfigureList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetConfigureOption" GetConfigureOption) :string
  (arg0 :string))

(cffi:defcfun ("GetConfigureValue" GetConfigureValue) :string
  (arg0 :pointer))

(cffi:defcfun ("GetConfigureInfo" GetConfigureInfo) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetConfigureInfoList" GetConfigureInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DestroyConfigureOptions" DestroyConfigureOptions) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetConfigurePaths" GetConfigurePaths) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetConfigureOptions" GetConfigureOptions) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("ListConfigureInfo" ListConfigureInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DestroyConfigureList" DestroyConfigureList) :void)

(cffi:defcfun ("ConstituteImage" ConstituteImage) :pointer
  (arg0 :unsigned-long)
  (arg1 :unsigned-long)
  (arg2 :string)
  (arg3 StorageType)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("PingImage" PingImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PingImages" PingImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ReadImage" ReadImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ReadImages" ReadImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ReadInlineImage" ReadInlineImage) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("WriteImage" WriteImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("WriteImages" WriteImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("DestroyConstitute" DestroyConstitute) :void)

(cffi:defcstruct FrameInfo
  (width :unsigned-long)
  (height :unsigned-long)
  (x :long)
  (y :long)
  (inner_bevel :long)
  (outer_bevel :long))

(cffi:defcfun ("BorderImage" BorderImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("FrameImage" FrameImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("RaiseImage" RaiseImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MagickBooleanType))

(cffi:defcstruct DelegateInfo
  (path :string)
  (decode :string)
  (encode :string)
  (commands :string)
  (mode :long)
  (thread_support MagickBooleanType)
  (spawn MagickBooleanType)
  (stealth MagickBooleanType)
  (previous :pointer)
  (next :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("GetDelegateCommand" GetDelegateCommand) :string
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :string)
  (arg4 :pointer))

(cffi:defcfun ("GetDelegateList" GetDelegateList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetDelegateCommands" GetDelegateCommands) :string
  (arg0 :pointer))

(cffi:defcfun ("GetDelegateInfo" GetDelegateInfo) :pointer
  (arg0 :string)
  (arg1 :string)
  (exception :pointer))

(cffi:defcfun ("GetDelegateInfoList" GetDelegateInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetDelegateMode" GetDelegateMode) :long
  (arg0 :pointer))

(cffi:defcfun ("GetDelegateThreadSupport" GetDelegateThreadSupport) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("InvokeDelegate" InvokeDelegate) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :string)
  (arg4 :pointer))

(cffi:defcfun ("ListDelegateInfo" ListDelegateInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DestroyDelegateList" DestroyDelegateList) :void)

(alexandria:define-constant QuantumDepth 16)

(cffi:defcstruct DoublePixelPacket
  (red :double)
  (green :double)
  (blue :double)
  (opacity :double)
  (index :double))

(cffi:defcstruct ImageAttribute
  (key :string)
  (value :string)
  (compression MagickBooleanType)
  (previous :pointer)
  (next :pointer))

(cffi:defcfun ("AllocateString" AllocateString) :string
  (arg0 :string))

(cffi:defcfun ("InterpretImageAttributes" InterpretImageAttributes) :string
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("PostscriptGeometry" PostscriptGeometry) :string
  (arg0 :string))

(cffi:defcfun ("TranslateText" TranslateText) :string
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("GetImageAttribute" GetImageAttribute) :pointer
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GetImageClippingPathAttribute" GetImageClippingPathAttribute) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetNextImageAttribute" GetNextImageAttribute) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AcquireCacheViewIndexes" AcquireCacheViewIndexes) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AcquireIndexes" AcquireIndexes) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AcquirePixels" AcquirePixels) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AcquireCacheViewPixels" AcquireCacheViewPixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :pointer))

(cffi:defcfun ("AcquireImagePixels" AcquireImagePixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :pointer))

(cffi:defcfun ("AllocateImage" AllocateImage) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetImageFromMagickRegistry" GetImageFromMagickRegistry) :pointer
  (arg0 :string)
  (id :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetImageList" GetImageList) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :pointer))

(cffi:defcfun ("GetNextImage" GetNextImage) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetPreviousImage" GetPreviousImage) :pointer
  (arg0 :pointer))

(cffi:defcfun ("FlattenImages" FlattenImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MosaicImages" MosaicImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PopImageList" PopImageList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ShiftImageList" ShiftImageList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("SpliceImageList" SpliceImageList) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :unsigned-long)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetCacheViewIndexes" GetCacheViewIndexes) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetIndexes" GetIndexes) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ValidateColormapIndex" ValidateColormapIndex) :unsigned-short
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("GetImageGeometry" GetImageGeometry) :int
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :unsigned-int)
  (arg3 :pointer))

(cffi:defcfun ("ParseImageGeometry" ParseImageGeometry) :int
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetImageListIndex" GetImageListIndex) :long
  (arg0 :pointer))

(cffi:defcfun ("SetMagickRegistry" SetMagickRegistry) :long
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("AcquireOneCacheViewPixel" AcquireOneCacheViewPixel) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("AcquireOneCacheViewVirtualPixel" AcquireOneCacheViewVirtualPixel) MagickBooleanType
  (arg0 :pointer)
  (arg1 VirtualPixelMethod)
  (arg2 :long)
  (arg3 :long)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("AffinityImage" AffinityImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("AffinityImages" AffinityImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("AllocateImageColormap" AllocateImageColormap) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("ClipPathImage" ClipPathImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 MagickBooleanType))

(cffi:defcfun ("CloneImageAttributes" CloneImageAttributes) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ColorFloodfillImage" ColorFloodfillImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :long)
  (arg4 :long)
  (arg5 :pointer))

(cffi:defcfun ("DeleteImageAttribute" DeleteImageAttribute) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DeleteMagickRegistry" DeleteMagickRegistry) MagickBooleanType
  (arg0 :long))

(cffi:defcfun ("DescribeImage" DescribeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MagickBooleanType))

(cffi:defcfun ("FormatImageAttribute" FormatImageAttribute) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string)
  &rest)

(cffi:defcfun ("FormatImageAttributeList" FormatImageAttributeList) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("FuzzyColorCompare" FuzzyColorCompare) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("FuzzyOpacityCompare" FuzzyOpacityCompare) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickMonitor" MagickMonitor) MagickBooleanType
  (arg0 :string)
  (arg1 :long)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("MapImage" MapImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MagickBooleanType))

(cffi:defcfun ("MapImages" MapImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MagickBooleanType))

(cffi:defcfun ("MatteFloodfillImage" MatteFloodfillImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-short)
  (arg3 :long)
  (arg4 :long)
  (arg5 :pointer))

(cffi:defcfun ("OpaqueImage" OpaqueImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("PaintFloodfillImage" PaintFloodfillImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :long)
  (arg4 :long)
  (arg5 :pointer)
  (arg6 :pointer))

(cffi:defcfun ("PaintOpaqueImage" PaintOpaqueImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("PaintOpaqueImageChannel" PaintOpaqueImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("PaintTransparentImage" PaintTransparentImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-short))

(cffi:defcfun ("SetExceptionInfo" SetExceptionInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("SetImageAttribute" SetImageAttribute) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("SyncCacheViewPixels" SyncCacheViewPixels) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("SyncImagePixels" SyncImagePixels) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("TransparentImage" TransparentImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-short))

(cffi:defcfun ("AcquireOneMagickPixel" AcquireOneMagickPixel) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :pointer))

(cffi:defcfun ("GetMonitorHandler" GetMonitorHandler) :pointer)

(cffi:defcfun ("SetMonitorHandler" SetMonitorHandler) :pointer
  (arg0 :pointer))

(cffi:defcfun ("SizeBlob" SizeBlob) :long
  (image :pointer))

(cffi:defcfun ("InterpolatePixelColor" InterpolatePixelColor) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :double)
  (arg4 :double)
  (arg5 :pointer))

(cffi:defcfun ("ParseSizeGeometry" ParseSizeGeometry) :unsigned-int
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("AcquireOnePixel" AcquireOnePixel) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :pointer))

(cffi:defcfun ("AcquireOneVirtualPixel" AcquireOneVirtualPixel) :pointer
  (arg0 :pointer)
  (arg1 VirtualPixelMethod)
  (arg2 :long)
  (arg3 :long)
  (arg4 :pointer))

(cffi:defcfun ("GetCacheView" GetCacheView) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long))

(cffi:defcfun ("GetCacheViewPixels" GetCacheViewPixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long))

(cffi:defcfun ("GetImagePixels" GetImagePixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long))

(cffi:defcfun ("GetOnePixel" GetOnePixel) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long))

(cffi:defcfun ("GetPixels" GetPixels) :pointer
  (arg0 :pointer))

(cffi:defcfun ("SetCacheViewPixels" SetCacheViewPixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long))

(cffi:defcfun ("SetImagePixels" SetImagePixels) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long))

(cffi:defcfun ("PopImagePixels" PopImagePixels) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("PushImagePixels" PushImagePixels) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("ChannelImage" ChannelImage) :unsigned-int
  (arg0 :pointer)
  (arg1 ChannelType))

(cffi:defcfun ("ChannelThresholdImage" ChannelThresholdImage) :unsigned-int
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DispatchImage" DispatchImage) :unsigned-int
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :string)
  (arg6 StorageType)
  (arg7 :pointer)
  (arg8 :pointer))

(cffi:defcfun ("FuzzyColorMatch" FuzzyColorMatch) :unsigned-int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double))

(cffi:defcfun ("GetNumberScenes" GetNumberScenes) :unsigned-int
  (arg0 :pointer))

(cffi:defcfun ("GetMagickGeometry" GetMagickGeometry) :unsigned-int
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("IsSubimage" IsSubimage) :unsigned-int
  (arg0 :string)
  (arg1 :unsigned-int))

(cffi:defcfun ("PushImageList" PushImageList) :unsigned-int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("QuantizationError" QuantizationError) :unsigned-int
  (arg0 :pointer))

(cffi:defcfun ("RandomChannelThresholdImage" RandomChannelThresholdImage) :unsigned-int
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("SetImageList" SetImageList) :unsigned-int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :long)
  (arg3 :pointer))

(cffi:defcfun ("TransformColorspace" TransformColorspace) :unsigned-int
  (arg0 :pointer)
  (arg1 ColorspaceType))

(cffi:defcfun ("ThresholdImage" ThresholdImage) :unsigned-int
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("ThresholdImageChannel" ThresholdImageChannel) :unsigned-int
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("UnshiftImageList" UnshiftImageList) :unsigned-int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetImageListSize" GetImageListSize) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("CloseCacheView" CloseCacheView) :pointer
  (arg0 :pointer))

(cffi:defcfun ("OpenCacheView" OpenCacheView) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AcquireMemory" AcquireMemory) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AcquireNextImage" AcquireNextImage) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CloneMemory" CloneMemory) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DestroyImageAttributes" DestroyImageAttributes) :void
  (arg0 :pointer))

(cffi:defcfun ("DestroyImages" DestroyImages) :void
  (arg0 :pointer))

(cffi:defcfun ("DestroyMagick" DestroyMagick) :void)

(cffi:defcfun ("DestroyMagickRegistry" DestroyMagickRegistry) :void)

(cffi:defcfun ("GetConfigureBlob" GetConfigureBlob) :pointer
  (arg0 :string)
  (arg1 :string)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("GetMagickRegistry" GetMagickRegistry) :pointer
  (arg0 :long)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("IdentityAffine" IdentityAffine) :void
  (arg0 :pointer))

(cffi:defcfun ("LiberateMemory" LiberateMemory) :void
  (arg0 :pointer))

(cffi:defcfun ("LiberateSemaphoreInfo" LiberateSemaphoreInfo) :void
  (arg0 :pointer))

(cffi:defcfun ("FormatString" FormatString) :void
  (arg0 :string)
  (arg1 :string)
  &rest)

(cffi:defcfun ("FormatStringList" FormatStringList) :void
  (arg0 :string)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("HSLTransform" HSLTransform) :void
  (arg0 :double)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("InitializeMagick" InitializeMagick) :void
  (arg0 :string))

(cffi:defcfun ("ReacquireMemory" ReacquireMemory) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ResetImageAttributeIterator" ResetImageAttributeIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("SetCacheThreshold" SetCacheThreshold) :void
  (arg0 :unsigned-long))

(cffi:defcfun ("SetImage" SetImage) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("Strip" Strip) :void
  (arg0 :string))

(cffi:defcfun ("TemporaryFilename" TemporaryFilename) :void
  (arg0 :string))

(cffi:defcfun ("TransformHSL" TransformHSL) :void
  (arg0 :unsigned-short)
  (arg1 :unsigned-short)
  (arg2 :unsigned-short)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("DisplayImages" DisplayImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("RemoteDisplayCommand" RemoteDisplayCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string)
  (arg3 :pointer))


  

(cffi:defcfun ("DistortImage" DistortImage) :pointer
  (arg0 :pointer)
  (arg1 DistortImageMethod)
  (arg2 :unsigned-long)
  (arg3 :pointer)
  (arg4 MagickBooleanType)
  (exception :pointer))

;; (cffi:defcfun ("SparseColorImage" SparseColorImage) :pointer
;;   (arg0 :pointer)
;;   (arg1 ChannelType)
;;   (arg2 SparseColorMethod)
;;   (arg3 :unsigned-long)
;;   (arg4 :pointer)
;;   (arg5 :pointer))

(cffi:defcstruct PointInfo
  (x :double)
  (y :double))

(cffi:defcstruct StopInfo
  (color :pointer)
  (offset :double))

(cffi:defcstruct GradientInfo
  (type GradientType)
  (bounding_box :pointer)
  (gradient_vector :pointer)
  (stops :pointer)
  (number_stops :unsigned-long)
  (spread SpreadMethod)
  (debug MagickBooleanType)
  (signature :unsigned-long)
  (center PointInfo)
  (radius :double))

(cffi:defcstruct ElementReference
  (id :string)
  (type ReferenceType)
  (gradient GradientInfo)
  (signature :unsigned-long)
  (previous :pointer)
  (next :pointer))

(cffi:defcstruct DrawInfo
  (primitive :string)
  (geometry :string)
  (viewbox :pointer)
  (affine :pointer)
  (gravity :pointer)
  (fill :pointer)
  (stroke :pointer)
  (stroke_width :double)
  (gradient GradientInfo)
  (fill_pattern :pointer)
  (tile :pointer)
  (stroke_pattern :pointer)
  (stroke_antialias MagickBooleanType)
  (text_antialias MagickBooleanType)
  (fill_rule FillRule)
  (linecap LineCap)
  (linejoin LineJoin)
  (miterlimit :unsigned-long)
  (dash_offset :double)
  (decorate DecorationType)
  (compose CompositeOperator)
  (text :string)
  (face :unsigned-long)
  (font :string)
  (metrics :string)
  (family :string)
  (style :pointer)
  (stretch :pointer)
  (weight :unsigned-long)
  (encoding :string)
  (pointsize :double)
  (density :string)
  (align AlignType)
  (undercolor :pointer)
  (border_color :pointer)
  (server_name :string)
  (dash_pattern :pointer)
  (clip_mask :string)
  (bounds :pointer)
  (clip_units ClipPathUnits)
  (opacity :unsigned-short)
  (render MagickBooleanType)
  (element_reference ElementReference)
  (debug MagickBooleanType)
  (signature :unsigned-long)
  (kerning :double)
  (interword_spacing :double))

(cffi:defcstruct PrimitiveInfo
  (point PointInfo)
  (coordinates :unsigned-long)
  (primitive PrimitiveType)
  (method PaintMethod)
  (text :string))

(cffi:defcstruct TypeMetric
  (pixels_per_em PointInfo)
  (ascent :double)
  (descent :double)
  (width :double)
  (height :double)
  (max_advance :double)
  (underline_position :double)
  (underline_thickness :double)
  (bounds :pointer)
  (origin PointInfo))

(cffi:defcfun ("AcquireDrawInfo" AcquireDrawInfo) :pointer)

(cffi:defcfun ("CloneDrawInfo" CloneDrawInfo) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DestroyDrawInfo" DestroyDrawInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DrawAffineImage" DrawAffineImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DrawClipPath" DrawClipPath) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("DrawGradientImage" DrawGradientImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawImage" DrawImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawPatternPath" DrawPatternPath) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("DrawPrimitive" DrawPrimitive) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetAffineMatrix" GetAffineMatrix) :void
  (arg0 :pointer))

(cffi:defcfun ("GetDrawInfo" GetDrawInfo) :void
  (arg0 :pointer)
  (arg1 :pointer))


(cffi:defcfun ("AdaptiveBlurImage" AdaptiveBlurImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("AdaptiveBlurImageChannel" AdaptiveBlurImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :pointer))

(cffi:defcfun ("AdaptiveSharpenImage" AdaptiveSharpenImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("AdaptiveSharpenImageChannel" AdaptiveSharpenImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :pointer))

(cffi:defcfun ("BlurImage" BlurImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("BlurImageChannel" BlurImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :pointer))

(cffi:defcfun ("DespeckleImage" DespeckleImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("EdgeImage" EdgeImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("EmbossImage" EmbossImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("GaussianBlurImage" GaussianBlurImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("GaussianBlurImageChannel" GaussianBlurImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :pointer))

(cffi:defcfun ("MedianFilterImage" MedianFilterImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("MotionBlurImage" MotionBlurImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :pointer))

(cffi:defcfun ("MotionBlurImageChannel" MotionBlurImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :pointer))

(cffi:defcfun ("PreviewImage" PreviewImage) :pointer
  (arg0 :pointer)
  (arg1 PreviewType)
  (arg2 :pointer))

(cffi:defcfun ("RadialBlurImage" RadialBlurImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("RadialBlurImageChannel" RadialBlurImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("ReduceNoiseImage" ReduceNoiseImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("SelectiveBlurImage" SelectiveBlurImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :pointer))

(cffi:defcfun ("SelectiveBlurImageChannel" SelectiveBlurImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :pointer))

(cffi:defcfun ("ShadeImage" ShadeImage) :pointer
  (arg0 :pointer)
  (arg1 MagickBooleanType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :pointer))

(cffi:defcfun ("SharpenImage" SharpenImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("SharpenImageChannel" SharpenImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :pointer))

(cffi:defcfun ("SpreadImage" SpreadImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("UnsharpMaskImage" UnsharpMaskImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :pointer))

(cffi:defcfun ("UnsharpMaskImageChannel" UnsharpMaskImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :double)
  (arg6 :pointer))

(cffi:defcfun ("ClutImage" ClutImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ClutImageChannel" ClutImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer))

(cffi:defcfun ("ContrastImage" ContrastImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("ContrastStretchImage" ContrastStretchImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("ContrastStretchImageChannel" ContrastStretchImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("EqualizeImage" EqualizeImage) MagickBooleanType
  (image :pointer))

(cffi:defcfun ("EqualizeImageChannel" EqualizeImageChannel) MagickBooleanType
  (image :pointer)
  (arg1 ChannelType))

(cffi:defcfun ("GammaImage" GammaImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GammaImageChannel" GammaImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double))

(cffi:defcfun ("LevelImage" LevelImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("LevelImageChannel" LevelImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("LevelizeImageChannel" LevelizeImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("LevelImageColors" LevelImageColors) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 MagickBooleanType))

(cffi:defcfun ("LinearStretchImage" LinearStretchImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("ModulateImage" ModulateImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("NegateImage" NegateImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("NegateImageChannel" NegateImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 MagickBooleanType))

(cffi:defcfun ("NormalizeImage" NormalizeImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("NormalizeImageChannel" NormalizeImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType))

(cffi:defcfun ("SigmoidalContrastImage" SigmoidalContrastImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType)
  (arg2 :string))

(cffi:defcfun ("SigmoidalContrastImageChannel" SigmoidalContrastImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 MagickBooleanType)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("EnhanceImage" EnhanceImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcstruct _ExceptionInfo
  (severity ExceptionType)
  (error_number :int)
  (reason :string)
  (description :string)
  (exceptions :pointer)
  (relinquish MagickBooleanType)
  (semaphore :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("GetExceptionMessage" GetExceptionMessage) :string
  (arg0 :int))

(cffi:defcfun ("GetLocaleExceptionMessage" GetLocaleExceptionMessage) :string
  (arg0 ExceptionType)
  (arg1 :string))

(cffi:defcfun ("SetErrorHandler" SetErrorHandler) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AcquireExceptionInfo" AcquireExceptionInfo) :pointer)

(cffi:defcfun ("DestroyExceptionInfo" DestroyExceptionInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("SetFatalErrorHandler" SetFatalErrorHandler) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ThrowException" ThrowException) MagickBooleanType
  (arg0 :pointer)
  (arg1 ExceptionType)
  (arg2 :string)
  (arg3 :string))

(cffi:defcfun ("ThrowMagickException" ThrowMagickException) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string)
  (arg3 :unsigned-long)
  (arg4 ExceptionType)
  (arg5 :string)
  (arg6 :string)
  &rest)

(cffi:defcfun ("ThrowMagickExceptionList" ThrowMagickExceptionList) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string)
  (arg3 :unsigned-long)
  (arg4 ExceptionType)
  (arg5 :string)
  (arg6 :string)
  (arg7 :pointer))

(cffi:defcfun ("CatchException" CatchException) :void
  (arg0 :pointer))

(cffi:defcfun ("ClearMagickException" ClearMagickException) :void
  (arg0 :pointer))

(cffi:defcfun ("GetExceptionInfo" GetExceptionInfo) :void
  (arg0 :pointer))

(cffi:defcfun ("InheritException" InheritException) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickError" MagickError) :void
  (arg0 ExceptionType)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("MagickFatalError" MagickFatalError) :void
  (arg0 ExceptionType)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("MagickWarning" MagickWarning) :void
  (arg0 ExceptionType)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("SetWarningHandler" SetWarningHandler) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AddNoiseImage" AddNoiseImage) :pointer
  (arg0 :pointer)
  (arg1 NoiseType)
  (arg2 :pointer))

(cffi:defcfun ("AddNoiseImageChannel" AddNoiseImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 NoiseType)
  (arg3 :pointer))

(cffi:defcfun ("CharcoalImage" CharcoalImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("ColorizeImage" ColorizeImage) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("ConvolveImage" ConvolveImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("ConvolveImageChannel" ConvolveImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :unsigned-long)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("FxImage" FxImage) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("FxImageChannel" FxImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("ImplodeImage" ImplodeImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("MorphImages" MorphImages) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("PolaroidImage" PolaroidImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("RecolorImage" RecolorImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("SepiaToneImage" SepiaToneImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("ShadowImage" ShadowImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :long)
  (arg4 :long)
  (arg5 :pointer))

(cffi:defcfun ("SketchImage" SketchImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :pointer))

(cffi:defcfun ("SteganoImage" SteganoImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("StereoImage" StereoImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("StereoAnaglyphImage" StereoAnaglyphImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :long)
  (arg3 :long)
  (arg4 :pointer))

(cffi:defcfun ("SwirlImage" SwirlImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("TintImage" TintImage) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("VignetteImage" VignetteImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :long)
  (arg4 :long)
  (arg5 :pointer))

(cffi:defcfun ("WaveImage" WaveImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("EvaluateImage" EvaluateImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickEvaluateOperator)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("EvaluateImageChannel" EvaluateImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 MagickEvaluateOperator)
  (arg3 :double)
  (arg4 :pointer))

(cffi:defcfun ("FunctionImage" FunctionImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickFunction)
  (arg2 :unsigned-long)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("FunctionImageChannel" FunctionImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 MagickFunction)
  (arg3 :unsigned-long)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("SolarizeImage" SolarizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("ExpandAffine" ExpandAffine) :double
  (arg0 :pointer))

(cffi:defcfun ("GetOptimalKernelWidth" GetOptimalKernelWidth) :unsigned-long
  (arg0 :double)
  (arg1 :double))

(cffi:defcfun ("GetOptimalKernelWidth1D" GetOptimalKernelWidth1D) :unsigned-long
  (arg0 :double)
  (arg1 :double))

(cffi:defcfun ("GetOptimalKernelWidth2D" GetOptimalKernelWidth2D) :unsigned-long
  (arg0 :double)
  (arg1 :double))

(cffi:defcfun ("ConvertHSBToRGB" ConvertHSBToRGB) :void
  (arg0 :double)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("ConvertHSLToRGB" ConvertHSLToRGB) :void
  (arg0 :double)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("ConvertHWBToRGB" ConvertHWBToRGB) :void
  (arg0 :double)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("ConvertRGBToHSB" ConvertRGBToHSB) :void
  (arg0 :unsigned-short)
  (arg1 :unsigned-short)
  (arg2 :unsigned-short)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("ConvertRGBToHSL" ConvertRGBToHSL) :void
  (arg0 :unsigned-short)
  (arg1 :unsigned-short)
  (arg2 :unsigned-short)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("ConvertRGBToHWB" ConvertRGBToHWB) :void
  (arg0 :unsigned-short)
  (arg1 :unsigned-short)
  (arg2 :unsigned-short)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcstruct AffineMatrix
  (sx :double)
  (rx :double)
  (ry :double)
  (sy :double)
  (tx :double)
  (ty :double))

(cffi:defcstruct GeometryInfo
  (rho :double)
  (sigma :double)
  (xi :double)
  (psi :double)
  (chi :double))

(cffi:defcstruct RectangleInfo
  (width :unsigned-long)
  (height :unsigned-long)
  (x :long)
  (y :long))

(cffi:defcfun ("GetPageGeometry" GetPageGeometry) :string
  (arg0 :string))

(cffi:defcfun ("IsGeometry" IsGeometry) MagickBooleanType
  (arg0 :string))

(cffi:defcfun ("IsSceneGeometry" IsSceneGeometry) MagickBooleanType
  (arg0 :string)
  (arg1 MagickBooleanType))

(cffi:defcfun ("GetGeometry" GetGeometry) :unsigned-int
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("ParseAbsoluteGeometry" ParseAbsoluteGeometry) :unsigned-int
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("ParseAffineGeometry" ParseAffineGeometry) :unsigned-int
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("ParseGeometry" ParseGeometry) :unsigned-int
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("ParseGravityGeometry" ParseGravityGeometry) :unsigned-int
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("ParseMetaGeometry" ParseMetaGeometry) :unsigned-int
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("ParsePageGeometry" ParsePageGeometry) :unsigned-int
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("ParseRegionGeometry" ParseRegionGeometry) :unsigned-int
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("GravityAdjustGeometry" GravityAdjustGeometry) :void
  (arg0 :unsigned-long)
  (arg1 :unsigned-long)
  (arg2 GravityType)
  (arg3 :pointer))

(cffi:defcfun ("SetGeometry" SetGeometry) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("SetGeometryInfo" SetGeometryInfo) :void
  (arg0 :pointer))

(alexandria:define-constant SmallHashmapSize 17)

(alexandria:define-constant MediumHashmapSize 509)

(alexandria:define-constant LargeHashmapSize 8191)

(alexandria:define-constant HugeHashmapSize 131071)

(cffi:defcfun ("DestroyHashmap" DestroyHashmap) :pointer
  (arg0 :pointer))

(cffi:defcfun ("NewHashmap" NewHashmap) :pointer
  (arg0 :unsigned-long)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("DestroyLinkedList" DestroyLinkedList) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("NewLinkedList" NewLinkedList) :pointer
  (arg0 :unsigned-long))

(cffi:defcfun ("AppendValueToLinkedList" AppendValueToLinkedList) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CompareHashmapString" CompareHashmapString) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CompareHashmapStringInfo" CompareHashmapStringInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("InsertValueInLinkedList" InsertValueInLinkedList) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("InsertValueInSortedLinkedList" InsertValueInSortedLinkedList) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("IsHashmapEmpty" IsHashmapEmpty) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("IsLinkedListEmpty" IsLinkedListEmpty) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("LinkedListToArray" LinkedListToArray) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PutEntryInHashmap" PutEntryInHashmap) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("HashPointerType" HashPointerType) :pointer
  (arg0 :pointer))

(cffi:defcfun ("HashStringType" HashStringType) :pointer
  (arg0 :pointer))

(cffi:defcfun ("HashStringInfoType" HashStringInfoType) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetNumberOfElementsInLinkedList" GetNumberOfElementsInLinkedList) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("GetNumberOfEntriesInHashmap" GetNumberOfEntriesInHashmap) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("ClearLinkedList" ClearLinkedList) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetLastValueInLinkedList" GetLastValueInLinkedList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetNextKeyInHashmap" GetNextKeyInHashmap) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetNextValueInHashmap" GetNextValueInHashmap) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetNextValueInLinkedList" GetNextValueInLinkedList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetValueFromHashmap" GetValueFromHashmap) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetValueFromLinkedList" GetValueFromLinkedList) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("RemoveElementByValueFromLinkedList" RemoveElementByValueFromLinkedList) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("RemoveElementFromLinkedList" RemoveElementFromLinkedList) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("RemoveEntryFromHashmap" RemoveEntryFromHashmap) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("RemoveLastElementFromLinkedList" RemoveLastElementFromLinkedList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ResetHashmapIterator" ResetHashmapIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("ResetLinkedListIterator" ResetLinkedListIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("IdentifyImage" IdentifyImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MagickBooleanType))

(cffi:defcstruct PrimaryInfo
  (x :double)
  (y :double)
  (z :double))

(cffi:defcstruct SegmentInfo
  (x1 :double)
  (y1 :double)
  (x2 :double)
  (y2 :double))

(cffi:defcstruct ChromaticityInfo
  (red_primary PrimaryInfo)
  (green_primary PrimaryInfo)
  (blue_primary PrimaryInfo)
  (white_point PrimaryInfo))

(cffi:defcstruct _Image
  (storage_class ClassType)
  (colorspace ColorspaceType)
  (compression CompressionType)
  (quality :unsigned-long)
  (orientation OrientationType)
  (taint MagickBooleanType)
  (matte MagickBooleanType)
  (columns :unsigned-long)
  (rows :unsigned-long)
  (depth :unsigned-long)
  (colors :unsigned-long)
  (colormap :pointer)
  (background_color :pointer)
  (border_color :pointer)
  (matte_color :pointer)
  (gamma :double)
  (chromaticity ChromaticityInfo)
  (rendering_intent :pointer)
  (profiles :pointer)
  (units ResolutionType)
  (montage :string)
  (directory :string)
  (geometry :string)
  (offset :long)
  (x_resolution :double)
  (y_resolution :double)
  (page RectangleInfo)
  (extract_info RectangleInfo)
  (tile_info RectangleInfo)
  (bias :double)
  (blur :double)
  (fuzz :double)
  (filter :pointer)
  (interlace InterlaceType)
  (endian :pointer)
  (gravity GravityType)
  (compose CompositeOperator)
  (dispose :pointer)
  (clip_mask :pointer)
  (scene :unsigned-long)
  (delay :unsigned-long)
  (ticks_per_second :long)
  (iterations :unsigned-long)
  (total_colors :unsigned-long)
  (start_loop :long)
  (error ErrorInfo)
  (timer :pointer)
  (progress_monitor :pointer)
  (client_data :pointer)
  (cache :pointer)
  (attributes :pointer)
  (ascii85 :pointer)
  (blob :pointer)
  (filename :pointer)
  (magick_filename :pointer)
  (magick :pointer)
  (magick_columns :unsigned-long)
  (magick_rows :unsigned-long)
  (exception _ExceptionInfo)
  (debug MagickBooleanType)
  (reference_count :long)
  (semaphore :pointer)
  (color_profile :pointer)
  (iptc_profile :pointer)
  (generic_profile :pointer)
  (generic_profiles :unsigned-long)
  (signature :unsigned-long)
  (previous :pointer)
  (list :pointer)
  (next :pointer)
  (interpolate :pointer)
  (black_point_compensation MagickBooleanType)
  (transparent_color :pointer)
  (mask :pointer)
  (tile_offset RectangleInfo)
  (properties :pointer)
  (artifacts :pointer)
  (type ImageType)
  (dither MagickBooleanType))

(cffi:defcstruct _ImageInfo
  (compression CompressionType)
  (orientation OrientationType)
  (temporary MagickBooleanType)
  (adjoin MagickBooleanType)
  (affirm MagickBooleanType)
  (antialias MagickBooleanType)
  (size :string)
  (extract :string)
  (page :string)
  (scenes :string)
  (scene :unsigned-long)
  (number_scenes :unsigned-long)
  (depth :unsigned-long)
  (interlace InterlaceType)
  (endian :pointer)
  (units ResolutionType)
  (quality :unsigned-long)
  (sampling_factor :string)
  (server_name :string)
  (font :string)
  (texture :string)
  (density :string)
  (pointsize :double)
  (fuzz :double)
  (background_color :pointer)
  (border_color :pointer)
  (matte_color :pointer)
  (dither MagickBooleanType)
  (monochrome MagickBooleanType)
  (colors :unsigned-long)
  (colorspace ColorspaceType)
  (type ImageType)
  (preview_type PreviewType)
  (group :long)
  (ping MagickBooleanType)
  (verbose MagickBooleanType)
  (view :string)
  (authenticate :string)
  (channel ChannelType)
  (attributes :pointer)
  (options :pointer)
  (progress_monitor :pointer)
  (client_data :pointer)
  (cache :pointer)
  (stream :pointer)
  (file :pointer)
  (blob :pointer)
  (length :pointer)
  (magick :pointer)
  (unique :pointer)
  (zero :pointer)
  (filename :pointer)
  (debug MagickBooleanType)
  (tile :string)
  (subimage :unsigned-long)
  (subrange :unsigned-long)
  (pen :pointer)
  (signature :unsigned-long)
  (virtual_pixel_method VirtualPixelMethod)
  (transparent_color :pointer)
  (profile :pointer)
  (synchronize MagickBooleanType))

(cffi:defcfun ("CatchImageException" CatchImageException) ExceptionType
  (arg0 :pointer))

(cffi:defcfun ("AcquireImage" AcquireImage) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AppendImages" AppendImages) :pointer
  (arg0 :pointer)
  (arg1 MagickBooleanType)
  (arg2 :pointer))

(cffi:defcfun ("AverageImages" AverageImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CloneImage" CloneImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 MagickBooleanType)
  (arg4 :pointer))

(cffi:defcfun ("CombineImages" CombineImages) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer))

(cffi:defcfun ("DestroyImage" DestroyImage) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetImageClipMask" GetImageClipMask) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetImageMask" GetImageMask) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("NewMagickImage" NewMagickImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("ReferenceImage" ReferenceImage) :pointer
  (arg0 :pointer))

(cffi:defcfun ("SeparateImages" SeparateImages) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer))

(cffi:defcfun ("AcquireImageInfo" AcquireImageInfo) :pointer)

(cffi:defcfun ("CloneImageInfo" CloneImageInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DestroyImageInfo" DestroyImageInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetImageType" GetImageType) ImageType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("AcquireImageColormap" AcquireImageColormap) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("ClipImage" ClipImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("ClipImagePath" ClipImagePath) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 MagickBooleanType))

(cffi:defcfun ("CycleColormapImage" CycleColormapImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long))

(cffi:defcfun ("GetImageAlphaChannel" GetImageAlphaChannel) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("IsTaintImage" IsTaintImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("IsMagickConflict" IsMagickConflict) MagickBooleanType
  (arg0 :string))

(cffi:defcfun ("IsHighDynamicRangeImage" IsHighDynamicRangeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("IsImageObject" IsImageObject) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("ListMagickInfo" ListMagickInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ModifyImage" ModifyImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PlasmaImage" PlasmaImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long)
  (arg3 :unsigned-long))

(cffi:defcfun ("ResetImagePage" ResetImagePage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("SeparateImageChannel" SeparateImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType))

(cffi:defcfun ("SetImageAlphaChannel" SetImageAlphaChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 AlphaChannelType))

(cffi:defcfun ("SetImageBackgroundColor" SetImageBackgroundColor) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("SetImageClipMask" SetImageClipMask) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("SetImageExtent" SetImageExtent) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long))

(cffi:defcfun ("SetImageInfo" SetImageInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType)
  (arg2 :pointer))

(cffi:defcfun ("SetImageMask" SetImageMask) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("SetImageOpacity" SetImageOpacity) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("SetImageStorageClass" SetImageStorageClass) MagickBooleanType
  (arg0 :pointer)
  (arg1 ClassType))

(cffi:defcfun ("SetImageType" SetImageType) MagickBooleanType
  (arg0 :pointer)
  (arg1 ImageType))

(cffi:defcfun ("SortColormapByIntensity" SortColormapByIntensity) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("StripImage" StripImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("SyncImage" SyncImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("SyncImageSettings" SyncImageSettings) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("SyncImagesSettings" SyncImagesSettings) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("TextureImage" TextureImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("InterpretImageFilename" InterpretImageFilename) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :int)
  (arg4 :string))

(cffi:defcfun ("GetImageVirtualPixelMethod" GetImageVirtualPixelMethod) VirtualPixelMethod
  (arg0 :pointer))

(cffi:defcfun ("SetImageVirtualPixelMethod" SetImageVirtualPixelMethod) VirtualPixelMethod
  (arg0 :pointer)
  (arg1 VirtualPixelMethod))

(cffi:defcfun ("DestroyImagePixels" DestroyImagePixels) :void
  (arg0 :pointer))

(cffi:defcfun ("DisassociateImageStream" DisassociateImageStream) :void
  (arg0 :pointer))

(cffi:defcfun ("GetImageException" GetImageException) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetImageInfo" GetImageInfo) :void
  (arg0 :pointer))

(cffi:defcfun ("SetImageInfoBlob" SetImageInfoBlob) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("SetImageInfoFile" SetImageInfoFile) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CoalesceImages" CoalesceImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DisposeImages" DisposeImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CompareImageLayers" CompareImageLayers) :pointer
  (arg0 :pointer)
  (arg1 ImageLayerMethod)
  (arg2 :pointer))

(cffi:defcfun ("DeconstructImages" DeconstructImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MergeImageLayers" MergeImageLayers) :pointer
  (arg0 :pointer)
  (arg1 ImageLayerMethod)
  (arg2 :pointer))

(cffi:defcfun ("OptimizeImageLayers" OptimizeImageLayers) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("OptimizePlusImageLayers" OptimizePlusImageLayers) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CompositeLayers" CompositeLayers) :void
  (arg0 :pointer)
  (arg1 CompositeOperator)
  (arg2 :pointer)
  (arg3 :long)
  (arg4 :long)
  (arg5 :pointer))

(cffi:defcfun ("OptimizeImageTransparency" OptimizeImageTransparency) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("RemoveDuplicateLayers" RemoveDuplicateLayers) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("RemoveZeroDelayLayers" RemoveZeroDelayLayers) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CloneImageList" CloneImageList) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CloneImages" CloneImages) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("DestroyImageList" DestroyImageList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetFirstImageInList" GetFirstImageInList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetImageFromList" GetImageFromList) :pointer
  (arg0 :pointer)
  (arg1 :long))

(cffi:defcfun ("GetLastImageInList" GetLastImageInList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetNextImageInList" GetNextImageInList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetPreviousImageInList" GetPreviousImageInList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ImageListToArray" ImageListToArray) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("NewImageList" NewImageList) :pointer)

(cffi:defcfun ("RemoveImageFromList" RemoveImageFromList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("RemoveLastImageFromList" RemoveLastImageFromList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("RemoveFirstImageFromList" RemoveFirstImageFromList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("SpliceImageIntoList" SpliceImageIntoList) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("SplitImageList" SplitImageList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("SyncNextImageInList" SyncNextImageInList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetImageIndexInList" GetImageIndexInList) :long
  (arg0 :pointer))

(cffi:defcfun ("GetImageListLength" GetImageListLength) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("AppendImageToList" AppendImageToList) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DeleteImageFromList" DeleteImageFromList) :void
  (arg0 :pointer))

(cffi:defcfun ("DeleteImages" DeleteImages) :void
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("InsertImageInList" InsertImageInList) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PrependImageToList" PrependImageToList) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ReplaceImageInList" ReplaceImageInList) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ReverseImageList" ReverseImageList) :void
  (arg0 :pointer))

(cffi:defcfun ("SyncImageList" SyncImageList) :void
  (arg0 :pointer))

(cffi:defcstruct LocaleInfo
  (path :string)
  (tag :string)
  (message :string)
  (stealth MagickBooleanType)
  (previous :pointer)
  (next :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("GetLocaleList" GetLocaleList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetLocaleMessage" GetLocaleMessage) :string
  (arg0 :string))

(cffi:defcfun ("GetLocaleInfo_" GetLocaleInfo_) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetLocaleInfoList" GetLocaleInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DestroyLocaleOptions" DestroyLocaleOptions) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetLocaleOptions" GetLocaleOptions) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("ListLocaleInfo" ListLocaleInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DestroyLocaleList" DestroyLocaleList) :void)

(alexandria:define-constant MagickLogFilename "log.xml" :test #'string=)


(cffi:defcfun ("GetLogList" GetLogList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetLogName" GetLogName) :string)

(cffi:defcfun ("SetLogName" SetLogName) :string
  (arg0 :string))

(cffi:defcfun ("GetLogInfo" GetLogInfo) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetLogInfoList" GetLogInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("SetLogEventMask" SetLogEventMask) LogEventType
  (arg0 :string))

(cffi:defcfun ("IsEventLogging" IsEventLogging) MagickBooleanType)

(cffi:defcfun ("ListLogInfo" ListLogInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("LogMagickEvent" LogMagickEvent) MagickBooleanType
  (arg0 LogEventType)
  (arg1 :string)
  (arg2 :string)
  (arg3 :unsigned-long)
  (arg4 :string)
  &rest)

(cffi:defcfun ("LogMagickEventList" LogMagickEventList) MagickBooleanType
  (arg0 LogEventType)
  (arg1 :string)
  (arg2 :string)
  (arg3 :unsigned-long)
  (arg4 :string)
  (arg5 :pointer))

(cffi:defcfun ("CloseMagickLog" CloseMagickLog) :void)

(cffi:defcfun ("DestroyLogList" DestroyLogList) :void)

(cffi:defcfun ("SetLogFormat" SetLogFormat) :void
  (arg0 :string))

(cffi:defcstruct MagicInfo
  (path :string)
  (name :string)
  (target :string)
  (magic :pointer)
  (length :pointer)
  (offset :long)
  (stealth MagickBooleanType)
  (previous :pointer)
  (next :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("GetMagicList" GetMagicList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetMagicName" GetMagicName) :string
  (arg0 :pointer))

(cffi:defcfun ("ListMagicInfo" ListMagicInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetMagicInfo" GetMagicInfo) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetMagicInfoList" GetMagicInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DestroyMagicList" DestroyMagicList) :void)


(cffi:defcstruct MagickInfo
  (name :string)
  (description :string)
  (version :string)
  (note :string)
  (module :string)
  (image_info :pointer)
  (decoder :pointer)
  (encoder :pointer)
  (magick :pointer)
  (client_data :pointer)
  (adjoin MagickBooleanType)
  (raw MagickBooleanType)
  (endian_support MagickBooleanType)
  (blob_support MagickBooleanType)
  (seekable_stream MagickBooleanType)
  (format_type MagickFormatType)
  (thread_support :unsigned-int)
  (stealth MagickBooleanType)
  (previous :pointer)
  (next :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("GetMagickList" GetMagickList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetImageMagick" GetImageMagick) :string
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetMagickDescription" GetMagickDescription) :string
  (arg0 :pointer))

(cffi:defcfun ("GetImageDecoder" GetImageDecoder) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetImageEncoder" GetImageEncoder) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetMagickAdjoin" GetMagickAdjoin) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("GetMagickBlobSupport" GetMagickBlobSupport) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("GetMagickEndianSupport" GetMagickEndianSupport) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("GetMagickRawSupport" GetMagickRawSupport) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("GetMagickSeekableStream" GetMagickSeekableStream) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("IsMagickInstantiated" IsMagickInstantiated) MagickBooleanType)

(cffi:defcfun ("UnregisterMagickInfo" UnregisterMagickInfo) MagickBooleanType
  (arg0 :string))

(cffi:defcfun ("GetMagickInfo" GetMagickInfo) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetMagickInfoList" GetMagickInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("RegisterMagickInfo" RegisterMagickInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("SetMagickInfo" SetMagickInfo) :pointer
  (arg0 :string))

(cffi:defcfun ("GetMagickThreadSupport" GetMagickThreadSupport) :unsigned-int
  (arg0 :pointer))

(cffi:defcfun ("DestroyMagickList" DestroyMagickList) :void)

(cffi:defcfun ("MagickCoreGenesis" MagickCoreGenesis) :void
  (arg0 :string)
  (arg1 MagickBooleanType))

(cffi:defcfun ("MagickCoreTerminus" MagickCoreTerminus) :void)

(cffi:defcfun ("AcquireMagickMatrix" AcquireMagickMatrix) :pointer
  (arg0 :unsigned-long)
  (arg1 :unsigned-long))

(cffi:defcfun ("RelinquishMagickMatrix" RelinquishMagickMatrix) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("GaussJordanElimination" GaussJordanElimination) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long)
  (arg3 :unsigned-long))

(cffi:defcfun ("LeastSquaresAddTerms" LeastSquaresAddTerms) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :unsigned-long)
  (arg5 :unsigned-long))

(cffi:defcfun ("AcquireMagickMemory" AcquireMagickMemory) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AcquireQuantumMemory" AcquireQuantumMemory) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CopyMagickMemory" CopyMagickMemory) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DestroyMagickMemory" DestroyMagickMemory) :void)

(cffi:defcfun ("GetMagickMemoryMethods" GetMagickMemoryMethods) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("RelinquishMagickMemory" RelinquishMagickMemory) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ResetMagickMemory" ResetMagickMemory) :pointer
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer))

(cffi:defcfun ("ResizeMagickMemory" ResizeMagickMemory) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ResizeQuantumMemory" ResizeQuantumMemory) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("SetMagickMemoryMethods" SetMagickMemoryMethods) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcstruct ModuleInfo
  (path :string)
  (tag :string)
  (handle :pointer)
  (unregister_module :pointer)
  (register_module :pointer)
  (timestamp :pointer)
  (stealth MagickBooleanType)
  (previous :pointer)
  (next :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("GetModuleList" GetModuleList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetModuleInfo" GetModuleInfo) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetModuleInfoList" GetModuleInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("InvokeDynamicImageFilter" InvokeDynamicImageFilter) MagickBooleanType
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("InvokeStaticImageFilter" InvokeStaticImageFilter) MagickBooleanType
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("ListModuleInfo" ListModuleInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("OpenModule" OpenModule) MagickBooleanType
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("OpenModules" OpenModules) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("DestroyModuleList" DestroyModuleList) :void)

(cffi:defcfun ("RegisterStaticModules" RegisterStaticModules) :void)

(cffi:defcfun ("UnregisterStaticModules" UnregisterStaticModules) :void)

(cffi:defcfun ("GetMimeList" GetMimeList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickToMime" MagickToMime) :string
  (arg0 :string))

(cffi:defcfun ("GetMimeDescription" GetMimeDescription) :string
  (arg0 :pointer))

(cffi:defcfun ("GetMimeType" GetMimeType) :string
  (arg0 :pointer))

(cffi:defcfun ("ListMimeInfo" ListMimeInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("LoadMimeLists" LoadMimeLists) MagickBooleanType
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetMimeInfo" GetMimeInfo) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("GetMimeInfoList" GetMimeInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DestroyMimeList" DestroyMimeList) :void)

(cffi:defcfun ("SetImageProgressMonitor" SetImageProgressMonitor) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("SetImageInfoProgressMonitor" SetImageInfoProgressMonitor) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("QuantumTick" QuantumTick) MagickBooleanType
  (offset :long)
  (span :unsigned-long))

(cffi:defcstruct MontageInfo
  (geometry :string)
  (tile :string)
  (title :string)
  (frame :string)
  (texture :string)
  (font :string)
  (pointsize :double)
  (border_width :unsigned-long)
  (shadow MagickBooleanType)
  (fill :pointer)
  (stroke :pointer)
  (background_color :pointer)
  (border_color :pointer)
  (matte_color :pointer)
  (gravity GravityType)
  (filename :pointer)
  (debug MagickBooleanType)
  (signature :unsigned-long))

(cffi:defcfun ("MontageImages" MontageImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MontageImageList" MontageImageList) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("CloneMontageInfo" CloneMontageInfo) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DestroyMontageInfo" DestroyMontageInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetMontageInfo" GetMontageInfo) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcstruct OptionInfo
  (mnemonic :string)
  (type :long)
  (stealth MagickBooleanType))

(cffi:defcfun ("GetMagickOptions" GetMagickOptions) :pointer
  (arg0 MagickOption))

(cffi:defcfun ("GetNextImageOption" GetNextImageOption) :string
  (arg0 :pointer))

(cffi:defcfun ("RemoveImageOption" RemoveImageOption) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GetImageOption" GetImageOption) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickOptionToMnemonic" MagickOptionToMnemonic) :string
  (arg0 MagickOption)
  (arg1 :long))

(cffi:defcfun ("ParseChannelOption" ParseChannelOption) :long
  (arg0 :string))

(cffi:defcfun ("ParseMagickOption" ParseMagickOption) :long
  (arg0 MagickOption)
  (arg1 MagickBooleanType)
  (arg2 :string))

(cffi:defcfun ("CloneImageOptions" CloneImageOptions) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DefineImageOption" DefineImageOption) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DeleteImageOption" DeleteImageOption) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("IsMagickOption" IsMagickOption) MagickBooleanType
  (arg0 :string))

(cffi:defcfun ("ListMagickOptions" ListMagickOptions) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickOption)
  (arg2 :pointer))

(cffi:defcfun ("SetImageOption" SetImageOption) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("DestroyImageOptions" DestroyImageOptions) :void
  (arg0 :pointer))

(cffi:defcfun ("ResetImageOptionIterator" ResetImageOptionIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("OilPaintImage" OilPaintImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("FloodfillPaintImage" FloodfillPaintImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :long)
  (arg5 :long)
  (arg6 MagickBooleanType))

(cffi:defcfun ("GradientImage" GradientImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 GradientType)
  (arg2 SpreadMethod)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("OpaquePaintImage" OpaquePaintImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 MagickBooleanType))

(cffi:defcfun ("OpaquePaintImageChannel" OpaquePaintImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 MagickBooleanType))

(cffi:defcfun ("TransparentPaintImage" TransparentPaintImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-short)
  (arg3 MagickBooleanType))

(cffi:defcfun ("TransparentPaintImageChroma" TransparentPaintImageChroma) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :unsigned-short)
  (arg4 MagickBooleanType))

(cffi:defcstruct LongPixelPacket
  (red :unsigned-long)
  (green :unsigned-long)
  (blue :unsigned-long)
  (opacity :unsigned-long)
  (index :unsigned-long))

(cffi:defcstruct MagickPixelPacket
  (storage_class ClassType)
  (colorspace ColorspaceType)
  (matte MagickBooleanType)
  (fuzz :double)
  (depth :unsigned-long)
  (red :double)
  (green :double)
  (blue :double)
  (opacity :double)
  (index :double))

(cffi:defcstruct PixelPacket
  (blue :unsigned-short)
  (green :unsigned-short)
  (red :unsigned-short)
  (opacity :unsigned-short))

(cffi:defcfun ("ExportImagePixels" ExportImagePixels) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :string)
  (arg6 StorageType)
  (arg7 :pointer)
  (arg8 :pointer))

(cffi:defcfun ("ImportImagePixels" ImportImagePixels) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :string)
  (arg6 StorageType)
  (arg7 :pointer))

(cffi:defcfun ("GetMagickPixelPacket" GetMagickPixelPacket) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetImageTotalInkDensity" GetImageTotalInkDensity) :double
  (image :pointer))

(cffi:defcstruct ProfileInfo
  (name :string)
  (length :pointer)
  (info :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("GetNextImageProfile" GetNextImageProfile) :string
  (arg0 :pointer))

(cffi:defcfun ("GetImageProfile" GetImageProfile) :pointer
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("CloneImageProfiles" CloneImageProfiles) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DeleteImageProfile" DeleteImageProfile) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("ProfileImage" ProfileImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 MagickBooleanType))

(cffi:defcfun ("SetImageProfile" SetImageProfile) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("SyncImageProfiles" SyncImageProfiles) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("RemoveImageProfile" RemoveImageProfile) :pointer
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DestroyImageProfiles" DestroyImageProfiles) :void
  (arg0 :pointer))

(cffi:defcfun ("ResetImageProfileIterator" ResetImageProfileIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("GetNextImageProperty" GetNextImageProperty) :string
  (arg0 :pointer))

(cffi:defcfun ("InterpretImageProperties" InterpretImageProperties) :string
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("RemoveImageProperty" RemoveImageProperty) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GetImageProperty" GetImageProperty) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GetMagickProperty" GetMagickProperty) :string
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("CloneImageProperties" CloneImageProperties) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DefineImageProperty" DefineImageProperty) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DeleteImageProperty" DeleteImageProperty) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("FormatImageProperty" FormatImageProperty) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string)
  &rest)

(cffi:defcfun ("FormatImagePropertyList" FormatImagePropertyList) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("SetImageProperty" SetImageProperty) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("DestroyImageProperties" DestroyImageProperties) :void
  (arg0 :pointer))

(cffi:defcfun ("ResetImagePropertyIterator" ResetImagePropertyIterator) :void
  (arg0 :pointer))

(cffi:defcstruct QuantizeInfo
  (number_colors :unsigned-long)
  (tree_depth :unsigned-long)
  (dither MagickBooleanType)
  (colorspace ColorspaceType)
  (measure_error MagickBooleanType)
  (signature :unsigned-long)
  (dither_method DitherMethod))

(cffi:defcfun ("CompressImageColormap" CompressImageColormap) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("GetImageQuantizeError" GetImageQuantizeError) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("PosterizeImage" PosterizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 MagickBooleanType))

(cffi:defcfun ("QuantizeImage" QuantizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("QuantizeImages" QuantizeImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("RemapImage" RemapImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("RemapImages" RemapImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("AcquireQuantizeInfo" AcquireQuantizeInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("CloneQuantizeInfo" CloneQuantizeInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DestroyQuantizeInfo" DestroyQuantizeInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetQuantizeInfo" GetQuantizeInfo) :void
  (arg0 :pointer))

(cffi:defcfun ("RoundToQuantum" RoundToQuantum) :unsigned-short
  (value :double))

(cffi:defcfun ("ScaleQuantumToChar" ScaleQuantumToChar) :unsigned-char
  (quantum :unsigned-short))

(cffi:defcfun ("SetQuantumDepth" SetQuantumDepth) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long))

(cffi:defcfun ("SetQuantumFormat" SetQuantumFormat) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 QuantumFormatType))

(cffi:defcfun ("SetQuantumPad" SetQuantumPad) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long))

(cffi:defcfun ("AcquireQuantumInfo" AcquireQuantumInfo) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DestroyQuantumInfo" DestroyQuantumInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetQuantumType" GetQuantumType) QuantumType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ExportQuantumPixels" ExportQuantumPixels) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 QuantumType)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("GetQuantumExtent" GetQuantumExtent) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 QuantumType))

(cffi:defcfun ("ImportQuantumPixels" ImportQuantumPixels) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 QuantumType)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("GetQuantumPixels" GetQuantumPixels) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetQuantumInfo" GetQuantumInfo) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("SetQuantumAlphaType" SetQuantumAlphaType) :void
  (arg0 :pointer)
  (arg1 QuantumAlphaType))

(cffi:defcfun ("SetQuantumImageType" SetQuantumImageType) :void
  (arg0 :pointer)
  (arg1 QuantumType))

(cffi:defcfun ("SetQuantumMinIsWhite" SetQuantumMinIsWhite) :void
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("SetQuantumPack" SetQuantumPack) :void
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("SetQuantumQuantum" SetQuantumQuantum) :void
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("SetQuantumScale" SetQuantumScale) :void
  (arg0 :pointer)
  (arg1 :double))


(cffi:defcfun ("GetNextImageRegistry" GetNextImageRegistry) :string)

(cffi:defcfun ("GetImageRegistry" GetImageRegistry) :pointer
  (arg0 RegistryType)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("DefineImageRegistry" DefineImageRegistry) MagickBooleanType
  (arg0 RegistryType)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("DeleteImageRegistry" DeleteImageRegistry) MagickBooleanType
  (arg0 :string))

(cffi:defcfun ("SetImageRegistry" SetImageRegistry) MagickBooleanType
  (arg0 RegistryType)
  (arg1 :string)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("DestroyImageRegistry" DestroyImageRegistry) :void)

(cffi:defcfun ("RemoveImageRegistry" RemoveImageRegistry) :pointer
  (arg0 :string))

(cffi:defcfun ("ResetImageRegistryIterator" ResetImageRegistryIterator) :void)

(cffi:defcfun ("GetRandomValue" GetRandomValue) :double
  (arg0 :pointer))

(cffi:defcfun ("GetPseudoRandomValue" GetPseudoRandomValue) :double)

(cffi:defcfun ("AcquireRandomInfo" AcquireRandomInfo) :pointer)

(cffi:defcfun ("DestroyRandomInfo" DestroyRandomInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetRandomKey" GetRandomKey) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DestroyRandomReservoir" DestroyRandomReservoir) :void)

(cffi:defcfun ("SeedPseudoRandomGenerator" SeedPseudoRandomGenerator) :void
  (arg0 :unsigned-long))

(cffi:defcfun ("SetRandomKey" SetRandomKey) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("SetRandomTrueRandom" SetRandomTrueRandom) :void
  (arg0 MagickBooleanType))

(cffi:defcfun ("ResamplePixelColor" ResamplePixelColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("SetResampleFilterInterpolateMethod" SetResampleFilterInterpolateMethod) MagickBooleanType
  (arg0 :pointer)
  (arg1 InterpolatePixelMethod))

(cffi:defcfun ("SetResampleFilterVirtualPixelMethod" SetResampleFilterVirtualPixelMethod) MagickBooleanType
  (arg0 :pointer)
  (arg1 VirtualPixelMethod))

(cffi:defcfun ("AcquireResampleFilter" AcquireResampleFilter) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DestroyResampleFilter" DestroyResampleFilter) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ScaleResampleFilter" ScaleResampleFilter) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("SetResampleFilter" SetResampleFilter) :void
  (arg0 :pointer)
  (arg1 FilterTypes)
  (arg2 :double))

(cffi:defcfun ("AdaptiveResizeImage" AdaptiveResizeImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("LiquidRescaleImage" LiquidRescaleImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :double)
  (arg4 :double)
  (arg5 :pointer))

(cffi:defcfun ("MagnifyImage" MagnifyImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MinifyImage" MinifyImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ResampleImage" ResampleImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 FilterTypes)
  (arg4 :double)
  (arg5 :pointer))

(cffi:defcfun ("ResizeImage" ResizeImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 FilterTypes)
  (arg4 :double)
  (arg5 :pointer))

(cffi:defcfun ("SampleImage" SampleImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("ScaleImage" ScaleImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("ThumbnailImage" ThumbnailImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("ZoomImage" ZoomImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("AcquireUniqueFileResource" AcquireUniqueFileResource) :int
  (arg0 :string))

(cffi:defcfun ("AcquireMagickResource" AcquireMagickResource) MagickBooleanType
  (arg0 ResourceType)
  (arg1 :unsigned-long))

(cffi:defcfun ("RelinquishUniqueFileResource" RelinquishUniqueFileResource) MagickBooleanType
  (arg0 :string))

(cffi:defcfun ("ListMagickResourceInfo" ListMagickResourceInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("SetMagickResourceLimit" SetMagickResourceLimit) MagickBooleanType
  (arg0 ResourceType)
  (arg1 :unsigned-long))

(cffi:defcfun ("GetMagickResource" GetMagickResource) :unsigned-long
  (arg0 ResourceType))

(cffi:defcfun ("GetMagickResourceLimit" GetMagickResourceLimit) :unsigned-long
  (arg0 ResourceType))

(cffi:defcfun ("AsynchronousDestroyMagickResources" AsynchronousDestroyMagickResources) :void)

(cffi:defcfun ("DestroyMagickResources" DestroyMagickResources) :void)

(cffi:defcfun ("InitializeMagickResources" InitializeMagickResources) :void)

(cffi:defcfun ("RelinquishMagickResource" RelinquishMagickResource) :void
  (arg0 ResourceType)
  (arg1 :unsigned-long))

(cffi:defcfun ("GetImageDynamicThreshold" GetImageDynamicThreshold) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("SegmentImage" SegmentImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 ColorspaceType)
  (arg2 MagickBooleanType)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("AffineTransformImage" AffineTransformImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DeskewImage" DeskewImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("RotateImage" RotateImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :pointer))

(cffi:defcfun ("ShearImage" ShearImage) :pointer
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("SignatureImage" SignatureImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("AddValueToSplayTree" AddValueToSplayTree) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DeleteNodeByValueFromSplayTree" DeleteNodeByValueFromSplayTree) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DeleteNodeFromSplayTree" DeleteNodeFromSplayTree) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CompareSplayTreeString" CompareSplayTreeString) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CompareSplayTreeStringInfo" CompareSplayTreeStringInfo) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CloneSplayTree" CloneSplayTree) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DestroySplayTree" DestroySplayTree) :pointer
  (arg0 :pointer))

(cffi:defcfun ("NewSplayTree" NewSplayTree) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetNumberOfNodesInSplayTree" GetNumberOfNodesInSplayTree) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("GetNextKeyInSplayTree" GetNextKeyInSplayTree) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetNextValueInSplayTree" GetNextValueInSplayTree) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetValueFromSplayTree" GetValueFromSplayTree) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("RemoveNodeByValueFromSplayTree" RemoveNodeByValueFromSplayTree) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("RemoveNodeFromSplayTree" RemoveNodeFromSplayTree) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ResetSplayTreeIterator" ResetSplayTreeIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("ReadStream" ReadStream) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("WriteStream" WriteStream) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcstruct ChannelStatistics
  (depth :unsigned-long)
  (minima :double)
  (maxima :double)
  (mean :double)
  (standard_deviation :double)
  (kurtosis :double)
  (skewness :double))

(cffi:defcfun ("GetImageChannelStatistics" GetImageChannelStatistics) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetImageChannelExtrema" GetImageChannelExtrema) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetImageChannelMean" GetImageChannelMean) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetImageChannelKurtosis" GetImageChannelKurtosis) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetImageChannelRange" GetImageChannelRange) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetImageExtrema" GetImageExtrema) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("GetImageRange" GetImageRange) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("GetImageMean" GetImageMean) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("GetImageKurtosis" GetImageKurtosis) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("SetImageChannelDepth" SetImageChannelDepth) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :unsigned-long))

(cffi:defcfun ("SetImageDepth" SetImageDepth) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("GetImageBoundingBox" GetImageBoundingBox) RectangleInfo
  (arg0 :pointer)
  (exception :pointer))

(cffi:defcfun ("GetImageChannelDepth" GetImageChannelDepth) :unsigned-long
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer))

(cffi:defcfun ("GetImageDepth" GetImageDepth) :unsigned-long
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetImageQuantumDepth" GetImageQuantumDepth) :unsigned-long
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcstruct StringInfo
  (path :pointer)
  (datum :pointer)
  (length :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("AcquireString" AcquireString) :string
  (arg0 :string))

(cffi:defcfun ("CloneString" CloneString) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("ConstantString" ConstantString) :string
  (arg0 :string))

(cffi:defcfun ("DestroyString" DestroyString) :string
  (arg0 :string))

(cffi:defcfun ("DestroyStringList" DestroyStringList) :pointer
  (arg0 :pointer))

(cffi:defcfun ("EscapeString" EscapeString) :string
  (arg0 :string)
  (arg1 :char))

(cffi:defcfun ("FileToString" FileToString) :string
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetEnvironmentValue" GetEnvironmentValue) :string
  (arg0 :string))

(cffi:defcfun ("StringInfoToHexString" StringInfoToHexString) :string
  (arg0 :pointer))

(cffi:defcfun ("StringInfoToString" StringInfoToString) :string
  (arg0 :pointer))

(cffi:defcfun ("StringToArgv" StringToArgv) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("StringToken" StringToken) :string
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("StringToList" StringToList) :pointer
  (arg0 :string))

(cffi:defcfun ("GetStringInfoPath" GetStringInfoPath) :string
  (arg0 :pointer))

(cffi:defcfun ("StringToDouble" StringToDouble) :double
  (arg0 :string)
  (arg1 :double))

(cffi:defcfun ("FormatMagickSize" FormatMagickSize) :long
  (arg0 :unsigned-long)
  (arg1 :string))

(cffi:defcfun ("FormatMagickString" FormatMagickString) :long
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :string)
  &rest)

(cffi:defcfun ("FormatMagickStringList" FormatMagickStringList) :long
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("FormatMagickTime" FormatMagickTime) :long
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("LocaleCompare" LocaleCompare) :long
  (arg0 :string)
  (arg1 :string))

(cffi:defcfun ("LocaleNCompare" LocaleNCompare) :long
  (arg0 :string)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("ConcatenateString" ConcatenateString) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("SubstituteString" SubstituteString) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("CompareStringInfo" CompareStringInfo) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ConcatenateMagickString" ConcatenateMagickString) :pointer
  (arg0 :string)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("CopyMagickString" CopyMagickString) :pointer
  (arg0 :string)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("GetStringInfoLength" GetStringInfoLength) :pointer
  (arg0 :pointer))

(cffi:defcfun ("AcquireStringInfo" AcquireStringInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("CloneStringInfo" CloneStringInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ConfigureFileToStringInfo" ConfigureFileToStringInfo) :pointer
  (arg0 :string))

(cffi:defcfun ("DestroyStringInfo" DestroyStringInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("FileToStringInfo" FileToStringInfo) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("SplitStringInfo" SplitStringInfo) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("StringToStringInfo" StringToStringInfo) :pointer
  (arg0 :string))

(cffi:defcfun ("GetStringInfoDatum" GetStringInfoDatum) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ConcatenateStringInfo" ConcatenateStringInfo) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("LocaleLower" LocaleLower) :void
  (arg0 :string))

(cffi:defcfun ("LocaleUpper" LocaleUpper) :void
  (arg0 :string))

(cffi:defcfun ("PrintStringInfo" PrintStringInfo) :void
  (file :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("ResetStringInfo" ResetStringInfo) :void
  (arg0 :pointer))

(cffi:defcfun ("SetStringInfo" SetStringInfo) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("SetStringInfoDatum" SetStringInfoDatum) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("SetStringInfoLength" SetStringInfoLength) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("SetStringInfoPath" SetStringInfoPath) :void
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("StripString" StripString) :void
  (arg0 :string))

(cffi:defcstruct Timer
  (start :double)
  (stop :double)
  (total :double))

(cffi:defcstruct TimerInfo
  (user Timer)
  (elapsed Timer)
  (state TimerState)
  (signature :unsigned-long))

(cffi:defcfun ("GetElapsedTime" GetElapsedTime) :double
  (arg0 :pointer))

(cffi:defcfun ("GetUserTime" GetUserTime) :double
  (arg0 :pointer))

(cffi:defcfun ("ContinueTimer" ContinueTimer) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("AcquireTimerInfo" AcquireTimerInfo) :pointer)

(cffi:defcfun ("DestroyTimerInfo" DestroyTimerInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetTimerInfo" GetTimerInfo) :void
  (arg0 :pointer))

(cffi:defcfun ("ResetTimer" ResetTimer) :void
  (arg0 :pointer))

(cffi:defcfun ("StartTimer" StartTimer) :void
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("Tokenizer" Tokenizer) :int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :string)
  (arg3 :pointer)
  (arg4 :string)
  (arg5 :string)
  (arg6 :string)
  (arg7 :string)
  (arg8 :char)
  (arg9 :string)
  (arg10 :pointer)
  (arg11 :string))

(cffi:defcfun ("GlobExpression" GlobExpression) MagickBooleanType
  (arg0 :string)
  (arg1 :string)
  (arg2 MagickBooleanType))

(cffi:defcfun ("IsGlob" IsGlob) MagickBooleanType
  (arg0 :string))

(cffi:defcfun ("AcquireTokenInfo" AcquireTokenInfo) :pointer)

(cffi:defcfun ("DestroyTokenInfo" DestroyTokenInfo) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetMagickToken" GetMagickToken) :void
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("ChopImage" ChopImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("ConsolidateCMYKImages" ConsolidateCMYKImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("CropImage" CropImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("ExcerptImage" ExcerptImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("ExtentImage" ExtentImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("ExtractSubimageFromImage" ExtractSubimageFromImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("FlipImage" FlipImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("FlopImage" FlopImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("RollImage" RollImage) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :pointer))

(cffi:defcfun ("ShaveImage" ShaveImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("SpliceImage" SpliceImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("TransposeImage" TransposeImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("TransverseImage" TransverseImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("TrimImage" TrimImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("TransformImage" TransformImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("TransformImages" TransformImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("AdaptiveThresholdImage" AdaptiveThresholdImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long)
  (arg4 :pointer))

(cffi:defcfun ("DestroyThresholdMap" DestroyThresholdMap) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetThresholdMap" GetThresholdMap) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("BilevelImage" BilevelImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("BilevelImageChannel" BilevelImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double))

(cffi:defcfun ("BlackThresholdImage" BlackThresholdImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("BlackThresholdImageChannel" BlackThresholdImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("ListThresholdMaps" ListThresholdMaps) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("OrderedDitherImage" OrderedDitherImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("OrderedDitherImageChannel" OrderedDitherImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer))

(cffi:defcfun ("OrderedPosterizeImage" OrderedPosterizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("OrderedPosterizeImageChannel" OrderedPosterizeImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("RandomThresholdImage" RandomThresholdImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("RandomThresholdImageChannel" RandomThresholdImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :string)
  (arg3 :pointer))

(cffi:defcfun ("WhiteThresholdImage" WhiteThresholdImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("WhiteThresholdImageChannel" WhiteThresholdImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :string)
  (arg3 :pointer))


(cffi:defcstruct TypeInfo
  (face :unsigned-long)
  (path :string)
  (name :string)
  (description :string)
  (family :string)
  (style StyleType)
  (stretch StretchType)
  (weight :unsigned-long)
  (encoding :string)
  (foundry :string)
  (format :string)
  (metrics :string)
  (glyphs :string)
  (stealth MagickBooleanType)
  (previous :pointer)
  (next :pointer)
  (signature :unsigned-long))

(cffi:defcfun ("GetTypeList" GetTypeList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("ListTypeInfo" ListTypeInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetTypeInfo" GetTypeInfo) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetTypeInfoByFamily" GetTypeInfoByFamily) :pointer
  (arg0 :string)
  (arg1 StyleType)
  (arg2 StretchType)
  (arg3 :unsigned-long)
  (arg4 :pointer))

(cffi:defcfun ("GetTypeInfoList" GetTypeInfoList) :pointer
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("DestroyTypeList" DestroyTypeList) :void)

(cffi:defcfun ("Base64Encode" Base64Encode) :string
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetPathComponents" GetPathComponents) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("ListFiles" ListFiles) :pointer
  (arg0 :string)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("OpenMagickStream" OpenMagickStream) :pointer
  (arg0 :string)
  (arg1 :string))

(cffi:defcfun ("SystemCommand" SystemCommand) :int
  (arg0 MagickBooleanType)
  (arg1 :string))

(cffi:defcfun ("AcquireUniqueFilename" AcquireUniqueFilename) MagickBooleanType
  (arg0 :string))

(cffi:defcfun ("AcquireUniqueSymbolicLink" AcquireUniqueSymbolicLink) MagickBooleanType
  (arg0 :string)
  (arg1 :string))

(cffi:defcfun ("ExpandFilenames" ExpandFilenames) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetPathAttributes" GetPathAttributes) MagickBooleanType
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("GetExecutionPath" GetExecutionPath) MagickBooleanType
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("IsMagickTrue" IsMagickTrue) MagickBooleanType
  (arg0 :string))

(cffi:defcfun ("IsPathAccessible" IsPathAccessible) MagickBooleanType
  (arg0 :string))

(cffi:defcfun ("Base64Decode" Base64Decode) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("MultilineCensus" MultilineCensus) :unsigned-long
  (arg0 :string))

(cffi:defcfun ("AppendImageFormat" AppendImageFormat) :void
  (arg0 :string)
  (arg1 :string))

(cffi:defcfun ("ChopPathComponents" ChopPathComponents) :void
  (arg0 :string)
  (arg1 :unsigned-long))

(cffi:defcfun ("ExpandFilename" ExpandFilename) :void
  (arg0 :string))

(cffi:defcfun ("GetPathComponent" GetPathComponent) :void
  (arg0 :string)
  (arg1 PathType)
  (arg2 :string))

(cffi:defcfun ("GetMagickHomeURL" GetMagickHomeURL) :string)

(cffi:defcfun ("GetMagickCopyright" GetMagickCopyright) :string)

(cffi:defcfun ("GetMagickPackageName" GetMagickPackageName) :string)

(cffi:defcfun ("GetMagickQuantumDepth" GetMagickQuantumDepth) :string
  (arg0 :pointer))

(cffi:defcfun ("GetMagickQuantumRange" GetMagickQuantumRange) :string
  (arg0 :pointer))

(cffi:defcfun ("GetMagickReleaseDate" GetMagickReleaseDate) :string)

(cffi:defcfun ("GetMagickVersion" GetMagickVersion) :string
  (arg0 :pointer))

(cffi:defcfun ("CanonicalXMLContent" CanonicalXMLContent) :string
  (arg0 :string)
  (arg1 MagickBooleanType))

(cffi:defcfun ("XMLTreeInfoToXML" XMLTreeInfoToXML) :string
  (arg0 :pointer))

(cffi:defcfun ("GetXMLTreeAttribute" GetXMLTreeAttribute) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GetXMLTreeContent" GetXMLTreeContent) :string
  (arg0 :pointer))

(cffi:defcfun ("GetXMLTreeProcessingInstructions" GetXMLTreeProcessingInstructions) :pointer
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GetXMLTreeTag" GetXMLTreeTag) :string
  (arg0 :pointer))

(cffi:defcfun ("GetXMLTreeAttributes" GetXMLTreeAttributes) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("AddChildToXMLTree" AddChildToXMLTree) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("AddPathToXMLTree" AddPathToXMLTree) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("DestroyXMLTree" DestroyXMLTree) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetNextXMLTreeTag" GetNextXMLTreeTag) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetXMLTreeChild" GetXMLTreeChild) :pointer
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GetXMLTreeOrdered" GetXMLTreeOrdered) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetXMLTreePath" GetXMLTreePath) :pointer
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("GetXMLTreeSibling" GetXMLTreeSibling) :pointer
  (arg0 :pointer))

(cffi:defcfun ("InsertTagIntoXMLTree" InsertTagIntoXMLTree) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("NewXMLTree" NewXMLTree) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("NewXMLTreeTag" NewXMLTreeTag) :pointer
  (arg0 :string))

(cffi:defcfun ("ParseTagFromXMLTree" ParseTagFromXMLTree) :pointer
  (arg0 :pointer))

(cffi:defcfun ("PruneTagFromXMLTree" PruneTagFromXMLTree) :pointer
  (arg0 :pointer))

(cffi:defcfun ("SetXMLTreeAttribute" SetXMLTreeAttribute) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("SetXMLTreeContent" SetXMLTreeContent) :pointer
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcstruct XImportInfo
  (frame MagickBooleanType)
  (borders MagickBooleanType)
  (screen MagickBooleanType)
  (descend MagickBooleanType)
  (silent MagickBooleanType))

(cffi:defcfun ("XImportImage" XImportImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XGetImportInfo" XGetImportInfo) :void
  (arg0 :pointer))

(alexandria:define-constant WandSignature #xabacadab)

(cffi:defcfun ("MagickGetException" MagickGetException) :string
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickGetExceptionType" MagickGetExceptionType) ExceptionType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetIteratorIndex" MagickGetIteratorIndex) :long
  (arg0 :pointer))

(cffi:defcfun ("IsMagickWand" IsMagickWand) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickClearException" MagickClearException) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickSetIteratorIndex" MagickSetIteratorIndex) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long))

(cffi:defcfun ("CloneMagickWand" CloneMagickWand) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DestroyMagickWand" DestroyMagickWand) :pointer
  (arg0 :pointer))

(cffi:defcfun ("NewMagickWand" NewMagickWand) :pointer)

(cffi:defcfun ("NewMagickWandFromImage" NewMagickWandFromImage) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ClearMagickWand" ClearMagickWand) :void
  (arg0 :pointer))

(cffi:defcfun ("MagickWandGenesis" MagickWandGenesis) :void)

(cffi:defcfun ("MagickWandTerminus" MagickWandTerminus) :void)

(cffi:defcfun ("MagickRelinquishMemory" MagickRelinquishMemory) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickResetIterator" MagickResetIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("MagickSetFirstIterator" MagickSetFirstIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("MagickSetLastIterator" MagickSetLastIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("AnimateImageCommand" AnimateImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("CompareImageCommand" CompareImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("CompositeImageCommand" CompositeImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("ConjureImageCommand" ConjureImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("ConvertImageCommand" ConvertImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("DrawGetFillAlpha" DrawGetFillAlpha) :double
  (arg0 :pointer))

(cffi:defcfun ("DrawGetStrokeAlpha" DrawGetStrokeAlpha) :double
  (arg0 :pointer))

(cffi:defcfun ("DrawPeekGraphicWand" DrawPeekGraphicWand) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickDescribeImage" MagickDescribeImage) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageAttribute" MagickGetImageAttribute) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("PixelIteratorGetException" PixelIteratorGetException) :string
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickGetImageIndex" MagickGetImageIndex) :long
  (arg0 :pointer))

(cffi:defcfun ("MagickClipPathImage" MagickClipPathImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 MagickBooleanType))

(cffi:defcfun ("MagickColorFloodfillImage" MagickColorFloodfillImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double)
  (arg3 :pointer)
  (arg4 :long)
  (arg5 :long))

(cffi:defcfun ("MagickGetImageChannelExtrema" MagickGetImageChannelExtrema) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("MagickGetImageExtrema" MagickGetImageExtrema) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetImageMatte" MagickGetImageMatte) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImagePixels" MagickGetImagePixels) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :string)
  (arg6 StorageType)
  (arg7 :pointer))

(cffi:defcfun ("MagickMapImage" MagickMapImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MagickBooleanType))

(cffi:defcfun ("MagickMatteFloodfillImage" MagickMatteFloodfillImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer)
  (arg4 :long)
  (arg5 :long))

(cffi:defcfun ("MagickOpaqueImage" MagickOpaqueImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :double))

(cffi:defcfun ("MagickPaintFloodfillImage" MagickPaintFloodfillImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :double)
  (arg4 :pointer)
  (arg5 :long)
  (arg6 :long))

(cffi:defcfun ("MagickPaintOpaqueImage" MagickPaintOpaqueImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :double))

(cffi:defcfun ("MagickPaintOpaqueImageChannel" MagickPaintOpaqueImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :double))

(cffi:defcfun ("MagickPaintTransparentImage" MagickPaintTransparentImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickSetImageAttribute" MagickSetImageAttribute) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("MagickSetImageIndex" MagickSetImageIndex) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long))

(cffi:defcfun ("MagickSetImageOption" MagickSetImageOption) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string)
  (arg3 :string))

(cffi:defcfun ("MagickSetImagePixels" MagickSetImagePixels) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :string)
  (arg6 StorageType)
  (arg7 :pointer))

(cffi:defcfun ("MagickTransparentImage" MagickTransparentImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickFlattenImages" MagickFlattenImages) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickMosaicImages" MagickMosaicImages) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickRegionOfInterestImage" MagickRegionOfInterestImage) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickGetImageSize" MagickGetImageSize) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("PixelGetNextRow" PixelGetNextRow) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickWriteImageBlob" MagickWriteImageBlob) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawPopGraphicContext" DrawPopGraphicContext) :void
  (arg0 :pointer))

(cffi:defcfun ("DrawPushGraphicContext" DrawPushGraphicContext) :void
  (arg0 :pointer))

(cffi:defcfun ("DrawSetFillAlpha" DrawSetFillAlpha) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawSetStrokeAlpha" DrawSetStrokeAlpha) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DisplayImageCommand" DisplayImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("DrawGetTextAlignment" DrawGetTextAlignment) AlignType
  (arg0 :pointer))

(cffi:defcfun ("DrawGetClipPath" DrawGetClipPath) :string
  (arg0 :pointer))

(cffi:defcfun ("DrawGetException" DrawGetException) :string
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawGetFont" DrawGetFont) :string
  (arg0 :pointer))

(cffi:defcfun ("DrawGetFontFamily" DrawGetFontFamily) :string
  (arg0 :pointer))

(cffi:defcfun ("DrawGetTextEncoding" DrawGetTextEncoding) :string
  (arg0 :pointer))

(cffi:defcfun ("DrawGetVectorGraphics" DrawGetVectorGraphics) :string
  (arg0 :pointer))

(cffi:defcfun ("DrawGetClipUnits" DrawGetClipUnits) ClipPathUnits
  (arg0 :pointer))

(cffi:defcfun ("DrawGetTextDecoration" DrawGetTextDecoration) DecorationType
  (arg0 :pointer))

(cffi:defcfun ("DrawGetFillOpacity" DrawGetFillOpacity) :double
  (arg0 :pointer))

(cffi:defcfun ("DrawGetFontSize" DrawGetFontSize) :double
  (arg0 :pointer))

(cffi:defcfun ("DrawGetStrokeDashArray" DrawGetStrokeDashArray) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawGetStrokeDashOffset" DrawGetStrokeDashOffset) :double
  (arg0 :pointer))

(cffi:defcfun ("DrawGetStrokeOpacity" DrawGetStrokeOpacity) :double
  (arg0 :pointer))

(cffi:defcfun ("DrawGetStrokeWidth" DrawGetStrokeWidth) :double
  (arg0 :pointer))

(cffi:defcfun ("DrawGetTextKerning" DrawGetTextKerning) :double
  (arg0 :pointer))

(cffi:defcfun ("DrawGetTextInterwordSpacing" DrawGetTextInterwordSpacing) :double
  (arg0 :pointer))

(cffi:defcfun ("PeekDrawingWand" PeekDrawingWand) :pointer
  (arg0 :pointer))

(cffi:defcfun ("CloneDrawingWand" CloneDrawingWand) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DestroyDrawingWand" DestroyDrawingWand) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DrawAllocateWand" DrawAllocateWand) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("NewDrawingWand" NewDrawingWand) :pointer)

(cffi:defcfun ("DrawGetExceptionType" DrawGetExceptionType) ExceptionType
  (arg0 :pointer))

(cffi:defcfun ("DrawGetClipRule" DrawGetClipRule) FillRule
  (arg0 :pointer))

(cffi:defcfun ("DrawGetFillRule" DrawGetFillRule) FillRule
  (arg0 :pointer))

(cffi:defcfun ("DrawGetGravity" DrawGetGravity) GravityType
  (arg0 :pointer))

(cffi:defcfun ("DrawGetStrokeLineCap" DrawGetStrokeLineCap) LineCap
  (arg0 :pointer))

(cffi:defcfun ("DrawGetStrokeLineJoin" DrawGetStrokeLineJoin) LineJoin
  (arg0 :pointer))

(cffi:defcfun ("DrawClearException" DrawClearException) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("DrawComposite" DrawComposite) MagickBooleanType
  (arg0 :pointer)
  (arg1 CompositeOperator)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :double)
  (arg6 :pointer))

(cffi:defcfun ("DrawGetStrokeAntialias" DrawGetStrokeAntialias) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("DrawGetTextAntialias" DrawGetTextAntialias) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("DrawPopPattern" DrawPopPattern) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("DrawPushPattern" DrawPushPattern) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :double))

(cffi:defcfun ("DrawRender" DrawRender) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("DrawSetClipPath" DrawSetClipPath) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DrawSetFillPatternURL" DrawSetFillPatternURL) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DrawSetFont" DrawSetFont) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DrawSetFontFamily" DrawSetFontFamily) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DrawSetStrokeDashArray" DrawSetStrokeDashArray) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("DrawSetStrokePatternURL" DrawSetStrokePatternURL) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DrawSetVectorGraphics" DrawSetVectorGraphics) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("IsDrawingWand" IsDrawingWand) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("PopDrawingWand" PopDrawingWand) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("PushDrawingWand" PushDrawingWand) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("DrawGetFontStretch" DrawGetFontStretch) StretchType
  (arg0 :pointer))

(cffi:defcfun ("DrawGetFontStyle" DrawGetFontStyle) StyleType
  (arg0 :pointer))

(cffi:defcfun ("DrawGetFontWeight" DrawGetFontWeight) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("DrawGetStrokeMiterLimit" DrawGetStrokeMiterLimit) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("ClearDrawingWand" ClearDrawingWand) :void
  (arg0 :pointer))

(cffi:defcfun ("DrawAffine" DrawAffine) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawAnnotation" DrawAnnotation) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :pointer))

(cffi:defcfun ("DrawArc" DrawArc) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :double)
  (arg6 :double))

(cffi:defcfun ("DrawBezier" DrawBezier) :void
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("DrawCircle" DrawCircle) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("DrawColor" DrawColor) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 PaintMethod))

(cffi:defcfun ("DrawComment" DrawComment) :void
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DrawEllipse" DrawEllipse) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :double)
  (arg6 :double))

(cffi:defcfun ("DrawGetFillColor" DrawGetFillColor) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawGetStrokeColor" DrawGetStrokeColor) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawSetTextKerning" DrawSetTextKerning) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawSetTextInterwordSpacing" DrawSetTextInterwordSpacing) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawGetTextUnderColor" DrawGetTextUnderColor) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawLine" DrawLine) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("DrawMatte" DrawMatte) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 PaintMethod))

(cffi:defcfun ("DrawPathClose" DrawPathClose) :void
  (arg0 :pointer))

(cffi:defcfun ("DrawPathCurveToAbsolute" DrawPathCurveToAbsolute) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :double)
  (arg6 :double))

(cffi:defcfun ("DrawPathCurveToRelative" DrawPathCurveToRelative) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :double)
  (arg6 :double))

(cffi:defcfun ("DrawPathCurveToQuadraticBezierAbsolute" DrawPathCurveToQuadraticBezierAbsolute) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("DrawPathCurveToQuadraticBezierRelative" DrawPathCurveToQuadraticBezierRelative) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("DrawPathCurveToQuadraticBezierSmoothAbsolute" DrawPathCurveToQuadraticBezierSmoothAbsolute) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("DrawPathCurveToQuadraticBezierSmoothRelative" DrawPathCurveToQuadraticBezierSmoothRelative) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("DrawPathCurveToSmoothAbsolute" DrawPathCurveToSmoothAbsolute) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("DrawPathCurveToSmoothRelative" DrawPathCurveToSmoothRelative) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("DrawPathEllipticArcAbsolute" DrawPathEllipticArcAbsolute) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 MagickBooleanType)
  (arg5 MagickBooleanType)
  (arg6 :double)
  (arg7 :double))

(cffi:defcfun ("DrawPathEllipticArcRelative" DrawPathEllipticArcRelative) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 MagickBooleanType)
  (arg5 MagickBooleanType)
  (arg6 :double)
  (arg7 :double))

(cffi:defcfun ("DrawPathFinish" DrawPathFinish) :void
  (arg0 :pointer))

(cffi:defcfun ("DrawPathLineToAbsolute" DrawPathLineToAbsolute) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("DrawPathLineToRelative" DrawPathLineToRelative) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("DrawPathLineToHorizontalAbsolute" DrawPathLineToHorizontalAbsolute) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawPathLineToHorizontalRelative" DrawPathLineToHorizontalRelative) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawPathLineToVerticalAbsolute" DrawPathLineToVerticalAbsolute) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawPathLineToVerticalRelative" DrawPathLineToVerticalRelative) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawPathMoveToAbsolute" DrawPathMoveToAbsolute) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("DrawPathMoveToRelative" DrawPathMoveToRelative) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("DrawPathStart" DrawPathStart) :void
  (arg0 :pointer))

(cffi:defcfun ("DrawPoint" DrawPoint) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("DrawPolygon" DrawPolygon) :void
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("DrawPolyline" DrawPolyline) :void
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("DrawPopClipPath" DrawPopClipPath) :void
  (arg0 :pointer))

(cffi:defcfun ("DrawPopDefs" DrawPopDefs) :void
  (arg0 :pointer))

(cffi:defcfun ("DrawPushClipPath" DrawPushClipPath) :void
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DrawPushDefs" DrawPushDefs) :void
  (arg0 :pointer))

(cffi:defcfun ("DrawRectangle" DrawRectangle) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("DrawResetVectorGraphics" DrawResetVectorGraphics) :void
  (arg0 :pointer))

(cffi:defcfun ("DrawRotate" DrawRotate) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawRoundRectangle" DrawRoundRectangle) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :double)
  (arg6 :double))

(cffi:defcfun ("DrawScale" DrawScale) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("DrawSetClipRule" DrawSetClipRule) :void
  (arg0 :pointer)
  (arg1 FillRule))

(cffi:defcfun ("DrawSetClipUnits" DrawSetClipUnits) :void
  (arg0 :pointer)
  (arg1 ClipPathUnits))

(cffi:defcfun ("DrawSetFillColor" DrawSetFillColor) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawSetFillOpacity" DrawSetFillOpacity) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawSetFillRule" DrawSetFillRule) :void
  (arg0 :pointer)
  (arg1 FillRule))

(cffi:defcfun ("DrawSetFontSize" DrawSetFontSize) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawSetFontStretch" DrawSetFontStretch) :void
  (arg0 :pointer)
  (arg1 StretchType))

(cffi:defcfun ("DrawSetFontStyle" DrawSetFontStyle) :void
  (arg0 :pointer)
  (arg1 StyleType))

(cffi:defcfun ("DrawSetFontWeight" DrawSetFontWeight) :void
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("DrawSetGravity" DrawSetGravity) :void
  (arg0 :pointer)
  (arg1 GravityType))

(cffi:defcfun ("DrawSetStrokeAntialias" DrawSetStrokeAntialias) :void
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("DrawSetStrokeColor" DrawSetStrokeColor) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawSetStrokeDashOffset" DrawSetStrokeDashOffset) :void
  (arg0 :pointer)
  (dashoffset :double))

(cffi:defcfun ("DrawSetStrokeLineCap" DrawSetStrokeLineCap) :void
  (arg0 :pointer)
  (arg1 LineCap))

(cffi:defcfun ("DrawSetStrokeLineJoin" DrawSetStrokeLineJoin) :void
  (arg0 :pointer)
  (arg1 LineJoin))

(cffi:defcfun ("DrawSetStrokeMiterLimit" DrawSetStrokeMiterLimit) :void
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("DrawSetStrokeOpacity" DrawSetStrokeOpacity) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawSetStrokeWidth" DrawSetStrokeWidth) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawSetTextAlignment" DrawSetTextAlignment) :void
  (arg0 :pointer)
  (arg1 AlignType))

(cffi:defcfun ("DrawSetTextAntialias" DrawSetTextAntialias) :void
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("DrawSetTextDecoration" DrawSetTextDecoration) :void
  (arg0 :pointer)
  (arg1 DecorationType))

(cffi:defcfun ("DrawSetTextEncoding" DrawSetTextEncoding) :void
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("DrawSetTextUnderColor" DrawSetTextUnderColor) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("DrawSetViewbox" DrawSetViewbox) :void
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long))

(cffi:defcfun ("DrawSkewX" DrawSkewX) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawSkewY" DrawSkewY) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("DrawTranslate" DrawTranslate) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("IdentifyImageCommand" IdentifyImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("ImportImageCommand" ImportImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("MagickGetImageChannelStatistics" MagickGetImageChannelStatistics) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageFilename" MagickGetImageFilename) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageFormat" MagickGetImageFormat) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageSignature" MagickGetImageSignature) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickIdentifyImage" MagickIdentifyImage) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageCompose" MagickGetImageCompose) CompositeOperator
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageColorspace" MagickGetImageColorspace) ColorspaceType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageCompression" MagickGetImageCompression) CompressionType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageDispose" MagickGetImageDispose) DisposeType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageChannelDistortions" MagickGetImageChannelDistortions) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MetricType))

(cffi:defcfun ("MagickGetImageGamma" MagickGetImageGamma) :double
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageTotalInkDensity" MagickGetImageTotalInkDensity) :double
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageGravity" MagickGetImageGravity) GravityType
  (arg0 :pointer))

(cffi:defcfun ("MagickDestroyImage" MagickDestroyImage) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetImageFromMagickWand" GetImageFromMagickWand) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageType" MagickGetImageType) ImageType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageInterlaceScheme" MagickGetImageInterlaceScheme) InterlaceType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageInterpolateMethod" MagickGetImageInterpolateMethod) InterpolatePixelMethod
  (arg0 :pointer))

(cffi:defcfun ("MagickAdaptiveBlurImage" MagickAdaptiveBlurImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickAdaptiveBlurImageChannel" MagickAdaptiveBlurImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickAdaptiveResizeImage" MagickAdaptiveResizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long))

(cffi:defcfun ("MagickAdaptiveSharpenImage" MagickAdaptiveSharpenImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickAdaptiveSharpenImageChannel" MagickAdaptiveSharpenImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickAdaptiveThresholdImage" MagickAdaptiveThresholdImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long))

(cffi:defcfun ("MagickAddImage" MagickAddImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickAddNoiseImage" MagickAddNoiseImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 NoiseType))

(cffi:defcfun ("MagickAddNoiseImageChannel" MagickAddNoiseImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 NoiseType))

(cffi:defcfun ("MagickAffineTransformImage" MagickAffineTransformImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickAnnotateImage" MagickAnnotateImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :string))

(cffi:defcfun ("MagickAnimateImages" MagickAnimateImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickBlackThresholdImage" MagickBlackThresholdImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickBlurImage" MagickBlurImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickBlurImageChannel" MagickBlurImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickBorderImage" MagickBorderImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long)
  (arg3 :unsigned-long))

(cffi:defcfun ("MagickCharcoalImage" MagickCharcoalImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickChopImage" MagickChopImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickClipImage" MagickClipImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickClipImagePath" MagickClipImagePath) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 MagickBooleanType))

(cffi:defcfun ("MagickClutImage" MagickClutImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickClutImageChannel" MagickClutImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer))

(cffi:defcfun ("MagickColorizeImage" MagickColorizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickCommentImage" MagickCommentImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickCompositeImage" MagickCompositeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 CompositeOperator)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickCompositeImageChannel" MagickCompositeImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 CompositeOperator)
  (arg4 :long)
  (arg5 :long))

(cffi:defcfun ("MagickConstituteImage" MagickConstituteImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :string)
  (arg4 StorageType)
  (arg5 :pointer))

(cffi:defcfun ("MagickContrastImage" MagickContrastImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("MagickContrastStretchImage" MagickContrastStretchImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickContrastStretchImageChannel" MagickContrastStretchImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickConvolveImage" MagickConvolveImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("MagickConvolveImageChannel" MagickConvolveImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("MagickCropImage" MagickCropImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickCycleColormapImage" MagickCycleColormapImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long))

(cffi:defcfun ("MagickDecipherImage" MagickDecipherImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickDeskewImage" MagickDeskewImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickDespeckleImage" MagickDespeckleImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickDisplayImage" MagickDisplayImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickDisplayImages" MagickDisplayImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickDistortImage" MagickDistortImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 DistortImageMethod)
  (arg2 :unsigned-long)
  (arg3 :pointer)
  (arg4 MagickBooleanType))

(cffi:defcfun ("MagickDrawImage" MagickDrawImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickEdgeImage" MagickEdgeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickEmbossImage" MagickEmbossImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickEncipherImage" MagickEncipherImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickEnhanceImage" MagickEnhanceImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickEqualizeImage" MagickEqualizeImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickEqualizeImageChannel" MagickEqualizeImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType))

(cffi:defcfun ("MagickEvaluateImage" MagickEvaluateImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickEvaluateOperator)
  (arg2 :double))

(cffi:defcfun ("MagickEvaluateImageChannel" MagickEvaluateImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 MagickEvaluateOperator)
  (arg3 :double))

(cffi:defcfun ("MagickExportImagePixels" MagickExportImagePixels) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :string)
  (arg6 StorageType)
  (arg7 :pointer))

(cffi:defcfun ("MagickExtentImage" MagickExtentImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickFlipImage" MagickFlipImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickFloodfillPaintImage" MagickFloodfillPaintImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :double)
  (arg4 :pointer)
  (arg5 :long)
  (arg6 :long)
  (arg7 MagickBooleanType))

(cffi:defcfun ("MagickFlopImage" MagickFlopImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickFrameImage" MagickFrameImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long)
  (arg3 :unsigned-long)
  (arg4 :long)
  (arg5 :long))

(cffi:defcfun ("MagickFunctionImage" MagickFunctionImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickFunction)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("MagickFunctionImageChannel" MagickFunctionImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 MagickFunction)
  (arg3 :unsigned-long)
  (arg4 :pointer))

(cffi:defcfun ("MagickGammaImage" MagickGammaImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickGammaImageChannel" MagickGammaImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double))

(cffi:defcfun ("MagickGaussianBlurImage" MagickGaussianBlurImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickGaussianBlurImageChannel" MagickGaussianBlurImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickGetImageAlphaChannel" MagickGetImageAlphaChannel) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageBackgroundColor" MagickGetImageBackgroundColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickGetImageBluePrimary" MagickGetImageBluePrimary) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetImageBorderColor" MagickGetImageBorderColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickGetImageChannelDistortion" MagickGetImageChannelDistortion) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 ChannelType)
  (arg3 MetricType)
  (arg4 :pointer))

(cffi:defcfun ("MagickGetImageChannelKurtosis" MagickGetImageChannelKurtosis) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("MagickGetImageChannelMean" MagickGetImageChannelMean) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("MagickGetImageChannelRange" MagickGetImageChannelRange) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("MagickGetImageColormapColor" MagickGetImageColormapColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetImageDistortion" MagickGetImageDistortion) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MetricType)
  (arg3 :pointer))

(cffi:defcfun ("MagickGetImageGreenPrimary" MagickGetImageGreenPrimary) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetImageMatteColor" MagickGetImageMatteColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickGetImageLength" MagickGetImageLength) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickGetImagePage" MagickGetImagePage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("MagickGetImagePixelColor" MagickGetImagePixelColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :pointer))

(cffi:defcfun ("MagickGetImageRange" MagickGetImageRange) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetImageRedPrimary" MagickGetImageRedPrimary) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetImageResolution" MagickGetImageResolution) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetImageWhitePoint" MagickGetImageWhitePoint) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickHasNextImage" MagickHasNextImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickHasPreviousImage" MagickHasPreviousImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickImplodeImage" MagickImplodeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickImportImagePixels" MagickImportImagePixels) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long)
  (arg5 :string)
  (arg6 StorageType)
  (arg7 :pointer))

(cffi:defcfun ("MagickLabelImage" MagickLabelImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickLevelImage" MagickLevelImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickLevelImageChannel" MagickLevelImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("MagickLinearStretchImage" MagickLinearStretchImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickLiquidRescaleImage" MagickLiquidRescaleImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("MagickMagnifyImage" MagickMagnifyImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickMedianFilterImage" MagickMedianFilterImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickMinifyImage" MagickMinifyImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickModulateImage" MagickModulateImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickMotionBlurImage" MagickMotionBlurImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickMotionBlurImageChannel" MagickMotionBlurImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("MagickNegateImage" MagickNegateImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("MagickNegateImageChannel" MagickNegateImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 MagickBooleanType))

(cffi:defcfun ("MagickNewImage" MagickNewImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("MagickNextImage" MagickNextImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickNormalizeImage" MagickNormalizeImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickNormalizeImageChannel" MagickNormalizeImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType))

(cffi:defcfun ("MagickOilPaintImage" MagickOilPaintImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickOpaquePaintImage" MagickOpaquePaintImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :double)
  (arg4 MagickBooleanType))

(cffi:defcfun ("MagickOpaquePaintImageChannel" MagickOpaquePaintImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :double)
  (arg5 MagickBooleanType))

(cffi:defcfun ("MagickOrderedPosterizeImage" MagickOrderedPosterizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickOrderedPosterizeImageChannel" MagickOrderedPosterizeImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :string))

(cffi:defcfun ("MagickTransparentPaintImage" MagickTransparentPaintImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double)
  (arg3 :double)
  (invert MagickBooleanType))

(cffi:defcfun ("MagickPingImage" MagickPingImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickPingImageBlob" MagickPingImageBlob) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickPingImageFile" MagickPingImageFile) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickPolaroidImage" MagickPolaroidImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double))

(cffi:defcfun ("MagickPosterizeImage" MagickPosterizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 MagickBooleanType))

(cffi:defcfun ("MagickPreviousImage" MagickPreviousImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickQuantizeImage" MagickQuantizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 ColorspaceType)
  (arg3 :unsigned-long)
  (arg4 MagickBooleanType)
  (arg5 MagickBooleanType))

(cffi:defcfun ("MagickQuantizeImages" MagickQuantizeImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 ColorspaceType)
  (arg3 :unsigned-long)
  (arg4 MagickBooleanType)
  (arg5 MagickBooleanType))

(cffi:defcfun ("MagickRadialBlurImage" MagickRadialBlurImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickRadialBlurImageChannel" MagickRadialBlurImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double))

(cffi:defcfun ("MagickRaiseImage" MagickRaiseImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long)
  (arg4 :long)
  (arg5 MagickBooleanType))

(cffi:defcfun ("MagickRandomThresholdImage" MagickRandomThresholdImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickRandomThresholdImageChannel" MagickRandomThresholdImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickReadImage" MagickReadImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickReadImageBlob" MagickReadImageBlob) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickReadImageFile" MagickReadImageFile) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickRecolorImage" MagickRecolorImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("MagickReduceNoiseImage" MagickReduceNoiseImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickRemapImage" MagickRemapImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 DitherMethod))

(cffi:defcfun ("MagickRemoveImage" MagickRemoveImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickResampleImage" MagickResampleImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 FilterTypes)
  (arg4 :double))

(cffi:defcfun ("MagickResetImagePage" MagickResetImagePage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickResizeImage" MagickResizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 FilterTypes)
  (arg4 :double))

(cffi:defcfun ("MagickRollImage" MagickRollImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long))

(cffi:defcfun ("MagickRotateImage" MagickRotateImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double))

(cffi:defcfun ("MagickSampleImage" MagickSampleImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long))

(cffi:defcfun ("MagickScaleImage" MagickScaleImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long))

(cffi:defcfun ("MagickSegmentImage" MagickSegmentImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 ColorspaceType)
  (arg2 MagickBooleanType)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("MagickSelectiveBlurImage" MagickSelectiveBlurImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickSelectiveBlurImageChannel" MagickSelectiveBlurImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("MagickSeparateImageChannel" MagickSeparateImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType))

(cffi:defcfun ("MagickSepiaToneImage" MagickSepiaToneImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickSetImage" MagickSetImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickSetImageAlphaChannel" MagickSetImageAlphaChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 AlphaChannelType))

(cffi:defcfun ("MagickSetImageBackgroundColor" MagickSetImageBackgroundColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickSetImageBias" MagickSetImageBias) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickSetImageBluePrimary" MagickSetImageBluePrimary) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickSetImageBorderColor" MagickSetImageBorderColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickSetImageChannelDepth" MagickSetImageChannelDepth) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :unsigned-long))

(cffi:defcfun ("MagickSetImageClipMask" MagickSetImageClipMask) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickSetImageColormapColor" MagickSetImageColormapColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("MagickSetImageCompose" MagickSetImageCompose) MagickBooleanType
  (arg0 :pointer)
  (arg1 CompositeOperator))

(cffi:defcfun ("MagickSetImageCompression" MagickSetImageCompression) MagickBooleanType
  (arg0 :pointer)
  (arg1 CompressionType))

(cffi:defcfun ("MagickSetImageDelay" MagickSetImageDelay) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("MagickSetImageDepth" MagickSetImageDepth) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("MagickSetImageDispose" MagickSetImageDispose) MagickBooleanType
  (arg0 :pointer)
  (arg1 DisposeType))

(cffi:defcfun ("MagickSetImageColorspace" MagickSetImageColorspace) MagickBooleanType
  (arg0 :pointer)
  (arg1 ColorspaceType))

(cffi:defcfun ("MagickSetImageCompressionQuality" MagickSetImageCompressionQuality) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("MagickSetImageGreenPrimary" MagickSetImageGreenPrimary) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickSetImageGamma" MagickSetImageGamma) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickSetImageExtent" MagickSetImageExtent) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long))

(cffi:defcfun ("MagickSetImageFilename" MagickSetImageFilename) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickSetImageGravity" MagickSetImageGravity) MagickBooleanType
  (arg0 :pointer)
  (arg1 GravityType))

(cffi:defcfun ("MagickSetImageFormat" MagickSetImageFormat) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickSetImageInterlaceScheme" MagickSetImageInterlaceScheme) MagickBooleanType
  (arg0 :pointer)
  (arg1 InterlaceType))

(cffi:defcfun ("MagickSetImageInterpolateMethod" MagickSetImageInterpolateMethod) MagickBooleanType
  (arg0 :pointer)
  (arg1 InterpolatePixelMethod))

(cffi:defcfun ("MagickSetImageIterations" MagickSetImageIterations) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("MagickSetImageMatte" MagickSetImageMatte) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("MagickSetImageMatteColor" MagickSetImageMatteColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickSetImageOpacity" MagickSetImageOpacity) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickSetImageOrientation" MagickSetImageOrientation) MagickBooleanType
  (arg0 :pointer)
  (arg1 OrientationType))

(cffi:defcfun ("MagickSetImagePage" MagickSetImagePage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickSetImageRedPrimary" MagickSetImageRedPrimary) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickSetImageRenderingIntent" MagickSetImageRenderingIntent) MagickBooleanType
  (arg0 :pointer)
  (arg1 RenderingIntent))

(cffi:defcfun ("MagickSetImageResolution" MagickSetImageResolution) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickSetImageScene" MagickSetImageScene) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("MagickSetImageTicksPerSecond" MagickSetImageTicksPerSecond) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long))

(cffi:defcfun ("MagickSetImageType" MagickSetImageType) MagickBooleanType
  (arg0 :pointer)
  (arg1 ImageType))

(cffi:defcfun ("MagickSetImageUnits" MagickSetImageUnits) MagickBooleanType
  (arg0 :pointer)
  (arg1 ResolutionType))

(cffi:defcfun ("MagickSetImageWhitePoint" MagickSetImageWhitePoint) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickShadeImage" MagickShadeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickShadowImage" MagickShadowImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickSharpenImage" MagickSharpenImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickSharpenImageChannel" MagickSharpenImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickShaveImage" MagickShaveImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long))

(cffi:defcfun ("MagickShearImage" MagickShearImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickSigmoidalContrastImage" MagickSigmoidalContrastImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickSigmoidalContrastImageChannel" MagickSigmoidalContrastImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 MagickBooleanType)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("MagickSketchImage" MagickSketchImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("MagickSolarizeImage" MagickSolarizeImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

;; (cffi:defcfun ("MagickSparseColorImage" MagickSparseColorImage) MagickBooleanType
;;   (arg0 :pointer)
;;   (arg1 ChannelType)
;;   (arg2 SparseColorMethod)
;;   (arg3 :unsigned-long)
;;   (arg4 :pointer))

(cffi:defcfun ("MagickSpliceImage" MagickSpliceImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickSpreadImage" MagickSpreadImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickStripImage" MagickStripImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickSwirlImage" MagickSwirlImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickTintImage" MagickTintImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickTransposeImage" MagickTransposeImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickTransverseImage" MagickTransverseImage) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickThresholdImage" MagickThresholdImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickThresholdImageChannel" MagickThresholdImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double))

(cffi:defcfun ("MagickThumbnailImage" MagickThumbnailImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long))

(cffi:defcfun ("MagickTrimImage" MagickTrimImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickUniqueImageColors" MagickUniqueImageColors) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickUnsharpMaskImage" MagickUnsharpMaskImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double))

(cffi:defcfun ("MagickUnsharpMaskImageChannel" MagickUnsharpMaskImageChannel) MagickBooleanType
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :double)
  (arg3 :double)
  (arg4 :double)
  (arg5 :double))

(cffi:defcfun ("MagickVignetteImage" MagickVignetteImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickWaveImage" MagickWaveImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickWhiteThresholdImage" MagickWhiteThresholdImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickWriteImage" MagickWriteImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickWriteImageFile" MagickWriteImageFile) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickWriteImages" MagickWriteImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 MagickBooleanType))

(cffi:defcfun ("MagickWriteImagesFile" MagickWriteImagesFile) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickSetImageProgressMonitor" MagickSetImageProgressMonitor) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickAppendImages" MagickAppendImages) :pointer
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("MagickAverageImages" MagickAverageImages) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickCoalesceImages" MagickCoalesceImages) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickCombineImages" MagickCombineImages) :pointer
  (arg0 :pointer)
  (arg1 ChannelType))

(cffi:defcfun ("MagickCompareImageChannels" MagickCompareImageChannels) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 ChannelType)
  (arg3 MetricType)
  (arg4 :pointer))

(cffi:defcfun ("MagickCompareImages" MagickCompareImages) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 MetricType)
  (arg3 :pointer))

(cffi:defcfun ("MagickCompareImageLayers" MagickCompareImageLayers) :pointer
  (arg0 :pointer)
  (arg1 ImageLayerMethod))

(cffi:defcfun ("MagickDeconstructImages" MagickDeconstructImages) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickFxImage" MagickFxImage) :pointer
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickFxImageChannel" MagickFxImageChannel) :pointer
  (arg0 :pointer)
  (arg1 ChannelType)
  (arg2 :string))

(cffi:defcfun ("MagickGetImage" MagickGetImage) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageClipMask" MagickGetImageClipMask) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageRegion" MagickGetImageRegion) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickMergeImageLayers" MagickMergeImageLayers) :pointer
  (arg0 :pointer)
  (arg1 ImageLayerMethod))

(cffi:defcfun ("MagickMorphImages" MagickMorphImages) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("MagickMontageImage" MagickMontageImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :string)
  (arg4 MontageMode)
  (arg5 :string))

(cffi:defcfun ("MagickOptimizeImageLayers" MagickOptimizeImageLayers) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickPreviewImages" MagickPreviewImages) :pointer
  (wand :pointer)
  (arg1 PreviewType))

(cffi:defcfun ("MagickSteganoImage" MagickSteganoImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :long))

(cffi:defcfun ("MagickStereoImage" MagickStereoImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickTextureImage" MagickTextureImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickTransformImage" MagickTransformImage) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("MagickGetImageOrientation" MagickGetImageOrientation) OrientationType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageHistogram" MagickGetImageHistogram) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickGetImageRenderingIntent" MagickGetImageRenderingIntent) RenderingIntent
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageUnits" MagickGetImageUnits) ResolutionType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageBlob" MagickGetImageBlob) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickGetImagesBlob" MagickGetImagesBlob) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickGetImageColors" MagickGetImageColors) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageCompressionQuality" MagickGetImageCompressionQuality) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageDelay" MagickGetImageDelay) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageChannelDepth" MagickGetImageChannelDepth) :unsigned-long
  (arg0 :pointer)
  (arg1 ChannelType))

(cffi:defcfun ("MagickGetImageDepth" MagickGetImageDepth) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageHeight" MagickGetImageHeight) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageIterations" MagickGetImageIterations) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageScene" MagickGetImageScene) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageTicksPerSecond" MagickGetImageTicksPerSecond) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageWidth" MagickGetImageWidth) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MagickGetNumberImages" MagickGetNumberImages) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageVirtualPixelMethod" MagickGetImageVirtualPixelMethod) VirtualPixelMethod
  (arg0 :pointer))

(cffi:defcfun ("MagickSetImageVirtualPixelMethod" MagickSetImageVirtualPixelMethod) VirtualPixelMethod
  (arg0 :pointer)
  (arg1 VirtualPixelMethod))

(cffi:defcfun ("MagickGetFilename" MagickGetFilename) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickGetFormat" MagickGetFormat) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickGetFont" MagickGetFont) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickGetHomeURL" MagickGetHomeURL) :string)

(cffi:defcfun ("MagickGetImageProfiles" MagickGetImageProfiles) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetImageProperty" MagickGetImageProperty) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickGetImageProperties" MagickGetImageProperties) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetOption" MagickGetOption) :string
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickGetOptions" MagickGetOptions) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("MagickQueryConfigureOption" MagickQueryConfigureOption) :string
  (arg0 :string))

(cffi:defcfun ("MagickQueryConfigureOptions" MagickQueryConfigureOptions) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("MagickQueryFonts" MagickQueryFonts) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("MagickQueryFormats" MagickQueryFormats) :pointer
  (arg0 :string)
  (arg1 :pointer))

(cffi:defcfun ("MagickGetCompression" MagickGetCompression) CompressionType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetCopyright" MagickGetCopyright) :string)

(cffi:defcfun ("MagickGetPackageName" MagickGetPackageName) :string)

(cffi:defcfun ("MagickGetQuantumDepth" MagickGetQuantumDepth) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickGetQuantumRange" MagickGetQuantumRange) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickGetReleaseDate" MagickGetReleaseDate) :string)

(cffi:defcfun ("MagickGetVersion" MagickGetVersion) :string
  (arg0 :pointer))

(cffi:defcfun ("MagickGetPointsize" MagickGetPointsize) :double
  (arg0 :pointer))

(cffi:defcfun ("MagickGetSamplingFactors" MagickGetSamplingFactors) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickQueryFontMetrics" MagickQueryFontMetrics) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("MagickQueryMultilineFontMetrics" MagickQueryMultilineFontMetrics) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("MagickGetGravity" MagickGetGravity) GravityType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetType" MagickGetType) ImageType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetInterlaceScheme" MagickGetInterlaceScheme) InterlaceType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetInterpolateMethod" MagickGetInterpolateMethod) InterpolatePixelMethod
  (arg0 :pointer))

(cffi:defcfun ("MagickGetOrientation" MagickGetOrientation) OrientationType
  (arg0 :pointer))

(cffi:defcfun ("MagickDeleteOption" MagickDeleteOption) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickDeleteImageProperty" MagickDeleteImageProperty) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickGetAntialias" MagickGetAntialias) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetPage" MagickGetPage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("MagickGetSize" MagickGetSize) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetSizeOffset" MagickGetSizeOffset) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickProfileImage" MagickProfileImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("MagickSetAntialias" MagickSetAntialias) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType))

(cffi:defcfun ("MagickSetBackgroundColor" MagickSetBackgroundColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("MagickSetCompression" MagickSetCompression) MagickBooleanType
  (arg0 :pointer)
  (arg1 CompressionType))

(cffi:defcfun ("MagickSetCompressionQuality" MagickSetCompressionQuality) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("MagickSetDepth" MagickSetDepth) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("MagickSetFilename" MagickSetFilename) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickSetFormat" MagickSetFormat) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickSetFont" MagickSetFont) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickSetGravity" MagickSetGravity) MagickBooleanType
  (arg0 :pointer)
  (arg1 GravityType))

(cffi:defcfun ("MagickSetImageProfile" MagickSetImageProfile) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("MagickSetImageProperty" MagickSetImageProperty) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("MagickSetInterlaceScheme" MagickSetInterlaceScheme) MagickBooleanType
  (arg0 :pointer)
  (arg1 InterlaceType))

(cffi:defcfun ("MagickSetInterpolateMethod" MagickSetInterpolateMethod) MagickBooleanType
  (arg0 :pointer)
  (arg1 InterpolatePixelMethod))

(cffi:defcfun ("MagickSetOption" MagickSetOption) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :string))

(cffi:defcfun ("MagickSetOrientation" MagickSetOrientation) MagickBooleanType
  (arg0 :pointer)
  (arg1 OrientationType))

(cffi:defcfun ("MagickSetPage" MagickSetPage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long)
  (arg4 :long))

(cffi:defcfun ("MagickSetPassphrase" MagickSetPassphrase) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("MagickSetPointsize" MagickSetPointsize) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("MagickSetResolution" MagickSetResolution) MagickBooleanType
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double))

(cffi:defcfun ("MagickSetResourceLimit" MagickSetResourceLimit) MagickBooleanType
  (type ResourceType)
  (limit :unsigned-long))

(cffi:defcfun ("MagickSetSamplingFactors" MagickSetSamplingFactors) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("MagickSetSize" MagickSetSize) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long))

(cffi:defcfun ("MagickSetSizeOffset" MagickSetSizeOffset) MagickBooleanType
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :unsigned-long)
  (arg3 :long))

(cffi:defcfun ("MagickSetType" MagickSetType) MagickBooleanType
  (arg0 :pointer)
  (arg1 ImageType))

(cffi:defcfun ("MagickSetProgressMonitor" MagickSetProgressMonitor) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetResource" MagickGetResource) :unsigned-long
  (arg0 ResourceType))

(cffi:defcfun ("MagickGetResourceLimit" MagickGetResourceLimit) :unsigned-long
  (arg0 ResourceType))

(cffi:defcfun ("MagickGetBackgroundColor" MagickGetBackgroundColor) :pointer
  (arg0 :pointer))

(cffi:defcfun ("MagickGetOrientationType" MagickGetOrientationType) OrientationType
  (arg0 :pointer))

(cffi:defcfun ("MagickGetImageProfile" MagickGetImageProfile) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("MagickRemoveImageProfile" MagickRemoveImageProfile) :pointer
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :pointer))

(cffi:defcfun ("MagickGetCompressionQuality" MagickGetCompressionQuality) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("MogrifyImage" MogrifyImage) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("MogrifyImageCommand" MogrifyImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("MogrifyImageInfo" MogrifyImageInfo) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("MogrifyImageList" MogrifyImageList) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("MogrifyImages" MogrifyImages) MagickBooleanType
  (arg0 :pointer)
  (arg1 MagickBooleanType)
  (arg2 :int)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("MontageImageCommand" MontageImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("PixelGetIteratorException" PixelGetIteratorException) :string
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PixelGetIteratorExceptionType" PixelGetIteratorExceptionType) ExceptionType
  (arg0 :pointer))

(cffi:defcfun ("PixelGetIteratorRow" PixelGetIteratorRow) :long
  (arg0 :pointer))

(cffi:defcfun ("IsPixelIterator" IsPixelIterator) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("PixelClearIteratorException" PixelClearIteratorException) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("PixelSetIteratorRow" PixelSetIteratorRow) MagickBooleanType
  (arg0 :pointer)
  (arg1 :long))

(cffi:defcfun ("PixelSyncIterator" PixelSyncIterator) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("ClonePixelIterator" ClonePixelIterator) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DestroyPixelIterator" DestroyPixelIterator) :pointer
  (arg0 :pointer))

(cffi:defcfun ("NewPixelIterator" NewPixelIterator) :pointer
  (arg0 :pointer))

(cffi:defcfun ("NewPixelRegionIterator" NewPixelRegionIterator) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long))

(cffi:defcfun ("PixelGetCurrentIteratorRow" PixelGetCurrentIteratorRow) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PixelGetNextIteratorRow" PixelGetNextIteratorRow) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PixelGetPreviousIteratorRow" PixelGetPreviousIteratorRow) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("ClearPixelIterator" ClearPixelIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("PixelResetIterator" PixelResetIterator) :void
  (arg0 :pointer))

(cffi:defcfun ("PixelSetFirstIteratorRow" PixelSetFirstIteratorRow) :void
  (arg0 :pointer))

(cffi:defcfun ("PixelSetLastIteratorRow" PixelSetLastIteratorRow) :void
  (arg0 :pointer))

(cffi:defcfun ("GetPixelViewException" GetPixelViewException) :string
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("GetPixelViewX" GetPixelViewX) :long
  (arg0 :pointer))

(cffi:defcfun ("GetPixelViewY" GetPixelViewY) :long
  (arg0 :pointer))

(cffi:defcfun ("DuplexTransferPixelViewIterator" DuplexTransferPixelViewIterator) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("GetPixelViewIterator" GetPixelViewIterator) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("IsPixelView" IsPixelView) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("SetPixelViewIterator" SetPixelViewIterator) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("TransferPixelViewIterator" TransferPixelViewIterator) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("UpdatePixelViewIterator" UpdatePixelViewIterator) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("GetPixelViewWand" GetPixelViewWand) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ClonePixelView" ClonePixelView) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DestroyPixelView" DestroyPixelView) :pointer
  (arg0 :pointer))

(cffi:defcfun ("NewPixelView" NewPixelView) :pointer
  (arg0 :pointer))

(cffi:defcfun ("NewPixelViewRegion" NewPixelViewRegion) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :long)
  (arg3 :unsigned-long)
  (arg4 :unsigned-long))

(cffi:defcfun ("GetPixelViewPixels" GetPixelViewPixels) :pointer
  (arg0 :pointer))

(cffi:defcfun ("GetPixelViewHeight" GetPixelViewHeight) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("GetPixelViewWidth" GetPixelViewWidth) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("PixelGetColorAsNormalizedString" PixelGetColorAsNormalizedString) :string
  (arg0 :pointer))

(cffi:defcfun ("PixelGetColorAsString" PixelGetColorAsString) :string
  (arg0 :pointer))

(cffi:defcfun ("PixelGetException" PixelGetException) :string
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PixelGetAlpha" PixelGetAlpha) :double
  (arg0 :pointer))

(cffi:defcfun ("PixelGetBlack" PixelGetBlack) :double
  (arg0 :pointer))

(cffi:defcfun ("PixelGetBlue" PixelGetBlue) :double
  (arg0 :pointer))

(cffi:defcfun ("PixelGetCyan" PixelGetCyan) :double
  (arg0 :pointer))

(cffi:defcfun ("PixelGetFuzz" PixelGetFuzz) :double
  (arg0 :pointer))

(cffi:defcfun ("PixelGetGreen" PixelGetGreen) :double
  (arg0 :pointer))

(cffi:defcfun ("PixelGetMagenta" PixelGetMagenta) :double
  (arg0 :pointer))

(cffi:defcfun ("PixelGetOpacity" PixelGetOpacity) :double
  (arg0 :pointer))

(cffi:defcfun ("PixelGetRed" PixelGetRed) :double
  (arg0 :pointer))

(cffi:defcfun ("PixelGetYellow" PixelGetYellow) :double
  (arg0 :pointer))

(cffi:defcfun ("PixelGetExceptionType" PixelGetExceptionType) ExceptionType
  (arg0 :pointer))

(cffi:defcfun ("PixelGetIndex" PixelGetIndex) :unsigned-short
  (arg0 :pointer))

(cffi:defcfun ("IsPixelWand" IsPixelWand) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("IsPixelWandSimilar" IsPixelWandSimilar) MagickBooleanType
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :double))

(cffi:defcfun ("PixelClearException" PixelClearException) MagickBooleanType
  (arg0 :pointer))

(cffi:defcfun ("PixelSetColor" PixelSetColor) MagickBooleanType
  (arg0 :pointer)
  (arg1 :string))

(cffi:defcfun ("ClonePixelWand" ClonePixelWand) :pointer
  (arg0 :pointer))

(cffi:defcfun ("ClonePixelWands" ClonePixelWands) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("DestroyPixelWand" DestroyPixelWand) :pointer
  (arg0 :pointer))

(cffi:defcfun ("DestroyPixelWands" DestroyPixelWands) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("NewPixelWand" NewPixelWand) :pointer)

(cffi:defcfun ("NewPixelWands" NewPixelWands) :pointer
  (arg0 :unsigned-long))

(cffi:defcfun ("PixelGetAlphaQuantum" PixelGetAlphaQuantum) :unsigned-short
  (arg0 :pointer))

(cffi:defcfun ("PixelGetBlackQuantum" PixelGetBlackQuantum) :unsigned-short
  (arg0 :pointer))

(cffi:defcfun ("PixelGetBlueQuantum" PixelGetBlueQuantum) :unsigned-short
  (arg0 :pointer))

(cffi:defcfun ("PixelGetCyanQuantum" PixelGetCyanQuantum) :unsigned-short
  (arg0 :pointer))

(cffi:defcfun ("PixelGetGreenQuantum" PixelGetGreenQuantum) :unsigned-short
  (arg0 :pointer))

(cffi:defcfun ("PixelGetMagentaQuantum" PixelGetMagentaQuantum) :unsigned-short
  (arg0 :pointer))

(cffi:defcfun ("PixelGetOpacityQuantum" PixelGetOpacityQuantum) :unsigned-short
  (arg0 :pointer))

(cffi:defcfun ("PixelGetRedQuantum" PixelGetRedQuantum) :unsigned-short
  (arg0 :pointer))

(cffi:defcfun ("PixelGetYellowQuantum" PixelGetYellowQuantum) :unsigned-short
  (arg0 :pointer))

(cffi:defcfun ("PixelGetColorCount" PixelGetColorCount) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("ClearPixelWand" ClearPixelWand) :void
  (arg0 :pointer))

(cffi:defcfun ("PixelGetHSL" PixelGetHSL) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("PixelGetMagickColor" PixelGetMagickColor) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PixelGetQuantumColor" PixelGetQuantumColor) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PixelSetAlpha" PixelSetAlpha) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("PixelSetAlphaQuantum" PixelSetAlphaQuantum) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("PixelSetBlack" PixelSetBlack) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("PixelSetBlackQuantum" PixelSetBlackQuantum) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("PixelSetBlue" PixelSetBlue) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("PixelSetBlueQuantum" PixelSetBlueQuantum) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("PixelSetColorFromWand" PixelSetColorFromWand) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PixelSetColorCount" PixelSetColorCount) :void
  (arg0 :pointer)
  (arg1 :unsigned-long))

(cffi:defcfun ("PixelSetCyan" PixelSetCyan) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("PixelSetCyanQuantum" PixelSetCyanQuantum) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("PixelSetFuzz" PixelSetFuzz) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("PixelSetGreen" PixelSetGreen) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("PixelSetGreenQuantum" PixelSetGreenQuantum) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("PixelSetHSL" PixelSetHSL) :void
  (arg0 :pointer)
  (arg1 :double)
  (arg2 :double)
  (arg3 :double))

(cffi:defcfun ("PixelSetIndex" PixelSetIndex) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("PixelSetMagenta" PixelSetMagenta) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("PixelSetMagentaQuantum" PixelSetMagentaQuantum) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("PixelSetMagickColor" PixelSetMagickColor) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PixelSetOpacity" PixelSetOpacity) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("PixelSetOpacityQuantum" PixelSetOpacityQuantum) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("PixelSetQuantumColor" PixelSetQuantumColor) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("PixelSetRed" PixelSetRed) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("PixelSetRedQuantum" PixelSetRedQuantum) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("PixelSetYellow" PixelSetYellow) :void
  (arg0 :pointer)
  (arg1 :double))

(cffi:defcfun ("PixelSetYellowQuantum" PixelSetYellowQuantum) :void
  (arg0 :pointer)
  (arg1 :unsigned-short))

(cffi:defcfun ("StreamImageCommand" StreamImageCommand) MagickBooleanType
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))


