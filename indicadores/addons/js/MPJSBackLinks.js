/* 
This script and many more are available free online at
The JavaScript Source :: http://javascript.internet.com
Created by: Nate Baldwin :: http://www.mindpalette.com 

Breadcrumb Links Script
NOTE: Be sure to check Web site for updates 
*/

// ============================================================

/* The variable below determines what the home page, or the root directory,
of your site is named. The default is "Home". To use the address of your
site (www.yoursite.com), leave the value blank (nothing between the double quotes). */

var homePage = "Inicio";

/* The variable below controls the character(s) that the script places between
the link levels. The default is set to be the > (greater than) HTML entity
with a space on either side. Change this to whatever you want, but if the
character has an HTML entity, be sure to use that. */

var sepChars = " &raquo; ";

/* In most cases, the value below should just be a / sign. Or, you can use the
fully qualified http://www.yoursite.com address if you'd rather. Basically,
it just tells the script what all the link addresses will start with. */

var linkHome = "http://localhost/sis/cmark2/";
//var linkHome = "http://www.intelector.net/v6/";

/* Leave the value below set to 'true' if you want the script to not list your
index page name (index.html) at the end of the links path. The values 'true' or
'false' should be used without quotes. */

var hideIndex = true;

/* Leave the value below set to 'true' if you want the script to convert any
underscores in directory or names to spaces. For instance, it would convert
"golive_actions" to "golive actions". The values 'true' or 'false' should be
used without quotes. */

var UToSpace = true;

/* Leave the value below set to 'true' if you want the script to convert any dashes
in directory or page names to spaces. For instance, it would convert "golive-actions"
to "golive actions". The values 'true' or 'false' should be used without quotes. */

var DToSpace = true;

/* The variable below allows you to change the capitalization of the directory and
pages names in your menu. The value should be a number between 0 and 3, without
quotation marks. Options are as follows: 0 = no change; 1 = initial caps;
2 = all upper case; 3 = all lower case */

var changeCaps = 3;

/* If set to true, the variable below will not display the file's extension for
any file names displayed in the menu. Otherwise, set to false to show extensions.
The values 'true' or 'false' should be used without quotes. */

var hideExt = true;

//-------------------------------------------------------------------------
// SCRIPT FUNCTIONS  (shouldn't need to edit code below)...
//-------------------------------------------------------------------------

// build breadcrumb links...
function MPJSBackLinks() {
var linkHTML = '';
var thisURL = window.location + '';
var urlPair = thisURL.split('//');
if (urlPair.length > 1) thisURL = urlPair[1];
var dirArray = thisURL.split('/');
var linkArray = dirArray.slice(1);
var linkDir = '/';
var currentPage = '';
if (linkHome != '' && linkHome != '/') {
  var thisTest = linkHome.split('//');
  if (thisTest.length > 1) linkHome = thisTest[1];
  startArray = linkHome.split('/');
  var backCount = 0;
  for (var n=0; n<startArray.length; n++) {
    if (startArray[n] == '..') backCount++;
      else break;
    }
  if (backCount > 0) {
    var part1 = dirArray.slice(0, (dirArray.length - backCount - 1));
    var part2 = startArray.slice(backCount);
    startArray = part1.concat(part2);
    } else {
    var newStart = new Array(dirArray[0]);
    for (var n=1; n<startArray.length; n++) {
      var thisTest = (typeof dirArray[n] != "undefined") ? dirArray[n] : false;
      if (thisTest && thisTest == startArray[n]) newStart[n] = startArray[n];
        else break;
      }
    startArray = newStart;
    }
  if (startArray.length > 1) {
    var lastOne = startArray[startArray.length - 1];
    if (lastOne != '') {
      var thisTest = lastOne.split('.');
      if (thisTest.length > 1) startArray[startArray.length - 1] = '';
        else startArray[startArray.length] = '';
      }
    if (homePage == '') homePage = startArray[startArray.length-2];
    linkArray = dirArray.slice(startArray.length - 1);
    if (startArray[0] != '') startArray[0] = "http://"+startArray[0];
    linkDir = startArray.join('/');
    } else linkArray = dirArray.slice(1);
  } else {
  linkArray = dirArray.slice(1);
  if (homePage == '') homePage = dirArray[0];
  }
var backTrack = 1;
if (linkArray[linkArray.length - 1] != '') {
  var lastOne = linkArray[linkArray.length - 1];
  var testName = lastOne.split('.');
  if (testName[0] == 'index' || testName[0] == 'default') {
    backTrack = 2;
    currentPage = linkArray[linkArray.length - 2];
    } else if (hideExt) currentPage = testName[0]
    else currentPage = lastOne;
  } else {
  backTrack = 2;
  currentPage = linkArray[linkArray.length - 2];
  }
var html = '';
if (linkArray.length >= backTrack) {
  linkArray = linkArray.slice(0, linkArray.length - backTrack);
  var links = new Array();
  if (homePage != '') {
    homePage = MPBCParseText(homePage, UToSpace, DToSpace, changeCaps);
    links[links.length] = '<a href="'+linkDir+'">'+homePage+'</a>';
    }
  var baseDir = linkDir;
  for (var n=0; n<linkArray.length; n++) {
    baseDir += linkArray[n] + '/';
    var thisText = MPBCParseText(linkArray[n], UToSpace, DToSpace, changeCaps);
    links[links.length] = '<a href="'+baseDir+'">'+thisText+'</a>';
    }
  if (currentPage != '') links[links.length] = MPBCParseText(currentPage, UToSpace, DToSpace, changeCaps);
  html = '<div class="mp_backlinks">&nbsp; &bull; Ud. se encuentra en: '+links.join(sepChars)+'<\/div>';
  }
return html;
}
// parse string through text filters
function MPBCParseText(thisText, UToSpace, DToSpace, changeCaps) {
if (typeof thisText != "undefined" && thisText) {
  if (DToSpace) thisText = MPBCReplaceChar('-', ' ', thisText);
  if (UToSpace) thisText = MPBCReplaceChar('_', ' ', thisText);
  if (changeCaps) thisText = MPBCFixCaps(thisText, changeCaps);
  } else thisText = '';
return thisText;
}
// find and replace single character in string...
function MPBCReplaceChar(oldChar, newChar, thisString) {
var newString = '';
for (var n=0; n<thisString.length; n++) {
  newString += (thisString.charAt(n) == oldChar) ? newChar : thisString.charAt(n);
  }
return newString;
}
// determine changes in capitalization...
function MPBCFixCaps(thisString, changeCaps) {
if (changeCaps == 1) thisString = MPBCUCWords(thisString);
  else if (changeCaps == 2) thisString = thisString.toUpperCase();
  else if (changeCaps == 3) thisString = thisString.toLowerCase();
return thisString;
}
// capitalize the first letter of every word...
function MPBCUCWords(thisString) {
var thisArray = thisString.split(' ');
var newString = '';
for (var n=0; n<thisArray.length; n++) {
  var firstChar = thisArray[n].charAt(0).toUpperCase();
  var theRest = thisArray[n].substring(1, thisArray[n].length);
  newString += firstChar+theRest+' ';
  }
return newString.substring(0, newString.length - 1);
}
document.write(MPJSBackLinks());

