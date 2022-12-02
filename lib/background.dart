import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';

class BackGround extends ParallaxComponent {
  @override
  Future<void>? onLoad() async {
    parallax = await Parallax.load(
      [
        // ParallaxDa(),
        // ParallaxImage(),
        // ParallaxImage(),
        ParallaxImageData("parallax/plx-1.png"),
        ParallaxImageData("parallax/plx-2.png"),
        ParallaxImageData("parallax/plx-3.png"),
        ParallaxImageData("parallax/plx-4.png"),
        ParallaxImageData("parallax/plx-5.png"),
        ParallaxImageData(
          "parallax/plx-6.png",
        ),
      ],
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
      // repeat:
    );

    // TODO: implement onLoad
    return super.onLoad();
  }
}
