package Display.Util {

import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;

public class FilterUtil {

    private static const STANDARD_DROP_SHADOW_FILTER:Array = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
    private static const STANDARD_OUTLINE_FILTER:Array = [new GlowFilter(0, 1, 2, 2, 10, 1)];
    private static const WHITE_OUTLINE_FILTER:Array = [new GlowFilter(0xffaaaa, 0.8, 2, 2, 10, 1)];
    private static const EDITOR_OUTLINE_FILTER:Array = [new GlowFilter(ColorUtil.EDITOR_OUTLINE_COLOR, 0.8, 2, 2, 10, 1)];
    private static const DEFAULT_TEXT_SHADOW_FILTER:Array = [new DropShadowFilter(0,0,0,0.5,12,12)];

    public function FilterUtil() {
        super();
    }

    public static function getStandardDropShadowFilter():Array {
        return STANDARD_DROP_SHADOW_FILTER;
    }

    public static function getTextOutlineFilter():Array {
        return STANDARD_OUTLINE_FILTER;
    }

    public static function getWhiteOutlineFilter():Array {
        return WHITE_OUTLINE_FILTER;
    }

    public static function getEditorOutlineFilter():Array {
        return EDITOR_OUTLINE_FILTER;
    }

    public static function getTextShadowFilter():Array {
        return DEFAULT_TEXT_SHADOW_FILTER;
    }
}
}
