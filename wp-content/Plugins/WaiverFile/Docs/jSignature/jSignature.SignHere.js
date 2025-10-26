/** @license
jSignature v2 jSignature's Sign Here "sticker" plugin
Copyright (c) 2011 Willow Systems Corp http://willow-systems.com
MIT License <http://www.opensource.org/licenses/mit-license.php>

*/
; (function () {

    var apinamespace = 'jSignature'

    function attachHandlers($obj, apinamespace, extensionName) {

        ; (function (jSignatureInstance, $obj, apinamespace) {
            $obj.bind('click', function () {
                // when user is annoyed enough to click on us, hide us
                $obj.hide()
            })

            jSignatureInstance.events.subscribe(
                apinamespace + '.change'
                , function () {
                    if (jSignatureInstance.dataEngine.data.length) {
                        $obj.hide()
                    } else {
                        $obj.show()
                    }
                }
            )
        })(this, $obj, apinamespace)
    }

    function ExtensionInitializer(extensionName) {
        // we are called very early in instance's life.
        // right after the settings are resolved and 
        // jSignatureInstance.events is created 
        // and right before first ("jSignature.initializing") event is called.
        // You don't really need to manupilate 
        // jSignatureInstance directly, just attach
        // a bunch of events to jSignatureInstance.events
        // (look at the source of jSignatureClass to see when these fire)
        // and your special pieces of code will attach by themselves.

        // this function runs every time a new instance is set up.
        // this means every var you create will live only for one instance
        // unless you attach it to something outside, like "window."
        // and pick it up later from there.

        // when globalEvents' events fire, 'this' is globalEvents object
        // when jSignatureInstance's events fire, 'this' is jSignatureInstance

        // Here,
        // this = is new jSignatureClass's instance.

        // The way you COULD approch setting this up is:
        // if you have multistep set up, attach event to "jSignature.initializing"
        // that attaches other events to be fired further lower the init stream.
        // Or, if you know for sure you rely on only one jSignatureInstance's event,
        // just attach to it directly

        var apinamespace = 'jSignature'

        this.events.subscribe(
            // name of the event
            apinamespace + '.attachingEventHandlers'
            // event handlers, can pass args too, but in majority of cases,
            // 'this' which is jSignatureClass object instance pointer is enough to get by.
            , function (mode) {
                var renderer = function () {
                    var data = " data:image/gif;base64,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"
                        , $img = $('<img style="position:absolute !important; top: auto; min-width:90px !important; max-width:180px !important;width:10% !important;border:none !important;padding: 0 !important;margin:0 !important;box-shadow:0 0 0 !important;" />');
                    if (mode == 'initial') {
                        //CHANGE TO INITIAL TAG. 
                        data = " data:image/gif;base64,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";
                    }
                    try {
                        $img[0].src = data
                        return $img
                    } catch (ex) {
                        return $() // empty jQuery obj
                    }
                }
                if (this.settings[extensionName] && typeof this.settings[extensionName].renderer === 'function') {
                    renderer = this.settings[extensionName].renderer
                }

                var $obj = renderer()

                if ($obj.length) {
                    $obj.appendTo(this.$controlbarUpper)

                    attachHandlers.call(
                        this
                        , $obj
                        , apinamespace
                        , extensionName
                    )
                }
            }
        )
    }

    var ExtensionAttacher = function () {
        $.fn[apinamespace](
            'addPlugin'
            , 'instance' // type of plugin
            , 'SignHere' // extension name
            , ExtensionInitializer
        )
    }


    //  //Because plugins are minified together with jSignature, multiple defines per (minified) file blow up and dont make sense
    //	//Need to revisit this later.

    //	if ( typeof define === "function" && define.amd != null) {
    //		// AMD-loader compatible resource declaration
    //		// you need to call this one with jQuery as argument.
    //		define(function(){return Initializer} )
    //	} else {
    ExtensionAttacher()
    //	}

})();