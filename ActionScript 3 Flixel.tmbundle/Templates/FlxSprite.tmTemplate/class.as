package ${TM_CLASS_PATH}
{
	import com.adamatomic.flixel.*;

	public class ${TM_NEW_FILE_BASENAME} extends FlxSprite
	{
		[Embed(source="")] private var Img${TM_NEW_FILE_BASENAME}:Class;

		public function ${TM_NEW_FILE_BASENAME}(X:int, Y:int)
		{
			super(Img${TM_NEW_FILE_BASENAME},X,Y,true,true);
		}

		override public function update():void
		{			
			super.update();
		}
	}
}

