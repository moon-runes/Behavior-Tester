package Display.Control.Redrawers
{
import Display.Control.AssetLibrary;

import flash.display.BitmapData;
import flash.utils.Dictionary;

public class TextureData
{
    public var texture_:BitmapData = null;

    public var mask_:BitmapData = null;

    public var randomTextureData_:Vector.<TextureData> = null;

    public var altTextures_:Dictionary = null;

    public function TextureData(objectXML:XML)
    {
        var altTexture:XML = null;
        super();
        if(objectXML.hasOwnProperty("Texture"))
        {
            this.parse(XML(objectXML.Texture));
        }
        else if(objectXML.hasOwnProperty("AnimatedTexture"))
        {
            this.parse(XML(objectXML.AnimatedTexture));
        }
        else if(objectXML.hasOwnProperty("RandomTexture"))
        {
            this.parse(XML(objectXML.RandomTexture));
        }
        else
        {
            this.parse(objectXML);
        }
        for each(altTexture in objectXML.AltTexture)
        {
            this.parse(altTexture);
        }
        if(objectXML.hasOwnProperty("Mask"))
        {
            this.parse(XML(objectXML.Mask));
        }
        if(objectXML.hasOwnProperty("Effect"))
        {
            this.parse(XML(objectXML.Effect));
        }
    }

    public function getTexture(id:int = 0) : BitmapData
    {
        if(this.randomTextureData_ == null)
        {
            return this.texture_;
        }
        var textureData:TextureData = this.randomTextureData_[id % this.randomTextureData_.length];
        return textureData.getTexture(id);
    }

    public function getAltTextureData(id:int) : TextureData
    {
        if(this.altTextures_ == null)
        {
            return null;
        }
        return this.altTextures_[id];
    }

    private function parse(xml:XML) : void
    {
        var childXML:XML = null;
        switch(xml.name().toString())
        {
            case "Texture":
                this.texture_ = AssetLibrary.getImageFromSet(String(xml.File),int(xml.Index));
                break;
            case "Mask":
                this.mask_ = AssetLibrary.getImageFromSet(String(xml.File),int(xml.Index));
                break;
            case "RandomTexture":
                this.randomTextureData_ = new Vector.<TextureData>();
                for each(childXML in xml.children())
                {
                    this.randomTextureData_.push(new TextureData(childXML));
                }
                break;
            case "AltTexture":
                if(this.altTextures_ == null)
                {
                    this.altTextures_ = new Dictionary();
                }
                this.altTextures_[int(xml.@id)] = new TextureData(xml);
        }
    }
}
}
