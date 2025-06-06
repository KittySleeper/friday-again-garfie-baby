package funkin.backend.assets.loaders;

import sys.FileSystem;

import haxe.io.Path;
import haxe.ds.ReadOnlyArray;

class AssetLoader {
    /**
     * The ID of this asset loader instance.
     */
    public var id:String;

    /**
     * The root folder to obtain assets via this asset loader.
     */
    public var root:String;

    public function new(root:String) {
        if(root != null)
            root = Path.normalize(root);
        
        this.root = root;
    }

    public function getPath(assetID:String):String {
        if(root == null || root.length == 0)
            return assetID;

        return '${root}/${assetID}';
    }

    public function readDirectory(path:String):Array<String> {
        final path:String = getPath(path);
        return (FileSystem.exists(path)) ? FileSystem.readDirectory(path) : [];
    }

    public function toString():String {
        return 'AssetLoader(${id} - ${root})';
    }
}