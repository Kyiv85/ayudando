"use strict";define("multilingual",["lodash"],function(n){var t=null,e=null,a={PointerOperation:{GET:"get",SET:"set"},setCurrentLanguage:function(n){t=n},getCurrentLanguage:function(){return t},setOriginalLanguage:function(n){e=n},getOriginalLanguage:function(){return e},getTranslationPath:function(t,e){var r=a.getCurrentLanguage();return a.getOriginalLanguage()===r||n.isNull(r)?t:n.concat(n.take(t,e),"translations",r,n.drop(t,e))}};return a});
//# sourceMappingURL=multilingual.min.js.map