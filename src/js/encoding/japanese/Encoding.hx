package js.encoding.japanese;

import haxe.extern.EitherType;
import js.lib.Int8Array;
import js.lib.Uint8Array;
import js.lib.Uint8ClampedArray;
import js.lib.Int16Array;
import js.lib.Uint16Array;
import js.lib.Int32Array;
import js.lib.Uint32Array;
import js.lib.Float32Array;
import js.lib.Float64Array;
#if nodejs
import js.node.Buffer;
#end

#if encoding_japanese_standalone
@:native("Encoding")
#else
@:jsRequire("encoding-japanese")
#end
extern class Encoding {
    /**
     * Convert character encoding.
     */
    @:overload(function(data: Array<Int>, toEncoding: Charset, ?fromEncoding: EitherType<Charset, Array<Charset>>): Array<Int> {})
    @:overload(function(data: TypedArray, toEncoding: Charset, ?fromEncoding: EitherType<Charset, Array<Charset>>): Array<Int> {})
    @:overload(function(data: String, options: ConvertOptions): Any {})
    @:overload(function(data: Array<Int>, options: ConvertOptions): Any {})
    @:overload(function(data: TypedArray, options: ConvertOptions): Any {})
    #if nodejs
    @:overload(function(data: Buffer, toEncoding: Charset, ?fromEncoding: EitherType<Charset, Array<Charset>>): Array<Int> {})
    @:overload(function(data: Buffer, options: ConvertOptions): Any {})
    #end
    static function convert(data: String, toEncoding: Charset, ?fromEncoding: EitherType<Charset, Array<Charset>>): String;

    /**
     * Detect character encoding.
     */
    @:overload(function(data: Array<Int>, ?encodings: EitherType<Charset, Array<Charset>>): EitherType<Charset, Bool>{})
    @:overload(function(data: TypedArray, ?encodings: EitherType<Charset, Array<Charset>>): EitherType<Charset, Bool>{})
    #if nodejs
    @:overload(function(data: Buffer, ?encodings: EitherType<Charset, Array<Charset>>): EitherType<Charset, Bool>{})
    #end
    static function detect(data: String, ?encodings: EitherType<Charset, Array<Charset>>): EitherType<Charset, Bool>;

    /**
     * URL(percent) encode.
     */
    @:overload(function(data: TypedArray): String {})
    #if nodejs
    @:overload(function(data: Buffer): String {})
    #end
    static function urlEncode(data: Array<Int>): String;

    /**
     * URL(percent) decode.
     */
    static function urlDecode(string: String): Array<Int>;

    /**
     * Base64 encode.
     */
    @:overload(function(data: TypedArray): String {})
    #if nodejs
    @:overload(function(data: Buffer): String {})
    #end
    static function base64Encode(data: Array<Int>): String;

    /**
     * Base64 decode.
     */
    static function base64Decode(string: String): Array<Int>;

    /**
     * Joins a character code array to string.
     */
    @:overload(function(data: TypedArray): String {})
    #if nodejs
    @:overload(function(data: Buffer): String {})
    #end
    static function codeToString(data: Array<Int>): String;  

    /**
     * Splits string to an array of character codes.
     */
    static function stringToCode(string: String): Array<Int>;

    /**
     * Convert the ascii symbols and alphanumeric characters to the zenkaku symbols and alphanumeric characters.
     */
    @:overload(function(data: Array<Int>): Array<Int> {})
    @:overload(function(data: TypedArray): Array<Int> {})
    #if nodejs
    @:overload(function(data: Buffer): Array<Int> {})
    #end
    static function toHankakuCase(string: String): String; 

    /**
     * Convert to the zenkaku symbols and alphanumeric characters from the ascii symbols and alphanumeric characters.
     */
    @:overload(function(data: Array<Int>): Array<Int> {})
    @:overload(function(data: TypedArray): Array<Int> {})
    #if nodejs
    @:overload(function(data: Buffer): Array<Int> {})
    #end
    static function toZenkakuCase(string: String): String; 

    // 
    /**
     * Convert to the zenkaku hiragana from the zenkaku katakana.
     */
    @:overload(function(data: Array<Int>): Array<Int> {})
    @:overload(function(data: TypedArray): Array<Int> {})
    #if nodejs
    @:overload(function(data: Buffer): Array<Int> {})
    #end
    static function toHiraganaCase(string: String): String; 

    // 
    /**
     * Convert to the zenkaku katakana from the zenkaku hiragana.
     */
    @:overload(function(data: Array<Int>): Array<Int> {})
    @:overload(function(data: TypedArray): Array<Int> {})
    #if nodejs
    @:overload(function(data: Buffer): Array<Int> {})
    #end
    static function toKatakanaCase(string: String): String; 

    // 
    /**
     * Convert to the hankaku katakana from the zenkaku katakana.
     */
    @:overload(function(data: Array<Int>): Array<Int> {})
    @:overload(function(data: TypedArray): Array<Int> {})
    #if nodejs
    @:overload(function(data: Buffer): Array<Int> {})
    #end
    static function toHankanaCase(string: String): String; 

    /**
     * Convert to the zenkaku katakana from the hankaku katakana.
     */
    @:overload(function(data: Array<Int>): Array<Int> {})
    @:overload(function(data: TypedArray): Array<Int> {})
    #if nodejs
    @:overload(function(data: Buffer): Array<Int> {})
    #end
    static function toZenkanaCase(string: String): String; 

    /**
     * Convert the em space(U+3000) to the single space(U+0020).
     */
    @:overload(function(data: Array<Int>): Array<Int> {})
    @:overload(function(data: TypedArray): Array<Int> {})
    #if nodejs
    @:overload(function(data: Buffer): Array<Int> {})
    #end
    static function toHankakuSpace(string: String): String; 

    /**
     * Convert the single space(U+0020) to the em space(U+3000).
     */
    @:overload(function(data: Array<Int>): Array<Int> {})
    @:overload(function(data: TypedArray): Array<Int> {})
    #if nodejs
    @:overload(function(data: Buffer): Array<Int> {})
    #end
    static function toZenkakuSpace(string: String): String; 
}

typedef ConvertOptions = {
    var to: Charset;
    var ?from: EitherType<Charset, Array<Charset>>;
    var ?type: ConvertType;
    var ?bom: BOM;
}

enum abstract ConvertType(String) {
    var String = "string";
    var ArrayBuffer = "arraybuffer";
    var Array = "array";
}

enum abstract Charset(String) {
    var UTF32 = "UTF32"; // (detect only)
    var UTF16 = "UTF16";
    var UTF16BE = "UTF16BE";
    var UTF16LE = "UTF16LE";
    var Binary = "BINARY"; // (detect only)
    var Ascii = "ASCII"; // (detect only)
    var JIS = "JIS";
    var UTF8 = "UTF8";
    var EUCJP = "EUCJP";
    var SJIS = "SJIS";
    var Unicode = "UNICODE"; // (JavaScript Unicode Array)
    var Auto = "AUTO";
}

enum abstract BOM(EitherType<Bool, String>) {
    var BigEndian = true;
    var LittleEndian = "LE";
}

abstract TypedArray({})
    from Int8Array
    from Uint8Array
    from Uint8ClampedArray
    from Int16Array
    from Uint16Array
    from Int32Array
    from Uint32Array
    from Float32Array
    from Float64Array
{ }
