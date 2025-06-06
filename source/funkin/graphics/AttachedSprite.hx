package funkin.graphics;

import haxe.io.Path;

class AttachedSprite extends FlxSprite {
	public var sprTracker:FlxSprite;
	public var xAdd:Float = 0;
	public var yAdd:Float = 0;
	public var angleAdd:Float = 0;
	public var alphaMult:Float = 1;

	public var copyAngle:Bool = true;
	public var copyAlpha:Bool = true;
	public var copyVisible:Bool = false;

	public function new(?file:String = null, ?anim:String = null, ?parentFolder:String = null, ?loop:Bool = false) {
		super();
		if(anim != null) {
			frames = Paths.getSparrowAtlas(Path.join([parentFolder, file]));
			animation.addByPrefix('idle', anim, 24, loop);
			animation.play('idle');
		} else if(file != null)
			loadGraphic(Paths.image(Path.join([parentFolder, file])));
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if(sprTracker != null) {
			setPosition(sprTracker.x + xAdd, sprTracker.y + yAdd);
			scrollFactor.set(sprTracker.scrollFactor.x, sprTracker.scrollFactor.y);

			if(copyAngle)
				angle = sprTracker.angle + angleAdd;

			if(copyAlpha)
				alpha = sprTracker.alpha * alphaMult;

			if(copyVisible)
				visible = sprTracker.visible;
		}
	}
}
