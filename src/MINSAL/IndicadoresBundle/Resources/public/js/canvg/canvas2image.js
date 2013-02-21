/*
 * Canvas2Image v0.1
 * Copyright (c) 2008 Jacob Seidelin, jseidelin@nihilogic.dk
 * MIT License [http://www.opensource.org/licenses/mit-license.php]
 */

var Canvas2Image = (function() {

    var strDownloadMime = "image/octet-stream";

    // sends the generated file to the client
    var saveFile = function(strData) {
        document.location.href = strData;
    }

    return {
        saveAsPNG: function(oCanvas) {            
            var strData = oCanvas.toDataURL("image/png");
            saveFile(strData.replace("image/png", strDownloadMime));

            return true;
        }
    };

})();