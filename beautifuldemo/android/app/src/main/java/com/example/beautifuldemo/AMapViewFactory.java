//package com.example.beautifuldemo;
//
//import io.flutter.plugin.common.MessageCodec;
//import io.flutter.plugin.platform.PlatformView;
//import io.flutter.plugin.platform.PlatformViewFactory;
//
//import javax.swing.text.html.ImageView;
//
//public class AMapViewFactory extends PlatformViewFactory {
//    private ImageView imageView;
//
//    public AMapViewFactory(MessageCodec<Object> createArgsCodec, ImageView imageView){
//        super(createArgsCodec);
//        this.imageView = imageView;
//    }
//
//    @Override
//    public PlatformView create(final Context context, int i, Object o) {
//        return new PlatformView() {
//            @Override
//            public View getView() {
//                return mapView;
//            }
//
//            @Override
//            public void dispose() {
//
//            }
//        };
//    }
//}
